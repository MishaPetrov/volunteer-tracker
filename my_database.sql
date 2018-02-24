--
-- PostgreSQL database dump
--

-- Dumped from database version 10.2
-- Dumped by pg_dump version 10.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: doctors; Type: TABLE; Schema: public; Owner: michaelpetrov
--

CREATE TABLE doctors (
    id integer NOT NULL,
    name character varying,
    specialty character varying
);


ALTER TABLE doctors OWNER TO michaelpetrov;

--
-- Name: doctors_id_seq; Type: SEQUENCE; Schema: public; Owner: michaelpetrov
--

CREATE SEQUENCE doctors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE doctors_id_seq OWNER TO michaelpetrov;

--
-- Name: doctors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: michaelpetrov
--

ALTER SEQUENCE doctors_id_seq OWNED BY doctors.id;


--
-- Name: patients; Type: TABLE; Schema: public; Owner: michaelpetrov
--

CREATE TABLE patients (
    id integer NOT NULL,
    name character varying,
    ssn integer,
    birthday timestamp without time zone,
    doctor_id integer
);


ALTER TABLE patients OWNER TO michaelpetrov;

--
-- Name: patients_id_seq; Type: SEQUENCE; Schema: public; Owner: michaelpetrov
--

CREATE SEQUENCE patients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE patients_id_seq OWNER TO michaelpetrov;

--
-- Name: patients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: michaelpetrov
--

ALTER SEQUENCE patients_id_seq OWNED BY patients.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: michaelpetrov
--

CREATE TABLE projects (
    id integer NOT NULL,
    title character varying
);


ALTER TABLE projects OWNER TO michaelpetrov;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: michaelpetrov
--

CREATE SEQUENCE projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE projects_id_seq OWNER TO michaelpetrov;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: michaelpetrov
--

ALTER SEQUENCE projects_id_seq OWNED BY projects.id;


--
-- Name: volunteers; Type: TABLE; Schema: public; Owner: michaelpetrov
--

CREATE TABLE volunteers (
    id integer NOT NULL,
    name character varying,
    project_id integer
);


ALTER TABLE volunteers OWNER TO michaelpetrov;

--
-- Name: volunteers_id_seq; Type: SEQUENCE; Schema: public; Owner: michaelpetrov
--

CREATE SEQUENCE volunteers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE volunteers_id_seq OWNER TO michaelpetrov;

--
-- Name: volunteers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: michaelpetrov
--

ALTER SEQUENCE volunteers_id_seq OWNED BY volunteers.id;


--
-- Name: doctors id; Type: DEFAULT; Schema: public; Owner: michaelpetrov
--

ALTER TABLE ONLY doctors ALTER COLUMN id SET DEFAULT nextval('doctors_id_seq'::regclass);


--
-- Name: patients id; Type: DEFAULT; Schema: public; Owner: michaelpetrov
--

ALTER TABLE ONLY patients ALTER COLUMN id SET DEFAULT nextval('patients_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: michaelpetrov
--

ALTER TABLE ONLY projects ALTER COLUMN id SET DEFAULT nextval('projects_id_seq'::regclass);


--
-- Name: volunteers id; Type: DEFAULT; Schema: public; Owner: michaelpetrov
--

ALTER TABLE ONLY volunteers ALTER COLUMN id SET DEFAULT nextval('volunteers_id_seq'::regclass);


--
-- Data for Name: doctors; Type: TABLE DATA; Schema: public; Owner: michaelpetrov
--

COPY doctors (id, name, specialty) FROM stdin;
\.


--
-- Data for Name: patients; Type: TABLE DATA; Schema: public; Owner: michaelpetrov
--

COPY patients (id, name, ssn, birthday, doctor_id) FROM stdin;
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: michaelpetrov
--

COPY projects (id, title) FROM stdin;
521	Clean up Montgomery St 
522	Downtown Weekly Litter Cleanup March
523	 Caregiver Relief for Hospice Patients
524	 Host an Exchange Student in Portland!
525	Community Outreach & Enrollment Assistant
526	 Community Health Center Patient Advocate
527	Volunteer at the Portland International Film Festival
\.


--
-- Data for Name: volunteers; Type: TABLE DATA; Schema: public; Owner: michaelpetrov
--

COPY volunteers (id, name, project_id) FROM stdin;
331	Jarod Dansby	521
332	Trudy Bee	521
333	Marin Paez	521
334	Norman Aylesworth	522
335	Mason Orduno	522
336	Carina Delong	523
337	Rickie Munroe	523
338	Bertie Cossette	523
339	Merlin Petteway	523
340	Raymond Paylor	524
341	Laveta Koga	524
342	Verdie Drapeau	525
343	Margeret Knudsen	527
344	Annika Johannes	527
345	Marquis Litwin	527
346	Dominque Moro	526
\.


--
-- Name: doctors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: michaelpetrov
--

SELECT pg_catalog.setval('doctors_id_seq', 1, false);


--
-- Name: patients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: michaelpetrov
--

SELECT pg_catalog.setval('patients_id_seq', 1, false);


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: michaelpetrov
--

SELECT pg_catalog.setval('projects_id_seq', 527, true);


--
-- Name: volunteers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: michaelpetrov
--

SELECT pg_catalog.setval('volunteers_id_seq', 346, true);


--
-- Name: doctors doctors_pkey; Type: CONSTRAINT; Schema: public; Owner: michaelpetrov
--

ALTER TABLE ONLY doctors
    ADD CONSTRAINT doctors_pkey PRIMARY KEY (id);


--
-- Name: patients patients_pkey; Type: CONSTRAINT; Schema: public; Owner: michaelpetrov
--

ALTER TABLE ONLY patients
    ADD CONSTRAINT patients_pkey PRIMARY KEY (id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: michaelpetrov
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: volunteers volunteers_pkey; Type: CONSTRAINT; Schema: public; Owner: michaelpetrov
--

ALTER TABLE ONLY volunteers
    ADD CONSTRAINT volunteers_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

