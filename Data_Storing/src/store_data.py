"""
store_data.py

Creates the PostgreSQL schema and loads the scraped JSON data.

Requirements:
    pip install psycopg2-binary
"""

import os
import json
import getpass
from datetime import datetime
import psycopg2

# Prompt for the password at runtime.
DB_CONFIG = {
    "host": "localhost",
    "port": 5432,
    "dbname": "national_parks",
    "user": "postgres",
    "password": getpass.getpass("PostgreSQL password: "),
}

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
DATA_DIR = os.path.join(BASE_DIR, "..", "..", "Data_Scraping", "data")
SCHEMA_FILE = os.path.join(BASE_DIR, "..", "..", "Data_Storing", "src", "schema.sql")

DESIGNATIONS = ["World Heritage Site", "Biosphere Reserve"]
VISIT_YEAR = 2025


def run_schema(cursor):
    with open(SCHEMA_FILE, "r", encoding="utf-8") as f:
        sql_script = f.read()

    # execute() handles multiple ";"-separated statements; don't split manually.
    cursor.execute(sql_script)


def parse_date(date_str):
    if not date_str:
        return None
    try:
        return datetime.strptime(date_str, "%B %d, %Y").date()
    except ValueError:
        return None


def load_json(filename):
    path = os.path.join(DATA_DIR, filename)
    with open(path, "r", encoding="utf-8") as f:
        return json.load(f)


def insert_states(cursor, states_data, parks_data):
    state_names = {s["state"] for s in states_data}
    for park in parks_data:
        state_names.update(park["states"])

    is_territory_lookup = {s["state"]: s["is_territory"] for s in states_data}

    state_id_map = {}
    for name in sorted(state_names):
        is_territory = is_territory_lookup.get(name, False)
        cursor.execute(
            "INSERT INTO state (state_name, is_territory) VALUES (%s, %s) RETURNING state_id",
            (name, is_territory)
        )
        state_id_map[name] = cursor.fetchone()[0]

    return state_id_map


def insert_designations(cursor):
    designation_id_map = {}
    for name in DESIGNATIONS:
        cursor.execute(
            "INSERT INTO designation (designation_name) VALUES (%s) RETURNING designation_id",
            (name,)
        )
        designation_id_map[name] = cursor.fetchone()[0]
    return designation_id_map


def insert_parks(cursor, parks_data, state_id_map, designation_id_map):
    park_id_map = {}
    for park in parks_data:
        cursor.execute(
            """INSERT INTO park
               (name, date_established, area_acres, recreation_visitors, description)
               VALUES (%s, %s, %s, %s, %s)
               RETURNING park_id""",
            (
                park["name"],
                parse_date(park["date_established"]),
                park["area_acres"],
                park["recreation_visitors"],
                park["description"],
            )
        )
        park_id = cursor.fetchone()[0]
        park_id_map[park["name"]] = park_id

        # Park <-> State
        for state_name in park["states"]:
            state_id = state_id_map[state_name]
            cursor.execute(
                "INSERT INTO park_state (park_id, state_id) VALUES (%s, %s)",
                (park_id, state_id)
            )

        # Park <-> Designation
        if park["is_world_heritage_site"]:
            cursor.execute(
                "INSERT INTO park_designation (park_id, designation_id) VALUES (%s, %s)",
                (park_id, designation_id_map["World Heritage Site"])
            )
        if park["is_biosphere_reserve"]:
            cursor.execute(
                "INSERT INTO park_designation (park_id, designation_id) VALUES (%s, %s)",
                (park_id, designation_id_map["Biosphere Reserve"])
            )

    return park_id_map


def insert_visit_records(cursor, parks_data, park_id_map):
    for park in parks_data:
        if park["recreation_visitors"] is None:
            continue
        park_id = park_id_map[park["name"]]
        cursor.execute(
            """INSERT INTO visit_record (park_id, visit_year, visitor_count)
               VALUES (%s, %s, %s)""",
            (park_id, VISIT_YEAR, park["recreation_visitors"])
        )


def main():
    conn = psycopg2.connect(
        host=DB_CONFIG["host"],
        port=DB_CONFIG["port"],
        dbname=DB_CONFIG["dbname"],
        user=DB_CONFIG["user"],
        password=DB_CONFIG["password"],
    )
    cursor = conn.cursor()

    print("Creating schema (if not present)...")
    run_schema(cursor)

    print("Loading JSON files...")
    states_data = load_json("states.json")
    parks_data = load_json("parks.json")

    print("Inserting states...")
    state_id_map = insert_states(cursor, states_data, parks_data)

    print("Inserting designations...")
    designation_id_map = insert_designations(cursor)

    print("Inserting parks + relationships...")
    park_id_map = insert_parks(cursor, parks_data, state_id_map, designation_id_map)

    print("Inserting visit records...")
    insert_visit_records(cursor, parks_data, park_id_map)

    conn.commit()
    print(f"Done. Inserted {len(parks_data)} parks, {len(state_id_map)} states.")

    cursor.close()
    conn.close()


if __name__ == "__main__":
    main()