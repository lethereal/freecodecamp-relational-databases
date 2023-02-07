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
-- Name: astronomer; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.astronomer (
    astronomer_id integer NOT NULL,
    name character varying(60) NOT NULL,
    dateofbirth date,
    dateofdeath date,
    nationality character varying(120)
);


ALTER TABLE public.astronomer OWNER TO freecodecamp;

--
-- Name: astronomer_astronomer_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.astronomer_astronomer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.astronomer_astronomer_id_seq OWNER TO freecodecamp;

--
-- Name: astronomer_astronomer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.astronomer_astronomer_id_seq OWNED BY public.astronomer.astronomer_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(60) NOT NULL,
    galaxy_id integer NOT NULL,
    name_origin text,
    notes text,
    constellation character varying(60) NOT NULL,
    distance numeric(6,2),
    type character varying(60)
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
    name character varying(60) NOT NULL,
    composition text,
    sister_moons_qt integer,
    discovery_date date,
    planet_id integer,
    discovered_by integer[]
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
    name character varying(60) NOT NULL,
    known_satellites integer,
    star_id integer,
    confirmed boolean NOT NULL,
    mass_in_jupiters numeric(8,6),
    haslife boolean NOT NULL
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
    name character varying(60) NOT NULL,
    age_million_years integer,
    solar_luminosity integer,
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
-- Name: astronomer astronomer_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomer ALTER COLUMN astronomer_id SET DEFAULT nextval('public.astronomer_astronomer_id_seq'::regclass);


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
-- Data for Name: astronomer; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.astronomer VALUES (1, 'The Ancients', NULL, NULL, NULL);
INSERT INTO public.astronomer VALUES (2, 'Asaph Hall', '1829-10-15', '1907-11-22', 'American');
INSERT INTO public.astronomer VALUES (3, 'Galileo Galilei', '1564-02-15', '1642-01-08', 'Florentine');
INSERT INTO public.astronomer VALUES (4, 'Simon Marium', '1573-01-10', '1625-01-05', 'German');
INSERT INTO public.astronomer VALUES (5, 'Christiaan Huygens', '1629-04-14', '1695-07-08', 'Dutch');
INSERT INTO public.astronomer VALUES (6, 'Giovanni Cassini', '1625-06-08', '1712-09-14', 'Italian, naturalised French');
INSERT INTO public.astronomer VALUES (7, 'William Herschel', '1738-09-15', '1822-08-25', 'Hanoverian, since 1793 British');
INSERT INTO public.astronomer VALUES (8, 'William Henry Pickering', '1858-02-15', '1938-01-16', 'American');
INSERT INTO public.astronomer VALUES (9, 'William Cranch Bond', '1789-09-09', '1859-01-29', 'American');
INSERT INTO public.astronomer VALUES (10, 'George Phillips Bond', '1825-05-20', '1865-02-17', 'American');
INSERT INTO public.astronomer VALUES (11, 'William Lassell', '1799-06-18', '1880-10-05', 'English');
INSERT INTO public.astronomer VALUES (12, 'Gerar Peter Kuiper', '1905-12-07', '1973-12-23', 'Dutch');
INSERT INTO public.astronomer VALUES (13, 'Erich Karkoschka', '1955-11-06', NULL, 'German');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Andromeda Galaxy', 1, 'Andromeda, which is shortened from "andromeda galaxy", gets its name from the area of the sky in which it appears, the constellation of Andromeda.', 'Andromeda is the closest big galaxy to the Milky Way and is expected to collide with the Milky Way around 4.5 billion years from now. The two will eventually merge into a single new galaxy called Milkdromeda.', 'Andromeda', 2.50, NULL);
INSERT INTO public.galaxy VALUES ('Antennae Galaxies', 2, 'Appearance is similar to an insect''s antennae.', NULL, 'Corvus', 65.00, 'SB(s)m pec / SA(s)m pec');
INSERT INTO public.galaxy VALUES ('Backward Galaxy', 3, 'It appears to rotate backwards, as the tips of the spiral arms point in the direction of the rotation.', NULL, 'Centaurus', 200.00, 'SA(r)ab');
INSERT INTO public.galaxy VALUES ('Black Eye Galaxy', 4, 'It has a spectacular dark band of absorbing dust in front of the galaxy''s bright nucleus, giving rise to its nicknames of the ""Black Eye"" or ""Evil Eye"" galaxy.', NULL, 'Coma Berenices', 17.30, '(R)SA(rs)ab');
INSERT INTO public.galaxy VALUES ('Comet Galaxy', 5, 'This galaxy is named after its unusual appearance, looking like a comet.', 'The comet effect is caused by tidal stripping by its galaxy cluster, Abell 2667.', 'Sculptor', 3200.00, 'dIrr');
INSERT INTO public.galaxy VALUES ('Condor Galaxy', 6, 'Named after a condor, a type of vulture that is one of the largest flying birds.', 'The largest known spiral galaxy, it has a diameter of over 665,300 light-years (204.0 kiloparsecs). It is tidally disturbed by the smaller lenticular galaxy IC 4970.', 'Pavo', 212.00, 'SB;s)b pec');
INSERT INTO public.galaxy VALUES ('Milky Way', 8, 'The appearance from Earth of the galaxy — a band of light', 'The galaxy containing the Sun and its Solar System, and therefore Earth.', 'Sagittarius', 0.00, 'Sb; Sbc; SB(rs)bc');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (3, 'Luna', 'Helium, Argon, Neon, Sodium, Potassium, Hydrogen, Radon', 0, NULL, 8, '{1}');
INSERT INTO public.moon VALUES (4, 'Phobos', 'Phyllosilicates', 1, '1877-08-18', 9, '{2}');
INSERT INTO public.moon VALUES (5, 'Deimos', 'Similar to C or D-type asteroids', 1, '1877-08-12', 9, '{2}');
INSERT INTO public.moon VALUES (6, 'Io', 'Silicate rock, iron, forsterite, basalt, sulfur', 91, '1610-01-08', 10, '{3}');
INSERT INTO public.moon VALUES (7, 'Europa', 'Primarily silicate rock', 91, '1610-01-08', 10, '{3,4}');
INSERT INTO public.moon VALUES (8, 'Ganymede', 'Rocky material and mostly water ices, ammonia', 91, '1610-01-07', 10, '{3}');
INSERT INTO public.moon VALUES (9, 'Callisto', 'Equal amounts of rock and ices, water ice, carbon dioxide, silicates and organic compounds.', 91, '1610-01-07', 10, '{3}');
INSERT INTO public.moon VALUES (10, 'Titan', 'Half ice, half rocky material.', 82, '1655-03-25', 11, '{5}');
INSERT INTO public.moon VALUES (11, 'Rhea', 'Water ice, albedo, silicate rock', 82, '1672-12-23', 11, '{6}');
INSERT INTO public.moon VALUES (12, 'Dione', 'Water ice, albedo, silicate rock', 82, '1684-03-30', 11, '{6}');
INSERT INTO public.moon VALUES (13, 'Enceladus', 'Atmosfere of 91% water vapor, 4% nitrogen, 3.2% carbon dioxide, 1.7% methane. Crust composed of ice and rock.', 82, '1789-08-28', 11, '{7}');
INSERT INTO public.moon VALUES (14, 'Iapetus', 'Ice, carbonceus organic compounds, including cyano-compounds such as frozen hydrogen cyanide polymers', 82, '1671-10-25', 11, '{6}');
INSERT INTO public.moon VALUES (15, 'Phoebe', 'Ice, carbon dioxide, rock', 82, '1899-03-18', 11, '{8}');
INSERT INTO public.moon VALUES (16, 'Hyperion', 'Water ice and a small ammount of rock.', 82, '1848-09-16', 11, '{9,10,11}');
INSERT INTO public.moon VALUES (17, 'Titania', 'Ice, water ice, frozen carbon dioxide and rock.', 26, '1787-01-11', 12, '{7}');
INSERT INTO public.moon VALUES (18, 'Oberon', 'Water ice, and a dense non-ice componente that could be made of rock and carbonaceous material including heavy organic compounds.', 26, '1787-01-11', 12, '{7}');
INSERT INTO public.moon VALUES (19, 'Ariel', 'Equal parts water ice and a dense non-ice compotent that could consist of rock and carboneceous material including heavy organic compounds known as tholins.', 26, '1851-10-24', 12, '{11}');
INSERT INTO public.moon VALUES (20, 'Umbriel', 'Water and a dense non-ice component that could be made of rock and carbonaceous material including heavy organic compounds known as tholins.', 26, '1851-10-24', 12, '{11}');
INSERT INTO public.moon VALUES (21, 'Miranda', '60% water ice, silicate rock and organic compounds.', 26, '1948-02-16', 12, '{12}');
INSERT INTO public.moon VALUES (22, 'Perdita', 'Unknown', 26, '1999-05-18', 12, '{13}');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Upsilon Andromedae b', 0, 1, true, 0.620000, false);
INSERT INTO public.planet VALUES (2, 'Upsilon Andromedae c', 0, 1, true, 9.100000, false);
INSERT INTO public.planet VALUES (3, 'Majriti', 0, 1, true, 23.580000, false);
INSERT INTO public.planet VALUES (4, 'Upsilon Andromedae e', 0, 1, false, 1.059000, false);
INSERT INTO public.planet VALUES (5, '11 Comae Berenices b', 0, 4, true, 19.400000, false);
INSERT INTO public.planet VALUES (6, 'Mercury', 0, 8, true, 0.570000, false);
INSERT INTO public.planet VALUES (7, 'Venus', 0, 8, true, 0.380000, false);
INSERT INTO public.planet VALUES (8, 'Earth', 1, 8, true, 0.310000, true);
INSERT INTO public.planet VALUES (9, 'Mars', 2, 8, true, 0.310000, true);
INSERT INTO public.planet VALUES (10, 'Jupiter', 2, 8, true, 0.790000, false);
INSERT INTO public.planet VALUES (11, 'Saturn', 83, 8, true, 0.330000, false);
INSERT INTO public.planet VALUES (12, 'Uranus', 27, 8, true, 0.210000, false);
INSERT INTO public.planet VALUES (13, 'Neptune', 14, 8, true, 1.850000, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Gamma Corvi', 160, 355, 2);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 6500, 1521, 3);
INSERT INTO public.star VALUES (5, 'Alpha Sculptoris', 93, 1549, 5);
INSERT INTO public.star VALUES (6, 'Alpha Pavonis', 48, 2200, 6);
INSERT INTO public.star VALUES (1, 'Upsilon Andromedae', 3120, 4, 1);
INSERT INTO public.star VALUES (4, '11 Comae Berenices', 1530, 125, 4);
INSERT INTO public.star VALUES (8, 'Sol', 4600, 4, 8);


--
-- Name: astronomer_astronomer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.astronomer_astronomer_id_seq', 13, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 38, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: astronomer astronomer_astronomer_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomer
    ADD CONSTRAINT astronomer_astronomer_id_key UNIQUE (astronomer_id);


--
-- Name: astronomer astronomer_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomer
    ADD CONSTRAINT astronomer_name_key UNIQUE (name);


--
-- Name: astronomer astronomer_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomer
    ADD CONSTRAINT astronomer_pkey PRIMARY KEY (astronomer_id);


--
-- Name: galaxy galaxy_constellation_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constellation_key UNIQUE (constellation);


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
-- Name: star fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--