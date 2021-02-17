--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1
-- Dumped by pg_dump version 13.1

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: authentication_customuser; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.authentication_customuser (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    email character varying(255) NOT NULL,
    is_active boolean NOT NULL,
    is_admin boolean NOT NULL
);


--
-- Name: authentication_customuser_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.authentication_customuser_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: authentication_customuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.authentication_customuser_id_seq OWNED BY public.authentication_customuser.id;


--
-- Name: courses_category; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.courses_category (
    id integer NOT NULL,
    title character varying(200) NOT NULL,
    slug character varying(200) NOT NULL,
    description text,
    photo character varying(100),
    draft boolean NOT NULL
);


--
-- Name: courses_course; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.courses_course (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    title character varying(200) NOT NULL,
    slug character varying(200) NOT NULL,
    overview text NOT NULL,
    owner_id integer NOT NULL,
    subcategory_id integer NOT NULL,
    course_duration interval,
    draft boolean NOT NULL,
    likes integer NOT NULL,
    photo character varying(100),
    price integer,
    rating double precision NOT NULL,
    views integer NOT NULL,
    CONSTRAINT courses_course_likes_check CHECK ((likes >= 0)),
    CONSTRAINT courses_course_price_check CHECK ((price >= 0)),
    CONSTRAINT courses_course_views_check CHECK ((views >= 0))
);


--
-- Name: courses_course_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.courses_course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: courses_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.courses_course_id_seq OWNED BY public.courses_course.id;


--
-- Name: courses_lesson; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.courses_lesson (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    title character varying(200) NOT NULL,
    duration interval NOT NULL,
    course_id integer NOT NULL,
    draft boolean NOT NULL,
    overview text,
    photo character varying(100),
    slug character varying(200),
    video character varying(100) NOT NULL
);


--
-- Name: courses_lesson_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.courses_lesson_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: courses_lesson_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.courses_lesson_id_seq OWNED BY public.courses_lesson.id;


--
-- Name: courses_subcategory; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.courses_subcategory (
    id integer NOT NULL,
    title character varying(200) NOT NULL,
    category_id integer NOT NULL,
    draft boolean NOT NULL,
    slug character varying(50)
);


--
-- Name: courses_subcategory_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.courses_subcategory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: courses_subcategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.courses_subcategory_id_seq OWNED BY public.courses_subcategory.id;


--
-- Name: courses_subject_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.courses_subject_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: courses_subject_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.courses_subject_id_seq OWNED BY public.courses_category.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


--
-- Name: token_blacklist_blacklistedtoken; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.token_blacklist_blacklistedtoken (
    id integer NOT NULL,
    blacklisted_at timestamp with time zone NOT NULL,
    token_id integer NOT NULL
);


--
-- Name: token_blacklist_blacklistedtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.token_blacklist_blacklistedtoken_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: token_blacklist_blacklistedtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.token_blacklist_blacklistedtoken_id_seq OWNED BY public.token_blacklist_blacklistedtoken.id;


--
-- Name: token_blacklist_outstandingtoken; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.token_blacklist_outstandingtoken (
    id integer NOT NULL,
    token text NOT NULL,
    created_at timestamp with time zone,
    expires_at timestamp with time zone NOT NULL,
    user_id integer,
    jti character varying(255) NOT NULL
);


--
-- Name: token_blacklist_outstandingtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.token_blacklist_outstandingtoken_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: token_blacklist_outstandingtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.token_blacklist_outstandingtoken_id_seq OWNED BY public.token_blacklist_outstandingtoken.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: authentication_customuser id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.authentication_customuser ALTER COLUMN id SET DEFAULT nextval('public.authentication_customuser_id_seq'::regclass);


--
-- Name: courses_category id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courses_category ALTER COLUMN id SET DEFAULT nextval('public.courses_subject_id_seq'::regclass);


--
-- Name: courses_course id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courses_course ALTER COLUMN id SET DEFAULT nextval('public.courses_course_id_seq'::regclass);


--
-- Name: courses_lesson id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courses_lesson ALTER COLUMN id SET DEFAULT nextval('public.courses_lesson_id_seq'::regclass);


--
-- Name: courses_subcategory id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courses_subcategory ALTER COLUMN id SET DEFAULT nextval('public.courses_subcategory_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: token_blacklist_blacklistedtoken id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.token_blacklist_blacklistedtoken ALTER COLUMN id SET DEFAULT nextval('public.token_blacklist_blacklistedtoken_id_seq'::regclass);


--
-- Name: token_blacklist_outstandingtoken id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.token_blacklist_outstandingtoken ALTER COLUMN id SET DEFAULT nextval('public.token_blacklist_outstandingtoken_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add custom user	1	add_customuser
2	Can change custom user	1	change_customuser
3	Can delete custom user	1	delete_customuser
4	Can view custom user	1	view_customuser
5	Can add log entry	2	add_logentry
6	Can change log entry	2	change_logentry
7	Can delete log entry	2	delete_logentry
8	Can view log entry	2	view_logentry
9	Can add permission	3	add_permission
10	Can change permission	3	change_permission
11	Can delete permission	3	delete_permission
12	Can view permission	3	view_permission
13	Can add group	4	add_group
14	Can change group	4	change_group
15	Can delete group	4	delete_group
16	Can view group	4	view_group
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add course	7	add_course
26	Can change course	7	change_course
27	Can delete course	7	delete_course
28	Can view course	7	view_course
29	Can add subject	8	add_subject
30	Can change subject	8	change_subject
31	Can delete subject	8	delete_subject
32	Can view subject	8	view_subject
33	Can add module	9	add_module
34	Can change module	9	change_module
35	Can delete module	9	delete_module
36	Can view module	9	view_module
37	Can add lesson	10	add_lesson
38	Can change lesson	10	change_lesson
39	Can delete lesson	10	delete_lesson
40	Can view lesson	10	view_lesson
41	Can add subcategory	11	add_subcategory
42	Can change subcategory	11	change_subcategory
43	Can delete subcategory	11	delete_subcategory
44	Can view subcategory	11	view_subcategory
45	Can add category	8	add_category
46	Can change category	8	change_category
47	Can delete category	8	delete_category
48	Can view category	8	view_category
49	Can add blacklisted token	12	add_blacklistedtoken
50	Can change blacklisted token	12	change_blacklistedtoken
51	Can delete blacklisted token	12	delete_blacklistedtoken
52	Can view blacklisted token	12	view_blacklistedtoken
53	Can add outstanding token	13	add_outstandingtoken
54	Can change outstanding token	13	change_outstandingtoken
55	Can delete outstanding token	13	delete_outstandingtoken
56	Can view outstanding token	13	view_outstandingtoken
\.


--
-- Data for Name: authentication_customuser; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.authentication_customuser (id, password, last_login, email, is_active, is_admin) FROM stdin;
3	newnewnew	\N	new@new.com	t	f
10	passs	\N	der@der.com	t	f
11	pbkdf2_sha256$216000$z2dvApcTYrea$B0V64FzVZn9ODIGdiuH5ry7iTy4Ess0EF6AQpjYVirE=	\N	brand@new.com	t	f
12	pbkdf2_sha256$216000$Dj41iq3eiPt4$MHS7aJjbCD313PYc9D1e/UcePWNE0No2HCIGfTRHzsc=	\N	bro@bro.com	t	f
1	pbkdf2_sha256$216000$STBzq3MSsGJy$/UE6diX8MqWjk1y2hqjcQZXqGFZyQuT5KPOjvFIkcAM=	2021-02-16 09:49:28.145736+03	admin@admin.com	t	t
\.


--
-- Data for Name: courses_category; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.courses_category (id, title, slug, description, photo, draft) FROM stdin;
6	Иностранные языки	inostrannye-yazyki	Хотите выучить язык? Вам сюда	category/lang.png	f
5	Информационные технологии	informacionnye-tehnologii	Все, что связано с миром IT	category/it_n1vDyki.png	f
8	Красота и здоровье	krasota-i-zdorove	Прически, визаж, ногти, массаж, медицина, для беременных и новорожденных и др.	category/beauty_iVHYF4j.png	f
11	Наука	nauka	Подготовка детей, физика, химия, астрономия, экономика, история и др.	category/science.png	f
10	Развитие личности	razvitie-lichnosti	Финансовая грамотность, семейные отношения, психология, лидерские качества и др.	category/person.png	f
7	Спорт и фитнес	sport-i-fitnes	Фитнес, йога, тренажеры и др.	category/sport.png	f
9	Хобби и увлечения	hobbi-i-uvlecheniya	Рисование, рукоделие, кулинария, музыка, фото и др.	category/hobby.png	f
12	Gaming	gaming	Курсы по популярным Online-играм: CS:GO, Dota2, Fortnite и др.	category/gaming.png	t
\.


--
-- Data for Name: courses_course; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.courses_course (id, created_at, updated_at, title, slug, overview, owner_id, subcategory_id, course_duration, draft, likes, photo, price, rating, views) FROM stdin;
1	2021-02-16 11:53:33.117187+03	2021-02-16 11:53:33.117212+03	Python	python	супер курс	3	1	01:35:24	f	56	courses/<django.db.models.fields.CharField>/p2.jpg	515	4	156
2	2021-02-16 11:54:59.485542+03	2021-02-16 11:55:41.023405+03	Python	python1	одрлолплр	10	1	01:35:24	f	15	courses/<django.db.models.fields.CharField>/p5.png	156	5	156
4	2021-02-16 11:56:21.077115+03	2021-02-16 11:56:21.077143+03	Python	python34	уцкккуцкцукцк	11	1	01:35:24	f	2342	courses/<django.db.models.fields.CharField>/p1.jpg	234	3	324
6	2021-02-16 11:57:37.593599+03	2021-02-16 12:39:12.447413+03	Python	python6	кпарпарапрап	12	1	01:35:24	f	234	courses/<django.db.models.fields.CharField>/p2_FXB483C.jpg	234	2	234
5	2021-02-16 11:56:53.33467+03	2021-02-16 12:39:22.789722+03	Python	python334	вапвапвап	12	1	01:35:24	f	234	courses/<django.db.models.fields.CharField>/p1_YvKHmaI.jpg	234	2	324
3	2021-02-16 11:55:32.519604+03	2021-02-16 12:40:57.635914+03	Python	python2	куеуеукеуке	11	1	01:35:24	f	12344	courses/<django.db.models.fields.CharField>/p3.jpg	123	3.5	123
7	2021-02-16 11:58:04.856774+03	2021-02-16 20:35:09.809309+03	Python	python8	цуавыаыаы	11	1	01:35:24	f	234	courses/<django.db.models.fields.CharField>/p5_JUAFHH0.png	234	5.5	234
8	2021-02-16 20:36:40.402064+03	2021-02-16 20:36:40.402094+03	C++ Begginer	c-begginer	qwdqwdqwdq	12	2	00:02:10	f	1000	courses/<django.db.models.fields.CharField>/1200px-ISO_C_Logo.svg_1.png	10	4	300
\.


--
-- Data for Name: courses_lesson; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.courses_lesson (id, created_at, updated_at, title, duration, course_id, draft, overview, photo, slug, video) FROM stdin;
1	2021-02-16 20:37:58.262684+03	2021-02-16 20:37:58.262708+03	first lesson	00:00:20	8	f	qwwqdqw		first-lesson	
2	2021-02-16 20:39:18.677047+03	2021-02-16 20:39:18.67707+03	first lesson	00:00:30	7	f	fghfhgfhf		first-lesson1	
\.


--
-- Data for Name: courses_subcategory; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.courses_subcategory (id, title, category_id, draft, slug) FROM stdin;
2	C++	5	f	cplusplus
1	Python	5	f	python
4	Spanish	6	f	spanish
3	English	6	f	english
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-02-08 14:30:40.01372+03	1	Physics	1	[{"added": {}}]	8	1
2	2021-02-08 14:30:43.89701+03	2	Math	1	[{"added": {}}]	8	1
3	2021-02-08 14:30:52.892977+03	3	History	1	[{"added": {}}]	8	1
4	2021-02-08 14:31:01.790781+03	4	Biology	1	[{"added": {}}]	8	1
5	2021-02-12 17:55:01.668672+03	4	Biology	3		8	1
6	2021-02-12 17:55:15.180665+03	3	History	3		8	1
7	2021-02-12 17:55:15.189751+03	2	Math	3		8	1
8	2021-02-12 17:55:15.191395+03	1	Physics	3		8	1
9	2021-02-12 18:04:26.761918+03	5	Информационные технологии	1	[{"added": {}}]	8	1
10	2021-02-12 18:05:47.758332+03	5	Информационные технологии	2	[]	8	1
11	2021-02-12 18:05:56.138461+03	5	Информационные технологии	2	[]	8	1
12	2021-02-12 18:06:19.668264+03	5	Информационные технологии	2	[]	8	1
13	2021-02-12 18:06:47.831557+03	5	Информационные технологии	2	[{"changed": {"fields": ["Photo"]}}]	8	1
14	2021-02-12 18:08:57.441314+03	5	Информационные технологии	2	[{"changed": {"fields": ["Photo"]}}]	8	1
15	2021-02-12 18:10:53.831747+03	6	Иностранные языки	1	[{"added": {}}]	8	1
16	2021-02-12 18:11:56.36032+03	7	Спорт и фитнес	1	[{"added": {}}]	8	1
17	2021-02-14 15:47:28.104462+03	8	Красота и здоровье	1	[{"added": {}}]	8	1
18	2021-02-14 15:47:57.271233+03	9	Хобби и увлечения	1	[{"added": {}}]	8	1
19	2021-02-14 15:48:28.182019+03	10	Развитие личности	1	[{"added": {}}]	8	1
20	2021-02-14 15:48:58.640996+03	11	Наука	1	[{"added": {}}]	8	1
21	2021-02-14 15:49:40.444328+03	12	Gaming	1	[{"added": {}}]	8	1
22	2021-02-16 09:51:09.68041+03	6	Иностранные языки	2	[{"changed": {"fields": ["Photo"]}}]	8	1
23	2021-02-16 09:51:22.856995+03	5	Информационные технологии	2	[{"changed": {"fields": ["Photo"]}}]	8	1
24	2021-02-16 09:51:54.662593+03	8	Красота и здоровье	2	[{"changed": {"fields": ["Description", "Photo"]}}]	8	1
25	2021-02-16 09:52:39.059101+03	11	Наука	2	[{"changed": {"fields": ["Description", "Photo"]}}]	8	1
26	2021-02-16 09:53:16.368335+03	10	Развитие личности	2	[{"changed": {"fields": ["Description", "Photo"]}}]	8	1
27	2021-02-16 09:53:47.665939+03	7	Спорт и фитнес	2	[{"changed": {"fields": ["Description", "Photo"]}}]	8	1
28	2021-02-16 09:54:10.359362+03	9	Хобби и увлечения	2	[{"changed": {"fields": ["Description", "Photo"]}}]	8	1
29	2021-02-16 10:03:40.324653+03	12	Gaming	2	[{"changed": {"fields": ["Draft"]}}]	8	1
30	2021-02-16 10:03:51.178032+03	12	Gaming	2	[{"changed": {"fields": ["Draft"]}}]	8	1
31	2021-02-16 10:05:27.850825+03	12	Gaming	2	[{"changed": {"fields": ["Draft"]}}]	8	1
32	2021-02-16 11:51:45.877945+03	1	Python	1	[{"added": {}}]	11	1
33	2021-02-16 11:53:33.132571+03	1	Python	1	[{"added": {}}]	7	1
34	2021-02-16 11:54:59.487572+03	2	Python	1	[{"added": {}}]	7	1
35	2021-02-16 11:55:32.529852+03	3	Python	1	[{"added": {}}]	7	1
36	2021-02-16 11:55:41.02558+03	2	Python	2	[{"changed": {"fields": ["Draft"]}}]	7	1
37	2021-02-16 11:56:21.086943+03	4	Python	1	[{"added": {}}]	7	1
38	2021-02-16 11:56:53.344622+03	5	Python	1	[{"added": {}}]	7	1
39	2021-02-16 11:56:58.134139+03	5	Python	2	[{"changed": {"fields": ["Draft"]}}]	7	1
40	2021-02-16 11:57:37.596466+03	6	Python	1	[{"added": {}}]	7	1
41	2021-02-16 11:58:04.859068+03	7	Python	1	[{"added": {}}]	7	1
42	2021-02-16 12:39:05.224134+03	7	Python	2	[]	7	1
43	2021-02-16 12:39:12.448824+03	6	Python	2	[{"changed": {"fields": ["Rating"]}}]	7	1
44	2021-02-16 12:39:22.791214+03	5	Python	2	[]	7	1
45	2021-02-16 12:40:57.637792+03	3	Python	2	[{"changed": {"fields": ["Rating"]}}]	7	1
46	2021-02-16 12:41:11.854081+03	7	Python	2	[{"changed": {"fields": ["Rating"]}}]	7	1
47	2021-02-16 20:33:22.154376+03	1	Python	2	[{"changed": {"fields": ["Slug"]}}]	11	1
48	2021-02-16 20:33:41.877881+03	2	C++	1	[{"added": {}}]	11	1
49	2021-02-16 20:33:47.563187+03	1	Python	2	[{"changed": {"fields": ["Draft"]}}]	11	1
50	2021-02-16 20:34:13.977533+03	3	English	1	[{"added": {}}]	11	1
51	2021-02-16 20:34:27.186069+03	4	Spanish	1	[{"added": {}}]	11	1
52	2021-02-16 20:34:32.1745+03	3	English	2	[{"changed": {"fields": ["Draft"]}}]	11	1
53	2021-02-16 20:35:09.811184+03	7	Python	2	[]	7	1
54	2021-02-16 20:36:40.40488+03	8	C++ Begginer	1	[{"added": {}}]	7	1
55	2021-02-16 20:37:58.26415+03	1	Lesson object (1)	1	[{"added": {}}]	10	1
56	2021-02-16 20:39:18.678088+03	2	Lesson object (2)	1	[{"added": {}}]	10	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	authentication	customuser
2	admin	logentry
3	auth	permission
4	auth	group
5	contenttypes	contenttype
6	sessions	session
7	courses	course
9	courses	module
8	courses	category
10	courses	lesson
11	courses	subcategory
12	token_blacklist	blacklistedtoken
13	token_blacklist	outstandingtoken
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-02-08 14:26:25.39081+03
2	authentication	0001_initial	2021-02-08 14:26:25.398864+03
3	admin	0001_initial	2021-02-08 14:26:25.410608+03
4	admin	0002_logentry_remove_auto_add	2021-02-08 14:26:25.424793+03
5	admin	0003_logentry_add_action_flag_choices	2021-02-08 14:26:25.429402+03
6	contenttypes	0002_remove_content_type_name	2021-02-08 14:26:25.451448+03
7	auth	0001_initial	2021-02-08 14:26:25.474338+03
8	auth	0002_alter_permission_name_max_length	2021-02-08 14:26:25.494555+03
9	auth	0003_alter_user_email_max_length	2021-02-08 14:26:25.50047+03
10	auth	0004_alter_user_username_opts	2021-02-08 14:26:25.506053+03
11	auth	0005_alter_user_last_login_null	2021-02-08 14:26:25.515015+03
12	auth	0006_require_contenttypes_0002	2021-02-08 14:26:25.516962+03
13	auth	0007_alter_validators_add_error_messages	2021-02-08 14:26:25.522435+03
14	auth	0008_alter_user_username_max_length	2021-02-08 14:26:25.528436+03
15	auth	0009_alter_user_last_name_max_length	2021-02-08 14:26:25.53532+03
16	auth	0010_alter_group_name_max_length	2021-02-08 14:26:25.542459+03
17	auth	0011_update_proxy_permissions	2021-02-08 14:26:25.552809+03
18	auth	0012_alter_user_first_name_max_length	2021-02-08 14:26:25.558631+03
19	courses	0001_initial	2021-02-08 14:26:25.592512+03
20	sessions	0001_initial	2021-02-08 14:26:25.610353+03
21	courses	0002_auto_20210209_1019	2021-02-09 13:19:13.456412+03
22	token_blacklist	0001_initial	2021-02-11 09:20:34.867289+03
23	token_blacklist	0002_outstandingtoken_jti_hex	2021-02-11 09:20:34.88509+03
24	token_blacklist	0003_auto_20171017_2007	2021-02-11 09:20:34.898776+03
25	token_blacklist	0004_auto_20171017_2013	2021-02-11 09:20:34.909883+03
26	token_blacklist	0005_remove_outstandingtoken_jti	2021-02-11 09:20:34.918159+03
27	token_blacklist	0006_auto_20171017_2113	2021-02-11 09:20:34.925888+03
28	token_blacklist	0007_auto_20171017_2214	2021-02-11 09:20:34.951674+03
29	courses	0003_auto_20210212_1449	2021-02-12 17:49:32.186183+03
30	courses	0004_auto_20210216_0702	2021-02-16 10:02:28.115791+03
31	courses	0005_auto_20210216_0704	2021-02-16 10:04:45.770389+03
32	courses	0006_auto_20210216_0835	2021-02-16 11:35:17.624592+03
33	courses	0007_subcategory_draft	2021-02-16 19:16:52.70246+03
34	courses	0008_auto_20210216_1725	2021-02-16 20:25:30.638301+03
35	courses	0009_subcategory_slug	2021-02-16 20:33:02.138385+03
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
2qee5l4mv3wbsyndslysoiaxdfsa685a	.eJxVjMsOwiAQRf-FtSFMgTK4dO83kBkeUjU0Ke3K-O_apAvd3nPOfYlA21rD1vMSpiTOAsTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fGiGyGZ1JGdgozwqKJkNYbGKPg7UqARfAWBA0FNRFR7KoB-ciKj-K9wfe4Dd1:1l94ht:Zqr7sx8RXSsBdWMhPawJTE7vRyV3L0qprx00ReFjQJU	2021-02-22 14:27:53.677137+03
q2zzq4ee7th7xid156dv2ddlpg2wgeqn	.eJxVjMsOwiAQRf-FtSFMgTK4dO83kBkeUjU0Ke3K-O_apAvd3nPOfYlA21rD1vMSpiTOAsTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fGiGyGZ1JGdgozwqKJkNYbGKPg7UqARfAWBA0FNRFR7KoB-ciKj-K9wfe4Dd1:1lBuAq:KTOAwb36KWtttbWcyvZeQCxWtx1Vol40Euud8vjpowE	2021-03-02 09:49:28.151286+03
\.


--
-- Data for Name: token_blacklist_blacklistedtoken; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.token_blacklist_blacklistedtoken (id, blacklisted_at, token_id) FROM stdin;
1	2021-02-11 09:54:44.644386+03	2
\.


--
-- Data for Name: token_blacklist_outstandingtoken; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.token_blacklist_outstandingtoken (id, token, created_at, expires_at, user_id, jti) FROM stdin;
1	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzExMjI5MywianRpIjoiYTQ3NjUwYjY4ZDc1NGQxZGE2ZmZkZmQ3OWJhYTk3MTMiLCJ1c2VyX2lkIjoxMn0.Bj_qbPLev0ePSHq7ax-iHNA8FZmv6Wk4Lzj__uzuijo	2021-02-11 09:44:53.870316+03	2021-02-12 09:44:53+03	12	a47650b68d754d1da6ffdfd79baa9713
2	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzExMjc1NCwianRpIjoiZmU3NjJjMzlmNTM3NDkzM2JjYzE0YWFhYjFlNGNmMDEiLCJ1c2VyX2lkIjoxMn0.MFeSH5bnbpkBGMeJ4iGnqD-WXkAskGSHAvsZ6cUqumo	2021-02-11 09:52:34.214551+03	2021-02-12 09:52:34+03	12	fe762c39f5374933bcc14aaab1e4cf01
3	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzQzNTI3OSwianRpIjoiOTVkZjg1MTUzZmVmNGViZjgwOTA3OTBkMDJmNTZjMjkiLCJ1c2VyX2lkIjoxMn0.iKeFFmfJi6yPbtheGeUkLWnCbfafN6ud1VmFX5p5Zo0	2021-02-15 03:27:59.469446+03	2021-02-16 03:27:59+03	12	95df85153fef4ebf8090790d02f56c29
4	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzQ2NTIzMSwianRpIjoiZTAxYjJmZTJmNjljNDg0MWJiYzBkZmU0ZDYzMzEwY2UiLCJ1c2VyX2lkIjoxMn0.eA-tzlv5YOyDQvmq6lTbgH2nJD5R8S1nypFEXBY4vsU	2021-02-15 11:47:11.808672+03	2021-02-16 11:47:11+03	12	e01b2fe2f69c4841bbc0dfe4d63310ce
5	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzQ2NTI1NSwianRpIjoiNWMxM2ViM2Y4OGJmNDZhOGE3ZDg4ODFhYjZjYzFmZGQiLCJ1c2VyX2lkIjoxMn0.dfiSlw5w9PwSIPhr31gwIb-uEs5jAZp-AvqWIV8Gttg	2021-02-15 11:47:35.222791+03	2021-02-16 11:47:35+03	12	5c13eb3f88bf46a8a7d8881ab6cc1fdd
6	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzQ2NTI3NiwianRpIjoiMTliMGVmMWNiYTYyNDZiYjhhY2ZhZThhYzI0NThjNmQiLCJ1c2VyX2lkIjoxMn0.fy4wJnngbuPjRb-QAnijIHTXdx4HrA8KKV8MKr5pu6Q	2021-02-15 11:47:56.718557+03	2021-02-16 11:47:56+03	12	19b0ef1cba6246bb8acfae8ac2458c6d
7	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzQ2NjY2MSwianRpIjoiN2RhZTAyMWYxMDNlNDNhZTgzOWQ0MzY0YzZlZDg4ZDEiLCJ1c2VyX2lkIjoxMn0.ig8sngQlDMeUidn1ABsBVzo3cfvRTZMX6peGtJrqZxM	2021-02-15 12:11:01.843573+03	2021-02-16 12:11:01+03	12	7dae021f103e43ae839d4364c6ed88d1
8	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzQ2ODA1MCwianRpIjoiZWVhYmEyZjZmOTEyNDA5ZGI5YzY4YzQzMGFjZDJmMTciLCJ1c2VyX2lkIjoxMn0.dMOtJ4-i9gCUR707k5CNPBiuxm_ilAOfe_dY4QIj_Bo	2021-02-15 12:34:10.128189+03	2021-02-16 12:34:10+03	12	eeaba2f6f912409db9c68c430acd2f17
9	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzQ2OTM4OSwianRpIjoiMTIwYjk4YWQxOTJhNDQ3Y2JlZWMyZDkzYzVjZTMyNWMiLCJ1c2VyX2lkIjoxMn0.TgFeqF-OOvUtFKMRBLF4hYgduv6inuk6lUKUp2yGQ0A	2021-02-15 12:56:29.678016+03	2021-02-16 12:56:29+03	12	120b98ad192a447cbeec2d93c5ce325c
10	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzQ2OTQ1MCwianRpIjoiMTJmZjZjNzMxOWUyNDRhNjhmYjFiMTAxNTlkYTgwMTYiLCJ1c2VyX2lkIjoxMn0.LtMNQ8KKnn27NAZGZPv3aSgTiFBfj0tuu-iT8Y0Ofq4	2021-02-15 12:57:30.217637+03	2021-02-16 12:57:30+03	12	12ff6c7319e244a68fb1b10159da8016
11	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzQ2OTU4NiwianRpIjoiMzY5OTk5ODBkMjczNDY2MDg2YTVmYTQzNDcwOTdjZDYiLCJ1c2VyX2lkIjoxMn0.UOhIv28-tD89jqMt2LRpI6nSbv-3iTkoRDJB24CEpAc	2021-02-15 12:59:46.159702+03	2021-02-16 12:59:46+03	12	36999980d273466086a5fa4347097cd6
12	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzQ2OTY1NywianRpIjoiZTU3ODJkYmM1MDFjNDBjNmIyNTZlNzQ3YWViZGU1ZDgiLCJ1c2VyX2lkIjoxMn0._2hy0ztjWl3oS8fbloiUETJtiGMrN0TlOPS7zCl3Fdc	2021-02-15 13:00:57.300187+03	2021-02-16 13:00:57+03	12	e5782dbc501c40c6b256e747aebde5d8
13	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzQ3MTA3NywianRpIjoiZDVjOTdhOTM3NTZhNDYwYjhiNTIyY2E5MDY5Y2Q0ZmIiLCJ1c2VyX2lkIjoxMn0.zPAc2N3hA_Az0h9oeO8-0u1wGtCKsDkxrbFmB9YbjCY	2021-02-15 13:24:37.710086+03	2021-02-16 13:24:37+03	12	d5c97a93756a460b8b522ca9069cd4fb
14	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzQ3MTEyMywianRpIjoiZjJhYWQ5NWY4MmE0NDZmNGE1NTNjZTIzM2JiMTQxYTUiLCJ1c2VyX2lkIjoxfQ.BOvX_vavUfE0UY1I2dKpAdKH-sbZmRJajzsFMTUDBkw	2021-02-15 13:25:23.366313+03	2021-02-16 13:25:23+03	1	f2aad95f82a446f4a553ce233bb141a5
15	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzQ3MTE5NSwianRpIjoiYjY4YjczYjZlYTg5NDc0ZThhNjhjOWNkMDI1MmZiYmYiLCJ1c2VyX2lkIjoxfQ.nXdin37RxIoK7CB7MgryB4fpESUkVWlR6Mzaf_pO7cE	2021-02-15 13:26:35.52697+03	2021-02-16 13:26:35+03	1	b68b73b6ea89474e8a68c9cd0252fbbf
16	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzQ3NTMyNCwianRpIjoiNjlhNGMwZjNmYjEzNGJmZGJkNTJiNmQ4OWUyOWYyZWQiLCJ1c2VyX2lkIjoxMn0.iM5wEvAg8fsazE4V7VfxOBxEAgPo2lqpjwuUqKk7WBY	2021-02-15 14:35:24.15061+03	2021-02-16 14:35:24+03	12	69a4c0f3fb134bfdbd52b6d89e29f2ed
17	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzQ3NjQzOCwianRpIjoiZWIyYjBjMzM2ZmZmNGZmZmIzNzc1YjQ5MjY2MjExNzUiLCJ1c2VyX2lkIjoxMn0.NdXpGweFHvjJ6pY2Bva_GAan8RCYSw6mf9L1PDTg_c4	2021-02-15 14:53:58.308622+03	2021-02-16 14:53:58+03	12	eb2b0c336fff4fffb3775b4926621175
18	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzQ3Njk2NywianRpIjoiMzNhN2YxYjU3YzIzNDllNGEyMWExNGRhMDgxMzdiYWYiLCJ1c2VyX2lkIjoxMn0.SwFelrZtC4bu_2UyiD-A8E0rGtiPliEeOzjRPE8H-Hs	2021-02-15 15:02:47.048694+03	2021-02-16 15:02:47+03	12	33a7f1b57c2349e4a21a14da08137baf
19	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzQ3NzAzMCwianRpIjoiN2RjODI0MTc0YzhhNDU0Mzk2MTdiNGU4OGM1NWFkNTIiLCJ1c2VyX2lkIjoxMn0.ildxAwtpwJQ94sIkfmAKYHR8w-4h9jq9_BZP320fb5Q	2021-02-15 15:03:50.881747+03	2021-02-16 15:03:50+03	12	7dc824174c8a45439617b4e88c55ad52
20	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzQ3NzA1OCwianRpIjoiZjAzYzYwZjU0NTM2NDg0M2IzNWE4OTZjOGFlMWEyNTciLCJ1c2VyX2lkIjoxMn0.3ut-ZTKUOcOPgbRpKPuTYUCxT01yfI3q9Xjja6dJ4KY	2021-02-15 15:04:18.74746+03	2021-02-16 15:04:18+03	12	f03c60f545364843b35a896c8ae1a257
21	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzQ3NzE0NywianRpIjoiNTZjNjU5ZDJmZGY1NGRiN2I4NmViNWUzNjc1M2NkNzMiLCJ1c2VyX2lkIjoxMn0.9kHiqq1SZ4bVLbKGgQMsRJ8E9pOUFUI025113tz8igw	2021-02-15 15:05:47.509932+03	2021-02-16 15:05:47+03	12	56c659d2fdf54db7b86eb5e36753cd73
22	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzQ3NzI2MywianRpIjoiZjQ5MDFlYzM5YzhkNDA0NThkYzQzZTgzZDc0ZDNiYjAiLCJ1c2VyX2lkIjoxMn0.kr_qeF9Sb9M1EuJgARQ8JDG0mSNY09-4ZK9LdtIbzqk	2021-02-15 15:07:43.535415+03	2021-02-16 15:07:43+03	12	f4901ec39c8d40458dc43e83d74d3bb0
23	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzQ3NzUzOCwianRpIjoiNTI2NGM5ZjFhMGEzNDM1OTg2ZDFlNTM5OTZkNGQzOWEiLCJ1c2VyX2lkIjoxMn0.wYY1c-6dmeQTAsNdZKWKbeN98VP4qQAhGTquz4_N7pk	2021-02-15 15:12:18.26313+03	2021-02-16 15:12:18+03	12	5264c9f1a0a3435986d1e53996d4d39a
24	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzQ3NzU2NiwianRpIjoiODVkNTMyZTExYTk4NGI5MThjYWJkZmIyYmFkNDJmODEiLCJ1c2VyX2lkIjoxMn0.rct5pN9t7D9ZxqEXi8kNxhDWuhvkMF-mX0Q-cI_n5cA	2021-02-15 15:12:46.791321+03	2021-02-16 15:12:46+03	12	85d532e11a984b918cabdfb2bad42f81
25	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzQ3ODM0NCwianRpIjoiZTA1MDNiM2JlYTRmNDRmZGE3Y2EwOWE1Yjg4ODJmZmQiLCJ1c2VyX2lkIjoxfQ.BsMwkxxetOqwzTNdXsSu57nn8__4lwAnWRQI51wsQ1o	2021-02-15 15:25:44.968435+03	2021-02-16 15:25:44+03	1	e0503b3bea4f44fda7ca09a5b8882ffd
26	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzU1MTgwNywianRpIjoiZDg1MGQxYzRkYzEwNDliZThjZjU0YzY3ZmI3NzllZDUiLCJ1c2VyX2lkIjoxMn0.6IjnkZU_K0fvGXBm2suOus6jc9h5VSD94iORQQQRr-k	2021-02-16 11:50:07.873691+03	2021-02-17 11:50:07+03	12	d850d1c4dc1049be8cf54c67fb779ed5
27	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzU1MTk1OSwianRpIjoiMGE3Mjc4NmQxNmI1NDU4ZWFkYjYyYTRjOTg2MjJkNWEiLCJ1c2VyX2lkIjoxMn0.no6QbgITmFRjNP5NVb9f5xeIWdL2tvvgoC8-2SZanP4	2021-02-16 11:52:39.430542+03	2021-02-17 11:52:39+03	12	0a72786d16b5458eadb62a4c98622d5a
28	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzU1MjExMiwianRpIjoiMjQ2MzUwMzQxNjMyNGJkYThkMjhjMDQ3MmQyZDQyZmQiLCJ1c2VyX2lkIjoxMn0.8Qfrg_I4flcooewnMbVoK1g9yiSTcE_t4XtqT2G8ONg	2021-02-16 11:55:12.399371+03	2021-02-17 11:55:12+03	12	2463503416324bda8d28c0472d2d42fd
29	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzU1MjEzMSwianRpIjoiN2ZlM2U2NWY2NTBiNDZkYmJiMDg0MWMwZjBhMzE3MmIiLCJ1c2VyX2lkIjoxMn0.OoBYayjizApp4j9cGnZ88IJ5ywwHLzPvqG_EyMw7Y2M	2021-02-16 11:55:31.215922+03	2021-02-17 11:55:31+03	12	7fe3e65f650b46dbbb0841c0f0a3172b
30	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzU1MjI1NywianRpIjoiYjk3MjEzOTM1NTA3NGIxNWI1ZjAwMTVhMmE1OTk2NmQiLCJ1c2VyX2lkIjoxMn0.35Go3eXdL98KlpMOWyKTOdHIcALPmuaBzUjyGPP2LTw	2021-02-16 11:57:37.722015+03	2021-02-17 11:57:37+03	12	b972139355074b15b5f0015a2a59966d
31	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzU1MjMwMSwianRpIjoiMWMwNWZlYTI0Nzc5NDI0Y2JkZDRjYjJjOGNiNWU5ZTAiLCJ1c2VyX2lkIjoxMn0.f9-yXdF255iuPYuLNQmmKHyJegKNfjVS2oinpZn8CAw	2021-02-16 11:58:21.17534+03	2021-02-17 11:58:21+03	12	1c05fea24779424cbdd4cb2c8cb5e9e0
32	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzU1MjMxOCwianRpIjoiMDExMDAzZTNiN2ExNDQ3Zjk4NWYxOTk5OTY2YzkzMjMiLCJ1c2VyX2lkIjoxMn0.i4GzWJX9244EBzSIBtWn_ZejASmYxAizWwxGfAgLs9o	2021-02-16 11:58:38.713865+03	2021-02-17 11:58:38+03	12	011003e3b7a1447f985f1999966c9323
33	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzU1MjQ4MSwianRpIjoiMGI3Nzg5YTY4M2M5NGU4NDlmYWJiNzBkOGU5N2ZiNjAiLCJ1c2VyX2lkIjoxMn0.YnxD8RTU8Dyg0xaPgUhs3_nEfPdQeKCU13SAfuuYE9g	2021-02-16 12:01:21.499897+03	2021-02-17 12:01:21+03	12	0b7789a683c94e849fabb70d8e97fb60
34	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzU1MjU0MCwianRpIjoiMmIyOGNjNzQxZTZiNDc5NmFmN2I5YzRmYmM0NWM2OGYiLCJ1c2VyX2lkIjoxMn0.c-Cc36U7QoYSmFOOy8demuUX_zWOo-Ftfz2waVXpgwc	2021-02-16 12:02:20.15744+03	2021-02-17 12:02:20+03	12	2b28cc741e6b4796af7b9c4fbc45c68f
35	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzU1MjU5OCwianRpIjoiZGNlMGRhNjkwYjhkNDRlMjg0M2UxNjRlZTRkMjZiMGYiLCJ1c2VyX2lkIjoxMn0.XPCIhtoAIGK1qRztU4HUdRe2uEItqiLect0rdYrIMFU	2021-02-16 12:03:18.004365+03	2021-02-17 12:03:18+03	12	dce0da690b8d44e2843e164ee4d26b0f
36	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzU1MjYxNCwianRpIjoiMDgwM2Q1MTgzZGI2NGFhOWE0MjZhOTM3MDNmMGM5ZWQiLCJ1c2VyX2lkIjoxMn0.ztYWVEyhaZjHy-TBKSmfEzstsasgl4Oe-7LUNumX3z4	2021-02-16 12:03:34.556309+03	2021-02-17 12:03:34+03	12	0803d5183db64aa9a426a93703f0c9ed
37	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzU1MjYzNywianRpIjoiY2I4NTViYjU2NTZkNGQyNmI3ZTY5ZDlhNzQ4NWJiZjAiLCJ1c2VyX2lkIjoxMn0.IMz5ClF--y4NMJdlFS-M3cZqyXzy8yIfKJK7FU_kiv4	2021-02-16 12:03:57.849574+03	2021-02-17 12:03:57+03	12	cb855bb5656d4d26b7e69d9a7485bbf0
38	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzU1NTA1NSwianRpIjoiOTY4OTQ3ZjM5N2M3NGI3ZGFjNjhhMmUzZGFlMWY1NTIiLCJ1c2VyX2lkIjoxMn0.0m4EP0fxBFpxpz9SxZnqGNsJhECttZY_1syGVIo4Mzs	2021-02-16 12:44:15.20412+03	2021-02-17 12:44:15+03	12	968947f397c74b7dac68a2e3dae1f552
39	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzU1NTI2MiwianRpIjoiMDI5MmEyMjUwMWM2NDJlNWFmNTEyNjllNGQ2MGE0NGMiLCJ1c2VyX2lkIjoxMn0.M-H6dN2jzY8JJr0yy-CJYBmssGNfgIpng0fwnFJdIrk	2021-02-16 12:47:42.106474+03	2021-02-17 12:47:42+03	12	0292a22501c642e5af51269e4d60a44c
40	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzU1Nzg4NiwianRpIjoiY2IyYjQ5MzNhNTA2NDFiNThhNTlhMzFiMWRhYTcyZWIiLCJ1c2VyX2lkIjoxMn0.8JFzr1nbKqzU5brHdpimQtjvWNbgYTS5lc-F9MpzWFA	2021-02-16 13:31:26.290142+03	2021-02-17 13:31:26+03	12	cb2b4933a50641b58a59a31b1daa72eb
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 56, true);


--
-- Name: authentication_customuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.authentication_customuser_id_seq', 12, true);


--
-- Name: courses_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.courses_course_id_seq', 8, true);


--
-- Name: courses_lesson_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.courses_lesson_id_seq', 2, true);


--
-- Name: courses_subcategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.courses_subcategory_id_seq', 4, true);


--
-- Name: courses_subject_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.courses_subject_id_seq', 12, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 56, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 13, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 35, true);


--
-- Name: token_blacklist_blacklistedtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.token_blacklist_blacklistedtoken_id_seq', 1, true);


--
-- Name: token_blacklist_outstandingtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.token_blacklist_outstandingtoken_id_seq', 40, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: authentication_customuser authentication_customuser_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.authentication_customuser
    ADD CONSTRAINT authentication_customuser_email_key UNIQUE (email);


--
-- Name: authentication_customuser authentication_customuser_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.authentication_customuser
    ADD CONSTRAINT authentication_customuser_pkey PRIMARY KEY (id);


--
-- Name: courses_course courses_course_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courses_course
    ADD CONSTRAINT courses_course_pkey PRIMARY KEY (id);


--
-- Name: courses_course courses_course_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courses_course
    ADD CONSTRAINT courses_course_slug_key UNIQUE (slug);


--
-- Name: courses_lesson courses_lesson_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courses_lesson
    ADD CONSTRAINT courses_lesson_pkey PRIMARY KEY (id);


--
-- Name: courses_lesson courses_lesson_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courses_lesson
    ADD CONSTRAINT courses_lesson_slug_key UNIQUE (slug);


--
-- Name: courses_subcategory courses_subcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courses_subcategory
    ADD CONSTRAINT courses_subcategory_pkey PRIMARY KEY (id);


--
-- Name: courses_category courses_subject_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courses_category
    ADD CONSTRAINT courses_subject_pkey PRIMARY KEY (id);


--
-- Name: courses_category courses_subject_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courses_category
    ADD CONSTRAINT courses_subject_slug_key UNIQUE (slug);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: token_blacklist_blacklistedtoken token_blacklist_blacklistedtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.token_blacklist_blacklistedtoken
    ADD CONSTRAINT token_blacklist_blacklistedtoken_pkey PRIMARY KEY (id);


--
-- Name: token_blacklist_blacklistedtoken token_blacklist_blacklistedtoken_token_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.token_blacklist_blacklistedtoken
    ADD CONSTRAINT token_blacklist_blacklistedtoken_token_id_key UNIQUE (token_id);


--
-- Name: token_blacklist_outstandingtoken token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.token_blacklist_outstandingtoken
    ADD CONSTRAINT token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_uniq UNIQUE (jti);


--
-- Name: token_blacklist_outstandingtoken token_blacklist_outstandingtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.token_blacklist_outstandingtoken
    ADD CONSTRAINT token_blacklist_outstandingtoken_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: authentication_customuser_email_a127f886_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX authentication_customuser_email_a127f886_like ON public.authentication_customuser USING btree (email varchar_pattern_ops);


--
-- Name: courses_course_owner_id_97a468c6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX courses_course_owner_id_97a468c6 ON public.courses_course USING btree (owner_id);


--
-- Name: courses_course_slug_9c670f14_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX courses_course_slug_9c670f14_like ON public.courses_course USING btree (slug varchar_pattern_ops);


--
-- Name: courses_course_subject_id_7a2c8100; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX courses_course_subject_id_7a2c8100 ON public.courses_course USING btree (subcategory_id);


--
-- Name: courses_lesson_module_id_41252914; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX courses_lesson_module_id_41252914 ON public.courses_lesson USING btree (course_id);


--
-- Name: courses_lesson_slug_708303e2_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX courses_lesson_slug_708303e2_like ON public.courses_lesson USING btree (slug varchar_pattern_ops);


--
-- Name: courses_subcategory_category_id_de7e092b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX courses_subcategory_category_id_de7e092b ON public.courses_subcategory USING btree (category_id);


--
-- Name: courses_subcategory_slug_4a0257e4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX courses_subcategory_slug_4a0257e4 ON public.courses_subcategory USING btree (slug);


--
-- Name: courses_subcategory_slug_4a0257e4_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX courses_subcategory_slug_4a0257e4_like ON public.courses_subcategory USING btree (slug varchar_pattern_ops);


--
-- Name: courses_subject_slug_bad2b05f_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX courses_subject_slug_bad2b05f_like ON public.courses_category USING btree (slug varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_like ON public.token_blacklist_outstandingtoken USING btree (jti varchar_pattern_ops);


--
-- Name: token_blacklist_outstandingtoken_user_id_83bc629a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX token_blacklist_outstandingtoken_user_id_83bc629a ON public.token_blacklist_outstandingtoken USING btree (user_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: courses_course courses_course_owner_id_97a468c6_fk_authentic; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courses_course
    ADD CONSTRAINT courses_course_owner_id_97a468c6_fk_authentic FOREIGN KEY (owner_id) REFERENCES public.authentication_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: courses_course courses_course_subcategory_id_ce619eeb_fk_courses_s; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courses_course
    ADD CONSTRAINT courses_course_subcategory_id_ce619eeb_fk_courses_s FOREIGN KEY (subcategory_id) REFERENCES public.courses_subcategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: courses_lesson courses_lesson_course_id_16bc4882_fk_courses_course_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courses_lesson
    ADD CONSTRAINT courses_lesson_course_id_16bc4882_fk_courses_course_id FOREIGN KEY (course_id) REFERENCES public.courses_course(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: courses_subcategory courses_subcategory_category_id_de7e092b_fk_courses_category_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courses_subcategory
    ADD CONSTRAINT courses_subcategory_category_id_de7e092b_fk_courses_category_id FOREIGN KEY (category_id) REFERENCES public.courses_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_authentic; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_authentic FOREIGN KEY (user_id) REFERENCES public.authentication_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: token_blacklist_blacklistedtoken token_blacklist_blac_token_id_3cc7fe56_fk_token_bla; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.token_blacklist_blacklistedtoken
    ADD CONSTRAINT token_blacklist_blac_token_id_3cc7fe56_fk_token_bla FOREIGN KEY (token_id) REFERENCES public.token_blacklist_outstandingtoken(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: token_blacklist_outstandingtoken token_blacklist_outs_user_id_83bc629a_fk_authentic; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.token_blacklist_outstandingtoken
    ADD CONSTRAINT token_blacklist_outs_user_id_83bc629a_fk_authentic FOREIGN KEY (user_id) REFERENCES public.authentication_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

