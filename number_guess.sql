--
-- PostgreSQL database dump
--

-- Dumped from database version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    username character varying(22),
    user_id integer NOT NULL,
    num_guess integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_user_id_seq OWNER TO freecodecamp;

--
-- Name: games_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_user_id_seq OWNED BY public.games.user_id;


--
-- Name: games user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN user_id SET DEFAULT nextval('public.games_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES ('Reign', 1, 10);
INSERT INTO public.games VALUES ('user_1696229944625', 2, 265);
INSERT INTO public.games VALUES ('user_1696229944625', 3, 63);
INSERT INTO public.games VALUES ('user_1696229944624', 4, 969);
INSERT INTO public.games VALUES ('user_1696229944624', 5, 65);
INSERT INTO public.games VALUES ('user_1696229944625', 6, 308);
INSERT INTO public.games VALUES ('user_1696229944625', 7, 884);
INSERT INTO public.games VALUES ('user_1696229944625', 8, 563);
INSERT INTO public.games VALUES ('user_1696229948256', 9, 500);
INSERT INTO public.games VALUES ('user_1696229948256', 10, 390);
INSERT INTO public.games VALUES ('user_1696229948255', 11, 813);
INSERT INTO public.games VALUES ('user_1696229948255', 12, 213);
INSERT INTO public.games VALUES ('user_1696229948256', 13, 832);
INSERT INTO public.games VALUES ('user_1696229948256', 14, 478);
INSERT INTO public.games VALUES ('user_1696229948256', 15, 458);
INSERT INTO public.games VALUES ('user_1696230020326', 16, 773);
INSERT INTO public.games VALUES ('user_1696230020326', 17, 593);
INSERT INTO public.games VALUES ('user_1696230020325', 18, 852);
INSERT INTO public.games VALUES ('user_1696230020325', 19, 989);
INSERT INTO public.games VALUES ('user_1696230020326', 20, 113);
INSERT INTO public.games VALUES ('user_1696230020326', 21, 112);
INSERT INTO public.games VALUES ('user_1696230020326', 22, 631);
INSERT INTO public.games VALUES ('user_1696230162848', 23, 135);
INSERT INTO public.games VALUES ('user_1696230162848', 24, 172);
INSERT INTO public.games VALUES ('user_1696230162847', 25, 955);
INSERT INTO public.games VALUES ('user_1696230162847', 26, 302);
INSERT INTO public.games VALUES ('user_1696230162848', 27, 384);
INSERT INTO public.games VALUES ('user_1696230162848', 28, 745);
INSERT INTO public.games VALUES ('user_1696230162848', 29, 493);
INSERT INTO public.games VALUES ('user_1696230227892', 30, 712);
INSERT INTO public.games VALUES ('user_1696230227892', 31, 466);
INSERT INTO public.games VALUES ('user_1696230227891', 32, 810);
INSERT INTO public.games VALUES ('user_1696230227891', 33, 942);
INSERT INTO public.games VALUES ('user_1696230227892', 34, 951);
INSERT INTO public.games VALUES ('user_1696230227892', 35, 957);
INSERT INTO public.games VALUES ('user_1696230227892', 36, 754);
INSERT INTO public.games VALUES ('user_1696230260564', 37, 495);
INSERT INTO public.games VALUES ('user_1696230260564', 38, 62);
INSERT INTO public.games VALUES ('user_1696230260563', 39, 860);
INSERT INTO public.games VALUES ('user_1696230260563', 40, 88);
INSERT INTO public.games VALUES ('user_1696230260564', 41, 170);
INSERT INTO public.games VALUES ('user_1696230260564', 42, 736);
INSERT INTO public.games VALUES ('user_1696230260564', 43, 950);
INSERT INTO public.games VALUES ('user_1696230264663', 44, 503);
INSERT INTO public.games VALUES ('user_1696230264663', 45, 877);
INSERT INTO public.games VALUES ('user_1696230264662', 46, 852);
INSERT INTO public.games VALUES ('user_1696230264662', 47, 995);
INSERT INTO public.games VALUES ('user_1696230264663', 48, 442);
INSERT INTO public.games VALUES ('user_1696230264663', 49, 384);
INSERT INTO public.games VALUES ('user_1696230264663', 50, 982);
INSERT INTO public.games VALUES ('user_1696230309111', 51, 573);
INSERT INTO public.games VALUES ('user_1696230309111', 52, 828);
INSERT INTO public.games VALUES ('user_1696230309110', 53, 538);
INSERT INTO public.games VALUES ('user_1696230309110', 54, 713);
INSERT INTO public.games VALUES ('user_1696230309111', 55, 321);
INSERT INTO public.games VALUES ('user_1696230309111', 56, 98);
INSERT INTO public.games VALUES ('user_1696230309111', 57, 98);


--
-- Name: games_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_user_id_seq', 57, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

