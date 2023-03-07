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

CREATE TABLE galaxy
(
    galaxy_id    SERIAL PRIMARY KEY,
    name         VARCHAR(100) UNIQUE,
    notes        TEXT NOT NULL,
    has_life     BOOLEAN NOT NULL,
    number_of_stars VARCHAR(50) NOT NULL
);

CREATE TABLE star
(
    star_id      SERIAL PRIMARY KEY,
    name         VARCHAR(100) UNIQUE,
    notes        TEXT NOT NULL,
    number_of_planets INT NOT NULL,
    galaxy_id    INT,
    CONSTRAINT fk_galaxy_id FOREIGN KEY(galaxy_id) REFERENCES galaxy(galaxy_id)
);

CREATE TABLE planet
(
    planet_id    SERIAL PRIMARY KEY,
    name         VARCHAR(100) UNIQUE,
    notes        TEXT NOT NULL,
    number_of_moons INT NOT NULL,
    mass         NUMERIC(16,6),
    star_id      INT,
    CONSTRAINT fk_star_id FOREIGN KEY(star_id) REFERENCES star(star_id)
);

CREATE TABLE moon
(
    moon_id      SERIAL PRIMARY KEY,
    name         VARCHAR(100) UNIQUE,
    notes        TEXT NOT NULL,
    mass         NUMERIC(16,6) NOT NULL,
    planet_id    INT,
    CONSTRAINT fk_planet_id FOREIGN KEY(planet_id) REFERENCES planet(planet_id)
);

CREATE TABLE galaxy_add_on
(
    galaxy_add_on_id  SERIAL PRIMARY KEY,
    name           VARCHAR(100) UNIQUE,
    notes          TEXT NOT NULL,
    is_red         BOOLEAN NOT NULL,
    galaxy_id      INT,
    CONSTRAINT fk_galaxy_id FOREIGN KEY(galaxy_id) REFERENCES galaxy(galaxy_id)
);

INSERT INTO galaxy (name, notes, has_life, number_of_stars) 
VALUES ('Milky Way', 'Galaxy with life', TRUE, '100–500 billion'),
       ('Pinwheel Galaxy', 'Galaxy with no life', FALSE, '1 trillion'),
       ('Messier 77', 'Galaxy with no life', FALSE, '2 trillion'),
       ('NGC 1232', 'Spiral galaxy with no life', FALSE, '3 trillion'),
       ('Messier 90', 'Spiral galaxy with no life', FALSE, '2.5 trillion'),
       ('Virgo A', 'Elliptical Galaxy with no life', FALSE, '1 trillion');

INSERT INTO star (name, notes, number_of_planets, galaxy_id) 
VALUES ('Solar System', 'Star with life', 8,  1),
       ('Proxima Centauri', 'Star with no life', 3,  1),
       ('Alpha Centauri', 'Star with no life', 2,  1),
       ('Beta Centauri', 'Star with no life', 0,  1),
       ('Rigel', 'Star with no life', 0,  1),
       ('Betelgeuse', 'Star with no life', 0,  1);

INSERT INTO planet (name, notes, number_of_moons, mass, star_id) 
VALUES ('Earth', 'Planet with life', 1, 5.972168, 1),
       ('Mercury', 'Planet with no life', 0, 3.3011, 1),
       ('Venus', 'Planet with no life', 0, 4.8675, 1),
       ('Mars', 'Planet with no life', 2, 6.4171, 1),
       ('Jupiter', 'Planet with no life', 95, 1.8982, 1),
       ('Saturn', 'Planet with no life', 83, 5.6834, 1),
       ('Uranus', 'Planet with no life', 27, 8.6810, 1),
       ('Neptune', 'Planet with no life', 14, 1.5445, 1),
       ('Planet B', 'Planet with no life', 0, 0, 2),
       ('Planet D', 'Planet with no life', 0, 0, 2),
       ('Planet C', 'Planet with no life', 0, 0, 2),
       ('Candidate 1', 'Planet with no life', 0, 0, 3);

INSERT INTO moon (name, notes, mass, planet_id) 
VALUES ('Moon', 'Earth''s satellite', 1.111, 1),
       ('Io', 'Jupiter''s satellite', 2.111, 5),
       ('Europa', 'Jupiter''s satellite', 3.111, 5),
       ('Thebe', 'Jupiter''s satellite', 2.211, 5),
       ('Ganymede', 'Jupiter''s satellite', 3.121, 5),
       ('Callisto', 'Jupiter''s satellite', 1.141, 5),
       ('Adrastea', 'Jupiter''s satellite', 2.141, 5),
       ('Metis', 'Jupiter''s satellite', 6.141, 5),
       ('Leda', 'Jupiter''s satellite', 7.141, 5),
       ('Pandia', 'Jupiter''s satellite', 5.141, 5),
       ('Dia', 'Jupiter''s satellite', 1.141, 5),
       ('Carpo', 'Jupiter''s satellite', 0.141, 5),
       ('Mneme', 'Jupiter''s satellite', 0.131, 5),
       ('Mimas', 'Saturn''s satellite', 0.131, 6),
       ('Enceladus', 'Saturn''s satellite', 6.131, 6),
       ('Tethys', 'Saturn''s satellite', 5.131, 6),
       ('Dione', 'Saturn''s satellite', 4.131, 6),
       ('Rhea', 'Saturn''s satellite', 2.131, 6),
       ('Titan', 'Saturn''s satellite', 1.131, 6),
       ('Iapetus', 'Saturn''s satellite', 7.131, 6);

INSERT INTO galaxy_add_on (name, notes, is_red, galaxy_id) 
VALUES ('Milky Way', 'Galaxy with life', TRUE, 1),
       ('Pinwheel Galaxy', 'Galaxy with animals', FALSE, 2),
       ('Virgo A', 'Galaxy with no animals', TRUE, 6);

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

--
-- PostgreSQL database dump complete 
--

