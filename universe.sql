--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: dwarf_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.dwarf_planet (
    dwarf_planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    mass_1021_kg numeric NOT NULL,
    diameter_km integer,
    moon_number integer,
    star_id integer
);


ALTER TABLE public.dwarf_planet OWNER TO freecodecamp;

--
-- Name: dwarf_planet_dwarf_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.dwarf_planet_dwarf_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dwarf_planet_dwarf_planet_id_seq OWNER TO freecodecamp;

--
-- Name: dwarf_planet_dwarf_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.dwarf_planet_dwarf_planet_id_seq OWNED BY public.dwarf_planet.dwarf_planet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    type text NOT NULL,
    diameter_ly integer,
    distance_from_earth_mly numeric,
    constellation character varying(20)
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
    name character varying(20) NOT NULL,
    mass_1021_kg numeric NOT NULL,
    diameter_km integer,
    gravity_ms2 numeric,
    magnetic_field boolean,
    planet_id integer
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
    name character varying(20) NOT NULL,
    mass_1024_kg numeric NOT NULL,
    diameter_km integer,
    gravity_ms2 numeric,
    rings boolean,
    moon_number integer,
    magnetic_field boolean,
    star_id integer
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
    designation text NOT NULL,
    constellation character varying(20),
    distance_from_earth_ly integer,
    galaxy_id integer,
    name character varying(20)
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
-- Name: dwarf_planet dwarf_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet ALTER COLUMN dwarf_planet_id SET DEFAULT nextval('public.dwarf_planet_dwarf_planet_id_seq'::regclass);


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
-- Data for Name: dwarf_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.dwarf_planet VALUES (1, 'Orcus', 0.55, 910, 1, 6);
INSERT INTO public.dwarf_planet VALUES (2, 'Salacia', 0.49, 846, 1, 6);
INSERT INTO public.dwarf_planet VALUES (3, 'Haumea', 4.01, 1560, 2, 6);
INSERT INTO public.dwarf_planet VALUES (4, 'Quaoar', 1.2, 1086, 1, 6);
INSERT INTO public.dwarf_planet VALUES (5, 'Makemake', 3.1, 1430, 1, 6);
INSERT INTO public.dwarf_planet VALUES (6, 'Gonggong', 1.75, 1230, 1, 6);
INSERT INTO public.dwarf_planet VALUES (7, 'Eris', 16.47, 2326, 1, 6);
INSERT INTO public.dwarf_planet VALUES (8, 'Sedna', 1, 960, 0, 6);
INSERT INTO public.dwarf_planet VALUES (9, 'Ceres', 0.94, 939, 0, 6);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'barred spiral', 87400, NULL, 'Sagittarius');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'barred spiral', 152000, 2.5, 'Andromeda');
INSERT INTO public.galaxy VALUES (3, 'Black Eye', 'spiral', 53800, 17, 'Coma Berenices');
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 'spiral', 61100, 2.73, 'Triangulum');
INSERT INTO public.galaxy VALUES (5, 'Porphyrion', 'Fanaroff Riley class II radio', NULL, 75, 'Draco');
INSERT INTO public.galaxy VALUES (6, 'Messier 63', 'spiral', NULL, 29.3, 'Canes Venatici');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 73.5, 3475, 1.6, false, 3);
INSERT INTO public.moon VALUES (2, 'Callisto', 107.6, 4821, 1.24, false, 5);
INSERT INTO public.moon VALUES (3, 'Ganymede', 148.2, 5262, 1.43, true, 5);
INSERT INTO public.moon VALUES (4, 'Europa', 48, 3122, 1.31, false, 5);
INSERT INTO public.moon VALUES (5, 'IO', 89.3, 3643, 1.8, true, 5);
INSERT INTO public.moon VALUES (7, 'Triton', 21.5, 2705, 0.78, NULL, 8);
INSERT INTO public.moon VALUES (8, 'Phobos', 0.00001, 22, NULL, NULL, 4);
INSERT INTO public.moon VALUES (9, 'Deimos', 0.000002, 13, NULL, NULL, 4);
INSERT INTO public.moon VALUES (10, 'Miranda', 0.063, 471, NULL, NULL, 7);
INSERT INTO public.moon VALUES (11, 'Ariel', 1.23, 1157, NULL, NULL, 7);
INSERT INTO public.moon VALUES (12, 'Umbriel', 1.29, 1169, NULL, NULL, 7);
INSERT INTO public.moon VALUES (13, 'Titania', 3.46, 1576, NULL, NULL, 7);
INSERT INTO public.moon VALUES (14, 'Oberon', 3.11, 1522, NULL, NULL, 7);
INSERT INTO public.moon VALUES (15, 'Mimas', 0.04, 396, NULL, NULL, 6);
INSERT INTO public.moon VALUES (16, 'Enceladus', 0.11, 504, NULL, NULL, 6);
INSERT INTO public.moon VALUES (17, 'Tethys', 0.62, 1062, NULL, NULL, 6);
INSERT INTO public.moon VALUES (18, 'Dione', 1.1, 1123, NULL, NULL, 6);
INSERT INTO public.moon VALUES (19, 'Rhea', 2.3, 1527, NULL, NULL, 6);
INSERT INTO public.moon VALUES (20, 'Iapetus', 1.8, 1470, NULL, NULL, 6);
INSERT INTO public.moon VALUES (6, 'Titan', 134.6, 5150, 1.35, NULL, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0.33, 4879, 3.7, false, 0, true, 6);
INSERT INTO public.planet VALUES (2, 'Venus', 4.87, 12104, 8.9, false, 0, false, 6);
INSERT INTO public.planet VALUES (3, 'Earth', 5.97, 12756, 9.8, false, 1, true, 6);
INSERT INTO public.planet VALUES (4, 'Mars', 0.64, 6792, 3.7, false, 2, false, 6);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1898, 142984, 23.1, true, 95, true, 6);
INSERT INTO public.planet VALUES (6, 'Saturn', 568, 120536, 9, true, 146, true, 6);
INSERT INTO public.planet VALUES (7, 'Uranus', 86.8, 51118, 8.7, true, 28, true, 6);
INSERT INTO public.planet VALUES (8, 'Neptune', 102, 49528, 11, true, 16, true, 6);
INSERT INTO public.planet VALUES (9, 'Pluto', 0.01, 2376, 0.7, false, 5, NULL, 6);
INSERT INTO public.planet VALUES (10, 'Poltergeist', 25.6, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (11, 'Phobetor', 23.3, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (12, 'Drangr', 0.12, NULL, NULL, NULL, NULL, NULL, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'PSR B1257+12', 'Virgo', 2300, 1, 'Lich');
INSERT INTO public.star VALUES (2, 'XO-5', 'Lynx', 893, 1, 'Absolutno');
INSERT INTO public.star VALUES (3, 'Orionis Aa', 'Orion', 497, 1, 'Betelgeuse');
INSERT INTO public.star VALUES (4, 'Virginis Aa', 'Virgo', 250, 1, 'Spica');
INSERT INTO public.star VALUES (5, 'Ericlani', 'Eridanus', 139, 1, 'Achernar');
INSERT INTO public.star VALUES (6, 'sun', NULL, NULL, 1, 'sun');


--
-- Name: dwarf_planet_dwarf_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.dwarf_planet_dwarf_planet_id_seq', 9, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: dwarf_planet dwarf_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet
    ADD CONSTRAINT dwarf_planet_name_key UNIQUE (name);


--
-- Name: dwarf_planet dwarf_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet
    ADD CONSTRAINT dwarf_planet_pkey PRIMARY KEY (dwarf_planet_id);


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
-- Name: star star_designation_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_designation_key UNIQUE (designation);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: dwarf_planet dwarf_planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet
    ADD CONSTRAINT dwarf_planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

