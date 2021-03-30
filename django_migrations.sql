--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

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
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: educarole
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO educarole;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: educarole
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO educarole;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: educarole
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: educarole
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: educarole
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-03-25 14:06:28.497803+03
2	contenttypes	0002_remove_content_type_name	2021-03-25 14:06:28.505589+03
3	courses	0001_initial	2021-03-25 14:06:28.547289+03
4	authentication	0001_initial	2021-03-25 14:06:28.583554+03
5	activity	0001_initial	2021-03-25 14:06:28.62269+03
6	admin	0001_initial	2021-03-25 14:06:28.649017+03
7	admin	0002_logentry_remove_auto_add	2021-03-25 14:06:28.66202+03
8	admin	0003_logentry_add_action_flag_choices	2021-03-25 14:06:28.66921+03
9	auth	0001_initial	2021-03-25 14:06:28.712666+03
10	auth	0002_alter_permission_name_max_length	2021-03-25 14:06:28.737548+03
11	auth	0003_alter_user_email_max_length	2021-03-25 14:06:28.743333+03
12	auth	0004_alter_user_username_opts	2021-03-25 14:06:28.748862+03
13	auth	0005_alter_user_last_login_null	2021-03-25 14:06:28.754671+03
14	auth	0006_require_contenttypes_0002	2021-03-25 14:06:28.756409+03
15	auth	0007_alter_validators_add_error_messages	2021-03-25 14:06:28.763166+03
16	auth	0008_alter_user_username_max_length	2021-03-25 14:06:28.768952+03
17	auth	0009_alter_user_last_name_max_length	2021-03-25 14:06:28.774239+03
18	auth	0010_alter_group_name_max_length	2021-03-25 14:06:28.791057+03
19	auth	0011_update_proxy_permissions	2021-03-25 14:06:28.805058+03
20	auth	0012_alter_user_first_name_max_length	2021-03-25 14:06:28.811011+03
21	base	0001_initial	2021-03-25 14:06:28.816797+03
22	courses	0002_course_owner	2021-03-25 14:06:28.831329+03
23	sessions	0001_initial	2021-03-25 14:06:28.838443+03
24	token_blacklist	0001_initial	2021-03-25 14:06:28.878281+03
25	token_blacklist	0002_outstandingtoken_jti_hex	2021-03-25 14:06:28.891575+03
26	token_blacklist	0003_auto_20171017_2007	2021-03-25 14:06:28.907866+03
27	token_blacklist	0004_auto_20171017_2013	2021-03-25 14:06:28.919926+03
28	token_blacklist	0005_remove_outstandingtoken_jti	2021-03-25 14:06:28.93275+03
29	token_blacklist	0006_auto_20171017_2113	2021-03-25 14:06:28.943207+03
30	token_blacklist	0007_auto_20171017_2214	2021-03-25 14:06:28.973115+03
73	authentication	0002_auto_20210326_1052	2021-03-26 13:53:00.061115+03
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: educarole
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 73, true);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: educarole
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

