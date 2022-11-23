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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    number_of_stars integer,
    age_in_millions_of_years numeric(6,2),
    galaxy_type character varying(50)
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
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    distance_from_planet numeric(4,2),
    is_spherical boolean
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
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    has_life boolean,
    planet_type character varying(50),
    population integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_info (
    planet_info_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    inhabitable boolean NOT NULL
);


ALTER TABLE public.planet_info OWNER TO freecodecamp;

--
-- Name: planet_info_planet_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_info_planet_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_info_planet_info_id_seq OWNER TO freecodecamp;

--
-- Name: planet_info_planet_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_info_planet_info_id_seq OWNED BY public.planet_info.planet_info_id;


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
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age_in_millions_of_years numeric(6,2),
    description text
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
-- Name: planet_info planet_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_info ALTER COLUMN planet_info_id SET DEFAULT nextval('public.planet_info_planet_info_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'GALAXY A', 1, 5.00, 'TYPE A');
INSERT INTO public.galaxy VALUES (2, 'GALAXY B', 1, 5.00, 'TYPE B');
INSERT INTO public.galaxy VALUES (3, 'GALAXY C', 1, 5.00, 'TYPE C');
INSERT INTO public.galaxy VALUES (4, 'GALAXY D', 1, 5.00, 'TYPE D');
INSERT INTO public.galaxy VALUES (5, 'GALAXY E', 1, 5.00, 'TYPE E');
INSERT INTO public.galaxy VALUES (6, 'GALAXY F', 1, 5.00, 'TYPE F');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'LOREM IPSUM', 1.00, true);
INSERT INTO public.moon VALUES (2, 1, 'LOREM IPSUM', 1.00, true);
INSERT INTO public.moon VALUES (3, 1, 'LOREM IPSUM', 1.00, true);
INSERT INTO public.moon VALUES (4, 1, 'LOREM IPSUM', 1.00, true);
INSERT INTO public.moon VALUES (5, 1, 'LOREM IPSUM', 1.00, true);
INSERT INTO public.moon VALUES (6, 1, 'LOREM IPSUM', 1.00, true);
INSERT INTO public.moon VALUES (7, 1, 'LOREM IPSUM', 1.00, true);
INSERT INTO public.moon VALUES (8, 1, 'LOREM IPSUM', 1.00, true);
INSERT INTO public.moon VALUES (9, 1, 'LOREM IPSUM', 1.00, true);
INSERT INTO public.moon VALUES (10, 1, 'LOREM IPSUM', 1.00, true);
INSERT INTO public.moon VALUES (11, 1, 'LOREM IPSUM', 1.00, true);
INSERT INTO public.moon VALUES (12, 1, 'LOREM IPSUM', 1.00, true);
INSERT INTO public.moon VALUES (13, 1, 'LOREM IPSUM', 1.00, true);
INSERT INTO public.moon VALUES (14, 1, 'LOREM IPSUM', 1.00, true);
INSERT INTO public.moon VALUES (15, 1, 'LOREM IPSUM', 1.00, true);
INSERT INTO public.moon VALUES (16, 2, 'LOREM IPSUM', 1.00, true);
INSERT INTO public.moon VALUES (17, 2, 'LOREM IPSUM', 1.00, true);
INSERT INTO public.moon VALUES (18, 2, 'LOREM IPSUM', 1.00, true);
INSERT INTO public.moon VALUES (19, 2, 'LOREM IPSUM', 1.00, true);
INSERT INTO public.moon VALUES (20, 2, 'LOREM IPSUM', 1.00, true);
INSERT INTO public.moon VALUES (21, 2, 'LOREM IPSUM', 1.00, true);
INSERT INTO public.moon VALUES (22, 2, 'LOREM IPSUM', 1.00, true);
INSERT INTO public.moon VALUES (23, 2, 'LOREM IPSUM', 1.00, true);
INSERT INTO public.moon VALUES (24, 2, 'LOREM IPSUM', 1.00, true);
INSERT INTO public.moon VALUES (25, 2, 'LOREM IPSUM', 1.00, true);
INSERT INTO public.moon VALUES (26, 2, 'LOREM IPSUM', 1.00, true);
INSERT INTO public.moon VALUES (27, 2, 'LOREM IPSUM', 1.00, true);
INSERT INTO public.moon VALUES (28, 2, 'LOREM IPSUM', 1.00, true);
INSERT INTO public.moon VALUES (29, 2, 'LOREM IPSUM', 1.00, true);
INSERT INTO public.moon VALUES (30, 2, 'LOREM IPSUM', 1.00, true);
INSERT INTO public.moon VALUES (31, 3, 'LOREM IPSUM', 1.00, true);
INSERT INTO public.moon VALUES (32, 3, 'LOREM IPSUM', 1.00, true);
INSERT INTO public.moon VALUES (33, 3, 'LOREM IPSUM', 1.00, true);
INSERT INTO public.moon VALUES (34, 3, 'LOREM IPSUM', 1.00, true);
INSERT INTO public.moon VALUES (35, 3, 'LOREM IPSUM', 1.00, true);
INSERT INTO public.moon VALUES (36, 3, 'LOREM IPSUM', 1.00, true);
INSERT INTO public.moon VALUES (37, 3, 'LOREM IPSUM', 1.00, true);
INSERT INTO public.moon VALUES (38, 3, 'LOREM IPSUM', 1.00, true);
INSERT INTO public.moon VALUES (39, 3, 'LOREM IPSUM', 1.00, true);
INSERT INTO public.moon VALUES (40, 3, 'LOREM IPSUM', 1.00, true);
INSERT INTO public.moon VALUES (41, 3, 'LOREM IPSUM', 1.00, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Planet A', true, 'Type A', 1500);
INSERT INTO public.planet VALUES (2, 1, 'Planet B', false, 'TYPE B', 0);
INSERT INTO public.planet VALUES (3, 2, 'Planet A', true, 'Type A', 1500);
INSERT INTO public.planet VALUES (4, 2, 'Planet B', false, 'TYPE B', 0);
INSERT INTO public.planet VALUES (5, 3, 'Planet A', true, 'Type A', 1500);
INSERT INTO public.planet VALUES (6, 3, 'Planet B', false, 'TYPE B', 0);
INSERT INTO public.planet VALUES (7, 5, 'Planet A', true, 'Type A', 1500);
INSERT INTO public.planet VALUES (8, 4, 'Planet B', false, 'TYPE B', 0);
INSERT INTO public.planet VALUES (9, 4, 'Planet A', true, 'Type A', 1500);
INSERT INTO public.planet VALUES (10, 5, 'Planet B', false, 'TYPE B', 0);
INSERT INTO public.planet VALUES (11, 6, 'Planet A', true, 'Type A', 1500);
INSERT INTO public.planet VALUES (12, 6, 'Planet B', false, 'TYPE B', 0);


--
-- Data for Name: planet_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_info VALUES (1, 1, 'LOREM', true);
INSERT INTO public.planet_info VALUES (2, 2, 'LOREM', true);
INSERT INTO public.planet_info VALUES (3, 3, 'LOREM', true);
INSERT INTO public.planet_info VALUES (4, 4, 'LOREM', true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'GALAXY A', 5.00, 'TYPE A');
INSERT INTO public.star VALUES (2, 2, 'GALAXY B', 5.00, 'TYPE B');
INSERT INTO public.star VALUES (3, 3, 'GALAXY C', 5.00, 'TYPE C');
INSERT INTO public.star VALUES (4, 4, 'GALAXY D', 5.00, 'TYPE D');
INSERT INTO public.star VALUES (5, 5, 'GALAXY E', 5.00, 'TYPE E');
INSERT INTO public.star VALUES (6, 6, 'GALAXY F', 5.00, 'TYPE F');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 41, true);


--
-- Name: planet_info_planet_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_info_planet_info_id_seq', 4, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet_info planet_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_info
    ADD CONSTRAINT planet_info_pkey PRIMARY KEY (planet_info_id);


--
-- Name: planet_info planet_info_planet_info_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_info
    ADD CONSTRAINT planet_info_planet_info_id_key UNIQUE (planet_info_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet_info planet_info_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_info
    ADD CONSTRAINT planet_info_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

