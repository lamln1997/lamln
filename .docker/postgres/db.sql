--
-- PostgreSQL database dump
--

-- Dumped from database version 12.5 (Ubuntu 12.5-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.5 (Ubuntu 12.5-0ubuntu0.20.04.1)

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
-- Name: permissions; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.permissions (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.permissions OWNER TO root;

--
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permissions_id_seq OWNER TO root;

--
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.roles OWNER TO root;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO root;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: roles_permissions; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.roles_permissions (
    id integer NOT NULL,
    role_id integer NOT NULL,
    permission_id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.roles_permissions OWNER TO root;

--
-- Name: roles_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.roles_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_permissions_id_seq OWNER TO root;

--
-- Name: roles_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.roles_permissions_id_seq OWNED BY public.roles_permissions.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    phone character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    age integer,
    address character varying(255),
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public."user" OWNER TO root;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO root;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: user_roles; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.user_roles (
    id integer NOT NULL,
    user_id integer NOT NULL,
    role_id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.user_roles OWNER TO root;

--
-- Name: user_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.user_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_roles_id_seq OWNER TO root;

--
-- Name: user_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.user_roles_id_seq OWNED BY public.user_roles.id;


--
-- Name: permissions id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: roles_permissions id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles_permissions ALTER COLUMN id SET DEFAULT nextval('public.roles_permissions_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Name: user_roles id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_roles ALTER COLUMN id SET DEFAULT nextval('public.user_roles_id_seq'::regclass);


--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.permissions (id, name, description, created_at, updated_at) FROM stdin;
4	user_detail	Quyền xem chi tiet 1 user	2020-11-23 09:35:59.348+07	2020-11-23 09:35:59.348+07
1	user_update	Quyền cập nhật user	2020-11-23 09:35:08.814+07	2020-11-23 09:36:36.074+07
2	user_create	Quyền tao moi user	2020-11-23 09:35:30.584+07	2020-11-23 09:37:08.862+07
3	user_delete	Quyền xoa user	2020-11-23 09:35:41.47+07	2020-11-23 09:37:20.342+07
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.roles (id, name, description, created_at, updated_at) FROM stdin;
5	Role 1	Full quyền	2020-11-26 15:14:28.98+07	2020-11-26 15:14:28.98+07
6	Role 2	Chỉ có quyền xem chi tiết user	2020-11-26 15:15:25.41+07	2020-11-26 15:15:25.41+07
7	Role 3	Thêm mới, xem chi tiết user	2020-11-26 15:15:58.754+07	2020-11-26 15:15:58.754+07
8	Role 4	Xem chi tiết, cập nhật user	2020-11-26 15:16:21.508+07	2020-11-26 15:16:21.508+07
9	Role 5	Cập nhật, xóa user	2020-11-26 15:16:54.658+07	2020-11-26 15:16:54.658+07
\.


--
-- Data for Name: roles_permissions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.roles_permissions (id, role_id, permission_id, created_at, updated_at) FROM stdin;
1	5	1	2020-11-26 15:14:28.985+07	2020-11-26 15:14:28.985+07
2	5	2	2020-11-26 15:14:28.985+07	2020-11-26 15:14:28.985+07
3	5	3	2020-11-26 15:14:28.985+07	2020-11-26 15:14:28.985+07
4	5	4	2020-11-26 15:14:28.986+07	2020-11-26 15:14:28.986+07
5	6	4	2020-11-26 15:15:25.418+07	2020-11-26 15:15:25.418+07
6	7	2	2020-11-26 15:15:58.758+07	2020-11-26 15:15:58.758+07
8	8	1	2020-11-26 15:16:21.51+07	2020-11-26 15:16:21.51+07
9	8	4	2020-11-26 15:16:21.511+07	2020-11-26 15:16:21.511+07
10	9	1	2020-11-26 15:16:54.662+07	2020-11-26 15:16:54.662+07
11	9	3	2020-11-26 15:16:54.663+07	2020-11-26 15:16:54.663+07
7	7	4	2020-11-26 15:15:58.758+07	2020-11-26 15:15:58.758+07
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public."user" (id, phone, email, password, first_name, last_name, age, address, created_at, updated_at) FROM stdin;
19	0399037737	lamln@icheck.vn	$2b$10$VXQ.3GM/SjINRDGWVNwOqOxCTTqq24pl6Kln.QKuHHm6sz4eCTQyK	Lưu	Nhất Lâm	\N	\N	2020-11-26 15:38:32.551+07	2020-11-26 15:38:32.551+07
23	01686372311	elly@hotmail.com	$2b$10$EZsOYmcWWq.0grx0eb7Aw.sVuZ83NPgM0uz02Z9jkAImTyxA3CeVO	Thương	Elly	\N	\N	2020-12-01 09:59:52.72+07	2020-12-01 09:59:52.72+07
25	0399015123	mail10phut1@gmail.com	$2b$10$5zkkHq1BDN2wuJDxWJZ9o.ELRTlNfKqMaz6ozlprKsglt40hEMlFK	Nhất	lÂM	\N	\N	2020-12-02 15:07:38.563+07	2020-12-02 15:07:38.563+07
\.


--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.user_roles (id, user_id, role_id, created_at, updated_at) FROM stdin;
18	19	7	2020-11-26 15:38:32.555+07	2020-11-26 15:38:32.555+07
17	19	5	2020-11-26 15:38:32.555+07	2020-11-26 15:38:32.555+07
22	23	5	2020-12-01 09:59:52.728+07	2020-12-01 09:59:52.728+07
24	25	5	2020-12-02 15:07:38.575+07	2020-12-02 15:07:38.575+07
25	25	6	2020-12-02 15:07:38.575+07	2020-12-02 15:07:38.575+07
26	25	7	2020-12-02 15:07:38.575+07	2020-12-02 15:07:38.575+07
27	25	8	2020-12-02 15:07:38.576+07	2020-12-02 15:07:38.576+07
28	25	9	2020-12-02 15:07:38.576+07	2020-12-02 15:07:38.576+07
\.


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.permissions_id_seq', 4, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.roles_id_seq', 11, true);


--
-- Name: roles_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.roles_permissions_id_seq', 13, true);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.user_id_seq', 25, true);


--
-- Name: user_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.user_roles_id_seq', 28, true);


--
-- Name: permissions permissions_name_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key UNIQUE (name);


--
-- Name: permissions permissions_name_key1; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key1 UNIQUE (name);


--
-- Name: permissions permissions_name_key10; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key10 UNIQUE (name);


--
-- Name: permissions permissions_name_key100; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key100 UNIQUE (name);


--
-- Name: permissions permissions_name_key101; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key101 UNIQUE (name);


--
-- Name: permissions permissions_name_key102; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key102 UNIQUE (name);


--
-- Name: permissions permissions_name_key103; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key103 UNIQUE (name);


--
-- Name: permissions permissions_name_key104; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key104 UNIQUE (name);


--
-- Name: permissions permissions_name_key105; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key105 UNIQUE (name);


--
-- Name: permissions permissions_name_key106; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key106 UNIQUE (name);


--
-- Name: permissions permissions_name_key107; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key107 UNIQUE (name);


--
-- Name: permissions permissions_name_key108; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key108 UNIQUE (name);


--
-- Name: permissions permissions_name_key109; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key109 UNIQUE (name);


--
-- Name: permissions permissions_name_key11; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key11 UNIQUE (name);


--
-- Name: permissions permissions_name_key110; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key110 UNIQUE (name);


--
-- Name: permissions permissions_name_key111; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key111 UNIQUE (name);


--
-- Name: permissions permissions_name_key112; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key112 UNIQUE (name);


--
-- Name: permissions permissions_name_key113; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key113 UNIQUE (name);


--
-- Name: permissions permissions_name_key114; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key114 UNIQUE (name);


--
-- Name: permissions permissions_name_key115; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key115 UNIQUE (name);


--
-- Name: permissions permissions_name_key116; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key116 UNIQUE (name);


--
-- Name: permissions permissions_name_key117; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key117 UNIQUE (name);


--
-- Name: permissions permissions_name_key118; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key118 UNIQUE (name);


--
-- Name: permissions permissions_name_key119; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key119 UNIQUE (name);


--
-- Name: permissions permissions_name_key12; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key12 UNIQUE (name);


--
-- Name: permissions permissions_name_key120; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key120 UNIQUE (name);


--
-- Name: permissions permissions_name_key121; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key121 UNIQUE (name);


--
-- Name: permissions permissions_name_key122; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key122 UNIQUE (name);


--
-- Name: permissions permissions_name_key123; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key123 UNIQUE (name);


--
-- Name: permissions permissions_name_key124; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key124 UNIQUE (name);


--
-- Name: permissions permissions_name_key125; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key125 UNIQUE (name);


--
-- Name: permissions permissions_name_key126; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key126 UNIQUE (name);


--
-- Name: permissions permissions_name_key127; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key127 UNIQUE (name);


--
-- Name: permissions permissions_name_key128; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key128 UNIQUE (name);


--
-- Name: permissions permissions_name_key129; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key129 UNIQUE (name);


--
-- Name: permissions permissions_name_key13; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key13 UNIQUE (name);


--
-- Name: permissions permissions_name_key130; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key130 UNIQUE (name);


--
-- Name: permissions permissions_name_key131; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key131 UNIQUE (name);


--
-- Name: permissions permissions_name_key132; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key132 UNIQUE (name);


--
-- Name: permissions permissions_name_key133; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key133 UNIQUE (name);


--
-- Name: permissions permissions_name_key134; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key134 UNIQUE (name);


--
-- Name: permissions permissions_name_key135; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key135 UNIQUE (name);


--
-- Name: permissions permissions_name_key136; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key136 UNIQUE (name);


--
-- Name: permissions permissions_name_key137; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key137 UNIQUE (name);


--
-- Name: permissions permissions_name_key138; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key138 UNIQUE (name);


--
-- Name: permissions permissions_name_key139; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key139 UNIQUE (name);


--
-- Name: permissions permissions_name_key14; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key14 UNIQUE (name);


--
-- Name: permissions permissions_name_key140; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key140 UNIQUE (name);


--
-- Name: permissions permissions_name_key141; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key141 UNIQUE (name);


--
-- Name: permissions permissions_name_key142; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key142 UNIQUE (name);


--
-- Name: permissions permissions_name_key143; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key143 UNIQUE (name);


--
-- Name: permissions permissions_name_key144; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key144 UNIQUE (name);


--
-- Name: permissions permissions_name_key145; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key145 UNIQUE (name);


--
-- Name: permissions permissions_name_key146; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key146 UNIQUE (name);


--
-- Name: permissions permissions_name_key147; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key147 UNIQUE (name);


--
-- Name: permissions permissions_name_key148; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key148 UNIQUE (name);


--
-- Name: permissions permissions_name_key149; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key149 UNIQUE (name);


--
-- Name: permissions permissions_name_key15; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key15 UNIQUE (name);


--
-- Name: permissions permissions_name_key150; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key150 UNIQUE (name);


--
-- Name: permissions permissions_name_key151; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key151 UNIQUE (name);


--
-- Name: permissions permissions_name_key152; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key152 UNIQUE (name);


--
-- Name: permissions permissions_name_key153; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key153 UNIQUE (name);


--
-- Name: permissions permissions_name_key154; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key154 UNIQUE (name);


--
-- Name: permissions permissions_name_key155; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key155 UNIQUE (name);


--
-- Name: permissions permissions_name_key156; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key156 UNIQUE (name);


--
-- Name: permissions permissions_name_key157; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key157 UNIQUE (name);


--
-- Name: permissions permissions_name_key158; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key158 UNIQUE (name);


--
-- Name: permissions permissions_name_key159; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key159 UNIQUE (name);


--
-- Name: permissions permissions_name_key16; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key16 UNIQUE (name);


--
-- Name: permissions permissions_name_key160; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key160 UNIQUE (name);


--
-- Name: permissions permissions_name_key161; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key161 UNIQUE (name);


--
-- Name: permissions permissions_name_key162; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key162 UNIQUE (name);


--
-- Name: permissions permissions_name_key163; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key163 UNIQUE (name);


--
-- Name: permissions permissions_name_key164; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key164 UNIQUE (name);


--
-- Name: permissions permissions_name_key165; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key165 UNIQUE (name);


--
-- Name: permissions permissions_name_key166; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key166 UNIQUE (name);


--
-- Name: permissions permissions_name_key167; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key167 UNIQUE (name);


--
-- Name: permissions permissions_name_key168; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key168 UNIQUE (name);


--
-- Name: permissions permissions_name_key169; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key169 UNIQUE (name);


--
-- Name: permissions permissions_name_key17; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key17 UNIQUE (name);


--
-- Name: permissions permissions_name_key170; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key170 UNIQUE (name);


--
-- Name: permissions permissions_name_key171; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key171 UNIQUE (name);


--
-- Name: permissions permissions_name_key172; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key172 UNIQUE (name);


--
-- Name: permissions permissions_name_key173; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key173 UNIQUE (name);


--
-- Name: permissions permissions_name_key174; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key174 UNIQUE (name);


--
-- Name: permissions permissions_name_key175; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key175 UNIQUE (name);


--
-- Name: permissions permissions_name_key176; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key176 UNIQUE (name);


--
-- Name: permissions permissions_name_key177; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key177 UNIQUE (name);


--
-- Name: permissions permissions_name_key178; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key178 UNIQUE (name);


--
-- Name: permissions permissions_name_key179; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key179 UNIQUE (name);


--
-- Name: permissions permissions_name_key18; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key18 UNIQUE (name);


--
-- Name: permissions permissions_name_key180; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key180 UNIQUE (name);


--
-- Name: permissions permissions_name_key181; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key181 UNIQUE (name);


--
-- Name: permissions permissions_name_key182; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key182 UNIQUE (name);


--
-- Name: permissions permissions_name_key183; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key183 UNIQUE (name);


--
-- Name: permissions permissions_name_key184; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key184 UNIQUE (name);


--
-- Name: permissions permissions_name_key185; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key185 UNIQUE (name);


--
-- Name: permissions permissions_name_key186; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key186 UNIQUE (name);


--
-- Name: permissions permissions_name_key187; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key187 UNIQUE (name);


--
-- Name: permissions permissions_name_key188; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key188 UNIQUE (name);


--
-- Name: permissions permissions_name_key189; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key189 UNIQUE (name);


--
-- Name: permissions permissions_name_key19; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key19 UNIQUE (name);


--
-- Name: permissions permissions_name_key190; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key190 UNIQUE (name);


--
-- Name: permissions permissions_name_key191; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key191 UNIQUE (name);


--
-- Name: permissions permissions_name_key192; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key192 UNIQUE (name);


--
-- Name: permissions permissions_name_key193; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key193 UNIQUE (name);


--
-- Name: permissions permissions_name_key194; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key194 UNIQUE (name);


--
-- Name: permissions permissions_name_key195; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key195 UNIQUE (name);


--
-- Name: permissions permissions_name_key196; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key196 UNIQUE (name);


--
-- Name: permissions permissions_name_key197; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key197 UNIQUE (name);


--
-- Name: permissions permissions_name_key198; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key198 UNIQUE (name);


--
-- Name: permissions permissions_name_key199; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key199 UNIQUE (name);


--
-- Name: permissions permissions_name_key2; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key2 UNIQUE (name);


--
-- Name: permissions permissions_name_key20; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key20 UNIQUE (name);


--
-- Name: permissions permissions_name_key200; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key200 UNIQUE (name);


--
-- Name: permissions permissions_name_key201; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key201 UNIQUE (name);


--
-- Name: permissions permissions_name_key202; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key202 UNIQUE (name);


--
-- Name: permissions permissions_name_key203; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key203 UNIQUE (name);


--
-- Name: permissions permissions_name_key204; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key204 UNIQUE (name);


--
-- Name: permissions permissions_name_key205; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key205 UNIQUE (name);


--
-- Name: permissions permissions_name_key206; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key206 UNIQUE (name);


--
-- Name: permissions permissions_name_key207; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key207 UNIQUE (name);


--
-- Name: permissions permissions_name_key208; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key208 UNIQUE (name);


--
-- Name: permissions permissions_name_key209; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key209 UNIQUE (name);


--
-- Name: permissions permissions_name_key21; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key21 UNIQUE (name);


--
-- Name: permissions permissions_name_key210; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key210 UNIQUE (name);


--
-- Name: permissions permissions_name_key211; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key211 UNIQUE (name);


--
-- Name: permissions permissions_name_key212; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key212 UNIQUE (name);


--
-- Name: permissions permissions_name_key213; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key213 UNIQUE (name);


--
-- Name: permissions permissions_name_key214; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key214 UNIQUE (name);


--
-- Name: permissions permissions_name_key215; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key215 UNIQUE (name);


--
-- Name: permissions permissions_name_key216; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key216 UNIQUE (name);


--
-- Name: permissions permissions_name_key217; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key217 UNIQUE (name);


--
-- Name: permissions permissions_name_key218; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key218 UNIQUE (name);


--
-- Name: permissions permissions_name_key219; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key219 UNIQUE (name);


--
-- Name: permissions permissions_name_key22; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key22 UNIQUE (name);


--
-- Name: permissions permissions_name_key220; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key220 UNIQUE (name);


--
-- Name: permissions permissions_name_key221; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key221 UNIQUE (name);


--
-- Name: permissions permissions_name_key222; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key222 UNIQUE (name);


--
-- Name: permissions permissions_name_key223; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key223 UNIQUE (name);


--
-- Name: permissions permissions_name_key224; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key224 UNIQUE (name);


--
-- Name: permissions permissions_name_key225; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key225 UNIQUE (name);


--
-- Name: permissions permissions_name_key226; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key226 UNIQUE (name);


--
-- Name: permissions permissions_name_key227; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key227 UNIQUE (name);


--
-- Name: permissions permissions_name_key228; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key228 UNIQUE (name);


--
-- Name: permissions permissions_name_key229; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key229 UNIQUE (name);


--
-- Name: permissions permissions_name_key23; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key23 UNIQUE (name);


--
-- Name: permissions permissions_name_key230; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key230 UNIQUE (name);


--
-- Name: permissions permissions_name_key231; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key231 UNIQUE (name);


--
-- Name: permissions permissions_name_key232; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key232 UNIQUE (name);


--
-- Name: permissions permissions_name_key233; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key233 UNIQUE (name);


--
-- Name: permissions permissions_name_key234; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key234 UNIQUE (name);


--
-- Name: permissions permissions_name_key235; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key235 UNIQUE (name);


--
-- Name: permissions permissions_name_key236; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key236 UNIQUE (name);


--
-- Name: permissions permissions_name_key237; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key237 UNIQUE (name);


--
-- Name: permissions permissions_name_key238; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key238 UNIQUE (name);


--
-- Name: permissions permissions_name_key239; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key239 UNIQUE (name);


--
-- Name: permissions permissions_name_key24; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key24 UNIQUE (name);


--
-- Name: permissions permissions_name_key240; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key240 UNIQUE (name);


--
-- Name: permissions permissions_name_key241; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key241 UNIQUE (name);


--
-- Name: permissions permissions_name_key242; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key242 UNIQUE (name);


--
-- Name: permissions permissions_name_key243; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key243 UNIQUE (name);


--
-- Name: permissions permissions_name_key244; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key244 UNIQUE (name);


--
-- Name: permissions permissions_name_key245; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key245 UNIQUE (name);


--
-- Name: permissions permissions_name_key246; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key246 UNIQUE (name);


--
-- Name: permissions permissions_name_key247; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key247 UNIQUE (name);


--
-- Name: permissions permissions_name_key248; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key248 UNIQUE (name);


--
-- Name: permissions permissions_name_key249; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key249 UNIQUE (name);


--
-- Name: permissions permissions_name_key25; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key25 UNIQUE (name);


--
-- Name: permissions permissions_name_key250; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key250 UNIQUE (name);


--
-- Name: permissions permissions_name_key251; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key251 UNIQUE (name);


--
-- Name: permissions permissions_name_key252; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key252 UNIQUE (name);


--
-- Name: permissions permissions_name_key253; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key253 UNIQUE (name);


--
-- Name: permissions permissions_name_key254; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key254 UNIQUE (name);


--
-- Name: permissions permissions_name_key255; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key255 UNIQUE (name);


--
-- Name: permissions permissions_name_key256; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key256 UNIQUE (name);


--
-- Name: permissions permissions_name_key257; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key257 UNIQUE (name);


--
-- Name: permissions permissions_name_key258; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key258 UNIQUE (name);


--
-- Name: permissions permissions_name_key259; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key259 UNIQUE (name);


--
-- Name: permissions permissions_name_key26; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key26 UNIQUE (name);


--
-- Name: permissions permissions_name_key260; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key260 UNIQUE (name);


--
-- Name: permissions permissions_name_key261; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key261 UNIQUE (name);


--
-- Name: permissions permissions_name_key262; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key262 UNIQUE (name);


--
-- Name: permissions permissions_name_key263; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key263 UNIQUE (name);


--
-- Name: permissions permissions_name_key264; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key264 UNIQUE (name);


--
-- Name: permissions permissions_name_key265; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key265 UNIQUE (name);


--
-- Name: permissions permissions_name_key266; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key266 UNIQUE (name);


--
-- Name: permissions permissions_name_key267; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key267 UNIQUE (name);


--
-- Name: permissions permissions_name_key268; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key268 UNIQUE (name);


--
-- Name: permissions permissions_name_key269; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key269 UNIQUE (name);


--
-- Name: permissions permissions_name_key27; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key27 UNIQUE (name);


--
-- Name: permissions permissions_name_key270; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key270 UNIQUE (name);


--
-- Name: permissions permissions_name_key271; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key271 UNIQUE (name);


--
-- Name: permissions permissions_name_key272; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key272 UNIQUE (name);


--
-- Name: permissions permissions_name_key273; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key273 UNIQUE (name);


--
-- Name: permissions permissions_name_key274; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key274 UNIQUE (name);


--
-- Name: permissions permissions_name_key275; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key275 UNIQUE (name);


--
-- Name: permissions permissions_name_key276; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key276 UNIQUE (name);


--
-- Name: permissions permissions_name_key277; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key277 UNIQUE (name);


--
-- Name: permissions permissions_name_key278; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key278 UNIQUE (name);


--
-- Name: permissions permissions_name_key279; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key279 UNIQUE (name);


--
-- Name: permissions permissions_name_key28; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key28 UNIQUE (name);


--
-- Name: permissions permissions_name_key280; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key280 UNIQUE (name);


--
-- Name: permissions permissions_name_key281; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key281 UNIQUE (name);


--
-- Name: permissions permissions_name_key282; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key282 UNIQUE (name);


--
-- Name: permissions permissions_name_key283; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key283 UNIQUE (name);


--
-- Name: permissions permissions_name_key284; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key284 UNIQUE (name);


--
-- Name: permissions permissions_name_key285; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key285 UNIQUE (name);


--
-- Name: permissions permissions_name_key286; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key286 UNIQUE (name);


--
-- Name: permissions permissions_name_key287; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key287 UNIQUE (name);


--
-- Name: permissions permissions_name_key288; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key288 UNIQUE (name);


--
-- Name: permissions permissions_name_key289; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key289 UNIQUE (name);


--
-- Name: permissions permissions_name_key29; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key29 UNIQUE (name);


--
-- Name: permissions permissions_name_key290; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key290 UNIQUE (name);


--
-- Name: permissions permissions_name_key291; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key291 UNIQUE (name);


--
-- Name: permissions permissions_name_key292; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key292 UNIQUE (name);


--
-- Name: permissions permissions_name_key293; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key293 UNIQUE (name);


--
-- Name: permissions permissions_name_key294; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key294 UNIQUE (name);


--
-- Name: permissions permissions_name_key295; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key295 UNIQUE (name);


--
-- Name: permissions permissions_name_key296; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key296 UNIQUE (name);


--
-- Name: permissions permissions_name_key297; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key297 UNIQUE (name);


--
-- Name: permissions permissions_name_key298; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key298 UNIQUE (name);


--
-- Name: permissions permissions_name_key299; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key299 UNIQUE (name);


--
-- Name: permissions permissions_name_key3; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key3 UNIQUE (name);


--
-- Name: permissions permissions_name_key30; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key30 UNIQUE (name);


--
-- Name: permissions permissions_name_key300; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key300 UNIQUE (name);


--
-- Name: permissions permissions_name_key301; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key301 UNIQUE (name);


--
-- Name: permissions permissions_name_key302; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key302 UNIQUE (name);


--
-- Name: permissions permissions_name_key303; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key303 UNIQUE (name);


--
-- Name: permissions permissions_name_key304; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key304 UNIQUE (name);


--
-- Name: permissions permissions_name_key305; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key305 UNIQUE (name);


--
-- Name: permissions permissions_name_key306; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key306 UNIQUE (name);


--
-- Name: permissions permissions_name_key307; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key307 UNIQUE (name);


--
-- Name: permissions permissions_name_key308; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key308 UNIQUE (name);


--
-- Name: permissions permissions_name_key309; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key309 UNIQUE (name);


--
-- Name: permissions permissions_name_key31; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key31 UNIQUE (name);


--
-- Name: permissions permissions_name_key310; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key310 UNIQUE (name);


--
-- Name: permissions permissions_name_key311; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key311 UNIQUE (name);


--
-- Name: permissions permissions_name_key312; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key312 UNIQUE (name);


--
-- Name: permissions permissions_name_key313; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key313 UNIQUE (name);


--
-- Name: permissions permissions_name_key314; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key314 UNIQUE (name);


--
-- Name: permissions permissions_name_key315; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key315 UNIQUE (name);


--
-- Name: permissions permissions_name_key316; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key316 UNIQUE (name);


--
-- Name: permissions permissions_name_key317; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key317 UNIQUE (name);


--
-- Name: permissions permissions_name_key318; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key318 UNIQUE (name);


--
-- Name: permissions permissions_name_key319; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key319 UNIQUE (name);


--
-- Name: permissions permissions_name_key32; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key32 UNIQUE (name);


--
-- Name: permissions permissions_name_key320; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key320 UNIQUE (name);


--
-- Name: permissions permissions_name_key321; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key321 UNIQUE (name);


--
-- Name: permissions permissions_name_key322; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key322 UNIQUE (name);


--
-- Name: permissions permissions_name_key323; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key323 UNIQUE (name);


--
-- Name: permissions permissions_name_key324; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key324 UNIQUE (name);


--
-- Name: permissions permissions_name_key325; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key325 UNIQUE (name);


--
-- Name: permissions permissions_name_key326; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key326 UNIQUE (name);


--
-- Name: permissions permissions_name_key327; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key327 UNIQUE (name);


--
-- Name: permissions permissions_name_key328; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key328 UNIQUE (name);


--
-- Name: permissions permissions_name_key33; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key33 UNIQUE (name);


--
-- Name: permissions permissions_name_key34; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key34 UNIQUE (name);


--
-- Name: permissions permissions_name_key35; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key35 UNIQUE (name);


--
-- Name: permissions permissions_name_key36; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key36 UNIQUE (name);


--
-- Name: permissions permissions_name_key37; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key37 UNIQUE (name);


--
-- Name: permissions permissions_name_key38; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key38 UNIQUE (name);


--
-- Name: permissions permissions_name_key39; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key39 UNIQUE (name);


--
-- Name: permissions permissions_name_key4; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key4 UNIQUE (name);


--
-- Name: permissions permissions_name_key40; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key40 UNIQUE (name);


--
-- Name: permissions permissions_name_key41; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key41 UNIQUE (name);


--
-- Name: permissions permissions_name_key42; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key42 UNIQUE (name);


--
-- Name: permissions permissions_name_key43; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key43 UNIQUE (name);


--
-- Name: permissions permissions_name_key44; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key44 UNIQUE (name);


--
-- Name: permissions permissions_name_key45; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key45 UNIQUE (name);


--
-- Name: permissions permissions_name_key46; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key46 UNIQUE (name);


--
-- Name: permissions permissions_name_key47; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key47 UNIQUE (name);


--
-- Name: permissions permissions_name_key48; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key48 UNIQUE (name);


--
-- Name: permissions permissions_name_key49; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key49 UNIQUE (name);


--
-- Name: permissions permissions_name_key5; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key5 UNIQUE (name);


--
-- Name: permissions permissions_name_key50; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key50 UNIQUE (name);


--
-- Name: permissions permissions_name_key51; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key51 UNIQUE (name);


--
-- Name: permissions permissions_name_key52; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key52 UNIQUE (name);


--
-- Name: permissions permissions_name_key53; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key53 UNIQUE (name);


--
-- Name: permissions permissions_name_key54; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key54 UNIQUE (name);


--
-- Name: permissions permissions_name_key55; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key55 UNIQUE (name);


--
-- Name: permissions permissions_name_key56; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key56 UNIQUE (name);


--
-- Name: permissions permissions_name_key57; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key57 UNIQUE (name);


--
-- Name: permissions permissions_name_key58; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key58 UNIQUE (name);


--
-- Name: permissions permissions_name_key59; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key59 UNIQUE (name);


--
-- Name: permissions permissions_name_key6; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key6 UNIQUE (name);


--
-- Name: permissions permissions_name_key60; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key60 UNIQUE (name);


--
-- Name: permissions permissions_name_key61; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key61 UNIQUE (name);


--
-- Name: permissions permissions_name_key62; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key62 UNIQUE (name);


--
-- Name: permissions permissions_name_key63; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key63 UNIQUE (name);


--
-- Name: permissions permissions_name_key64; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key64 UNIQUE (name);


--
-- Name: permissions permissions_name_key65; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key65 UNIQUE (name);


--
-- Name: permissions permissions_name_key66; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key66 UNIQUE (name);


--
-- Name: permissions permissions_name_key67; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key67 UNIQUE (name);


--
-- Name: permissions permissions_name_key68; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key68 UNIQUE (name);


--
-- Name: permissions permissions_name_key69; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key69 UNIQUE (name);


--
-- Name: permissions permissions_name_key7; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key7 UNIQUE (name);


--
-- Name: permissions permissions_name_key70; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key70 UNIQUE (name);


--
-- Name: permissions permissions_name_key71; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key71 UNIQUE (name);


--
-- Name: permissions permissions_name_key72; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key72 UNIQUE (name);


--
-- Name: permissions permissions_name_key73; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key73 UNIQUE (name);


--
-- Name: permissions permissions_name_key74; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key74 UNIQUE (name);


--
-- Name: permissions permissions_name_key75; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key75 UNIQUE (name);


--
-- Name: permissions permissions_name_key76; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key76 UNIQUE (name);


--
-- Name: permissions permissions_name_key77; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key77 UNIQUE (name);


--
-- Name: permissions permissions_name_key78; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key78 UNIQUE (name);


--
-- Name: permissions permissions_name_key79; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key79 UNIQUE (name);


--
-- Name: permissions permissions_name_key8; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key8 UNIQUE (name);


--
-- Name: permissions permissions_name_key80; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key80 UNIQUE (name);


--
-- Name: permissions permissions_name_key81; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key81 UNIQUE (name);


--
-- Name: permissions permissions_name_key82; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key82 UNIQUE (name);


--
-- Name: permissions permissions_name_key83; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key83 UNIQUE (name);


--
-- Name: permissions permissions_name_key84; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key84 UNIQUE (name);


--
-- Name: permissions permissions_name_key85; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key85 UNIQUE (name);


--
-- Name: permissions permissions_name_key86; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key86 UNIQUE (name);


--
-- Name: permissions permissions_name_key87; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key87 UNIQUE (name);


--
-- Name: permissions permissions_name_key88; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key88 UNIQUE (name);


--
-- Name: permissions permissions_name_key89; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key89 UNIQUE (name);


--
-- Name: permissions permissions_name_key9; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key9 UNIQUE (name);


--
-- Name: permissions permissions_name_key90; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key90 UNIQUE (name);


--
-- Name: permissions permissions_name_key91; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key91 UNIQUE (name);


--
-- Name: permissions permissions_name_key92; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key92 UNIQUE (name);


--
-- Name: permissions permissions_name_key93; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key93 UNIQUE (name);


--
-- Name: permissions permissions_name_key94; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key94 UNIQUE (name);


--
-- Name: permissions permissions_name_key95; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key95 UNIQUE (name);


--
-- Name: permissions permissions_name_key96; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key96 UNIQUE (name);


--
-- Name: permissions permissions_name_key97; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key97 UNIQUE (name);


--
-- Name: permissions permissions_name_key98; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key98 UNIQUE (name);


--
-- Name: permissions permissions_name_key99; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key99 UNIQUE (name);


--
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: roles roles_name_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key UNIQUE (name);


--
-- Name: roles roles_name_key1; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key1 UNIQUE (name);


--
-- Name: roles roles_name_key10; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key10 UNIQUE (name);


--
-- Name: roles roles_name_key100; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key100 UNIQUE (name);


--
-- Name: roles roles_name_key101; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key101 UNIQUE (name);


--
-- Name: roles roles_name_key102; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key102 UNIQUE (name);


--
-- Name: roles roles_name_key103; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key103 UNIQUE (name);


--
-- Name: roles roles_name_key104; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key104 UNIQUE (name);


--
-- Name: roles roles_name_key105; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key105 UNIQUE (name);


--
-- Name: roles roles_name_key106; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key106 UNIQUE (name);


--
-- Name: roles roles_name_key107; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key107 UNIQUE (name);


--
-- Name: roles roles_name_key108; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key108 UNIQUE (name);


--
-- Name: roles roles_name_key109; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key109 UNIQUE (name);


--
-- Name: roles roles_name_key11; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key11 UNIQUE (name);


--
-- Name: roles roles_name_key110; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key110 UNIQUE (name);


--
-- Name: roles roles_name_key111; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key111 UNIQUE (name);


--
-- Name: roles roles_name_key112; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key112 UNIQUE (name);


--
-- Name: roles roles_name_key113; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key113 UNIQUE (name);


--
-- Name: roles roles_name_key114; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key114 UNIQUE (name);


--
-- Name: roles roles_name_key115; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key115 UNIQUE (name);


--
-- Name: roles roles_name_key116; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key116 UNIQUE (name);


--
-- Name: roles roles_name_key117; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key117 UNIQUE (name);


--
-- Name: roles roles_name_key118; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key118 UNIQUE (name);


--
-- Name: roles roles_name_key119; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key119 UNIQUE (name);


--
-- Name: roles roles_name_key12; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key12 UNIQUE (name);


--
-- Name: roles roles_name_key120; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key120 UNIQUE (name);


--
-- Name: roles roles_name_key121; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key121 UNIQUE (name);


--
-- Name: roles roles_name_key122; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key122 UNIQUE (name);


--
-- Name: roles roles_name_key123; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key123 UNIQUE (name);


--
-- Name: roles roles_name_key124; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key124 UNIQUE (name);


--
-- Name: roles roles_name_key125; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key125 UNIQUE (name);


--
-- Name: roles roles_name_key126; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key126 UNIQUE (name);


--
-- Name: roles roles_name_key127; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key127 UNIQUE (name);


--
-- Name: roles roles_name_key128; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key128 UNIQUE (name);


--
-- Name: roles roles_name_key129; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key129 UNIQUE (name);


--
-- Name: roles roles_name_key13; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key13 UNIQUE (name);


--
-- Name: roles roles_name_key130; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key130 UNIQUE (name);


--
-- Name: roles roles_name_key131; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key131 UNIQUE (name);


--
-- Name: roles roles_name_key132; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key132 UNIQUE (name);


--
-- Name: roles roles_name_key133; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key133 UNIQUE (name);


--
-- Name: roles roles_name_key134; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key134 UNIQUE (name);


--
-- Name: roles roles_name_key135; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key135 UNIQUE (name);


--
-- Name: roles roles_name_key136; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key136 UNIQUE (name);


--
-- Name: roles roles_name_key137; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key137 UNIQUE (name);


--
-- Name: roles roles_name_key138; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key138 UNIQUE (name);


--
-- Name: roles roles_name_key139; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key139 UNIQUE (name);


--
-- Name: roles roles_name_key14; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key14 UNIQUE (name);


--
-- Name: roles roles_name_key140; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key140 UNIQUE (name);


--
-- Name: roles roles_name_key141; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key141 UNIQUE (name);


--
-- Name: roles roles_name_key142; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key142 UNIQUE (name);


--
-- Name: roles roles_name_key143; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key143 UNIQUE (name);


--
-- Name: roles roles_name_key144; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key144 UNIQUE (name);


--
-- Name: roles roles_name_key145; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key145 UNIQUE (name);


--
-- Name: roles roles_name_key146; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key146 UNIQUE (name);


--
-- Name: roles roles_name_key147; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key147 UNIQUE (name);


--
-- Name: roles roles_name_key148; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key148 UNIQUE (name);


--
-- Name: roles roles_name_key149; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key149 UNIQUE (name);


--
-- Name: roles roles_name_key15; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key15 UNIQUE (name);


--
-- Name: roles roles_name_key150; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key150 UNIQUE (name);


--
-- Name: roles roles_name_key151; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key151 UNIQUE (name);


--
-- Name: roles roles_name_key152; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key152 UNIQUE (name);


--
-- Name: roles roles_name_key153; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key153 UNIQUE (name);


--
-- Name: roles roles_name_key154; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key154 UNIQUE (name);


--
-- Name: roles roles_name_key155; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key155 UNIQUE (name);


--
-- Name: roles roles_name_key156; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key156 UNIQUE (name);


--
-- Name: roles roles_name_key157; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key157 UNIQUE (name);


--
-- Name: roles roles_name_key158; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key158 UNIQUE (name);


--
-- Name: roles roles_name_key159; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key159 UNIQUE (name);


--
-- Name: roles roles_name_key16; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key16 UNIQUE (name);


--
-- Name: roles roles_name_key160; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key160 UNIQUE (name);


--
-- Name: roles roles_name_key161; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key161 UNIQUE (name);


--
-- Name: roles roles_name_key162; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key162 UNIQUE (name);


--
-- Name: roles roles_name_key163; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key163 UNIQUE (name);


--
-- Name: roles roles_name_key164; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key164 UNIQUE (name);


--
-- Name: roles roles_name_key165; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key165 UNIQUE (name);


--
-- Name: roles roles_name_key166; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key166 UNIQUE (name);


--
-- Name: roles roles_name_key167; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key167 UNIQUE (name);


--
-- Name: roles roles_name_key168; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key168 UNIQUE (name);


--
-- Name: roles roles_name_key169; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key169 UNIQUE (name);


--
-- Name: roles roles_name_key17; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key17 UNIQUE (name);


--
-- Name: roles roles_name_key170; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key170 UNIQUE (name);


--
-- Name: roles roles_name_key171; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key171 UNIQUE (name);


--
-- Name: roles roles_name_key172; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key172 UNIQUE (name);


--
-- Name: roles roles_name_key173; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key173 UNIQUE (name);


--
-- Name: roles roles_name_key174; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key174 UNIQUE (name);


--
-- Name: roles roles_name_key175; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key175 UNIQUE (name);


--
-- Name: roles roles_name_key176; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key176 UNIQUE (name);


--
-- Name: roles roles_name_key177; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key177 UNIQUE (name);


--
-- Name: roles roles_name_key178; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key178 UNIQUE (name);


--
-- Name: roles roles_name_key179; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key179 UNIQUE (name);


--
-- Name: roles roles_name_key18; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key18 UNIQUE (name);


--
-- Name: roles roles_name_key180; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key180 UNIQUE (name);


--
-- Name: roles roles_name_key181; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key181 UNIQUE (name);


--
-- Name: roles roles_name_key182; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key182 UNIQUE (name);


--
-- Name: roles roles_name_key183; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key183 UNIQUE (name);


--
-- Name: roles roles_name_key184; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key184 UNIQUE (name);


--
-- Name: roles roles_name_key185; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key185 UNIQUE (name);


--
-- Name: roles roles_name_key186; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key186 UNIQUE (name);


--
-- Name: roles roles_name_key187; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key187 UNIQUE (name);


--
-- Name: roles roles_name_key188; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key188 UNIQUE (name);


--
-- Name: roles roles_name_key189; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key189 UNIQUE (name);


--
-- Name: roles roles_name_key19; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key19 UNIQUE (name);


--
-- Name: roles roles_name_key190; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key190 UNIQUE (name);


--
-- Name: roles roles_name_key191; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key191 UNIQUE (name);


--
-- Name: roles roles_name_key192; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key192 UNIQUE (name);


--
-- Name: roles roles_name_key193; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key193 UNIQUE (name);


--
-- Name: roles roles_name_key194; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key194 UNIQUE (name);


--
-- Name: roles roles_name_key195; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key195 UNIQUE (name);


--
-- Name: roles roles_name_key196; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key196 UNIQUE (name);


--
-- Name: roles roles_name_key197; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key197 UNIQUE (name);


--
-- Name: roles roles_name_key198; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key198 UNIQUE (name);


--
-- Name: roles roles_name_key199; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key199 UNIQUE (name);


--
-- Name: roles roles_name_key2; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key2 UNIQUE (name);


--
-- Name: roles roles_name_key20; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key20 UNIQUE (name);


--
-- Name: roles roles_name_key200; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key200 UNIQUE (name);


--
-- Name: roles roles_name_key201; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key201 UNIQUE (name);


--
-- Name: roles roles_name_key202; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key202 UNIQUE (name);


--
-- Name: roles roles_name_key203; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key203 UNIQUE (name);


--
-- Name: roles roles_name_key204; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key204 UNIQUE (name);


--
-- Name: roles roles_name_key205; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key205 UNIQUE (name);


--
-- Name: roles roles_name_key206; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key206 UNIQUE (name);


--
-- Name: roles roles_name_key207; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key207 UNIQUE (name);


--
-- Name: roles roles_name_key208; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key208 UNIQUE (name);


--
-- Name: roles roles_name_key209; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key209 UNIQUE (name);


--
-- Name: roles roles_name_key21; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key21 UNIQUE (name);


--
-- Name: roles roles_name_key210; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key210 UNIQUE (name);


--
-- Name: roles roles_name_key211; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key211 UNIQUE (name);


--
-- Name: roles roles_name_key212; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key212 UNIQUE (name);


--
-- Name: roles roles_name_key213; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key213 UNIQUE (name);


--
-- Name: roles roles_name_key214; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key214 UNIQUE (name);


--
-- Name: roles roles_name_key215; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key215 UNIQUE (name);


--
-- Name: roles roles_name_key216; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key216 UNIQUE (name);


--
-- Name: roles roles_name_key217; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key217 UNIQUE (name);


--
-- Name: roles roles_name_key218; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key218 UNIQUE (name);


--
-- Name: roles roles_name_key219; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key219 UNIQUE (name);


--
-- Name: roles roles_name_key22; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key22 UNIQUE (name);


--
-- Name: roles roles_name_key220; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key220 UNIQUE (name);


--
-- Name: roles roles_name_key221; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key221 UNIQUE (name);


--
-- Name: roles roles_name_key222; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key222 UNIQUE (name);


--
-- Name: roles roles_name_key223; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key223 UNIQUE (name);


--
-- Name: roles roles_name_key224; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key224 UNIQUE (name);


--
-- Name: roles roles_name_key225; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key225 UNIQUE (name);


--
-- Name: roles roles_name_key226; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key226 UNIQUE (name);


--
-- Name: roles roles_name_key227; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key227 UNIQUE (name);


--
-- Name: roles roles_name_key228; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key228 UNIQUE (name);


--
-- Name: roles roles_name_key229; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key229 UNIQUE (name);


--
-- Name: roles roles_name_key23; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key23 UNIQUE (name);


--
-- Name: roles roles_name_key230; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key230 UNIQUE (name);


--
-- Name: roles roles_name_key231; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key231 UNIQUE (name);


--
-- Name: roles roles_name_key232; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key232 UNIQUE (name);


--
-- Name: roles roles_name_key233; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key233 UNIQUE (name);


--
-- Name: roles roles_name_key234; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key234 UNIQUE (name);


--
-- Name: roles roles_name_key235; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key235 UNIQUE (name);


--
-- Name: roles roles_name_key236; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key236 UNIQUE (name);


--
-- Name: roles roles_name_key237; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key237 UNIQUE (name);


--
-- Name: roles roles_name_key238; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key238 UNIQUE (name);


--
-- Name: roles roles_name_key239; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key239 UNIQUE (name);


--
-- Name: roles roles_name_key24; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key24 UNIQUE (name);


--
-- Name: roles roles_name_key240; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key240 UNIQUE (name);


--
-- Name: roles roles_name_key241; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key241 UNIQUE (name);


--
-- Name: roles roles_name_key242; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key242 UNIQUE (name);


--
-- Name: roles roles_name_key243; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key243 UNIQUE (name);


--
-- Name: roles roles_name_key244; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key244 UNIQUE (name);


--
-- Name: roles roles_name_key245; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key245 UNIQUE (name);


--
-- Name: roles roles_name_key246; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key246 UNIQUE (name);


--
-- Name: roles roles_name_key247; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key247 UNIQUE (name);


--
-- Name: roles roles_name_key248; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key248 UNIQUE (name);


--
-- Name: roles roles_name_key249; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key249 UNIQUE (name);


--
-- Name: roles roles_name_key25; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key25 UNIQUE (name);


--
-- Name: roles roles_name_key250; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key250 UNIQUE (name);


--
-- Name: roles roles_name_key251; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key251 UNIQUE (name);


--
-- Name: roles roles_name_key252; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key252 UNIQUE (name);


--
-- Name: roles roles_name_key253; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key253 UNIQUE (name);


--
-- Name: roles roles_name_key254; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key254 UNIQUE (name);


--
-- Name: roles roles_name_key255; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key255 UNIQUE (name);


--
-- Name: roles roles_name_key256; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key256 UNIQUE (name);


--
-- Name: roles roles_name_key257; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key257 UNIQUE (name);


--
-- Name: roles roles_name_key258; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key258 UNIQUE (name);


--
-- Name: roles roles_name_key259; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key259 UNIQUE (name);


--
-- Name: roles roles_name_key26; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key26 UNIQUE (name);


--
-- Name: roles roles_name_key260; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key260 UNIQUE (name);


--
-- Name: roles roles_name_key261; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key261 UNIQUE (name);


--
-- Name: roles roles_name_key262; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key262 UNIQUE (name);


--
-- Name: roles roles_name_key263; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key263 UNIQUE (name);


--
-- Name: roles roles_name_key264; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key264 UNIQUE (name);


--
-- Name: roles roles_name_key265; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key265 UNIQUE (name);


--
-- Name: roles roles_name_key266; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key266 UNIQUE (name);


--
-- Name: roles roles_name_key267; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key267 UNIQUE (name);


--
-- Name: roles roles_name_key268; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key268 UNIQUE (name);


--
-- Name: roles roles_name_key269; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key269 UNIQUE (name);


--
-- Name: roles roles_name_key27; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key27 UNIQUE (name);


--
-- Name: roles roles_name_key270; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key270 UNIQUE (name);


--
-- Name: roles roles_name_key271; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key271 UNIQUE (name);


--
-- Name: roles roles_name_key272; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key272 UNIQUE (name);


--
-- Name: roles roles_name_key273; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key273 UNIQUE (name);


--
-- Name: roles roles_name_key274; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key274 UNIQUE (name);


--
-- Name: roles roles_name_key275; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key275 UNIQUE (name);


--
-- Name: roles roles_name_key276; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key276 UNIQUE (name);


--
-- Name: roles roles_name_key277; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key277 UNIQUE (name);


--
-- Name: roles roles_name_key278; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key278 UNIQUE (name);


--
-- Name: roles roles_name_key279; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key279 UNIQUE (name);


--
-- Name: roles roles_name_key28; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key28 UNIQUE (name);


--
-- Name: roles roles_name_key280; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key280 UNIQUE (name);


--
-- Name: roles roles_name_key281; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key281 UNIQUE (name);


--
-- Name: roles roles_name_key282; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key282 UNIQUE (name);


--
-- Name: roles roles_name_key283; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key283 UNIQUE (name);


--
-- Name: roles roles_name_key284; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key284 UNIQUE (name);


--
-- Name: roles roles_name_key285; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key285 UNIQUE (name);


--
-- Name: roles roles_name_key286; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key286 UNIQUE (name);


--
-- Name: roles roles_name_key287; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key287 UNIQUE (name);


--
-- Name: roles roles_name_key288; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key288 UNIQUE (name);


--
-- Name: roles roles_name_key289; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key289 UNIQUE (name);


--
-- Name: roles roles_name_key29; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key29 UNIQUE (name);


--
-- Name: roles roles_name_key290; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key290 UNIQUE (name);


--
-- Name: roles roles_name_key291; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key291 UNIQUE (name);


--
-- Name: roles roles_name_key292; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key292 UNIQUE (name);


--
-- Name: roles roles_name_key293; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key293 UNIQUE (name);


--
-- Name: roles roles_name_key294; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key294 UNIQUE (name);


--
-- Name: roles roles_name_key295; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key295 UNIQUE (name);


--
-- Name: roles roles_name_key296; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key296 UNIQUE (name);


--
-- Name: roles roles_name_key297; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key297 UNIQUE (name);


--
-- Name: roles roles_name_key298; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key298 UNIQUE (name);


--
-- Name: roles roles_name_key299; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key299 UNIQUE (name);


--
-- Name: roles roles_name_key3; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key3 UNIQUE (name);


--
-- Name: roles roles_name_key30; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key30 UNIQUE (name);


--
-- Name: roles roles_name_key300; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key300 UNIQUE (name);


--
-- Name: roles roles_name_key301; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key301 UNIQUE (name);


--
-- Name: roles roles_name_key302; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key302 UNIQUE (name);


--
-- Name: roles roles_name_key303; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key303 UNIQUE (name);


--
-- Name: roles roles_name_key304; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key304 UNIQUE (name);


--
-- Name: roles roles_name_key305; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key305 UNIQUE (name);


--
-- Name: roles roles_name_key306; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key306 UNIQUE (name);


--
-- Name: roles roles_name_key307; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key307 UNIQUE (name);


--
-- Name: roles roles_name_key308; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key308 UNIQUE (name);


--
-- Name: roles roles_name_key309; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key309 UNIQUE (name);


--
-- Name: roles roles_name_key31; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key31 UNIQUE (name);


--
-- Name: roles roles_name_key310; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key310 UNIQUE (name);


--
-- Name: roles roles_name_key311; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key311 UNIQUE (name);


--
-- Name: roles roles_name_key312; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key312 UNIQUE (name);


--
-- Name: roles roles_name_key313; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key313 UNIQUE (name);


--
-- Name: roles roles_name_key314; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key314 UNIQUE (name);


--
-- Name: roles roles_name_key315; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key315 UNIQUE (name);


--
-- Name: roles roles_name_key316; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key316 UNIQUE (name);


--
-- Name: roles roles_name_key317; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key317 UNIQUE (name);


--
-- Name: roles roles_name_key318; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key318 UNIQUE (name);


--
-- Name: roles roles_name_key319; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key319 UNIQUE (name);


--
-- Name: roles roles_name_key32; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key32 UNIQUE (name);


--
-- Name: roles roles_name_key320; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key320 UNIQUE (name);


--
-- Name: roles roles_name_key321; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key321 UNIQUE (name);


--
-- Name: roles roles_name_key322; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key322 UNIQUE (name);


--
-- Name: roles roles_name_key323; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key323 UNIQUE (name);


--
-- Name: roles roles_name_key324; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key324 UNIQUE (name);


--
-- Name: roles roles_name_key325; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key325 UNIQUE (name);


--
-- Name: roles roles_name_key326; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key326 UNIQUE (name);


--
-- Name: roles roles_name_key327; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key327 UNIQUE (name);


--
-- Name: roles roles_name_key328; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key328 UNIQUE (name);


--
-- Name: roles roles_name_key33; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key33 UNIQUE (name);


--
-- Name: roles roles_name_key34; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key34 UNIQUE (name);


--
-- Name: roles roles_name_key35; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key35 UNIQUE (name);


--
-- Name: roles roles_name_key36; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key36 UNIQUE (name);


--
-- Name: roles roles_name_key37; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key37 UNIQUE (name);


--
-- Name: roles roles_name_key38; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key38 UNIQUE (name);


--
-- Name: roles roles_name_key39; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key39 UNIQUE (name);


--
-- Name: roles roles_name_key4; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key4 UNIQUE (name);


--
-- Name: roles roles_name_key40; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key40 UNIQUE (name);


--
-- Name: roles roles_name_key41; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key41 UNIQUE (name);


--
-- Name: roles roles_name_key42; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key42 UNIQUE (name);


--
-- Name: roles roles_name_key43; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key43 UNIQUE (name);


--
-- Name: roles roles_name_key44; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key44 UNIQUE (name);


--
-- Name: roles roles_name_key45; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key45 UNIQUE (name);


--
-- Name: roles roles_name_key46; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key46 UNIQUE (name);


--
-- Name: roles roles_name_key47; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key47 UNIQUE (name);


--
-- Name: roles roles_name_key48; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key48 UNIQUE (name);


--
-- Name: roles roles_name_key49; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key49 UNIQUE (name);


--
-- Name: roles roles_name_key5; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key5 UNIQUE (name);


--
-- Name: roles roles_name_key50; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key50 UNIQUE (name);


--
-- Name: roles roles_name_key51; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key51 UNIQUE (name);


--
-- Name: roles roles_name_key52; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key52 UNIQUE (name);


--
-- Name: roles roles_name_key53; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key53 UNIQUE (name);


--
-- Name: roles roles_name_key54; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key54 UNIQUE (name);


--
-- Name: roles roles_name_key55; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key55 UNIQUE (name);


--
-- Name: roles roles_name_key56; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key56 UNIQUE (name);


--
-- Name: roles roles_name_key57; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key57 UNIQUE (name);


--
-- Name: roles roles_name_key58; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key58 UNIQUE (name);


--
-- Name: roles roles_name_key59; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key59 UNIQUE (name);


--
-- Name: roles roles_name_key6; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key6 UNIQUE (name);


--
-- Name: roles roles_name_key60; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key60 UNIQUE (name);


--
-- Name: roles roles_name_key61; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key61 UNIQUE (name);


--
-- Name: roles roles_name_key62; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key62 UNIQUE (name);


--
-- Name: roles roles_name_key63; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key63 UNIQUE (name);


--
-- Name: roles roles_name_key64; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key64 UNIQUE (name);


--
-- Name: roles roles_name_key65; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key65 UNIQUE (name);


--
-- Name: roles roles_name_key66; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key66 UNIQUE (name);


--
-- Name: roles roles_name_key67; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key67 UNIQUE (name);


--
-- Name: roles roles_name_key68; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key68 UNIQUE (name);


--
-- Name: roles roles_name_key69; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key69 UNIQUE (name);


--
-- Name: roles roles_name_key7; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key7 UNIQUE (name);


--
-- Name: roles roles_name_key70; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key70 UNIQUE (name);


--
-- Name: roles roles_name_key71; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key71 UNIQUE (name);


--
-- Name: roles roles_name_key72; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key72 UNIQUE (name);


--
-- Name: roles roles_name_key73; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key73 UNIQUE (name);


--
-- Name: roles roles_name_key74; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key74 UNIQUE (name);


--
-- Name: roles roles_name_key75; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key75 UNIQUE (name);


--
-- Name: roles roles_name_key76; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key76 UNIQUE (name);


--
-- Name: roles roles_name_key77; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key77 UNIQUE (name);


--
-- Name: roles roles_name_key78; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key78 UNIQUE (name);


--
-- Name: roles roles_name_key79; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key79 UNIQUE (name);


--
-- Name: roles roles_name_key8; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key8 UNIQUE (name);


--
-- Name: roles roles_name_key80; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key80 UNIQUE (name);


--
-- Name: roles roles_name_key81; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key81 UNIQUE (name);


--
-- Name: roles roles_name_key82; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key82 UNIQUE (name);


--
-- Name: roles roles_name_key83; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key83 UNIQUE (name);


--
-- Name: roles roles_name_key84; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key84 UNIQUE (name);


--
-- Name: roles roles_name_key85; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key85 UNIQUE (name);


--
-- Name: roles roles_name_key86; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key86 UNIQUE (name);


--
-- Name: roles roles_name_key87; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key87 UNIQUE (name);


--
-- Name: roles roles_name_key88; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key88 UNIQUE (name);


--
-- Name: roles roles_name_key89; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key89 UNIQUE (name);


--
-- Name: roles roles_name_key9; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key9 UNIQUE (name);


--
-- Name: roles roles_name_key90; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key90 UNIQUE (name);


--
-- Name: roles roles_name_key91; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key91 UNIQUE (name);


--
-- Name: roles roles_name_key92; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key92 UNIQUE (name);


--
-- Name: roles roles_name_key93; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key93 UNIQUE (name);


--
-- Name: roles roles_name_key94; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key94 UNIQUE (name);


--
-- Name: roles roles_name_key95; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key95 UNIQUE (name);


--
-- Name: roles roles_name_key96; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key96 UNIQUE (name);


--
-- Name: roles roles_name_key97; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key97 UNIQUE (name);


--
-- Name: roles roles_name_key98; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key98 UNIQUE (name);


--
-- Name: roles roles_name_key99; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key99 UNIQUE (name);


--
-- Name: roles_permissions roles_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles_permissions
    ADD CONSTRAINT roles_permissions_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: user user_email_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key UNIQUE (email);


--
-- Name: user user_email_key1; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key1 UNIQUE (email);


--
-- Name: user user_email_key10; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key10 UNIQUE (email);


--
-- Name: user user_email_key100; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key100 UNIQUE (email);


--
-- Name: user user_email_key101; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key101 UNIQUE (email);


--
-- Name: user user_email_key102; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key102 UNIQUE (email);


--
-- Name: user user_email_key103; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key103 UNIQUE (email);


--
-- Name: user user_email_key104; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key104 UNIQUE (email);


--
-- Name: user user_email_key105; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key105 UNIQUE (email);


--
-- Name: user user_email_key106; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key106 UNIQUE (email);


--
-- Name: user user_email_key107; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key107 UNIQUE (email);


--
-- Name: user user_email_key108; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key108 UNIQUE (email);


--
-- Name: user user_email_key109; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key109 UNIQUE (email);


--
-- Name: user user_email_key11; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key11 UNIQUE (email);


--
-- Name: user user_email_key110; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key110 UNIQUE (email);


--
-- Name: user user_email_key111; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key111 UNIQUE (email);


--
-- Name: user user_email_key112; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key112 UNIQUE (email);


--
-- Name: user user_email_key113; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key113 UNIQUE (email);


--
-- Name: user user_email_key114; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key114 UNIQUE (email);


--
-- Name: user user_email_key115; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key115 UNIQUE (email);


--
-- Name: user user_email_key116; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key116 UNIQUE (email);


--
-- Name: user user_email_key117; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key117 UNIQUE (email);


--
-- Name: user user_email_key118; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key118 UNIQUE (email);


--
-- Name: user user_email_key119; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key119 UNIQUE (email);


--
-- Name: user user_email_key12; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key12 UNIQUE (email);


--
-- Name: user user_email_key120; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key120 UNIQUE (email);


--
-- Name: user user_email_key121; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key121 UNIQUE (email);


--
-- Name: user user_email_key122; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key122 UNIQUE (email);


--
-- Name: user user_email_key123; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key123 UNIQUE (email);


--
-- Name: user user_email_key124; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key124 UNIQUE (email);


--
-- Name: user user_email_key125; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key125 UNIQUE (email);


--
-- Name: user user_email_key126; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key126 UNIQUE (email);


--
-- Name: user user_email_key127; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key127 UNIQUE (email);


--
-- Name: user user_email_key128; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key128 UNIQUE (email);


--
-- Name: user user_email_key129; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key129 UNIQUE (email);


--
-- Name: user user_email_key13; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key13 UNIQUE (email);


--
-- Name: user user_email_key130; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key130 UNIQUE (email);


--
-- Name: user user_email_key131; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key131 UNIQUE (email);


--
-- Name: user user_email_key132; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key132 UNIQUE (email);


--
-- Name: user user_email_key133; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key133 UNIQUE (email);


--
-- Name: user user_email_key134; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key134 UNIQUE (email);


--
-- Name: user user_email_key135; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key135 UNIQUE (email);


--
-- Name: user user_email_key136; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key136 UNIQUE (email);


--
-- Name: user user_email_key137; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key137 UNIQUE (email);


--
-- Name: user user_email_key138; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key138 UNIQUE (email);


--
-- Name: user user_email_key139; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key139 UNIQUE (email);


--
-- Name: user user_email_key14; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key14 UNIQUE (email);


--
-- Name: user user_email_key140; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key140 UNIQUE (email);


--
-- Name: user user_email_key141; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key141 UNIQUE (email);


--
-- Name: user user_email_key142; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key142 UNIQUE (email);


--
-- Name: user user_email_key143; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key143 UNIQUE (email);


--
-- Name: user user_email_key144; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key144 UNIQUE (email);


--
-- Name: user user_email_key145; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key145 UNIQUE (email);


--
-- Name: user user_email_key146; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key146 UNIQUE (email);


--
-- Name: user user_email_key147; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key147 UNIQUE (email);


--
-- Name: user user_email_key148; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key148 UNIQUE (email);


--
-- Name: user user_email_key149; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key149 UNIQUE (email);


--
-- Name: user user_email_key15; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key15 UNIQUE (email);


--
-- Name: user user_email_key150; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key150 UNIQUE (email);


--
-- Name: user user_email_key151; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key151 UNIQUE (email);


--
-- Name: user user_email_key152; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key152 UNIQUE (email);


--
-- Name: user user_email_key153; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key153 UNIQUE (email);


--
-- Name: user user_email_key154; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key154 UNIQUE (email);


--
-- Name: user user_email_key155; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key155 UNIQUE (email);


--
-- Name: user user_email_key156; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key156 UNIQUE (email);


--
-- Name: user user_email_key157; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key157 UNIQUE (email);


--
-- Name: user user_email_key158; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key158 UNIQUE (email);


--
-- Name: user user_email_key159; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key159 UNIQUE (email);


--
-- Name: user user_email_key16; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key16 UNIQUE (email);


--
-- Name: user user_email_key160; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key160 UNIQUE (email);


--
-- Name: user user_email_key161; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key161 UNIQUE (email);


--
-- Name: user user_email_key162; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key162 UNIQUE (email);


--
-- Name: user user_email_key163; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key163 UNIQUE (email);


--
-- Name: user user_email_key164; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key164 UNIQUE (email);


--
-- Name: user user_email_key165; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key165 UNIQUE (email);


--
-- Name: user user_email_key166; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key166 UNIQUE (email);


--
-- Name: user user_email_key167; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key167 UNIQUE (email);


--
-- Name: user user_email_key168; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key168 UNIQUE (email);


--
-- Name: user user_email_key169; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key169 UNIQUE (email);


--
-- Name: user user_email_key17; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key17 UNIQUE (email);


--
-- Name: user user_email_key170; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key170 UNIQUE (email);


--
-- Name: user user_email_key171; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key171 UNIQUE (email);


--
-- Name: user user_email_key172; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key172 UNIQUE (email);


--
-- Name: user user_email_key173; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key173 UNIQUE (email);


--
-- Name: user user_email_key174; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key174 UNIQUE (email);


--
-- Name: user user_email_key175; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key175 UNIQUE (email);


--
-- Name: user user_email_key176; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key176 UNIQUE (email);


--
-- Name: user user_email_key177; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key177 UNIQUE (email);


--
-- Name: user user_email_key178; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key178 UNIQUE (email);


--
-- Name: user user_email_key179; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key179 UNIQUE (email);


--
-- Name: user user_email_key18; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key18 UNIQUE (email);


--
-- Name: user user_email_key180; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key180 UNIQUE (email);


--
-- Name: user user_email_key181; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key181 UNIQUE (email);


--
-- Name: user user_email_key182; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key182 UNIQUE (email);


--
-- Name: user user_email_key183; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key183 UNIQUE (email);


--
-- Name: user user_email_key184; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key184 UNIQUE (email);


--
-- Name: user user_email_key185; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key185 UNIQUE (email);


--
-- Name: user user_email_key186; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key186 UNIQUE (email);


--
-- Name: user user_email_key187; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key187 UNIQUE (email);


--
-- Name: user user_email_key188; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key188 UNIQUE (email);


--
-- Name: user user_email_key189; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key189 UNIQUE (email);


--
-- Name: user user_email_key19; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key19 UNIQUE (email);


--
-- Name: user user_email_key190; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key190 UNIQUE (email);


--
-- Name: user user_email_key191; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key191 UNIQUE (email);


--
-- Name: user user_email_key192; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key192 UNIQUE (email);


--
-- Name: user user_email_key193; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key193 UNIQUE (email);


--
-- Name: user user_email_key194; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key194 UNIQUE (email);


--
-- Name: user user_email_key195; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key195 UNIQUE (email);


--
-- Name: user user_email_key196; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key196 UNIQUE (email);


--
-- Name: user user_email_key197; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key197 UNIQUE (email);


--
-- Name: user user_email_key198; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key198 UNIQUE (email);


--
-- Name: user user_email_key199; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key199 UNIQUE (email);


--
-- Name: user user_email_key2; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key2 UNIQUE (email);


--
-- Name: user user_email_key20; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key20 UNIQUE (email);


--
-- Name: user user_email_key200; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key200 UNIQUE (email);


--
-- Name: user user_email_key201; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key201 UNIQUE (email);


--
-- Name: user user_email_key202; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key202 UNIQUE (email);


--
-- Name: user user_email_key203; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key203 UNIQUE (email);


--
-- Name: user user_email_key204; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key204 UNIQUE (email);


--
-- Name: user user_email_key205; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key205 UNIQUE (email);


--
-- Name: user user_email_key206; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key206 UNIQUE (email);


--
-- Name: user user_email_key207; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key207 UNIQUE (email);


--
-- Name: user user_email_key208; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key208 UNIQUE (email);


--
-- Name: user user_email_key209; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key209 UNIQUE (email);


--
-- Name: user user_email_key21; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key21 UNIQUE (email);


--
-- Name: user user_email_key210; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key210 UNIQUE (email);


--
-- Name: user user_email_key211; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key211 UNIQUE (email);


--
-- Name: user user_email_key212; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key212 UNIQUE (email);


--
-- Name: user user_email_key213; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key213 UNIQUE (email);


--
-- Name: user user_email_key214; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key214 UNIQUE (email);


--
-- Name: user user_email_key215; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key215 UNIQUE (email);


--
-- Name: user user_email_key216; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key216 UNIQUE (email);


--
-- Name: user user_email_key217; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key217 UNIQUE (email);


--
-- Name: user user_email_key218; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key218 UNIQUE (email);


--
-- Name: user user_email_key219; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key219 UNIQUE (email);


--
-- Name: user user_email_key22; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key22 UNIQUE (email);


--
-- Name: user user_email_key220; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key220 UNIQUE (email);


--
-- Name: user user_email_key221; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key221 UNIQUE (email);


--
-- Name: user user_email_key222; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key222 UNIQUE (email);


--
-- Name: user user_email_key223; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key223 UNIQUE (email);


--
-- Name: user user_email_key224; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key224 UNIQUE (email);


--
-- Name: user user_email_key225; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key225 UNIQUE (email);


--
-- Name: user user_email_key226; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key226 UNIQUE (email);


--
-- Name: user user_email_key227; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key227 UNIQUE (email);


--
-- Name: user user_email_key228; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key228 UNIQUE (email);


--
-- Name: user user_email_key229; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key229 UNIQUE (email);


--
-- Name: user user_email_key23; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key23 UNIQUE (email);


--
-- Name: user user_email_key230; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key230 UNIQUE (email);


--
-- Name: user user_email_key231; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key231 UNIQUE (email);


--
-- Name: user user_email_key232; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key232 UNIQUE (email);


--
-- Name: user user_email_key233; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key233 UNIQUE (email);


--
-- Name: user user_email_key234; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key234 UNIQUE (email);


--
-- Name: user user_email_key235; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key235 UNIQUE (email);


--
-- Name: user user_email_key236; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key236 UNIQUE (email);


--
-- Name: user user_email_key237; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key237 UNIQUE (email);


--
-- Name: user user_email_key238; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key238 UNIQUE (email);


--
-- Name: user user_email_key239; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key239 UNIQUE (email);


--
-- Name: user user_email_key24; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key24 UNIQUE (email);


--
-- Name: user user_email_key240; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key240 UNIQUE (email);


--
-- Name: user user_email_key241; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key241 UNIQUE (email);


--
-- Name: user user_email_key242; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key242 UNIQUE (email);


--
-- Name: user user_email_key243; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key243 UNIQUE (email);


--
-- Name: user user_email_key244; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key244 UNIQUE (email);


--
-- Name: user user_email_key245; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key245 UNIQUE (email);


--
-- Name: user user_email_key246; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key246 UNIQUE (email);


--
-- Name: user user_email_key247; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key247 UNIQUE (email);


--
-- Name: user user_email_key248; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key248 UNIQUE (email);


--
-- Name: user user_email_key249; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key249 UNIQUE (email);


--
-- Name: user user_email_key25; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key25 UNIQUE (email);


--
-- Name: user user_email_key250; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key250 UNIQUE (email);


--
-- Name: user user_email_key251; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key251 UNIQUE (email);


--
-- Name: user user_email_key252; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key252 UNIQUE (email);


--
-- Name: user user_email_key253; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key253 UNIQUE (email);


--
-- Name: user user_email_key254; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key254 UNIQUE (email);


--
-- Name: user user_email_key255; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key255 UNIQUE (email);


--
-- Name: user user_email_key256; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key256 UNIQUE (email);


--
-- Name: user user_email_key257; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key257 UNIQUE (email);


--
-- Name: user user_email_key258; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key258 UNIQUE (email);


--
-- Name: user user_email_key259; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key259 UNIQUE (email);


--
-- Name: user user_email_key26; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key26 UNIQUE (email);


--
-- Name: user user_email_key260; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key260 UNIQUE (email);


--
-- Name: user user_email_key261; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key261 UNIQUE (email);


--
-- Name: user user_email_key262; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key262 UNIQUE (email);


--
-- Name: user user_email_key263; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key263 UNIQUE (email);


--
-- Name: user user_email_key264; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key264 UNIQUE (email);


--
-- Name: user user_email_key265; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key265 UNIQUE (email);


--
-- Name: user user_email_key266; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key266 UNIQUE (email);


--
-- Name: user user_email_key267; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key267 UNIQUE (email);


--
-- Name: user user_email_key268; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key268 UNIQUE (email);


--
-- Name: user user_email_key269; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key269 UNIQUE (email);


--
-- Name: user user_email_key27; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key27 UNIQUE (email);


--
-- Name: user user_email_key270; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key270 UNIQUE (email);


--
-- Name: user user_email_key271; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key271 UNIQUE (email);


--
-- Name: user user_email_key272; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key272 UNIQUE (email);


--
-- Name: user user_email_key273; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key273 UNIQUE (email);


--
-- Name: user user_email_key274; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key274 UNIQUE (email);


--
-- Name: user user_email_key275; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key275 UNIQUE (email);


--
-- Name: user user_email_key276; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key276 UNIQUE (email);


--
-- Name: user user_email_key277; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key277 UNIQUE (email);


--
-- Name: user user_email_key278; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key278 UNIQUE (email);


--
-- Name: user user_email_key279; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key279 UNIQUE (email);


--
-- Name: user user_email_key28; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key28 UNIQUE (email);


--
-- Name: user user_email_key280; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key280 UNIQUE (email);


--
-- Name: user user_email_key281; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key281 UNIQUE (email);


--
-- Name: user user_email_key282; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key282 UNIQUE (email);


--
-- Name: user user_email_key283; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key283 UNIQUE (email);


--
-- Name: user user_email_key284; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key284 UNIQUE (email);


--
-- Name: user user_email_key285; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key285 UNIQUE (email);


--
-- Name: user user_email_key286; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key286 UNIQUE (email);


--
-- Name: user user_email_key287; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key287 UNIQUE (email);


--
-- Name: user user_email_key288; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key288 UNIQUE (email);


--
-- Name: user user_email_key289; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key289 UNIQUE (email);


--
-- Name: user user_email_key29; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key29 UNIQUE (email);


--
-- Name: user user_email_key290; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key290 UNIQUE (email);


--
-- Name: user user_email_key291; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key291 UNIQUE (email);


--
-- Name: user user_email_key292; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key292 UNIQUE (email);


--
-- Name: user user_email_key293; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key293 UNIQUE (email);


--
-- Name: user user_email_key294; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key294 UNIQUE (email);


--
-- Name: user user_email_key295; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key295 UNIQUE (email);


--
-- Name: user user_email_key296; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key296 UNIQUE (email);


--
-- Name: user user_email_key297; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key297 UNIQUE (email);


--
-- Name: user user_email_key298; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key298 UNIQUE (email);


--
-- Name: user user_email_key299; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key299 UNIQUE (email);


--
-- Name: user user_email_key3; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key3 UNIQUE (email);


--
-- Name: user user_email_key30; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key30 UNIQUE (email);


--
-- Name: user user_email_key300; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key300 UNIQUE (email);


--
-- Name: user user_email_key301; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key301 UNIQUE (email);


--
-- Name: user user_email_key302; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key302 UNIQUE (email);


--
-- Name: user user_email_key303; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key303 UNIQUE (email);


--
-- Name: user user_email_key304; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key304 UNIQUE (email);


--
-- Name: user user_email_key305; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key305 UNIQUE (email);


--
-- Name: user user_email_key306; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key306 UNIQUE (email);


--
-- Name: user user_email_key307; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key307 UNIQUE (email);


--
-- Name: user user_email_key308; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key308 UNIQUE (email);


--
-- Name: user user_email_key309; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key309 UNIQUE (email);


--
-- Name: user user_email_key31; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key31 UNIQUE (email);


--
-- Name: user user_email_key310; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key310 UNIQUE (email);


--
-- Name: user user_email_key311; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key311 UNIQUE (email);


--
-- Name: user user_email_key312; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key312 UNIQUE (email);


--
-- Name: user user_email_key313; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key313 UNIQUE (email);


--
-- Name: user user_email_key314; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key314 UNIQUE (email);


--
-- Name: user user_email_key315; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key315 UNIQUE (email);


--
-- Name: user user_email_key316; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key316 UNIQUE (email);


--
-- Name: user user_email_key317; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key317 UNIQUE (email);


--
-- Name: user user_email_key318; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key318 UNIQUE (email);


--
-- Name: user user_email_key319; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key319 UNIQUE (email);


--
-- Name: user user_email_key32; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key32 UNIQUE (email);


--
-- Name: user user_email_key320; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key320 UNIQUE (email);


--
-- Name: user user_email_key321; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key321 UNIQUE (email);


--
-- Name: user user_email_key322; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key322 UNIQUE (email);


--
-- Name: user user_email_key323; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key323 UNIQUE (email);


--
-- Name: user user_email_key324; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key324 UNIQUE (email);


--
-- Name: user user_email_key325; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key325 UNIQUE (email);


--
-- Name: user user_email_key326; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key326 UNIQUE (email);


--
-- Name: user user_email_key327; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key327 UNIQUE (email);


--
-- Name: user user_email_key328; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key328 UNIQUE (email);


--
-- Name: user user_email_key33; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key33 UNIQUE (email);


--
-- Name: user user_email_key34; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key34 UNIQUE (email);


--
-- Name: user user_email_key35; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key35 UNIQUE (email);


--
-- Name: user user_email_key36; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key36 UNIQUE (email);


--
-- Name: user user_email_key37; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key37 UNIQUE (email);


--
-- Name: user user_email_key38; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key38 UNIQUE (email);


--
-- Name: user user_email_key39; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key39 UNIQUE (email);


--
-- Name: user user_email_key4; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key4 UNIQUE (email);


--
-- Name: user user_email_key40; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key40 UNIQUE (email);


--
-- Name: user user_email_key41; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key41 UNIQUE (email);


--
-- Name: user user_email_key42; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key42 UNIQUE (email);


--
-- Name: user user_email_key43; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key43 UNIQUE (email);


--
-- Name: user user_email_key44; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key44 UNIQUE (email);


--
-- Name: user user_email_key45; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key45 UNIQUE (email);


--
-- Name: user user_email_key46; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key46 UNIQUE (email);


--
-- Name: user user_email_key47; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key47 UNIQUE (email);


--
-- Name: user user_email_key48; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key48 UNIQUE (email);


--
-- Name: user user_email_key49; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key49 UNIQUE (email);


--
-- Name: user user_email_key5; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key5 UNIQUE (email);


--
-- Name: user user_email_key50; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key50 UNIQUE (email);


--
-- Name: user user_email_key51; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key51 UNIQUE (email);


--
-- Name: user user_email_key52; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key52 UNIQUE (email);


--
-- Name: user user_email_key53; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key53 UNIQUE (email);


--
-- Name: user user_email_key54; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key54 UNIQUE (email);


--
-- Name: user user_email_key55; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key55 UNIQUE (email);


--
-- Name: user user_email_key56; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key56 UNIQUE (email);


--
-- Name: user user_email_key57; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key57 UNIQUE (email);


--
-- Name: user user_email_key58; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key58 UNIQUE (email);


--
-- Name: user user_email_key59; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key59 UNIQUE (email);


--
-- Name: user user_email_key6; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key6 UNIQUE (email);


--
-- Name: user user_email_key60; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key60 UNIQUE (email);


--
-- Name: user user_email_key61; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key61 UNIQUE (email);


--
-- Name: user user_email_key62; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key62 UNIQUE (email);


--
-- Name: user user_email_key63; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key63 UNIQUE (email);


--
-- Name: user user_email_key64; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key64 UNIQUE (email);


--
-- Name: user user_email_key65; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key65 UNIQUE (email);


--
-- Name: user user_email_key66; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key66 UNIQUE (email);


--
-- Name: user user_email_key67; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key67 UNIQUE (email);


--
-- Name: user user_email_key68; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key68 UNIQUE (email);


--
-- Name: user user_email_key69; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key69 UNIQUE (email);


--
-- Name: user user_email_key7; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key7 UNIQUE (email);


--
-- Name: user user_email_key70; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key70 UNIQUE (email);


--
-- Name: user user_email_key71; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key71 UNIQUE (email);


--
-- Name: user user_email_key72; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key72 UNIQUE (email);


--
-- Name: user user_email_key73; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key73 UNIQUE (email);


--
-- Name: user user_email_key74; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key74 UNIQUE (email);


--
-- Name: user user_email_key75; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key75 UNIQUE (email);


--
-- Name: user user_email_key76; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key76 UNIQUE (email);


--
-- Name: user user_email_key77; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key77 UNIQUE (email);


--
-- Name: user user_email_key78; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key78 UNIQUE (email);


--
-- Name: user user_email_key79; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key79 UNIQUE (email);


--
-- Name: user user_email_key8; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key8 UNIQUE (email);


--
-- Name: user user_email_key80; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key80 UNIQUE (email);


--
-- Name: user user_email_key81; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key81 UNIQUE (email);


--
-- Name: user user_email_key82; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key82 UNIQUE (email);


--
-- Name: user user_email_key83; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key83 UNIQUE (email);


--
-- Name: user user_email_key84; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key84 UNIQUE (email);


--
-- Name: user user_email_key85; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key85 UNIQUE (email);


--
-- Name: user user_email_key86; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key86 UNIQUE (email);


--
-- Name: user user_email_key87; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key87 UNIQUE (email);


--
-- Name: user user_email_key88; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key88 UNIQUE (email);


--
-- Name: user user_email_key89; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key89 UNIQUE (email);


--
-- Name: user user_email_key9; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key9 UNIQUE (email);


--
-- Name: user user_email_key90; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key90 UNIQUE (email);


--
-- Name: user user_email_key91; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key91 UNIQUE (email);


--
-- Name: user user_email_key92; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key92 UNIQUE (email);


--
-- Name: user user_email_key93; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key93 UNIQUE (email);


--
-- Name: user user_email_key94; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key94 UNIQUE (email);


--
-- Name: user user_email_key95; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key95 UNIQUE (email);


--
-- Name: user user_email_key96; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key96 UNIQUE (email);


--
-- Name: user user_email_key97; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key97 UNIQUE (email);


--
-- Name: user user_email_key98; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key98 UNIQUE (email);


--
-- Name: user user_email_key99; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key99 UNIQUE (email);


--
-- Name: user user_phone_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key UNIQUE (phone);


--
-- Name: user user_phone_key1; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key1 UNIQUE (phone);


--
-- Name: user user_phone_key10; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key10 UNIQUE (phone);


--
-- Name: user user_phone_key100; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key100 UNIQUE (phone);


--
-- Name: user user_phone_key101; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key101 UNIQUE (phone);


--
-- Name: user user_phone_key102; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key102 UNIQUE (phone);


--
-- Name: user user_phone_key103; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key103 UNIQUE (phone);


--
-- Name: user user_phone_key104; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key104 UNIQUE (phone);


--
-- Name: user user_phone_key105; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key105 UNIQUE (phone);


--
-- Name: user user_phone_key106; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key106 UNIQUE (phone);


--
-- Name: user user_phone_key107; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key107 UNIQUE (phone);


--
-- Name: user user_phone_key108; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key108 UNIQUE (phone);


--
-- Name: user user_phone_key109; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key109 UNIQUE (phone);


--
-- Name: user user_phone_key11; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key11 UNIQUE (phone);


--
-- Name: user user_phone_key110; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key110 UNIQUE (phone);


--
-- Name: user user_phone_key111; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key111 UNIQUE (phone);


--
-- Name: user user_phone_key112; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key112 UNIQUE (phone);


--
-- Name: user user_phone_key113; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key113 UNIQUE (phone);


--
-- Name: user user_phone_key114; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key114 UNIQUE (phone);


--
-- Name: user user_phone_key115; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key115 UNIQUE (phone);


--
-- Name: user user_phone_key116; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key116 UNIQUE (phone);


--
-- Name: user user_phone_key117; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key117 UNIQUE (phone);


--
-- Name: user user_phone_key118; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key118 UNIQUE (phone);


--
-- Name: user user_phone_key119; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key119 UNIQUE (phone);


--
-- Name: user user_phone_key12; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key12 UNIQUE (phone);


--
-- Name: user user_phone_key120; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key120 UNIQUE (phone);


--
-- Name: user user_phone_key121; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key121 UNIQUE (phone);


--
-- Name: user user_phone_key122; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key122 UNIQUE (phone);


--
-- Name: user user_phone_key123; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key123 UNIQUE (phone);


--
-- Name: user user_phone_key124; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key124 UNIQUE (phone);


--
-- Name: user user_phone_key125; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key125 UNIQUE (phone);


--
-- Name: user user_phone_key126; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key126 UNIQUE (phone);


--
-- Name: user user_phone_key127; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key127 UNIQUE (phone);


--
-- Name: user user_phone_key128; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key128 UNIQUE (phone);


--
-- Name: user user_phone_key129; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key129 UNIQUE (phone);


--
-- Name: user user_phone_key13; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key13 UNIQUE (phone);


--
-- Name: user user_phone_key130; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key130 UNIQUE (phone);


--
-- Name: user user_phone_key131; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key131 UNIQUE (phone);


--
-- Name: user user_phone_key132; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key132 UNIQUE (phone);


--
-- Name: user user_phone_key133; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key133 UNIQUE (phone);


--
-- Name: user user_phone_key134; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key134 UNIQUE (phone);


--
-- Name: user user_phone_key135; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key135 UNIQUE (phone);


--
-- Name: user user_phone_key136; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key136 UNIQUE (phone);


--
-- Name: user user_phone_key137; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key137 UNIQUE (phone);


--
-- Name: user user_phone_key138; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key138 UNIQUE (phone);


--
-- Name: user user_phone_key139; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key139 UNIQUE (phone);


--
-- Name: user user_phone_key14; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key14 UNIQUE (phone);


--
-- Name: user user_phone_key140; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key140 UNIQUE (phone);


--
-- Name: user user_phone_key141; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key141 UNIQUE (phone);


--
-- Name: user user_phone_key142; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key142 UNIQUE (phone);


--
-- Name: user user_phone_key143; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key143 UNIQUE (phone);


--
-- Name: user user_phone_key144; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key144 UNIQUE (phone);


--
-- Name: user user_phone_key145; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key145 UNIQUE (phone);


--
-- Name: user user_phone_key146; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key146 UNIQUE (phone);


--
-- Name: user user_phone_key147; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key147 UNIQUE (phone);


--
-- Name: user user_phone_key148; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key148 UNIQUE (phone);


--
-- Name: user user_phone_key149; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key149 UNIQUE (phone);


--
-- Name: user user_phone_key15; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key15 UNIQUE (phone);


--
-- Name: user user_phone_key150; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key150 UNIQUE (phone);


--
-- Name: user user_phone_key151; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key151 UNIQUE (phone);


--
-- Name: user user_phone_key152; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key152 UNIQUE (phone);


--
-- Name: user user_phone_key153; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key153 UNIQUE (phone);


--
-- Name: user user_phone_key154; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key154 UNIQUE (phone);


--
-- Name: user user_phone_key155; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key155 UNIQUE (phone);


--
-- Name: user user_phone_key156; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key156 UNIQUE (phone);


--
-- Name: user user_phone_key157; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key157 UNIQUE (phone);


--
-- Name: user user_phone_key158; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key158 UNIQUE (phone);


--
-- Name: user user_phone_key159; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key159 UNIQUE (phone);


--
-- Name: user user_phone_key16; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key16 UNIQUE (phone);


--
-- Name: user user_phone_key160; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key160 UNIQUE (phone);


--
-- Name: user user_phone_key161; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key161 UNIQUE (phone);


--
-- Name: user user_phone_key162; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key162 UNIQUE (phone);


--
-- Name: user user_phone_key163; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key163 UNIQUE (phone);


--
-- Name: user user_phone_key164; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key164 UNIQUE (phone);


--
-- Name: user user_phone_key165; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key165 UNIQUE (phone);


--
-- Name: user user_phone_key166; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key166 UNIQUE (phone);


--
-- Name: user user_phone_key167; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key167 UNIQUE (phone);


--
-- Name: user user_phone_key168; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key168 UNIQUE (phone);


--
-- Name: user user_phone_key169; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key169 UNIQUE (phone);


--
-- Name: user user_phone_key17; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key17 UNIQUE (phone);


--
-- Name: user user_phone_key170; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key170 UNIQUE (phone);


--
-- Name: user user_phone_key171; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key171 UNIQUE (phone);


--
-- Name: user user_phone_key172; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key172 UNIQUE (phone);


--
-- Name: user user_phone_key173; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key173 UNIQUE (phone);


--
-- Name: user user_phone_key174; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key174 UNIQUE (phone);


--
-- Name: user user_phone_key175; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key175 UNIQUE (phone);


--
-- Name: user user_phone_key176; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key176 UNIQUE (phone);


--
-- Name: user user_phone_key177; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key177 UNIQUE (phone);


--
-- Name: user user_phone_key178; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key178 UNIQUE (phone);


--
-- Name: user user_phone_key179; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key179 UNIQUE (phone);


--
-- Name: user user_phone_key18; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key18 UNIQUE (phone);


--
-- Name: user user_phone_key180; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key180 UNIQUE (phone);


--
-- Name: user user_phone_key181; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key181 UNIQUE (phone);


--
-- Name: user user_phone_key182; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key182 UNIQUE (phone);


--
-- Name: user user_phone_key183; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key183 UNIQUE (phone);


--
-- Name: user user_phone_key184; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key184 UNIQUE (phone);


--
-- Name: user user_phone_key185; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key185 UNIQUE (phone);


--
-- Name: user user_phone_key186; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key186 UNIQUE (phone);


--
-- Name: user user_phone_key187; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key187 UNIQUE (phone);


--
-- Name: user user_phone_key188; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key188 UNIQUE (phone);


--
-- Name: user user_phone_key189; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key189 UNIQUE (phone);


--
-- Name: user user_phone_key19; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key19 UNIQUE (phone);


--
-- Name: user user_phone_key190; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key190 UNIQUE (phone);


--
-- Name: user user_phone_key191; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key191 UNIQUE (phone);


--
-- Name: user user_phone_key192; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key192 UNIQUE (phone);


--
-- Name: user user_phone_key193; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key193 UNIQUE (phone);


--
-- Name: user user_phone_key194; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key194 UNIQUE (phone);


--
-- Name: user user_phone_key195; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key195 UNIQUE (phone);


--
-- Name: user user_phone_key196; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key196 UNIQUE (phone);


--
-- Name: user user_phone_key197; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key197 UNIQUE (phone);


--
-- Name: user user_phone_key198; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key198 UNIQUE (phone);


--
-- Name: user user_phone_key199; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key199 UNIQUE (phone);


--
-- Name: user user_phone_key2; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key2 UNIQUE (phone);


--
-- Name: user user_phone_key20; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key20 UNIQUE (phone);


--
-- Name: user user_phone_key200; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key200 UNIQUE (phone);


--
-- Name: user user_phone_key201; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key201 UNIQUE (phone);


--
-- Name: user user_phone_key202; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key202 UNIQUE (phone);


--
-- Name: user user_phone_key203; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key203 UNIQUE (phone);


--
-- Name: user user_phone_key204; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key204 UNIQUE (phone);


--
-- Name: user user_phone_key205; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key205 UNIQUE (phone);


--
-- Name: user user_phone_key206; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key206 UNIQUE (phone);


--
-- Name: user user_phone_key207; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key207 UNIQUE (phone);


--
-- Name: user user_phone_key208; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key208 UNIQUE (phone);


--
-- Name: user user_phone_key209; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key209 UNIQUE (phone);


--
-- Name: user user_phone_key21; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key21 UNIQUE (phone);


--
-- Name: user user_phone_key210; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key210 UNIQUE (phone);


--
-- Name: user user_phone_key211; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key211 UNIQUE (phone);


--
-- Name: user user_phone_key212; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key212 UNIQUE (phone);


--
-- Name: user user_phone_key213; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key213 UNIQUE (phone);


--
-- Name: user user_phone_key214; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key214 UNIQUE (phone);


--
-- Name: user user_phone_key215; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key215 UNIQUE (phone);


--
-- Name: user user_phone_key216; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key216 UNIQUE (phone);


--
-- Name: user user_phone_key217; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key217 UNIQUE (phone);


--
-- Name: user user_phone_key218; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key218 UNIQUE (phone);


--
-- Name: user user_phone_key219; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key219 UNIQUE (phone);


--
-- Name: user user_phone_key22; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key22 UNIQUE (phone);


--
-- Name: user user_phone_key220; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key220 UNIQUE (phone);


--
-- Name: user user_phone_key221; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key221 UNIQUE (phone);


--
-- Name: user user_phone_key222; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key222 UNIQUE (phone);


--
-- Name: user user_phone_key223; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key223 UNIQUE (phone);


--
-- Name: user user_phone_key224; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key224 UNIQUE (phone);


--
-- Name: user user_phone_key225; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key225 UNIQUE (phone);


--
-- Name: user user_phone_key226; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key226 UNIQUE (phone);


--
-- Name: user user_phone_key227; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key227 UNIQUE (phone);


--
-- Name: user user_phone_key228; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key228 UNIQUE (phone);


--
-- Name: user user_phone_key229; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key229 UNIQUE (phone);


--
-- Name: user user_phone_key23; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key23 UNIQUE (phone);


--
-- Name: user user_phone_key230; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key230 UNIQUE (phone);


--
-- Name: user user_phone_key231; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key231 UNIQUE (phone);


--
-- Name: user user_phone_key232; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key232 UNIQUE (phone);


--
-- Name: user user_phone_key233; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key233 UNIQUE (phone);


--
-- Name: user user_phone_key234; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key234 UNIQUE (phone);


--
-- Name: user user_phone_key235; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key235 UNIQUE (phone);


--
-- Name: user user_phone_key236; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key236 UNIQUE (phone);


--
-- Name: user user_phone_key237; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key237 UNIQUE (phone);


--
-- Name: user user_phone_key238; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key238 UNIQUE (phone);


--
-- Name: user user_phone_key239; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key239 UNIQUE (phone);


--
-- Name: user user_phone_key24; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key24 UNIQUE (phone);


--
-- Name: user user_phone_key240; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key240 UNIQUE (phone);


--
-- Name: user user_phone_key241; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key241 UNIQUE (phone);


--
-- Name: user user_phone_key242; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key242 UNIQUE (phone);


--
-- Name: user user_phone_key243; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key243 UNIQUE (phone);


--
-- Name: user user_phone_key244; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key244 UNIQUE (phone);


--
-- Name: user user_phone_key245; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key245 UNIQUE (phone);


--
-- Name: user user_phone_key246; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key246 UNIQUE (phone);


--
-- Name: user user_phone_key247; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key247 UNIQUE (phone);


--
-- Name: user user_phone_key248; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key248 UNIQUE (phone);


--
-- Name: user user_phone_key249; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key249 UNIQUE (phone);


--
-- Name: user user_phone_key25; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key25 UNIQUE (phone);


--
-- Name: user user_phone_key250; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key250 UNIQUE (phone);


--
-- Name: user user_phone_key251; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key251 UNIQUE (phone);


--
-- Name: user user_phone_key252; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key252 UNIQUE (phone);


--
-- Name: user user_phone_key253; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key253 UNIQUE (phone);


--
-- Name: user user_phone_key254; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key254 UNIQUE (phone);


--
-- Name: user user_phone_key255; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key255 UNIQUE (phone);


--
-- Name: user user_phone_key256; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key256 UNIQUE (phone);


--
-- Name: user user_phone_key257; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key257 UNIQUE (phone);


--
-- Name: user user_phone_key258; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key258 UNIQUE (phone);


--
-- Name: user user_phone_key259; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key259 UNIQUE (phone);


--
-- Name: user user_phone_key26; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key26 UNIQUE (phone);


--
-- Name: user user_phone_key260; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key260 UNIQUE (phone);


--
-- Name: user user_phone_key261; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key261 UNIQUE (phone);


--
-- Name: user user_phone_key262; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key262 UNIQUE (phone);


--
-- Name: user user_phone_key263; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key263 UNIQUE (phone);


--
-- Name: user user_phone_key264; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key264 UNIQUE (phone);


--
-- Name: user user_phone_key265; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key265 UNIQUE (phone);


--
-- Name: user user_phone_key266; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key266 UNIQUE (phone);


--
-- Name: user user_phone_key267; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key267 UNIQUE (phone);


--
-- Name: user user_phone_key268; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key268 UNIQUE (phone);


--
-- Name: user user_phone_key269; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key269 UNIQUE (phone);


--
-- Name: user user_phone_key27; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key27 UNIQUE (phone);


--
-- Name: user user_phone_key270; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key270 UNIQUE (phone);


--
-- Name: user user_phone_key271; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key271 UNIQUE (phone);


--
-- Name: user user_phone_key272; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key272 UNIQUE (phone);


--
-- Name: user user_phone_key273; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key273 UNIQUE (phone);


--
-- Name: user user_phone_key274; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key274 UNIQUE (phone);


--
-- Name: user user_phone_key275; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key275 UNIQUE (phone);


--
-- Name: user user_phone_key276; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key276 UNIQUE (phone);


--
-- Name: user user_phone_key277; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key277 UNIQUE (phone);


--
-- Name: user user_phone_key278; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key278 UNIQUE (phone);


--
-- Name: user user_phone_key279; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key279 UNIQUE (phone);


--
-- Name: user user_phone_key28; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key28 UNIQUE (phone);


--
-- Name: user user_phone_key280; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key280 UNIQUE (phone);


--
-- Name: user user_phone_key281; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key281 UNIQUE (phone);


--
-- Name: user user_phone_key282; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key282 UNIQUE (phone);


--
-- Name: user user_phone_key283; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key283 UNIQUE (phone);


--
-- Name: user user_phone_key284; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key284 UNIQUE (phone);


--
-- Name: user user_phone_key285; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key285 UNIQUE (phone);


--
-- Name: user user_phone_key286; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key286 UNIQUE (phone);


--
-- Name: user user_phone_key287; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key287 UNIQUE (phone);


--
-- Name: user user_phone_key288; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key288 UNIQUE (phone);


--
-- Name: user user_phone_key289; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key289 UNIQUE (phone);


--
-- Name: user user_phone_key29; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key29 UNIQUE (phone);


--
-- Name: user user_phone_key290; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key290 UNIQUE (phone);


--
-- Name: user user_phone_key291; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key291 UNIQUE (phone);


--
-- Name: user user_phone_key292; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key292 UNIQUE (phone);


--
-- Name: user user_phone_key293; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key293 UNIQUE (phone);


--
-- Name: user user_phone_key294; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key294 UNIQUE (phone);


--
-- Name: user user_phone_key295; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key295 UNIQUE (phone);


--
-- Name: user user_phone_key296; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key296 UNIQUE (phone);


--
-- Name: user user_phone_key297; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key297 UNIQUE (phone);


--
-- Name: user user_phone_key298; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key298 UNIQUE (phone);


--
-- Name: user user_phone_key299; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key299 UNIQUE (phone);


--
-- Name: user user_phone_key3; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key3 UNIQUE (phone);


--
-- Name: user user_phone_key30; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key30 UNIQUE (phone);


--
-- Name: user user_phone_key300; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key300 UNIQUE (phone);


--
-- Name: user user_phone_key301; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key301 UNIQUE (phone);


--
-- Name: user user_phone_key302; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key302 UNIQUE (phone);


--
-- Name: user user_phone_key303; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key303 UNIQUE (phone);


--
-- Name: user user_phone_key304; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key304 UNIQUE (phone);


--
-- Name: user user_phone_key305; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key305 UNIQUE (phone);


--
-- Name: user user_phone_key306; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key306 UNIQUE (phone);


--
-- Name: user user_phone_key307; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key307 UNIQUE (phone);


--
-- Name: user user_phone_key308; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key308 UNIQUE (phone);


--
-- Name: user user_phone_key309; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key309 UNIQUE (phone);


--
-- Name: user user_phone_key31; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key31 UNIQUE (phone);


--
-- Name: user user_phone_key310; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key310 UNIQUE (phone);


--
-- Name: user user_phone_key311; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key311 UNIQUE (phone);


--
-- Name: user user_phone_key312; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key312 UNIQUE (phone);


--
-- Name: user user_phone_key313; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key313 UNIQUE (phone);


--
-- Name: user user_phone_key314; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key314 UNIQUE (phone);


--
-- Name: user user_phone_key315; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key315 UNIQUE (phone);


--
-- Name: user user_phone_key316; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key316 UNIQUE (phone);


--
-- Name: user user_phone_key317; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key317 UNIQUE (phone);


--
-- Name: user user_phone_key318; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key318 UNIQUE (phone);


--
-- Name: user user_phone_key319; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key319 UNIQUE (phone);


--
-- Name: user user_phone_key32; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key32 UNIQUE (phone);


--
-- Name: user user_phone_key320; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key320 UNIQUE (phone);


--
-- Name: user user_phone_key321; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key321 UNIQUE (phone);


--
-- Name: user user_phone_key322; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key322 UNIQUE (phone);


--
-- Name: user user_phone_key323; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key323 UNIQUE (phone);


--
-- Name: user user_phone_key324; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key324 UNIQUE (phone);


--
-- Name: user user_phone_key325; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key325 UNIQUE (phone);


--
-- Name: user user_phone_key326; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key326 UNIQUE (phone);


--
-- Name: user user_phone_key327; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key327 UNIQUE (phone);


--
-- Name: user user_phone_key328; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key328 UNIQUE (phone);


--
-- Name: user user_phone_key33; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key33 UNIQUE (phone);


--
-- Name: user user_phone_key34; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key34 UNIQUE (phone);


--
-- Name: user user_phone_key35; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key35 UNIQUE (phone);


--
-- Name: user user_phone_key36; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key36 UNIQUE (phone);


--
-- Name: user user_phone_key37; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key37 UNIQUE (phone);


--
-- Name: user user_phone_key38; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key38 UNIQUE (phone);


--
-- Name: user user_phone_key39; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key39 UNIQUE (phone);


--
-- Name: user user_phone_key4; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key4 UNIQUE (phone);


--
-- Name: user user_phone_key40; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key40 UNIQUE (phone);


--
-- Name: user user_phone_key41; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key41 UNIQUE (phone);


--
-- Name: user user_phone_key42; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key42 UNIQUE (phone);


--
-- Name: user user_phone_key43; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key43 UNIQUE (phone);


--
-- Name: user user_phone_key44; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key44 UNIQUE (phone);


--
-- Name: user user_phone_key45; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key45 UNIQUE (phone);


--
-- Name: user user_phone_key46; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key46 UNIQUE (phone);


--
-- Name: user user_phone_key47; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key47 UNIQUE (phone);


--
-- Name: user user_phone_key48; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key48 UNIQUE (phone);


--
-- Name: user user_phone_key49; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key49 UNIQUE (phone);


--
-- Name: user user_phone_key5; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key5 UNIQUE (phone);


--
-- Name: user user_phone_key50; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key50 UNIQUE (phone);


--
-- Name: user user_phone_key51; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key51 UNIQUE (phone);


--
-- Name: user user_phone_key52; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key52 UNIQUE (phone);


--
-- Name: user user_phone_key53; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key53 UNIQUE (phone);


--
-- Name: user user_phone_key54; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key54 UNIQUE (phone);


--
-- Name: user user_phone_key55; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key55 UNIQUE (phone);


--
-- Name: user user_phone_key56; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key56 UNIQUE (phone);


--
-- Name: user user_phone_key57; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key57 UNIQUE (phone);


--
-- Name: user user_phone_key58; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key58 UNIQUE (phone);


--
-- Name: user user_phone_key59; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key59 UNIQUE (phone);


--
-- Name: user user_phone_key6; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key6 UNIQUE (phone);


--
-- Name: user user_phone_key60; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key60 UNIQUE (phone);


--
-- Name: user user_phone_key61; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key61 UNIQUE (phone);


--
-- Name: user user_phone_key62; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key62 UNIQUE (phone);


--
-- Name: user user_phone_key63; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key63 UNIQUE (phone);


--
-- Name: user user_phone_key64; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key64 UNIQUE (phone);


--
-- Name: user user_phone_key65; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key65 UNIQUE (phone);


--
-- Name: user user_phone_key66; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key66 UNIQUE (phone);


--
-- Name: user user_phone_key67; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key67 UNIQUE (phone);


--
-- Name: user user_phone_key68; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key68 UNIQUE (phone);


--
-- Name: user user_phone_key69; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key69 UNIQUE (phone);


--
-- Name: user user_phone_key7; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key7 UNIQUE (phone);


--
-- Name: user user_phone_key70; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key70 UNIQUE (phone);


--
-- Name: user user_phone_key71; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key71 UNIQUE (phone);


--
-- Name: user user_phone_key72; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key72 UNIQUE (phone);


--
-- Name: user user_phone_key73; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key73 UNIQUE (phone);


--
-- Name: user user_phone_key74; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key74 UNIQUE (phone);


--
-- Name: user user_phone_key75; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key75 UNIQUE (phone);


--
-- Name: user user_phone_key76; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key76 UNIQUE (phone);


--
-- Name: user user_phone_key77; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key77 UNIQUE (phone);


--
-- Name: user user_phone_key78; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key78 UNIQUE (phone);


--
-- Name: user user_phone_key79; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key79 UNIQUE (phone);


--
-- Name: user user_phone_key8; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key8 UNIQUE (phone);


--
-- Name: user user_phone_key80; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key80 UNIQUE (phone);


--
-- Name: user user_phone_key81; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key81 UNIQUE (phone);


--
-- Name: user user_phone_key82; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key82 UNIQUE (phone);


--
-- Name: user user_phone_key83; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key83 UNIQUE (phone);


--
-- Name: user user_phone_key84; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key84 UNIQUE (phone);


--
-- Name: user user_phone_key85; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key85 UNIQUE (phone);


--
-- Name: user user_phone_key86; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key86 UNIQUE (phone);


--
-- Name: user user_phone_key87; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key87 UNIQUE (phone);


--
-- Name: user user_phone_key88; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key88 UNIQUE (phone);


--
-- Name: user user_phone_key89; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key89 UNIQUE (phone);


--
-- Name: user user_phone_key9; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key9 UNIQUE (phone);


--
-- Name: user user_phone_key90; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key90 UNIQUE (phone);


--
-- Name: user user_phone_key91; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key91 UNIQUE (phone);


--
-- Name: user user_phone_key92; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key92 UNIQUE (phone);


--
-- Name: user user_phone_key93; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key93 UNIQUE (phone);


--
-- Name: user user_phone_key94; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key94 UNIQUE (phone);


--
-- Name: user user_phone_key95; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key95 UNIQUE (phone);


--
-- Name: user user_phone_key96; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key96 UNIQUE (phone);


--
-- Name: user user_phone_key97; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key97 UNIQUE (phone);


--
-- Name: user user_phone_key98; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key98 UNIQUE (phone);


--
-- Name: user user_phone_key99; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key99 UNIQUE (phone);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (id);


--
-- Name: permissions_id; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX permissions_id ON public.permissions USING btree (id);


--
-- Name: roles_id; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX roles_id ON public.roles USING btree (id);


--
-- Name: roles_permissions_id; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX roles_permissions_id ON public.roles_permissions USING btree (id);


--
-- Name: user_id; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX user_id ON public."user" USING btree (id);


--
-- Name: user_roles_id; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX user_roles_id ON public.user_roles USING btree (id);


--
-- Name: roles_permissions roles_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles_permissions
    ADD CONSTRAINT roles_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: roles_permissions roles_permissions_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles_permissions
    ADD CONSTRAINT roles_permissions_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_roles user_roles_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_roles user_roles_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

