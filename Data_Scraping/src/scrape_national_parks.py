import json
import os
import re

import requests
from bs4 import BeautifulSoup

URL = "https://en.wikipedia.org/wiki/List_of_national_parks_of_the_United_States"

HEADERS = {
    "User-Agent": "Mozilla/5.0"
}

DATA_DIR = os.path.join(os.path.dirname(__file__), "..", "data")


def fetch_page():
    response = requests.get(URL, headers=HEADERS, timeout=15)
    response.raise_for_status()
    return BeautifulSoup(response.text, "html.parser")


def clean_text(text):
    text = re.sub(r"\[\s*\d+\s*\]", "", text)
    text = re.sub(r"\s+", " ", text)
    text = re.sub(r"\s+([,.;:])", r"\1", text)
    return text.strip()


def scrape_parks(soup):
    tables = soup.select("table.wikitable")

    if not tables:
        raise RuntimeError("Parks table not found.")

    parks = []

    for row in tables[0].select("tr")[1:]:
        cells = row.find_all(["th", "td"])

        if len(cells) < 7:
            continue

        raw_name = clean_text(cells[0].get_text())

        park_name = re.sub(r"[\*\u2020\u2021]", "", raw_name).strip()

        is_whs = "*" in raw_name or "‡" in raw_name
        is_br = "†" in raw_name or "‡" in raw_name

        location = clean_text(cells[2].get_text(" "))
        location = re.split(r"\d", location, maxsplit=1)[0]
        states = [s.strip() for s in location.split(",") if s.strip()]

        area_text = clean_text(cells[4].get_text())
        area_match = re.search(r"([\d,]+\.?\d*)\s*acres", area_text)

        if area_match:
            area = float(area_match.group(1).replace(",", ""))
        else:
            area = None

        visitor_text = clean_text(cells[5].get_text())
        visitor_digits = re.sub(r"[^\d]", "", visitor_text)

        if visitor_digits:
            visitors = int(visitor_digits)
        else:
            visitors = None

        established = clean_text(cells[3].get_text())
        description = clean_text(cells[6].get_text(" "))

        parks.append({
            "name": park_name,
            "is_world_heritage_site": is_whs,
            "is_biosphere_reserve": is_br,
            "states": states,
            "date_established": established,
            "area_acres": area,
            "recreation_visitors": visitors,
            "description": description,
        })

    return parks


def scrape_states(soup):
    tables = soup.select("table.wikitable")

    if len(tables) < 2:
        raise RuntimeError("States table not found.")

    states = []

    for row in tables[1].select("tr")[1:]:
        cells = row.find_all(["th", "td"])

        if len(cells) < 4:
            continue

        numbers = []

        for i in range(1, 4):
            text = clean_text(cells[i].get_text())

            if text.isdigit():
                numbers.append(int(text))
            else:
                numbers.append(0)

        states.append({
            "state": clean_text(cells[0].get_text()),
            "is_territory": cells[0].find("i") is not None,
            "total_parks": numbers[0],
            "exclusive_parks": numbers[1],
            "shared_parks": numbers[2],
        })

    return states

def save_json(data, filename):
    os.makedirs(DATA_DIR, exist_ok=True)

    path = os.path.join(DATA_DIR, filename)

    with open(path, "w", encoding="utf-8") as file:
        json.dump(data, file, indent=2, ensure_ascii=False)

    print(f"Saved {len(data)} records to {path}")


def main():
    print("Fetching Wikipedia page...")
    soup = fetch_page()

    print("Scraping parks...")
    parks = scrape_parks(soup)
    save_json(parks, "parks.json")

    print("Scraping states...")
    states = scrape_states(soup)
    save_json(states, "states.json")

    print("Finished.")


if __name__ == "__main__":
    main()