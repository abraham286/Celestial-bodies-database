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
-- Name: universe; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO postgres;

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_type character varying(50) NOT NULL,
    description text,
    surface_temperature integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxies_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxies_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxies_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxies_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxies_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer,
    diameter numeric(6,1),
    orbital_period_days numeric(10,1)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moons_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moons_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moons_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moons_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moons_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    star_id integer,
    has_life boolean,
    no_of_moons integer,
    has_rings boolean,
    distance_from_sun integer
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
-- Name: space_mission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.space_mission (
    space_mission_id integer NOT NULL,
    mission_name character varying(50) NOT NULL,
    destination character varying(50),
    launch_year integer,
    mission_status character varying(50),
    name character varying(50)
);


ALTER TABLE public.space_mission OWNER TO postgres;

--
-- Name: space_mission_mission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.space_mission_mission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_mission_mission_id_seq OWNER TO postgres;

--
-- Name: space_mission_mission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.space_mission_mission_id_seq OWNED BY public.space_mission.space_mission_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    star_type character varying(50),
    galaxy_id integer,
    surface_temperature integer
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxies_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moons_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: space_mission space_mission_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.space_mission ALTER COLUMN space_mission_id SET DEFAULT nextval('public.space_mission_mission_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', ' Home galaxy of our Solar System', NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 'Nearest major galaxy to the Milky Way', NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', ' A member of the Local Group', NULL);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Elliptical', ' Giant elliptical galaxy', NULL);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', 'Spiral', 'Galaxy known for its prominent spiral arms', NULL);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel Galaxy', 'Spiral', 'Large face-on spiral galaxy', NULL);
INSERT INTO public.galaxy VALUES (7, 'Sombrero Galaxy', 'Spiral', 'Galaxy known for its bright central bulge and prominent dust lane', NULL);
INSERT INTO public.galaxy VALUES (8, 'Large Magellanic Cloud', 'Irregular', 'A dwarf galaxy near the Milky Way', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Io', 5, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Europa', 5, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, NULL, NULL);
INSERT INTO public.moon VALUES (22, 'Amalthea', 5, 167.0, NULL);
INSERT INTO public.moon VALUES (23, 'Himalia', 5, 139.6, NULL);
INSERT INTO public.moon VALUES (24, 'Titan', 6, 5149.5, NULL);
INSERT INTO public.moon VALUES (25, 'Enceladus', 6, 504.2, NULL);
INSERT INTO public.moon VALUES (26, 'Mimas', 6, 396.4, NULL);
INSERT INTO public.moon VALUES (27, 'Rhea', 6, 1527.6, NULL);
INSERT INTO public.moon VALUES (28, 'Iapetus', 6, 1469.0, NULL);
INSERT INTO public.moon VALUES (29, 'Dione', 6, 1122.8, NULL);
INSERT INTO public.moon VALUES (30, 'Tethys', 6, 1062.2, NULL);
INSERT INTO public.moon VALUES (31, 'Miranda', 7, 471.6, NULL);
INSERT INTO public.moon VALUES (32, 'Ariel', 7, 1157.8, NULL);
INSERT INTO public.moon VALUES (33, 'Umbriel', 7, 1169.4, NULL);
INSERT INTO public.moon VALUES (34, 'Triton', 33, 2706.8, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, false, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (2, 'Venus', 1, false, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (3, 'Earth', 1, true, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (4, 'Mars', 1, false, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, false, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, false, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, false, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (33, 'Neptune', 1, false, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (34, 'Ceres', 1, false, 0, false, NULL);
INSERT INTO public.planet VALUES (35, 'Pluto', 1, false, 5, false, NULL);
INSERT INTO public.planet VALUES (36, 'Haumea', 1, false, 2, true, NULL);
INSERT INTO public.planet VALUES (37, 'Eris', 1, false, 1, false, NULL);


--
-- Data for Name: space_mission; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.space_mission VALUES (1, 'Voyager 1', 'Jupiter', 1977, 'Active', NULL);
INSERT INTO public.space_mission VALUES (2, 'Voyager 2', 'Neptune', 1977, 'Active', NULL);
INSERT INTO public.space_mission VALUES (3, 'Cassini-Huygens', 'Saturn', 1997, 'Completed', NULL);
INSERT INTO public.space_mission VALUES (4, 'Mars Pathfinder', 'Mars', 1996, 'Completed', NULL);
INSERT INTO public.space_mission VALUES (5, 'Juno', 'Jupiter', 2011, 'Active', NULL);
INSERT INTO public.space_mission VALUES (6, 'New Horizons', 'Pluto', 2006, 'Active', NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G-type main-sequence', 1, NULL);
INSERT INTO public.star VALUES (2, 'Sirius', 'A-type main-sequence', 1, NULL);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 'Red dwarf', 1, NULL);
INSERT INTO public.star VALUES (4, 'Vega', 'A-type main-sequence', 1, NULL);
INSERT INTO public.star VALUES (5, 'Rigel', 'B-type blue supergiant', 1, NULL);
INSERT INTO public.star VALUES (6, 'Procyon', 'F-type main-sequence', 1, NULL);


--
-- Name: galaxies_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxies_galaxy_id_seq', 8, true);


--
-- Name: moons_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moons_moon_id_seq', 34, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 37, true);


--
-- Name: space_mission_mission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.space_mission_mission_id_seq', 6, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxies_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxies_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key1 UNIQUE (name);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key1 UNIQUE (name);


--
-- Name: moon moons_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moons_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key1 UNIQUE (name);


--
-- Name: planet planet_name_key2; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key2 UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: space_mission space_mission_mission_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.space_mission
    ADD CONSTRAINT space_mission_mission_name_key UNIQUE (mission_name);


--
-- Name: space_mission space_mission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.space_mission
    ADD CONSTRAINT space_mission_pkey PRIMARY KEY (space_mission_id);


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
-- Name: moon moons_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moons_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

