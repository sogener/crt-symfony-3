--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE dbname;




--
-- Drop roles
--

DROP ROLE "user";


--
-- Roles
--

CREATE ROLE "user";
ALTER ROLE "user" WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md5ad42c83ac4d3b86de14f207c46a0df0e';






--
-- PostgreSQL database dump
--

-- Dumped from database version 11.14
-- Dumped by pg_dump version 11.14

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: user
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO "user";

\connect template1

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
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: user
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: user
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: user
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 11.14
-- Dumped by pg_dump version 11.14

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
-- Name: dbname; Type: DATABASE; Schema: -; Owner: user
--

CREATE DATABASE dbname WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE dbname OWNER TO "user";

\connect dbname

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

SET default_with_oids = false;

--
-- Name: admin; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.admin (
    id integer NOT NULL,
    username character varying(180) NOT NULL,
    roles json NOT NULL,
    password character varying(255) NOT NULL
);


ALTER TABLE public.admin OWNER TO "user";

--
-- Name: admin_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.admin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_id_seq OWNER TO "user";

--
-- Name: article; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.article (
    id integer NOT NULL,
    news_id integer,
    title character varying(255) NOT NULL,
    text character varying(255) NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    image character varying(255) NOT NULL
);


ALTER TABLE public.article OWNER TO "user";

--
-- Name: article_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.article_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.article_id_seq OWNER TO "user";

--
-- Name: comments; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.comments (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    text character varying(255) NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    article_id integer
);


ALTER TABLE public.comments OWNER TO "user";

--
-- Name: COLUMN comments.created_at; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.comments.created_at IS '(DC2Type:datetime_immutable)';


--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO "user";

--
-- Name: doctrine_migration_versions; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.doctrine_migration_versions (
    version character varying(191) NOT NULL,
    executed_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    execution_time integer
);


ALTER TABLE public.doctrine_migration_versions OWNER TO "user";

--
-- Name: news; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.news (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    is_show boolean NOT NULL,
    description character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.news OWNER TO "user";

--
-- Name: news_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.news_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.news_id_seq OWNER TO "user";

--
-- Name: user; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    second_name character varying(255) NOT NULL
);


ALTER TABLE public."user" OWNER TO "user";

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO "user";

--
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.admin (id, username, roles, password) FROM stdin;
12	admin	["ROLE_ADMIN"]	$2y$13$tYDhykXUcYfAGafn0mNuQuWEE7JvGAibiBdP30R/iHM0SixdDy4C.
\.


--
-- Data for Name: article; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.article (id, news_id, title, text, created_at, updated_at, image) FROM stdin;
9	2	Вторая статья	<div>Но</div>	2021-12-10 00:00:00	2021-12-10 10:20:57	unknown.png
10	2	Вторая статья	<div>ddd</div>	2021-12-10 00:00:00	2021-12-10 10:41:32	unnamed.jpg
11	3	бомба?	<div>да?</div>	2021-12-10 00:00:00	2021-12-10 11:12:07	Screenshot from 2021-12-01 15-57-03.png
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.comments (id, title, text, created_at, article_id) FROM stdin;
\.


--
-- Data for Name: doctrine_migration_versions; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.doctrine_migration_versions (version, executed_at, execution_time) FROM stdin;
DoctrineMigrations\\Version20211207124830	2021-12-07 12:49:16	80
DoctrineMigrations\\Version20211207125251	2021-12-07 12:53:00	51
DoctrineMigrations\\Version20211209142608	2021-12-09 14:26:33	66
DoctrineMigrations\\Version20211209143523	2021-12-09 14:35:38	66
DoctrineMigrations\\Version20211209143714	2021-12-09 14:37:25	53
DoctrineMigrations\\Version20211209163154	2021-12-09 16:32:35	19
DoctrineMigrations\\Version20211209163843	2021-12-09 16:46:06	46
DoctrineMigrations\\Version20211209164105	2021-12-09 16:46:33	46
DoctrineMigrations\\Version20211209164804	2021-12-09 16:48:16	35
DoctrineMigrations\\Version20211209165639	2021-12-09 16:57:21	17
DoctrineMigrations\\Version20211209165949	2021-12-09 16:59:52	45
DoctrineMigrations\\Version20211209170021	2021-12-09 17:00:27	41
DoctrineMigrations\\Version20211209170231	2021-12-09 17:04:44	51
DoctrineMigrations\\Version20211209170300	2021-12-09 17:13:17	50
DoctrineMigrations\\Version20211209170903	2021-12-09 17:13:17	3
DoctrineMigrations\\Version20211209163716	2021-12-10 06:27:17	42
DoctrineMigrations\\Version20211210062604	2021-12-10 06:27:17	28
DoctrineMigrations\\Version20211210080838	2021-12-10 08:08:51	52
DoctrineMigrations\\Version20211210080916	2021-12-10 08:09:22	55
DoctrineMigrations\\Version20211210082213	2021-12-10 08:22:30	73
DoctrineMigrations\\Version20211210082428	2021-12-10 08:24:33	56
DoctrineMigrations\\Version20211210082542	2021-12-10 08:25:59	42
DoctrineMigrations\\Version20211210082552	2021-12-10 08:25:59	0
DoctrineMigrations\\Version20211210082555	2021-12-10 08:25:59	0
DoctrineMigrations\\Version20211210085521	2021-12-10 08:55:27	35
DoctrineMigrations\\Version20211210093350	2021-12-10 09:35:10	49
DoctrineMigrations\\Version20211210093848	2021-12-10 09:38:52	47
DoctrineMigrations\\Version20211210100019	2021-12-10 10:00:46	48
DoctrineMigrations\\Version20211210101746	2021-12-10 10:17:50	26
\.


--
-- Data for Name: news; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.news (id, title, is_show, description) FROM stdin;
1	первая	t	пер запись
2	вторая	t	2
3	третья	t	3
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."user" (id, name, second_name) FROM stdin;
\.


--
-- Name: admin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.admin_id_seq', 12, true);


--
-- Name: article_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.article_id_seq', 11, true);


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.comments_id_seq', 32, true);


--
-- Name: news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.news_id_seq', 3, true);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.user_id_seq', 4, true);


--
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (id);


--
-- Name: article article_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.article
    ADD CONSTRAINT article_pkey PRIMARY KEY (id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: doctrine_migration_versions doctrine_migration_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.doctrine_migration_versions
    ADD CONSTRAINT doctrine_migration_versions_pkey PRIMARY KEY (version);


--
-- Name: news news_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: idx_23a0e66b5a459a0; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX idx_23a0e66b5a459a0 ON public.article USING btree (news_id);


--
-- Name: idx_5f9e962a7294869c; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX idx_5f9e962a7294869c ON public.comments USING btree (article_id);


--
-- Name: uniq_880e0d76f85e0677; Type: INDEX; Schema: public; Owner: user
--

CREATE UNIQUE INDEX uniq_880e0d76f85e0677 ON public.admin USING btree (username);


--
-- Name: article fk_23a0e66b5a459a0; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.article
    ADD CONSTRAINT fk_23a0e66b5a459a0 FOREIGN KEY (news_id) REFERENCES public.news(id);


--
-- Name: comments fk_5f9e962a7294869c; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_5f9e962a7294869c FOREIGN KEY (article_id) REFERENCES public.article(id);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 11.14
-- Dumped by pg_dump version 11.14

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: user
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO "user";

\connect postgres

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
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: user
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

