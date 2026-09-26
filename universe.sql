-- ============================================================
-- CELESTIAL BODIES DATABASE - freeCodeCamp Project
-- ============================================================

-- 1. Create the database (run this first, then connect with \c universe)
CREATE DATABASE universe;

-- After running the line above, connect with:
-- \c universe

-- ============================================================
-- TABLE: galaxy
-- ============================================================
CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    type VARCHAR(50) NOT NULL,
    distance_from_earth_mly NUMERIC,
    diameter_ly INT,
    has_supermassive_black_hole BOOLEAN
);

-- ============================================================
-- TABLE: star
-- ============================================================
CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id),
    spectral_type VARCHAR(10),
    mass_solar_masses NUMERIC,
    temperature_kelvin INT,
    is_variable BOOLEAN
);

-- ============================================================
-- TABLE: planet
-- ============================================================
CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    star_id INT NOT NULL REFERENCES star(star_id),
    planet_type VARCHAR(50),
    orbital_period_days NUMERIC,
    moon_count INT,
    has_rings BOOLEAN,
    is_habitable BOOLEAN
);

-- ============================================================
-- TABLE: moon
-- ============================================================
CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    planet_id INT NOT NULL REFERENCES planet(planet_id),
    diameter_km INT,
    orbital_period_days NUMERIC,
    discovery_year INT,
    has_atmosphere BOOLEAN
);

-- ============================================================
-- TABLE (custom): comet
-- ============================================================
CREATE TABLE comet (
    comet_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id),
    orbital_period_years NUMERIC,
    composition TEXT,
    last_observed_year INT,
    is_periodic BOOLEAN
);

-- ============================================================
-- INSERT DATA: galaxy (6 rows)
-- ============================================================
INSERT INTO galaxy (name, type, distance_from_earth_mly, diameter_ly, has_supermassive_black_hole) VALUES
('Milky Way', 'Barred Spiral', 0, 105700, TRUE),
('Andromeda', 'Spiral', 2.537, 220000, TRUE),
('Triangulum', 'Spiral', 2.73, 60000, FALSE),
('Whirlpool', 'Spiral', 23, 60000, TRUE),
('Sombrero', 'Lenticular', 29.3, 50000, TRUE),
('Cartwheel', 'Lenticular Ring', 500, 150000, FALSE);

-- ============================================================
-- INSERT DATA: star (12 rows)
-- ============================================================
INSERT INTO star (name, galaxy_id, spectral_type, mass_solar_masses, temperature_kelvin, is_variable) VALUES
('Sun', 1, 'G2V', 1.0, 5778, FALSE),
('Sirius', 1, 'A1V', 2.02, 9940, FALSE),
('Betelgeuse', 1, 'M1-2', 16.5, 3600, TRUE),
('Proxima Centauri', 1, 'M5.5Ve', 0.12, 3042, TRUE),
('Antares', 1, 'M1.5', 12.4, 3660, TRUE),
('Deneb', 1, 'A2Ia', 19, 8525, FALSE),
('Alpheratz', 2, 'B8IV', 3.8, 13800, FALSE),
('Mirach', 2, 'M0III', 2.49, 3817, FALSE),
('Beta Trianguli', 3, 'A5IV', 3.5, 8100, FALSE),
('Whirlpool Central', 4, 'B2III', 8.4, 20500, FALSE),
('Sombrero Prime', 5, 'K1III', 4.1, 4600, FALSE),
('Cartwheel Alpha', 6, 'O5V', 40, 42000, TRUE);

-- ============================================================
-- INSERT DATA: planet (12 rows)
-- ============================================================
INSERT INTO planet (name, star_id, planet_type, orbital_period_days, moon_count, has_rings, is_habitable) VALUES
('Mercury', 1, 'Terrestrial', 88, 0, FALSE, FALSE),
('Venus', 1, 'Terrestrial', 224.7, 0, FALSE, FALSE),
('Earth', 1, 'Terrestrial', 365.25, 1, FALSE, TRUE),
('Mars', 1, 'Terrestrial', 687, 2, FALSE, FALSE),
('Jupiter', 1, 'Gas Giant', 4333, 95, TRUE, FALSE),
('Saturn', 1, 'Gas Giant', 10759, 146, TRUE, FALSE),
('Uranus', 1, 'Ice Giant', 30687, 27, TRUE, FALSE),
('Neptune', 1, 'Ice Giant', 60190, 14, TRUE, FALSE),
('Proxima Centauri b', 4, 'Terrestrial', 11.2, 0, FALSE, TRUE),
('Sirius Ab I', 2, 'Gas Giant', 750, 0, FALSE, FALSE),
('Betelgeuse Prime', 3, 'Gas Giant', 3200, 0, TRUE, FALSE),
('Antares I', 5, 'Terrestrial', 410, 0, FALSE, FALSE);

-- ============================================================
-- INSERT DATA: moon (24 rows)
-- ============================================================
INSERT INTO moon (name, planet_id, diameter_km, orbital_period_days, discovery_year, has_atmosphere) VALUES
('Moon', 3, 3474, 27.3, -1, FALSE),
('Phobos', 4, 22, 0.32, 1877, FALSE),
('Deimos', 4, 12, 1.26, 1877, FALSE),
('Io', 5, 3643, 1.77, 1610, TRUE),
('Europa', 5, 3122, 3.55, 1610, FALSE),
('Ganymede', 5, 5268, 7.15, 1610, TRUE),
('Callisto', 5, 4821, 16.69, 1610, FALSE),
('Amalthea', 5, 167, 0.5, 1892, FALSE),
('Himalia', 5, 140, 250.6, 1904, FALSE),
('Titan', 6, 5150, 15.95, 1655, TRUE),
('Rhea', 6, 1527, 4.52, 1672, FALSE),
('Iapetus', 6, 1469, 79.3, 1671, FALSE),
('Dione', 6, 1123, 2.74, 1684, FALSE),
('Tethys', 6, 1062, 1.89, 1684, FALSE),
('Enceladus', 6, 504, 1.37, 1789, TRUE),
('Titania', 7, 1578, 8.71, 1787, FALSE),
('Oberon', 7, 1523, 13.46, 1787, FALSE),
('Miranda', 7, 471, 1.41, 1948, FALSE),
('Umbriel', 7, 1169, 4.14, 1851, FALSE),
('Triton', 8, 2707, 5.88, 1846, TRUE),
('Nereid', 8, 340, 360.1, 1949, FALSE),
('Proteus', 8, 420, 1.12, 1989, FALSE),
('Centauri Luna', 9, 1800, 9.4, 2024, FALSE),
('Betel Satellite', 11, 2600, 210.5, 2024, TRUE);

-- ============================================================
-- INSERT DATA: comet (6 rows)
-- ============================================================
INSERT INTO comet (name, galaxy_id, orbital_period_years, composition, last_observed_year, is_periodic) VALUES
('Halley''s Comet', 1, 76, 'Ice, dust, and rocky material with frozen gases such as ammonia and methane', 1986, TRUE),
('Hale-Bopp', 1, 2533, 'Nucleus of ice and dust, unusually large and active for a comet', 1997, TRUE),
('NEOWISE', 1, 6800, 'Icy body coated in dark, sooty material likely from repeated solar passes', 2020, TRUE),
('Encke', 1, 3.3, 'Rocky and icy material with one of the shortest known orbital periods', 2023, TRUE),
('Hyakutake', 1, 70000, 'Ice and volatile compounds, noted for its unusually long ion tail', 1996, TRUE),
('ISON', 1, 400, 'Icy sungrazer composed of dust and frozen volatiles, disintegrated near perihelion', 2013, FALSE);
