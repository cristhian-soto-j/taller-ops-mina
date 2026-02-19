--
-- PostgreSQL database dump
--

\restrict CPD3Q2m19wGc2EQKegtw3SzV7LPuCEr8tEeTJGnbhVfh14bdyFMtQZjUxbUFSR0

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE IF EXISTS ONLY public.equipment_workorder DROP CONSTRAINT IF EXISTS equipment_workorder_issue_id_5cc11a41_fk_equipment_issue_id;
ALTER TABLE IF EXISTS ONLY public.equipment_workorder DROP CONSTRAINT IF EXISTS equipment_workorder_equipment_id_057a1ab6_fk_equipment;
ALTER TABLE IF EXISTS ONLY public.equipment_workorder DROP CONSTRAINT IF EXISTS equipment_workorder_created_by_id_e6252a19_fk_auth_user_id;
ALTER TABLE IF EXISTS ONLY public.equipment_issue DROP CONSTRAINT IF EXISTS equipment_issue_reported_by_id_4615a317_fk_auth_user_id;
ALTER TABLE IF EXISTS ONLY public.equipment_issue DROP CONSTRAINT IF EXISTS equipment_issue_equipment_id_c6416379_fk_equipment_equipment_id;
ALTER TABLE IF EXISTS ONLY public.equipment_dailylog DROP CONSTRAINT IF EXISTS equipment_dailylog_equipment_id_6d6940ac_fk_equipment;
ALTER TABLE IF EXISTS ONLY public.equipment_dailylog DROP CONSTRAINT IF EXISTS equipment_dailylog_created_by_id_b330c613_fk_auth_user_id;
ALTER TABLE IF EXISTS ONLY public.django_admin_log DROP CONSTRAINT IF EXISTS django_admin_log_user_id_c564eba6_fk_auth_user_id;
ALTER TABLE IF EXISTS ONLY public.django_admin_log DROP CONSTRAINT IF EXISTS django_admin_log_content_type_id_c4bce8eb_fk_django_co;
ALTER TABLE IF EXISTS ONLY public.auth_user_user_permissions DROP CONSTRAINT IF EXISTS auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
ALTER TABLE IF EXISTS ONLY public.auth_user_user_permissions DROP CONSTRAINT IF EXISTS auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
ALTER TABLE IF EXISTS ONLY public.auth_user_groups DROP CONSTRAINT IF EXISTS auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
ALTER TABLE IF EXISTS ONLY public.auth_user_groups DROP CONSTRAINT IF EXISTS auth_user_groups_group_id_97559544_fk_auth_group_id;
ALTER TABLE IF EXISTS ONLY public.auth_permission DROP CONSTRAINT IF EXISTS auth_permission_content_type_id_2f476e4b_fk_django_co;
ALTER TABLE IF EXISTS ONLY public.auth_group_permissions DROP CONSTRAINT IF EXISTS auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
ALTER TABLE IF EXISTS ONLY public.auth_group_permissions DROP CONSTRAINT IF EXISTS auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
DROP INDEX IF EXISTS public.equipment_workorder_equipment_id_057a1ab6;
DROP INDEX IF EXISTS public.equipment_workorder_created_by_id_e6252a19;
DROP INDEX IF EXISTS public.equipment_w_type_fdbe5e_idx;
DROP INDEX IF EXISTS public.equipment_w_opened__9c89ef_idx;
DROP INDEX IF EXISTS public.equipment_w_equipme_c2cb2b_idx;
DROP INDEX IF EXISTS public.equipment_issue_reported_by_id_4615a317;
DROP INDEX IF EXISTS public.equipment_issue_equipment_id_c6416379;
DROP INDEX IF EXISTS public.equipment_i_reporte_630981_idx;
DROP INDEX IF EXISTS public.equipment_i_equipme_f2f029_idx;
DROP INDEX IF EXISTS public.equipment_equipment_code_c04df6aa_like;
DROP INDEX IF EXISTS public.equipment_e_status_fb8540_idx;
DROP INDEX IF EXISTS public.equipment_e_categor_458d69_idx;
DROP INDEX IF EXISTS public.equipment_dailylog_equipment_id_6d6940ac;
DROP INDEX IF EXISTS public.equipment_dailylog_created_by_id_b330c613;
DROP INDEX IF EXISTS public.equipment_d_equipme_c268ad_idx;
DROP INDEX IF EXISTS public.equipment_d_date_00fb76_idx;
DROP INDEX IF EXISTS public.django_session_session_key_c0390e0f_like;
DROP INDEX IF EXISTS public.django_session_expire_date_a5c62663;
DROP INDEX IF EXISTS public.django_admin_log_user_id_c564eba6;
DROP INDEX IF EXISTS public.django_admin_log_content_type_id_c4bce8eb;
DROP INDEX IF EXISTS public.auth_user_username_6821ab7c_like;
DROP INDEX IF EXISTS public.auth_user_user_permissions_user_id_a95ead1b;
DROP INDEX IF EXISTS public.auth_user_user_permissions_permission_id_1fbb5f2c;
DROP INDEX IF EXISTS public.auth_user_groups_user_id_6a12ed8b;
DROP INDEX IF EXISTS public.auth_user_groups_group_id_97559544;
DROP INDEX IF EXISTS public.auth_permission_content_type_id_2f476e4b;
DROP INDEX IF EXISTS public.auth_group_permissions_permission_id_84c5c92e;
DROP INDEX IF EXISTS public.auth_group_permissions_group_id_b120cbf9;
DROP INDEX IF EXISTS public.auth_group_name_a6ea08ec_like;
ALTER TABLE IF EXISTS ONLY public.equipment_workorder DROP CONSTRAINT IF EXISTS equipment_workorder_pkey;
ALTER TABLE IF EXISTS ONLY public.equipment_workorder DROP CONSTRAINT IF EXISTS equipment_workorder_issue_id_key;
ALTER TABLE IF EXISTS ONLY public.equipment_issue DROP CONSTRAINT IF EXISTS equipment_issue_pkey;
ALTER TABLE IF EXISTS ONLY public.equipment_equipment DROP CONSTRAINT IF EXISTS equipment_equipment_pkey;
ALTER TABLE IF EXISTS ONLY public.equipment_equipment DROP CONSTRAINT IF EXISTS equipment_equipment_code_key;
ALTER TABLE IF EXISTS ONLY public.equipment_dailylog DROP CONSTRAINT IF EXISTS equipment_dailylog_pkey;
ALTER TABLE IF EXISTS ONLY public.equipment_dailylog DROP CONSTRAINT IF EXISTS equipment_dailylog_date_equipment_id_shift_808664e3_uniq;
ALTER TABLE IF EXISTS ONLY public.django_session DROP CONSTRAINT IF EXISTS django_session_pkey;
ALTER TABLE IF EXISTS ONLY public.django_migrations DROP CONSTRAINT IF EXISTS django_migrations_pkey;
ALTER TABLE IF EXISTS ONLY public.django_content_type DROP CONSTRAINT IF EXISTS django_content_type_pkey;
ALTER TABLE IF EXISTS ONLY public.django_content_type DROP CONSTRAINT IF EXISTS django_content_type_app_label_model_76bd3d3b_uniq;
ALTER TABLE IF EXISTS ONLY public.django_admin_log DROP CONSTRAINT IF EXISTS django_admin_log_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_user DROP CONSTRAINT IF EXISTS auth_user_username_key;
ALTER TABLE IF EXISTS ONLY public.auth_user_user_permissions DROP CONSTRAINT IF EXISTS auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
ALTER TABLE IF EXISTS ONLY public.auth_user_user_permissions DROP CONSTRAINT IF EXISTS auth_user_user_permissions_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_user DROP CONSTRAINT IF EXISTS auth_user_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_user_groups DROP CONSTRAINT IF EXISTS auth_user_groups_user_id_group_id_94350c0c_uniq;
ALTER TABLE IF EXISTS ONLY public.auth_user_groups DROP CONSTRAINT IF EXISTS auth_user_groups_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_permission DROP CONSTRAINT IF EXISTS auth_permission_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_permission DROP CONSTRAINT IF EXISTS auth_permission_content_type_id_codename_01ab375a_uniq;
ALTER TABLE IF EXISTS ONLY public.auth_group DROP CONSTRAINT IF EXISTS auth_group_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_group_permissions DROP CONSTRAINT IF EXISTS auth_group_permissions_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_group_permissions DROP CONSTRAINT IF EXISTS auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
ALTER TABLE IF EXISTS ONLY public.auth_group DROP CONSTRAINT IF EXISTS auth_group_name_key;
DROP TABLE IF EXISTS public.equipment_workorder;
DROP TABLE IF EXISTS public.equipment_issue;
DROP TABLE IF EXISTS public.equipment_equipment;
DROP TABLE IF EXISTS public.equipment_dailylog;
DROP TABLE IF EXISTS public.django_session;
DROP TABLE IF EXISTS public.django_migrations;
DROP TABLE IF EXISTS public.django_content_type;
DROP TABLE IF EXISTS public.django_admin_log;
DROP TABLE IF EXISTS public.auth_user_user_permissions;
DROP TABLE IF EXISTS public.auth_user_groups;
DROP TABLE IF EXISTS public.auth_user;
DROP TABLE IF EXISTS public.auth_permission;
DROP TABLE IF EXISTS public.auth_group_permissions;
DROP TABLE IF EXISTS public.auth_group;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_user_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_user ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: equipment_dailylog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.equipment_dailylog (
    id bigint NOT NULL,
    date date NOT NULL,
    shift character varying(10) NOT NULL,
    operator_name character varying(120) NOT NULL,
    hourmeter_start double precision,
    hourmeter_end double precision,
    status character varying(30) NOT NULL,
    comment text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    created_by_id integer,
    equipment_id bigint NOT NULL
);


ALTER TABLE public.equipment_dailylog OWNER TO postgres;

--
-- Name: equipment_dailylog_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.equipment_dailylog ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.equipment_dailylog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: equipment_equipment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.equipment_equipment (
    id bigint NOT NULL,
    code character varying(50) NOT NULL,
    name character varying(120) NOT NULL,
    category character varying(30) NOT NULL,
    status character varying(30) NOT NULL,
    criticality smallint NOT NULL,
    is_active boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    CONSTRAINT equipment_equipment_criticality_check CHECK ((criticality >= 0))
);


ALTER TABLE public.equipment_equipment OWNER TO postgres;

--
-- Name: equipment_equipment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.equipment_equipment ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.equipment_equipment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: equipment_issue; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.equipment_issue (
    id bigint NOT NULL,
    reported_at timestamp with time zone NOT NULL,
    title character varying(120) NOT NULL,
    description text NOT NULL,
    severity character varying(10) NOT NULL,
    status character varying(20) NOT NULL,
    equipment_id bigint NOT NULL,
    reported_by_id integer
);


ALTER TABLE public.equipment_issue OWNER TO postgres;

--
-- Name: equipment_issue_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.equipment_issue ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.equipment_issue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: equipment_workorder; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.equipment_workorder (
    id bigint NOT NULL,
    type character varying(20) NOT NULL,
    status character varying(20) NOT NULL,
    opened_at timestamp with time zone NOT NULL,
    closed_at timestamp with time zone,
    symptom text NOT NULL,
    cause text NOT NULL,
    action_taken text NOT NULL,
    downtime_hours double precision,
    repair_hours double precision,
    created_by_id integer,
    equipment_id bigint NOT NULL,
    issue_id bigint,
    entered_shop_at timestamp with time zone,
    returned_service_at timestamp with time zone
);


ALTER TABLE public.equipment_workorder OWNER TO postgres;

--
-- Name: equipment_workorder_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.equipment_workorder ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.equipment_workorder_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add equipment	7	add_equipment
26	Can change equipment	7	change_equipment
27	Can delete equipment	7	delete_equipment
28	Can view equipment	7	view_equipment
29	Can add issue	8	add_issue
30	Can change issue	8	change_issue
31	Can delete issue	8	delete_issue
32	Can view issue	8	view_issue
33	Can add work order	9	add_workorder
34	Can change work order	9	change_workorder
35	Can delete work order	9	delete_workorder
36	Can view work order	9	view_workorder
37	Can add daily log	10	add_dailylog
38	Can change daily log	10	change_dailylog
39	Can delete daily log	10	delete_dailylog
40	Can view daily log	10	view_dailylog
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$1000000$SsSzDJ1wKqacrYt0JCidr2$Gw0G6qCiWXH8KllTehH8n814h7RU3g2db1lvq6bQi2E=	2026-02-18 12:43:16.836778-03	t	cri			cristhian.soto.j@gmail.com	t	t	2026-02-18 12:42:40.399402-03
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2026-02-18 13:17:51.80564-03	1	2026-02-17 GE-21 B	1	[{"added": {}}]	10	1
2	2026-02-18 13:18:31.423762-03	2	2026-02-17 MP-30 B	1	[{"added": {}}]	10	1
3	2026-02-18 13:56:55.5756-03	3	2026-02-17 COM-01 B	1	[{"added": {}}]	10	1
4	2026-02-18 13:57:57.123873-03	4	2026-02-17 PW-5000 A	1	[{"added": {}}]	10	1
5	2026-02-18 13:58:26.013514-03	5	2026-02-17 N-30 B	1	[{"added": {}}]	10	1
6	2026-02-18 13:59:11.827265-03	6	2026-02-17 CM-185 B	1	[{"added": {}}]	10	1
7	2026-02-18 14:00:00.939717-03	7	2026-02-17 CA_231 B	1	[{"added": {}}]	10	1
8	2026-02-18 14:00:35.63995-03	8	2026-02-17 CA_246 B	1	[{"added": {}}]	10	1
9	2026-02-18 14:01:08.303797-03	15	Cargador Frontal Jingong (CF-906)	1	[{"added": {}}]	7	1
10	2026-02-18 14:01:48.685114-03	9	2026-02-17 CF-906 B	1	[{"added": {}}]	10	1
11	2026-02-18 14:10:38.351112-03	10	2026-02-17 CA_208 B	1	[{"added": {}}]	10	1
12	2026-02-18 14:11:18.183134-03	11	2026-02-17 CF-44 B	1	[{"added": {}}]	10	1
13	2026-02-18 14:41:48.720618-03	1	OT #1 CF-44 (EN_PROCESO)	1	[{"added": {}}]	9	1
14	2026-02-18 16:53:14.595942-03	4	2026-02-17 PW-5000 B	2	[{"changed": {"fields": ["Shift"]}}]	10	1
15	2026-02-18 17:09:10.495601-03	2	OT #2 MA-03 (ABIERTA)	1	[{"added": {}}]	9	1
16	2026-02-18 17:13:09.44146-03	11	2026-02-17 CF-44 B	2	[{"changed": {"fields": ["Status"]}}]	10	1
17	2026-02-18 17:18:34.282476-03	3	OT #3 GE-21 (PLANIFICADA)	1	[{"added": {}}]	9	1
18	2026-02-18 17:19:34.649391-03	3	OT #3 GE-21 (PLANIFICADA)	3		9	1
19	2026-02-18 17:19:49.905619-03	2	OT #2 MA-03 (EN_PROCESO)	2	[{"changed": {"fields": ["Status"]}}]	9	1
20	2026-02-19 09:16:02.83483-03	12	2026-02-18 GE-21 A	1	[{"added": {}}]	10	1
21	2026-02-19 09:16:11.91446-03	12	2026-02-18 GE-21 A	2	[{"changed": {"fields": ["Created by"]}}]	10	1
22	2026-02-19 09:16:38.716068-03	13	2026-02-18 MP-30 A	1	[{"added": {}}]	10	1
23	2026-02-19 09:17:07.08593-03	14	2026-02-18 COM-01 A	1	[{"added": {}}]	10	1
24	2026-02-19 09:17:45.755478-03	15	2026-02-18 PW-5000 A	1	[{"added": {}}]	10	1
25	2026-02-19 09:18:11.983089-03	16	2026-02-18 N-30 A	1	[{"added": {}}]	10	1
26	2026-02-19 09:19:01.056775-03	17	2026-02-18 CM-185 A	1	[{"added": {}}]	10	1
27	2026-02-19 09:19:45.610492-03	18	2026-02-18 CA_231 A	1	[{"added": {}}]	10	1
28	2026-02-19 09:20:22.392333-03	19	2026-02-18 CA_246 A	1	[{"added": {}}]	10	1
29	2026-02-19 09:35:05.099954-03	20	2026-02-18 CF-906 A	1	[{"added": {}}]	10	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	equipment	equipment
8	equipment	issue
9	equipment	workorder
10	equipment	dailylog
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2026-02-18 12:29:05.787194-03
2	auth	0001_initial	2026-02-18 12:29:05.845841-03
3	admin	0001_initial	2026-02-18 12:29:05.863565-03
4	admin	0002_logentry_remove_auto_add	2026-02-18 12:29:05.877624-03
5	admin	0003_logentry_add_action_flag_choices	2026-02-18 12:29:05.877624-03
6	contenttypes	0002_remove_content_type_name	2026-02-18 12:29:05.893364-03
7	auth	0002_alter_permission_name_max_length	2026-02-18 12:29:05.893364-03
8	auth	0003_alter_user_email_max_length	2026-02-18 12:29:05.909264-03
9	auth	0004_alter_user_username_opts	2026-02-18 12:29:05.913862-03
10	auth	0005_alter_user_last_login_null	2026-02-18 12:29:05.913862-03
11	auth	0006_require_contenttypes_0002	2026-02-18 12:29:05.913862-03
12	auth	0007_alter_validators_add_error_messages	2026-02-18 12:29:05.925038-03
13	auth	0008_alter_user_username_max_length	2026-02-18 12:29:05.925038-03
14	auth	0009_alter_user_last_name_max_length	2026-02-18 12:29:05.93547-03
15	auth	0010_alter_group_name_max_length	2026-02-18 12:29:05.941174-03
16	auth	0011_update_proxy_permissions	2026-02-18 12:29:05.941174-03
17	auth	0012_alter_user_first_name_max_length	2026-02-18 12:29:05.956931-03
18	equipment	0001_initial	2026-02-18 12:29:06.052301-03
19	sessions	0001_initial	2026-02-18 12:29:06.063776-03
20	equipment	0002_workorder_entered_shop_at_and_more	2026-02-18 14:27:13.871654-03
21	equipment	0003_workorder_equipment_w_type_fdbe5e_idx	2026-02-18 14:31:40.334147-03
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
duagq0myvhuqaki1lwkesm6nf54mn4qw	.eJxVjEEOwiAQRe_C2pAZChRcuvcMZCiDVA0kpV0Z765NutDtf-_9lwi0rSVsnZcwJ3EWKE6_W6TpwXUH6U711uTU6rrMUe6KPGiX15b4eTncv4NCvXxrb0ejjBmZGXNykLUZFGhg9IMmjzYrFTVZp2P27B0CGxt9mgDBOiTx_gC9HTbq:1vsjhs:yFnEcgPIQsXzXO2HXMlMVxpPJoNgnjIqBZOHXe0PxY0	2026-03-04 12:43:16.836778-03
\.


--
-- Data for Name: equipment_dailylog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.equipment_dailylog (id, date, shift, operator_name, hourmeter_start, hourmeter_end, status, comment, created_at, created_by_id, equipment_id) FROM stdin;
1	2026-02-17	B	Rafael Figueroa	1535	1535	OPERATIVO	Sin postura	2026-02-18 13:17:51.802646-03	1	1
2	2026-02-17	B	Pablo Valdivia	4181	4181	OPERATIVO	Sin postura	2026-02-18 13:18:31.413549-03	1	3
3	2026-02-17	B	Rafael Figueroa	6122	6122	OPERATIVO	Sin postura	2026-02-18 13:56:55.5756-03	1	4
5	2026-02-17	B	Rafael Figueroa	2790	2790	OPERATIVO	sin postura	2026-02-18 13:58:26.013514-03	1	6
6	2026-02-17	B	Ivan Marin	2004	2006	OPERATIVO	Realiza 4 viajes de mineral	2026-02-18 13:59:11.826265-03	1	8
7	2026-02-17	B	Rafael Figueroa	80715	80761	OPERATIVO		2026-02-18 14:00:00.938715-03	1	12
8	2026-02-17	B	David Tello	75668	75761	OPERATIVO		2026-02-18 14:00:35.63995-03	1	13
9	2026-02-17	B	Huga Vegas	135	138	OPERATIVO	Carga 4 camionadas de mineral	2026-02-18 14:01:48.684113-03	1	15
10	2026-02-17	B	Luis Dias	0	0	OPERATIVO	Velocimetro y Odometro malo	2026-02-18 14:10:38.351112-03	1	11
4	2026-02-17	B	Cesar Nettle	0	0	OPERATIVO	Horometro malo, sin postura	2026-02-18 13:57:57.113914-03	1	5
11	2026-02-17	B	Huga Vegas	0	0	OPERATIVO	Fuera de servicio	2026-02-18 14:11:18.182139-03	1	7
12	2026-02-18	A	Rodrigo Perez	1535	1539	OPERATIVO		2026-02-19 09:16:02.831813-03	1	1
13	2026-02-18	A	Aldo Cortes	4181	4182	OPERATIVO		2026-02-19 09:16:38.715071-03	1	3
14	2026-02-18	A	Rodrigo Perez	6122	6123	OPERATIVO		2026-02-19 09:17:07.084423-03	1	4
15	2026-02-18	A	Luis Jofre	0	0	OPERATIVO	Realiza 1 pozo, total 10.5 metrod	2026-02-19 09:17:45.75449-03	1	5
16	2026-02-18	A	Rodrigo Perez	2790	2790	OPERATIVO	Sin postura	2026-02-19 09:18:11.983089-03	1	6
17	2026-02-18	A	Javier Neira	2006	2009	OPERATIVO	Realiza 6 viajes de esteril desde el by-pass	2026-02-19 09:19:01.055764-03	1	8
18	2026-02-18	A	Aldo Cortes	80751	80774	OPERATIVO		2026-02-19 09:19:45.610492-03	1	12
19	2026-02-18	A	David Tello	75761	75852	OPERATIVO		2026-02-19 09:20:22.392333-03	1	13
20	2026-02-18	A	Hugo Arostica	138	143	OPERATIVO		2026-02-19 09:35:05.098319-03	1	15
\.


--
-- Data for Name: equipment_equipment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.equipment_equipment (id, code, name, category, status, criticality, is_active, created_at, updated_at) FROM stdin;
1	GE-21	Generador Pramac 500	GENERATOR	OPERATIVO	3	t	2026-02-18 12:56:06.680173-03	2026-02-18 12:56:06.680173-03
2	MP-27	Jumbo Cannon	JUMBO	OPERATIVO	3	t	2026-02-18 12:56:06.692247-03	2026-02-18 12:56:06.692247-03
3	MP-30	Jumbo Sandvik DD-321	JUMBO	OPERATIVO	3	t	2026-02-18 12:56:06.696911-03	2026-02-18 12:56:06.696911-03
4	COM-01	Compresor Atlas 800 CFM	COMPRESSOR	OPERATIVO	3	t	2026-02-18 12:56:06.696911-03	2026-02-18 12:56:06.696911-03
5	PW-5000	Track drill - PW-5000	DRILL	OPERATIVO	3	t	2026-02-18 12:56:06.696911-03	2026-02-18 12:56:06.696911-03
6	N-30	Compresor Doosan	COMPRESSOR	OPERATIVO	3	t	2026-02-18 12:56:06.696911-03	2026-02-18 12:56:06.696911-03
7	CF-44	Cargador Frontal	LOADER	OPERATIVO	3	t	2026-02-18 12:56:06.696911-03	2026-02-18 12:56:06.696911-03
8	CM-185	Camion Extraccion	TRUCK	OPERATIVO	3	t	2026-02-18 12:56:06.696911-03	2026-02-18 12:56:06.696911-03
9	SP-04	Scoop	SCOOP	OPERATIVO	3	t	2026-02-18 12:56:06.696911-03	2026-02-18 12:56:06.696911-03
10	MA-03	O. Telescopico 	TELEHANDLER	OPERATIVO	3	t	2026-02-18 12:56:06.696911-03	2026-02-18 12:56:06.696911-03
11	CA_208	Camioneta Hilux	PICKUP	OPERATIVO	3	t	2026-02-18 12:56:06.696911-03	2026-02-18 12:56:06.696911-03
12	CA_231	Camioneta Hilux	PICKUP	OPERATIVO	3	t	2026-02-18 12:56:06.696911-03	2026-02-18 12:56:06.696911-03
13	CA_246	Camioneta Hilux	PICKUP	OPERATIVO	3	t	2026-02-18 12:56:06.711899-03	2026-02-18 12:56:06.711899-03
14	CA_224	Camioneta Hilux	PICKUP	OPERATIVO	3	t	2026-02-18 12:56:06.713909-03	2026-02-18 12:56:06.713909-03
15	CF-906	Cargador Frontal Jingong	LOADER	OPERATIVO	3	t	2026-02-18 14:01:08.302796-03	2026-02-18 14:01:08.302796-03
\.


--
-- Data for Name: equipment_issue; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.equipment_issue (id, reported_at, title, description, severity, status, equipment_id, reported_by_id) FROM stdin;
\.


--
-- Data for Name: equipment_workorder; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.equipment_workorder (id, type, status, opened_at, closed_at, symptom, cause, action_taken, downtime_hours, repair_hours, created_by_id, equipment_id, issue_id, entered_shop_at, returned_service_at) FROM stdin;
1	CORRECTIVA	EN_PROCESO	2026-02-17 14:40:44-03	\N	fuga aceite	manguera	cambio de manguera	\N	\N	\N	7	\N	2026-02-17 07:00:00-03	\N
2	CORRECTIVA	EN_PROCESO	2026-01-19 06:00:00-03	\N	Asiento malo, problemas de temperatura, mica trasera quebrada, brazo telescopico lento			\N	\N	1	10	\N	2026-01-19 06:00:00-03	\N
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 40, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 29, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 10, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 21, true);


--
-- Name: equipment_dailylog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.equipment_dailylog_id_seq', 20, true);


--
-- Name: equipment_equipment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.equipment_equipment_id_seq', 15, true);


--
-- Name: equipment_issue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.equipment_issue_id_seq', 1, false);


--
-- Name: equipment_workorder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.equipment_workorder_id_seq', 3, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: equipment_dailylog equipment_dailylog_date_equipment_id_shift_808664e3_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipment_dailylog
    ADD CONSTRAINT equipment_dailylog_date_equipment_id_shift_808664e3_uniq UNIQUE (date, equipment_id, shift);


--
-- Name: equipment_dailylog equipment_dailylog_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipment_dailylog
    ADD CONSTRAINT equipment_dailylog_pkey PRIMARY KEY (id);


--
-- Name: equipment_equipment equipment_equipment_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipment_equipment
    ADD CONSTRAINT equipment_equipment_code_key UNIQUE (code);


--
-- Name: equipment_equipment equipment_equipment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipment_equipment
    ADD CONSTRAINT equipment_equipment_pkey PRIMARY KEY (id);


--
-- Name: equipment_issue equipment_issue_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipment_issue
    ADD CONSTRAINT equipment_issue_pkey PRIMARY KEY (id);


--
-- Name: equipment_workorder equipment_workorder_issue_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipment_workorder
    ADD CONSTRAINT equipment_workorder_issue_id_key UNIQUE (issue_id);


--
-- Name: equipment_workorder equipment_workorder_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipment_workorder
    ADD CONSTRAINT equipment_workorder_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: equipment_d_date_00fb76_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX equipment_d_date_00fb76_idx ON public.equipment_dailylog USING btree (date, shift);


--
-- Name: equipment_d_equipme_c268ad_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX equipment_d_equipme_c268ad_idx ON public.equipment_dailylog USING btree (equipment_id, date);


--
-- Name: equipment_dailylog_created_by_id_b330c613; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX equipment_dailylog_created_by_id_b330c613 ON public.equipment_dailylog USING btree (created_by_id);


--
-- Name: equipment_dailylog_equipment_id_6d6940ac; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX equipment_dailylog_equipment_id_6d6940ac ON public.equipment_dailylog USING btree (equipment_id);


--
-- Name: equipment_e_categor_458d69_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX equipment_e_categor_458d69_idx ON public.equipment_equipment USING btree (category, is_active);


--
-- Name: equipment_e_status_fb8540_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX equipment_e_status_fb8540_idx ON public.equipment_equipment USING btree (status);


--
-- Name: equipment_equipment_code_c04df6aa_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX equipment_equipment_code_c04df6aa_like ON public.equipment_equipment USING btree (code varchar_pattern_ops);


--
-- Name: equipment_i_equipme_f2f029_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX equipment_i_equipme_f2f029_idx ON public.equipment_issue USING btree (equipment_id, status);


--
-- Name: equipment_i_reporte_630981_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX equipment_i_reporte_630981_idx ON public.equipment_issue USING btree (reported_at);


--
-- Name: equipment_issue_equipment_id_c6416379; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX equipment_issue_equipment_id_c6416379 ON public.equipment_issue USING btree (equipment_id);


--
-- Name: equipment_issue_reported_by_id_4615a317; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX equipment_issue_reported_by_id_4615a317 ON public.equipment_issue USING btree (reported_by_id);


--
-- Name: equipment_w_equipme_c2cb2b_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX equipment_w_equipme_c2cb2b_idx ON public.equipment_workorder USING btree (equipment_id, status);


--
-- Name: equipment_w_opened__9c89ef_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX equipment_w_opened__9c89ef_idx ON public.equipment_workorder USING btree (opened_at);


--
-- Name: equipment_w_type_fdbe5e_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX equipment_w_type_fdbe5e_idx ON public.equipment_workorder USING btree (type, status);


--
-- Name: equipment_workorder_created_by_id_e6252a19; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX equipment_workorder_created_by_id_e6252a19 ON public.equipment_workorder USING btree (created_by_id);


--
-- Name: equipment_workorder_equipment_id_057a1ab6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX equipment_workorder_equipment_id_057a1ab6 ON public.equipment_workorder USING btree (equipment_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: equipment_dailylog equipment_dailylog_created_by_id_b330c613_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipment_dailylog
    ADD CONSTRAINT equipment_dailylog_created_by_id_b330c613_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: equipment_dailylog equipment_dailylog_equipment_id_6d6940ac_fk_equipment; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipment_dailylog
    ADD CONSTRAINT equipment_dailylog_equipment_id_6d6940ac_fk_equipment FOREIGN KEY (equipment_id) REFERENCES public.equipment_equipment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: equipment_issue equipment_issue_equipment_id_c6416379_fk_equipment_equipment_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipment_issue
    ADD CONSTRAINT equipment_issue_equipment_id_c6416379_fk_equipment_equipment_id FOREIGN KEY (equipment_id) REFERENCES public.equipment_equipment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: equipment_issue equipment_issue_reported_by_id_4615a317_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipment_issue
    ADD CONSTRAINT equipment_issue_reported_by_id_4615a317_fk_auth_user_id FOREIGN KEY (reported_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: equipment_workorder equipment_workorder_created_by_id_e6252a19_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipment_workorder
    ADD CONSTRAINT equipment_workorder_created_by_id_e6252a19_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: equipment_workorder equipment_workorder_equipment_id_057a1ab6_fk_equipment; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipment_workorder
    ADD CONSTRAINT equipment_workorder_equipment_id_057a1ab6_fk_equipment FOREIGN KEY (equipment_id) REFERENCES public.equipment_equipment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: equipment_workorder equipment_workorder_issue_id_5cc11a41_fk_equipment_issue_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipment_workorder
    ADD CONSTRAINT equipment_workorder_issue_id_5cc11a41_fk_equipment_issue_id FOREIGN KEY (issue_id) REFERENCES public.equipment_issue(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

\unrestrict CPD3Q2m19wGc2EQKegtw3SzV7LPuCEr8tEeTJGnbhVfh14bdyFMtQZjUxbUFSR0

