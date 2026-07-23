-- schema.sql
-- PostgreSQL schema for the National Parks database.

-- National parks.
CREATE TABLE IF NOT EXISTS park (
    park_id             SERIAL PRIMARY KEY,
    name                VARCHAR(100) NOT NULL UNIQUE,
    date_established    DATE NULL,
    area_acres          DECIMAL(12, 2) NOT NULL,
    recreation_visitors INT NOT NULL,
    description         TEXT NOT NULL
);

-- States and territories.
-- Park counts -> derived from park_state.
CREATE TABLE IF NOT EXISTS state (
    state_id     SERIAL PRIMARY KEY,
    state_name   VARCHAR(50) NOT NULL UNIQUE,
    is_territory BOOLEAN NOT NULL DEFAULT FALSE
);

-- Relationship between parks and states.
CREATE TABLE IF NOT EXISTS park_state (
    park_id  INT NOT NULL,
    state_id INT NOT NULL,
    PRIMARY KEY (park_id, state_id),
    FOREIGN KEY (park_id)  REFERENCES park(park_id)   ON DELETE CASCADE,
    FOREIGN KEY (state_id) REFERENCES state(state_id) ON DELETE CASCADE
);

-- UNESCO designation types.
CREATE TABLE IF NOT EXISTS designation (
    designation_id   SERIAL PRIMARY KEY,
    designation_name VARCHAR(50) NOT NULL UNIQUE
);

-- Relationship between parks and designations.
CREATE TABLE IF NOT EXISTS park_designation (
    park_id        INT NOT NULL,
    designation_id INT NOT NULL,
    PRIMARY KEY (park_id, designation_id),
    FOREIGN KEY (park_id)        REFERENCES park(park_id)               ON DELETE CASCADE,
    FOREIGN KEY (designation_id) REFERENCES designation(designation_id) ON DELETE CASCADE
);

-- Visitation records.
CREATE TABLE IF NOT EXISTS visit_record (
    visit_id       SERIAL PRIMARY KEY,
    park_id        INT NOT NULL,
    visit_year     SMALLINT NOT NULL,
    visitor_count  INT NOT NULL,
    UNIQUE (park_id, visit_year),
    FOREIGN KEY (park_id) REFERENCES park(park_id) ON DELETE CASCADE
);