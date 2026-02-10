--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3 (Ubuntu 16.3-1.pgdg24.04+1)
-- Dumped by pg_dump version 16.3 (Ubuntu 16.3-1.pgdg24.04+1)

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
-- Name: training_schema; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA training_schema;


ALTER SCHEMA training_schema OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: courses; Type: TABLE; Schema: training_schema; Owner: postgres
--

CREATE TABLE training_schema.courses (
    id_course integer NOT NULL,
    course_name character varying(100) NOT NULL,
    description text,
    start_date date,
    end_date date,
    id_instructor integer
);


ALTER TABLE training_schema.courses OWNER TO postgres;

--
-- Name: courses_id_course_seq; Type: SEQUENCE; Schema: training_schema; Owner: postgres
--

CREATE SEQUENCE training_schema.courses_id_course_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE training_schema.courses_id_course_seq OWNER TO postgres;

--
-- Name: courses_id_course_seq; Type: SEQUENCE OWNED BY; Schema: training_schema; Owner: postgres
--

ALTER SEQUENCE training_schema.courses_id_course_seq OWNED BY training_schema.courses.id_course;


--
-- Name: instructors; Type: TABLE; Schema: training_schema; Owner: postgres
--

CREATE TABLE training_schema.instructors (
    id_instructor integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    phone character varying(15),
    specialization character varying(100)
);


ALTER TABLE training_schema.instructors OWNER TO postgres;

--
-- Name: instructors_id_instructor_seq; Type: SEQUENCE; Schema: training_schema; Owner: postgres
--

CREATE SEQUENCE training_schema.instructors_id_instructor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE training_schema.instructors_id_instructor_seq OWNER TO postgres;

--
-- Name: instructors_id_instructor_seq; Type: SEQUENCE OWNED BY; Schema: training_schema; Owner: postgres
--

ALTER SEQUENCE training_schema.instructors_id_instructor_seq OWNED BY training_schema.instructors.id_instructor;


--
-- Name: materials; Type: TABLE; Schema: training_schema; Owner: postgres
--

CREATE TABLE training_schema.materials (
    id_material integer NOT NULL,
    material_name character varying(100) NOT NULL,
    description text,
    id_course integer
);


ALTER TABLE training_schema.materials OWNER TO postgres;

--
-- Name: materials_id_material_seq; Type: SEQUENCE; Schema: training_schema; Owner: postgres
--

CREATE SEQUENCE training_schema.materials_id_material_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE training_schema.materials_id_material_seq OWNER TO postgres;

--
-- Name: materials_id_material_seq; Type: SEQUENCE OWNED BY; Schema: training_schema; Owner: postgres
--

ALTER SEQUENCE training_schema.materials_id_material_seq OWNED BY training_schema.materials.id_material;


--
-- Name: participants; Type: TABLE; Schema: training_schema; Owner: postgres
--

CREATE TABLE training_schema.participants (
    id_participant integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    phone character varying(15)
);


ALTER TABLE training_schema.participants OWNER TO postgres;

--
-- Name: participants_id_participant_seq; Type: SEQUENCE; Schema: training_schema; Owner: postgres
--

CREATE SEQUENCE training_schema.participants_id_participant_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE training_schema.participants_id_participant_seq OWNER TO postgres;

--
-- Name: participants_id_participant_seq; Type: SEQUENCE OWNED BY; Schema: training_schema; Owner: postgres
--

ALTER SEQUENCE training_schema.participants_id_participant_seq OWNED BY training_schema.participants.id_participant;


--
-- Name: registrations; Type: TABLE; Schema: training_schema; Owner: postgres
--

CREATE TABLE training_schema.registrations (
    id_registration integer NOT NULL,
    id_participant integer,
    id_course integer,
    registration_date date DEFAULT CURRENT_DATE
);


ALTER TABLE training_schema.registrations OWNER TO postgres;

--
-- Name: registrations_id_registration_seq; Type: SEQUENCE; Schema: training_schema; Owner: postgres
--

CREATE SEQUENCE training_schema.registrations_id_registration_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE training_schema.registrations_id_registration_seq OWNER TO postgres;

--
-- Name: registrations_id_registration_seq; Type: SEQUENCE OWNED BY; Schema: training_schema; Owner: postgres
--

ALTER SEQUENCE training_schema.registrations_id_registration_seq OWNED BY training_schema.registrations.id_registration;


--
-- Name: courses id_course; Type: DEFAULT; Schema: training_schema; Owner: postgres
--

ALTER TABLE ONLY training_schema.courses ALTER COLUMN id_course SET DEFAULT nextval('training_schema.courses_id_course_seq'::regclass);


--
-- Name: instructors id_instructor; Type: DEFAULT; Schema: training_schema; Owner: postgres
--

ALTER TABLE ONLY training_schema.instructors ALTER COLUMN id_instructor SET DEFAULT nextval('training_schema.instructors_id_instructor_seq'::regclass);


--
-- Name: materials id_material; Type: DEFAULT; Schema: training_schema; Owner: postgres
--

ALTER TABLE ONLY training_schema.materials ALTER COLUMN id_material SET DEFAULT nextval('training_schema.materials_id_material_seq'::regclass);


--
-- Name: participants id_participant; Type: DEFAULT; Schema: training_schema; Owner: postgres
--

ALTER TABLE ONLY training_schema.participants ALTER COLUMN id_participant SET DEFAULT nextval('training_schema.participants_id_participant_seq'::regclass);


--
-- Name: registrations id_registration; Type: DEFAULT; Schema: training_schema; Owner: postgres
--

ALTER TABLE ONLY training_schema.registrations ALTER COLUMN id_registration SET DEFAULT nextval('training_schema.registrations_id_registration_seq'::regclass);


--
-- Data for Name: courses; Type: TABLE DATA; Schema: training_schema; Owner: postgres
--

COPY training_schema.courses (id_course, course_name, description, start_date, end_date, id_instructor) FROM stdin;
1	Data Science 101	Introduction to Data Science	2024-07-01	2024-07-15	1
2	Machine Learning Basics	Fundamentals of Machine Learning	2024-08-01	2024-08-10	2
\.


--
-- Data for Name: instructors; Type: TABLE DATA; Schema: training_schema; Owner: postgres
--

COPY training_schema.instructors (id_instructor, name, email, phone, specialization) FROM stdin;
1	Dr. John Doe	john.doe@example.com	111222333	Data Science
2	Jane Roe	jane.roe@example.com	444555666	Machine Learning
\.


--
-- Data for Name: materials; Type: TABLE DATA; Schema: training_schema; Owner: postgres
--

COPY training_schema.materials (id_material, material_name, description, id_course) FROM stdin;
1	Introduction Slides	Slides for introduction	1
2	Machine Learning Overview	Overview of Machine Learning	2
\.


--
-- Data for Name: participants; Type: TABLE DATA; Schema: training_schema; Owner: postgres
--

COPY training_schema.participants (id_participant, name, email, phone) FROM stdin;
1	Alice Johnson	alice@example.com	123456789
2	Bob Smith	bob@example.com	987654321
\.


--
-- Data for Name: registrations; Type: TABLE DATA; Schema: training_schema; Owner: postgres
--

COPY training_schema.registrations (id_registration, id_participant, id_course, registration_date) FROM stdin;
1	1	1	2024-06-19
2	2	2	2024-06-19
\.


--
-- Name: courses_id_course_seq; Type: SEQUENCE SET; Schema: training_schema; Owner: postgres
--

SELECT pg_catalog.setval('training_schema.courses_id_course_seq', 2, true);


--
-- Name: instructors_id_instructor_seq; Type: SEQUENCE SET; Schema: training_schema; Owner: postgres
--

SELECT pg_catalog.setval('training_schema.instructors_id_instructor_seq', 2, true);


--
-- Name: materials_id_material_seq; Type: SEQUENCE SET; Schema: training_schema; Owner: postgres
--

SELECT pg_catalog.setval('training_schema.materials_id_material_seq', 2, true);


--
-- Name: participants_id_participant_seq; Type: SEQUENCE SET; Schema: training_schema; Owner: postgres
--

SELECT pg_catalog.setval('training_schema.participants_id_participant_seq', 3, true);


--
-- Name: registrations_id_registration_seq; Type: SEQUENCE SET; Schema: training_schema; Owner: postgres
--

SELECT pg_catalog.setval('training_schema.registrations_id_registration_seq', 2, true);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: training_schema; Owner: postgres
--

ALTER TABLE ONLY training_schema.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id_course);


--
-- Name: instructors instructors_email_key; Type: CONSTRAINT; Schema: training_schema; Owner: postgres
--

ALTER TABLE ONLY training_schema.instructors
    ADD CONSTRAINT instructors_email_key UNIQUE (email);


--
-- Name: instructors instructors_pkey; Type: CONSTRAINT; Schema: training_schema; Owner: postgres
--

ALTER TABLE ONLY training_schema.instructors
    ADD CONSTRAINT instructors_pkey PRIMARY KEY (id_instructor);


--
-- Name: materials materials_pkey; Type: CONSTRAINT; Schema: training_schema; Owner: postgres
--

ALTER TABLE ONLY training_schema.materials
    ADD CONSTRAINT materials_pkey PRIMARY KEY (id_material);


--
-- Name: participants participants_email_key; Type: CONSTRAINT; Schema: training_schema; Owner: postgres
--

ALTER TABLE ONLY training_schema.participants
    ADD CONSTRAINT participants_email_key UNIQUE (email);


--
-- Name: participants participants_pkey; Type: CONSTRAINT; Schema: training_schema; Owner: postgres
--

ALTER TABLE ONLY training_schema.participants
    ADD CONSTRAINT participants_pkey PRIMARY KEY (id_participant);


--
-- Name: registrations registrations_pkey; Type: CONSTRAINT; Schema: training_schema; Owner: postgres
--

ALTER TABLE ONLY training_schema.registrations
    ADD CONSTRAINT registrations_pkey PRIMARY KEY (id_registration);


--
-- Name: courses courses_id_instructor_fkey; Type: FK CONSTRAINT; Schema: training_schema; Owner: postgres
--

ALTER TABLE ONLY training_schema.courses
    ADD CONSTRAINT courses_id_instructor_fkey FOREIGN KEY (id_instructor) REFERENCES training_schema.instructors(id_instructor);


--
-- Name: materials materials_id_course_fkey; Type: FK CONSTRAINT; Schema: training_schema; Owner: postgres
--

ALTER TABLE ONLY training_schema.materials
    ADD CONSTRAINT materials_id_course_fkey FOREIGN KEY (id_course) REFERENCES training_schema.courses(id_course);


--
-- Name: registrations registrations_id_course_fkey; Type: FK CONSTRAINT; Schema: training_schema; Owner: postgres
--

ALTER TABLE ONLY training_schema.registrations
    ADD CONSTRAINT registrations_id_course_fkey FOREIGN KEY (id_course) REFERENCES training_schema.courses(id_course);


--
-- Name: registrations registrations_id_participant_fkey; Type: FK CONSTRAINT; Schema: training_schema; Owner: postgres
--

ALTER TABLE ONLY training_schema.registrations
    ADD CONSTRAINT registrations_id_participant_fkey FOREIGN KEY (id_participant) REFERENCES training_schema.participants(id_participant);


--
-- PostgreSQL database dump complete
--
