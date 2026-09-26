--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    orbital_period_years numeric,
    composition text,
    last_observed_year integer,
    is_periodic boolean
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    distance_from_earth_mly numeric,
    diameter_ly integer,
    has_supermassive_black_hole boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    diameter_km integer,
    orbital_period_days numeric,
    discovery_year integer,
    has_atmosphere boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    planet_type character varying(50),
    orbital_period_days numeric,
    moon_count integer,
    has_rings boolean,
    is_habitable boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    spectral_type character varying(10),
    mass_solar_masses numeric,
    temperature_kelvin integer,
    is_variable boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley''s Comet', 1, 76, 'Ice, dust, and rocky material with frozen gases such as ammonia and methane', 1986, true);
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 1, 2533, 'Nucleus of ice and dust, unusually large and active for a comet', 1997, true);
INSERT INTO public.comet VALUES (3, 'NEOWISE', 1, 6800, 'Icy body coated in dark, sooty material likely from repeated solar passes', 2020, true);
INSERT INTO public.comet VALUES (4, 'Encke', 1, 3.3, 'Rocky and icy material with one of the shortest known orbital periods', 2023, true);
INSERT INTO public.comet VALUES (5, 'Hyakutake', 1, 70000, 'Ice and volatile compounds, noted for its unusually long ion tail', 1996, true);
INSERT INTO public.comet VALUES (6, 'ISON', 1, 400, 'Icy sungrazer composed of dust and frozen volatiles, disintegrated near perihelion', 2013, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred Spiral', 0, 105700, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2.537, 220000, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 2.73, 60000, false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 23, 60000, true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Lenticular', 29.3, 50000, true);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 'Lenticular Ring', 500, 150000, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 3474, 27.3, -1, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22, 0.32, 1877, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12, 1.26, 1877, false);
INSERT INTO public.moon VALUES (4, 'Io', 5, 3643, 1.77, 1610, true);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3122, 3.55, 1610, false);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 5268, 7.15, 1610, true);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4821, 16.69, 1610, false);
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 167, 0.5, 1892, false);
INSERT INTO public.moon VALUES (9, 'Himalia', 5, 140, 250.6, 1904, false);
INSERT INTO public.moon VALUES (10, 'Titan', 6, 5150, 15.95, 1655, true);
INSERT INTO public.moon VALUES (11, 'Rhea', 6, 1527, 4.52, 1672, false);
INSERT INTO public.moon VALUES (12, 'Iapetus', 6, 1469, 79.3, 1671, false);
INSERT INTO public.moon VALUES (13, 'Dione', 6, 1123, 2.74, 1684, false);
INSERT INTO public.moon VALUES (14, 'Tethys', 6, 1062, 1.89, 1684, false);
INSERT INTO public.moon VALUES (15, 'Enceladus', 6, 504, 1.37, 1789, true);
INSERT INTO public.moon VALUES (16, 'Titania', 7, 1578, 8.71, 1787, false);
INSERT INTO public.moon VALUES (17, 'Oberon', 7, 1523, 13.46, 1787, false);
INSERT INTO public.moon VALUES (18, 'Miranda', 7, 471, 1.41, 1948, false);
INSERT INTO public.moon VALUES (19, 'Umbriel', 7, 1169, 4.14, 1851, false);
INSERT INTO public.moon VALUES (20, 'Triton', 8, 2707, 5.88, 1846, true);
INSERT INTO public.moon VALUES (21, 'Nereid', 8, 340, 360.1, 1949, false);
INSERT INTO public.moon VALUES (22, 'Proteus', 8, 420, 1.12, 1989, false);
INSERT INTO public.moon VALUES (23, 'Centauri Luna', 9, 1800, 9.4, 2024, false);
INSERT INTO public.moon VALUES (24, 'Betel Satellite', 11, 2600, 210.5, 2024, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', 88, 0, false, false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', 224.7, 0, false, false);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', 365.25, 1, false, true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', 687, 2, false, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas Giant', 4333, 95, true, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas Giant', 10759, 146, true, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice Giant', 30687, 27, true, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice Giant', 60190, 14, true, false);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 4, 'Terrestrial', 11.2, 0, false, true);
INSERT INTO public.planet VALUES (10, 'Sirius Ab I', 2, 'Gas Giant', 750, 0, false, false);
INSERT INTO public.planet VALUES (11, 'Betelgeuse Prime', 3, 'Gas Giant', 3200, 0, true, false);
INSERT INTO public.planet VALUES (12, 'Antares I', 5, 'Terrestrial', 410, 0, false, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G2V', 1.0, 5778, false);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'A1V', 2.02, 9940, false);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 'M1-2', 16.5, 3600, true);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1, 'M5.5Ve', 0.12, 3042, true);
INSERT INTO public.star VALUES (5, 'Antares', 1, 'M1.5', 12.4, 3660, true);
INSERT INTO public.star VALUES (6, 'Deneb', 1, 'A2Ia', 19, 8525, false);
INSERT INTO public.star VALUES (7, 'Alpheratz', 2, 'B8IV', 3.8, 13800, false);
INSERT INTO public.star VALUES (8, 'Mirach', 2, 'M0III', 2.49, 3817, false);
INSERT INTO public.star VALUES (9, 'Beta Trianguli', 3, 'A5IV', 3.5, 8100, false);
INSERT INTO public.star VALUES (10, 'Whirlpool Central', 4, 'B2III', 8.4, 20500, false);
INSERT INTO public.star VALUES (11, 'Sombrero Prime', 5, 'K1III', 4.1, 4600, false);
INSERT INTO public.star VALUES (12, 'Cartwheel Alpha', 6, 'O5V', 40, 42000, true);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: comet comet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

