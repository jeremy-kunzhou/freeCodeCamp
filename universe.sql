--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: action; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.action (
    action_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type integer NOT NULL,
    ref integer
);


ALTER TABLE public.action OWNER TO freecodecamp;

--
-- Name: actions_action_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.actions_action_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.actions_action_id_seq OWNER TO freecodecamp;

--
-- Name: actions_action_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.actions_action_id_seq OWNED BY public.action.action_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    galaxy_types character varying(30),
    has_life boolean NOT NULL
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
    name character varying(30) NOT NULL,
    description text,
    moon_types character varying(30),
    has_life boolean NOT NULL,
    distance_from_earth numeric(5,1),
    age_in_millions_of_years numeric(5,1),
    is_spherical boolean,
    planet_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    description text,
    planet_types character varying(30),
    has_life boolean NOT NULL,
    distance_from_earth numeric(5,1),
    age_in_millions_of_years numeric(5,1),
    is_spherical boolean,
    star_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    description text,
    star_types character varying(30),
    has_life boolean NOT NULL,
    distance_from_earth numeric(5,1),
    age_in_millions_of_years numeric(5,1),
    is_spherical boolean,
    galaxy_id integer NOT NULL
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
-- Name: action action_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.action ALTER COLUMN action_id SET DEFAULT nextval('public.actions_action_id_seq'::regclass);


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
-- Data for Name: action; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.action VALUES (1, '1', 1, 1);
INSERT INTO public.action VALUES (2, '2', 2, 2);
INSERT INTO public.action VALUES (3, '3', 3, 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, '1', '1', '1', false);
INSERT INTO public.galaxy VALUES (2, '2', '2', '2', false);
INSERT INTO public.galaxy VALUES (3, '3', '3', '3', false);
INSERT INTO public.galaxy VALUES (4, '4', '4', '4', false);
INSERT INTO public.galaxy VALUES (5, '5', '5', '5', false);
INSERT INTO public.galaxy VALUES (6, '6', '6', '6', false);
INSERT INTO public.galaxy VALUES (7, '7', '7', '7', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, '1', '1', '1', false, 1.1, 1.1, false, 1);
INSERT INTO public.moon VALUES (2, '2', '2', '2', false, 2.1, 2.1, false, 2);
INSERT INTO public.moon VALUES (3, '3', '3', '3', false, 3.1, 3.1, false, 3);
INSERT INTO public.moon VALUES (4, '4', '4', '4', false, 4.1, 4.1, false, 4);
INSERT INTO public.moon VALUES (5, '5', '5', '5', false, 5.1, 5.1, false, 5);
INSERT INTO public.moon VALUES (6, '6', '6', '6', false, 6.1, 6.1, false, 6);
INSERT INTO public.moon VALUES (7, '7', '7', '7', false, 7.1, 7.1, false, 6);
INSERT INTO public.moon VALUES (8, '8', '8', '8', false, 8.1, 8.1, false, 6);
INSERT INTO public.moon VALUES (9, '9', '9', '9', false, 9.1, 9.1, false, 6);
INSERT INTO public.moon VALUES (10, '10', '10', '10', false, 10.1, 10.1, false, 6);
INSERT INTO public.moon VALUES (11, '11', '11', '11', false, 11.1, 11.1, false, 6);
INSERT INTO public.moon VALUES (12, '12', '12', '12', false, 12.1, 12.1, false, 6);
INSERT INTO public.moon VALUES (13, '13', '13', '13', false, 13.1, 13.1, false, 6);
INSERT INTO public.moon VALUES (14, '14', '14', '14', false, 14.1, 14.1, false, 6);
INSERT INTO public.moon VALUES (15, '15', '15', '15', false, 15.1, 15.1, false, 6);
INSERT INTO public.moon VALUES (16, '16', '16', '16', false, 16.1, 16.1, false, 6);
INSERT INTO public.moon VALUES (17, '17', '17', '17', false, 17.1, 17.1, false, 6);
INSERT INTO public.moon VALUES (18, '18', '18', '18', false, 18.1, 18.1, false, 6);
INSERT INTO public.moon VALUES (19, '19', '19', '19', false, 19.1, 19.1, false, 6);
INSERT INTO public.moon VALUES (20, '120', '120', '120', false, 120.1, 120.1, false, 6);
INSERT INTO public.moon VALUES (21, '121', '121', '121', false, 121.1, 121.1, false, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, '1', '1', '1', false, 1.1, 1.1, false, 1);
INSERT INTO public.planet VALUES (2, '2', '2', '2', false, 2.1, 2.1, false, 2);
INSERT INTO public.planet VALUES (3, '3', '3', '3', false, 3.1, 3.1, false, 3);
INSERT INTO public.planet VALUES (4, '4', '4', '4', false, 4.1, 4.1, false, 4);
INSERT INTO public.planet VALUES (5, '5', '5', '5', false, 5.1, 5.1, false, 5);
INSERT INTO public.planet VALUES (6, '6', '6', '6', false, 6.1, 6.1, false, 6);
INSERT INTO public.planet VALUES (7, '7', '7', '7', false, 7.1, 7.1, false, 6);
INSERT INTO public.planet VALUES (8, '8', '8', '8', false, 8.1, 8.1, false, 6);
INSERT INTO public.planet VALUES (9, '9', '9', '9', false, 9.1, 9.1, false, 6);
INSERT INTO public.planet VALUES (10, '10', '10', '10', false, 10.1, 10.1, false, 6);
INSERT INTO public.planet VALUES (11, '11', '11', '11', false, 11.1, 11.1, false, 6);
INSERT INTO public.planet VALUES (12, '12', '12', '12', false, 12.1, 12.1, false, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, '1', '1', '1', false, 1.1, 1.1, false, 1);
INSERT INTO public.star VALUES (2, '2', '2', '2', false, 2.1, 2.1, false, 2);
INSERT INTO public.star VALUES (3, '3', '3', '3', false, 3.1, 3.1, false, 3);
INSERT INTO public.star VALUES (4, '4', '4', '4', false, 4.1, 4.1, false, 4);
INSERT INTO public.star VALUES (5, '5', '5', '5', false, 5.1, 5.1, false, 5);
INSERT INTO public.star VALUES (6, '6', '6', '6', false, 6.1, 6.1, false, 6);


--
-- Name: actions_action_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.actions_action_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: action actions_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.action
    ADD CONSTRAINT actions_name_key UNIQUE (name);


--
-- Name: action actions_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.action
    ADD CONSTRAINT actions_name_key1 UNIQUE (name);


--
-- Name: action actions_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.action
    ADD CONSTRAINT actions_pkey PRIMARY KEY (action_id);


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

