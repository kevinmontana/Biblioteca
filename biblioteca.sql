--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.10
-- Dumped by pg_dump version 9.6.10

-- Started on 2018-11-12 16:34:37 -04

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12393)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2230 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 185 (class 1259 OID 66925)
-- Name: administrador_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.administrador_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999
    CACHE 1;


ALTER TABLE public.administrador_id_seq OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 66927)
-- Name: categoria_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categoria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999
    CACHE 1;


ALTER TABLE public.categoria_id_seq OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 66929)
-- Name: id_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999
    CACHE 1;


ALTER TABLE public.id_id_seq OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 66931)
-- Name: libro_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.libro_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999
    CACHE 1;


ALTER TABLE public.libro_id_seq OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 66933)
-- Name: personal_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999
    CACHE 1;


ALTER TABLE public.personal_id_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 190 (class 1259 OID 66935)
-- Name: tbl_infantil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_infantil (
    id integer NOT NULL,
    str_nombre character varying(50)
);


ALTER TABLE public.tbl_infantil OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 66938)
-- Name: tbl_infantil_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbl_infantil_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tbl_infantil_id_seq OWNER TO postgres;

--
-- TOC entry 2231 (class 0 OID 0)
-- Dependencies: 191
-- Name: tbl_infantil_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbl_infantil_id_seq OWNED BY public.tbl_infantil.id;


--
-- TOC entry 192 (class 1259 OID 66940)
-- Name: tbl_infantil_libro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_infantil_libro (
    id integer NOT NULL,
    id_librofk integer,
    id_generoinfantil integer
);


ALTER TABLE public.tbl_infantil_libro OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 66943)
-- Name: tbl_infantil_libro_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbl_infantil_libro_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tbl_infantil_libro_id_seq OWNER TO postgres;

--
-- TOC entry 2232 (class 0 OID 0)
-- Dependencies: 193
-- Name: tbl_infantil_libro_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbl_infantil_libro_id_seq OWNED BY public.tbl_infantil_libro.id;


--
-- TOC entry 194 (class 1259 OID 66945)
-- Name: tbl_libro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_libro (
    id integer DEFAULT nextval('public.libro_id_seq'::regclass) NOT NULL,
    str_cota character varying(80),
    str_coha_notis character varying(80),
    str_titulo character varying(120),
    str_autor_nombre character varying(80),
    str_autor_apellido character varying(80),
    str_edicion_reimpresion character varying(50),
    str_pais_ciudad character varying(80),
    str_editorial character varying(120),
    int_n_paginas integer,
    str_isbn character varying(150),
    int_ejemplare integer,
    dtm_anho character varying(4),
    id_salafk integer,
    id_padre_deweyfk integer,
    id_hijo_deweyfk integer
);


ALTER TABLE public.tbl_libro OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 66952)
-- Name: tbl_master_dewey; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_master_dewey (
    id integer DEFAULT nextval('public.categoria_id_seq'::regclass) NOT NULL,
    str_nombre_seccion character varying(50),
    id_deweyfk integer,
    str_codigo_dewey character varying(3)
);


ALTER TABLE public.tbl_master_dewey OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 66956)
-- Name: tbl_prestamo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_prestamo (
    id integer NOT NULL,
    id_usuario_bibliotecafk integer,
    id_librofk integer,
    dtm_fecha_prestamo time with time zone,
    dtm_fecha_vencimiento time with time zone,
    id_usuario_publicofk integer,
    bln_estatus boolean
);


ALTER TABLE public.tbl_prestamo OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 66959)
-- Name: tbl_sala; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_sala (
    id integer NOT NULL,
    str_sala character varying(50)
);


ALTER TABLE public.tbl_sala OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 66962)
-- Name: tbl_sala_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbl_sala_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tbl_sala_id_seq OWNER TO postgres;

--
-- TOC entry 2233 (class 0 OID 0)
-- Dependencies: 198
-- Name: tbl_sala_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbl_sala_id_seq OWNED BY public.tbl_sala.id;


--
-- TOC entry 199 (class 1259 OID 66964)
-- Name: tbl_usuario_publico_nro_carnet_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbl_usuario_publico_nro_carnet_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999999
    CACHE 1;


ALTER TABLE public.tbl_usuario_publico_nro_carnet_seq OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 66966)
-- Name: tbl_usuario_publico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_usuario_publico (
    id integer NOT NULL,
    str_nombre character varying(50),
    str_apellido character varying(50),
    int_cedula integer,
    str_nacionalidad "char",
    str_telefono character varying(30),
    int_edad integer,
    dtm_fecha_registro time with time zone,
    str_sexo "char",
    str_direccion_personal text,
    str_profesion_oficio text,
    str_institucion_mision text,
    str_direccion_institucion_mision text,
    id_usuario_bibliotecafk integer,
    int_nro_carnet integer DEFAULT nextval('public.tbl_usuario_publico_nro_carnet_seq'::regclass)
);


ALTER TABLE public.tbl_usuario_publico OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 66973)
-- Name: tbl_usuario_publico_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbl_usuario_publico_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tbl_usuario_publico_id_seq OWNER TO postgres;

--
-- TOC entry 2234 (class 0 OID 0)
-- Dependencies: 201
-- Name: tbl_usuario_publico_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbl_usuario_publico_id_seq OWNED BY public.tbl_usuario_publico.id;


--
-- TOC entry 202 (class 1259 OID 66975)
-- Name: usuario_biblioteca_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_biblioteca_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999
    CACHE 1;


ALTER TABLE public.usuario_biblioteca_id_seq OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 66977)
-- Name: tbl_usuario_biblioteca; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_usuario_biblioteca (
    id integer DEFAULT nextval('public.usuario_biblioteca_id_seq'::regclass) NOT NULL,
    str_nombre character varying(50),
    str_apellido character varying(50),
    int_cedula integer,
    str_nacionalidad "char",
    str_nombre_usuario character varying(50),
    str_clave_usuario character varying(52),
    str_md5 character varying(255),
    str_telefono character varying(30),
    str_cargo character varying(80)
);


ALTER TABLE public.tbl_usuario_biblioteca OWNER TO postgres;

--
-- TOC entry 2056 (class 2604 OID 66984)
-- Name: tbl_infantil id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_infantil ALTER COLUMN id SET DEFAULT nextval('public.tbl_infantil_id_seq'::regclass);


--
-- TOC entry 2057 (class 2604 OID 66985)
-- Name: tbl_infantil_libro id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_infantil_libro ALTER COLUMN id SET DEFAULT nextval('public.tbl_infantil_libro_id_seq'::regclass);


--
-- TOC entry 2060 (class 2604 OID 66986)
-- Name: tbl_sala id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_sala ALTER COLUMN id SET DEFAULT nextval('public.tbl_sala_id_seq'::regclass);


--
-- TOC entry 2062 (class 2604 OID 66987)
-- Name: tbl_usuario_publico id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_usuario_publico ALTER COLUMN id SET DEFAULT nextval('public.tbl_usuario_publico_id_seq'::regclass);


--
-- TOC entry 2235 (class 0 OID 0)
-- Dependencies: 185
-- Name: administrador_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.administrador_id_seq', 1, false);


--
-- TOC entry 2236 (class 0 OID 0)
-- Dependencies: 186
-- Name: categoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categoria_id_seq', 100, true);


--
-- TOC entry 2237 (class 0 OID 0)
-- Dependencies: 187
-- Name: id_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_id_seq', 1, false);


--
-- TOC entry 2238 (class 0 OID 0)
-- Dependencies: 188
-- Name: libro_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.libro_id_seq', 42, true);


--
-- TOC entry 2239 (class 0 OID 0)
-- Dependencies: 189
-- Name: personal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_id_seq', 1, false);


--
-- TOC entry 2209 (class 0 OID 66935)
-- Dependencies: 190
-- Data for Name: tbl_infantil; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tbl_infantil (id, str_nombre) VALUES (1, 'imagenes');
INSERT INTO public.tbl_infantil (id, str_nombre) VALUES (2, 'animales');
INSERT INTO public.tbl_infantil (id, str_nombre) VALUES (3, 'aventura');
INSERT INTO public.tbl_infantil (id, str_nombre) VALUES (4, 'hadas');
INSERT INTO public.tbl_infantil (id, str_nombre) VALUES (5, 'teatro');
INSERT INTO public.tbl_infantil (id, str_nombre) VALUES (6, 'fabulas');
INSERT INTO public.tbl_infantil (id, str_nombre) VALUES (7, 'poesias');
INSERT INTO public.tbl_infantil (id, str_nombre) VALUES (8, 'venezolana');


--
-- TOC entry 2240 (class 0 OID 0)
-- Dependencies: 191
-- Name: tbl_infantil_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbl_infantil_id_seq', 8, true);


--
-- TOC entry 2211 (class 0 OID 66940)
-- Dependencies: 192
-- Data for Name: tbl_infantil_libro; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tbl_infantil_libro (id, id_librofk, id_generoinfantil) VALUES (6, 39, 1);
INSERT INTO public.tbl_infantil_libro (id, id_librofk, id_generoinfantil) VALUES (7, 40, 8);


--
-- TOC entry 2241 (class 0 OID 0)
-- Dependencies: 193
-- Name: tbl_infantil_libro_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbl_infantil_libro_id_seq', 7, true);


--
-- TOC entry 2213 (class 0 OID 66945)
-- Dependencies: 194
-- Data for Name: tbl_libro; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tbl_libro (id, str_cota, str_coha_notis, str_titulo, str_autor_nombre, str_autor_apellido, str_edicion_reimpresion, str_pais_ciudad, str_editorial, int_n_paginas, str_isbn, int_ejemplare, dtm_anho, id_salafk, id_padre_deweyfk, id_hijo_deweyfk) VALUES (40, 'asdas', 'asdasd', 'asdas', 'dasd', 'asd', 'sdas', 'asda', 'das', 1, 'ASD', 1, '2018', 3, 31, 36);
INSERT INTO public.tbl_libro (id, str_cota, str_coha_notis, str_titulo, str_autor_nombre, str_autor_apellido, str_edicion_reimpresion, str_pais_ciudad, str_editorial, int_n_paginas, str_isbn, int_ejemplare, dtm_anho, id_salafk, id_padre_deweyfk, id_hijo_deweyfk) VALUES (41, 'asdasd', 'asda', 'dasd', 'asd', 'asd', 'asdas', 'da', 'sd', 1, 'SKFJNNNEMC-2JJJAL', 1, '2018', 1, 81, 89);
INSERT INTO public.tbl_libro (id, str_cota, str_coha_notis, str_titulo, str_autor_nombre, str_autor_apellido, str_edicion_reimpresion, str_pais_ciudad, str_editorial, int_n_paginas, str_isbn, int_ejemplare, dtm_anho, id_salafk, id_padre_deweyfk, id_hijo_deweyfk) VALUES (39, '2ddfG-3', 'G-asDF2', 'Quien se llevo mi queso', 'Kevin', 'Montana', 'Primera Edición', 'Caracas', 'Tengo queso', 80, 'SKFJNNNEMC-2JJJAL', 5, '2018', 3, 31, 36);
INSERT INTO public.tbl_libro (id, str_cota, str_coha_notis, str_titulo, str_autor_nombre, str_autor_apellido, str_edicion_reimpresion, str_pais_ciudad, str_editorial, int_n_paginas, str_isbn, int_ejemplare, dtm_anho, id_salafk, id_padre_deweyfk, id_hijo_deweyfk) VALUES (38, '2ddfG-3', 'G-asDF2', 'Quien se llevo mi queso', 'Kevin', 'Montana', 'Primera Edición', 'Caracas', 'Tengo queso', 80, 'SKFJNNNEMC-2JJJAL', 5, '2018', 2, 31, 36);
INSERT INTO public.tbl_libro (id, str_cota, str_coha_notis, str_titulo, str_autor_nombre, str_autor_apellido, str_edicion_reimpresion, str_pais_ciudad, str_editorial, int_n_paginas, str_isbn, int_ejemplare, dtm_anho, id_salafk, id_padre_deweyfk, id_hijo_deweyfk) VALUES (37, '2ddfG-3', 'G-asDF2', 'Quien se llevo mi queso', 'Elvio ', 'Lado', 'Primera Edición', 'Venezuela', 'Tengo queso', 80, 'SKFJNNNEMC-2JJJAL', 5, '1998', 1, 31, 36);
INSERT INTO public.tbl_libro (id, str_cota, str_coha_notis, str_titulo, str_autor_nombre, str_autor_apellido, str_edicion_reimpresion, str_pais_ciudad, str_editorial, int_n_paginas, str_isbn, int_ejemplare, dtm_anho, id_salafk, id_padre_deweyfk, id_hijo_deweyfk) VALUES (42, 'asdas', 'akjsdhkjash', 'jkhkjashdj', 'jkhasjkdh', 'jkhasjkdh', 'kjhaskjdh', 'kjashdjkha', 'kjhaskjdh', 12, 'asdas', 123, '2018', 2, 71, 73);


--
-- TOC entry 2214 (class 0 OID 66952)
-- Dependencies: 195
-- Data for Name: tbl_master_dewey; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (1, 'Dewey', NULL, NULL);
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (2, 'Generalidades', 1, '000');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (72, 'Urbanismo & arte del paisaje', 71, '710');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (3, 'Bibliografia', 2, '010');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (73, 'Arquitectura del paisaje', 71, '720');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (74, 'Artes plásticas, Escultura', 71, '730');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (75, 'Dibujo & artes decorativas', 71, '740');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (5, 'Obras enciclopédicas generales', 2, '030');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (4, 'Bibliotecología y ciencias de la información
', 2, '020');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (6, 'Publicaciones en serie generales', 2, '050');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (7, 'Organizaciones generales & museología', 2, '060');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (8, 'Medios noticiosos, periodismo, publicación', 2, '070');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (9, 'Colecciones generales ', 2, '080');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (10, 'Manuscritos & libros raros', 2, '090');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (11, 'Filosofía & psicología', 1, '100');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (12, 'Metafísica', 11, '110');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (13, 'Epistemología, causalidad, género humano', 11, '120');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (14, 'Fenómenos paranormales ', 11, '130');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (15, 'Escuelas filosóficas específicas', 11, '140');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (16, 'Psicología', 11, '150');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (17, 'Lógica', 11, '160');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (18, 'Ética (filosofía moral)', 11, '170');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (19, 'Filosofía antigua, medieval, oriental ', 11, '180');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (20, 'Filosofía moderna occidental', 11, '190');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (21, 'Religión', 1, '200');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (22, 'Filosofía y teología de la relig', 21, '210');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (23, 'La Biblia
', 21, '220');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (24, 'Cristianismo; Teología cristiana
', 21, '230');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (25, 'Moral cristiana & teología
piadosa', 21, '240');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (26, 'Ordenes cristianas & iglesia local
', 21, '250');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (27, 'Teología social y eclesiástica', 21, '260');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (28, 'Historia del cristianismo y de la iglesia cristia', 21, '270');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (30, 'Religión comparada y otras religiones ', 21, '290');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (29, 'Confesiones & sectas cristianas
', 21, '280');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (76, 'Pintura & pinturas', 71, '750');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (32, 'Colecs. de estadística
general', 31, '310');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (77, 'Artes gráficas, Arte de grabar y grabados', 71, '760');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (33, 'Ciencia política', 31, '320');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (34, 'Economía', 31, '330');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (78, 'Fotografía & fotografías', 71, '770');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (35, 'Derecho', 31, '340');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (38, 'Educación', 31, '370');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (40, 'Costumbres, etiqueta, folclor', 31, '390');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (41, 'Lenguas', 1, '400');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (42, 'Lingüística', 41, '410');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (43, 'Inglés e inglés antiguo', 41, '420');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (44, 'Lenguas germánicas Alemán', 41, '430');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (45, 'Lenguas romances Francés', 41, '440');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (46, 'Italiano, rumano, retorromano', 41, '450');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (47, 'Lenguas española y portuguesa', 41, '460');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (48, 'Lenguas itálicas Latín', 41, '470');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (49, 'Lenguas helénicas Griego
clásico', 41, '480');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (50, 'Otras lenguas', 41, '490');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (51, 'Ciencias naturales & matemáticas', 1, '500');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (37, 'Problemas y servicios sociales; asociaciones', 31, '360');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (36, 'Administración pública y ciencia militar', 31, '350');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (39, 'Comercio, comunicaciones, transporte', 31, '380');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (52, 'Matemáticas
', 51, '510');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (53, 'Astronomía y ciencias afines', 51, '520');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (54, 'Física', 51, '530');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (55, 'Química y ciencias afines', 51, '540');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (56, 'Ciencias de la tierra', 51, '550');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (57, 'Paleontología, Paleozoología
', 51, '560');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (58, 'Ciencias de la vida. Biología', 51, '570');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (59, 'Ciencias botánicas. Plantas
', 51, '580');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (60, 'Ciencias zoológicas. Animales ', 51, '590');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (61, 'Tecnología (Ciencias aplicadas)', 1, '600');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (62, 'Ciencias médicas Medicina ', 61, '610');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (63, 'Ingeniería & operaciones afines', 61, '620');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (64, 'Agricultura y tecnologías relacionadas', 61, '630');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (65, 'Economía doméstica & vida familiar', 61, '640');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (66, 'Gerencia y servicios auxiliares', 61, '650');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (67, 'Ingeniería Química ', 61, '660');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (68, 'Manufactura', 61, '670');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (69, 'Manufactura para usos específicos', 61, '680');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (70, 'Construcción', 61, '690');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (71, 'Las artes. Bellas artes y decorativas', 1, '700');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (79, 'Música', 71, '780');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (80, 'Artes recreativas y de la actuación', 71, '790');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (31, 'Ciencias sociales ', 1, '300');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (81, 'Literatura & retórica', 1, '800');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (82, 'Literatura norteamericana en
inglés', 81, '810');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (83, 'Literatura inglesa e inglesa antigua
', 81, '820');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (84, 'Literatura de las lenguas germánicas', 81, '830');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (85, 'Literaturas de las lenguas romances', 81, '840');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (86, 'Literaturas italiana, rumana, retorromana', 81, '850');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (87, 'Literatura española & portuguesa
', 81, '860');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (88, 'Literaturas itálicas, Literatura latina', 81, '870');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (89, 'Literaturas helénicas, Literatura griega clásica', 81, '880');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (90, 'Literatura de otras lenguas', 81, '890');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (91, 'Geografía e historia', 1, '900');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (92, 'Geografía y viajes', 91, '910');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (93, 'Biografía, genealogía, insignias', 91, '920');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (94, 'Historia del mundo antiguo', 91, '930');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (95, 'Historia general de Europa', 91, '940');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (96, 'Historia general de Asia. Lejano Oriente', 91, '950');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (97, 'Historia general de África', 91, '960');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (98, 'Historia general de América del Norte', 91, '970');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (99, 'Historia general de América del Sur', 91, '980');
INSERT INTO public.tbl_master_dewey (id, str_nombre_seccion, id_deweyfk, str_codigo_dewey) VALUES (100, 'Historia general de otras áreas', 91, '990');


--
-- TOC entry 2215 (class 0 OID 66956)
-- Dependencies: 196
-- Data for Name: tbl_prestamo; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2216 (class 0 OID 66959)
-- Dependencies: 197
-- Data for Name: tbl_sala; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tbl_sala (id, str_sala) VALUES (1, 'Referencial');
INSERT INTO public.tbl_sala (id, str_sala) VALUES (2, 'General');
INSERT INTO public.tbl_sala (id, str_sala) VALUES (3, 'Infantil');


--
-- TOC entry 2242 (class 0 OID 0)
-- Dependencies: 198
-- Name: tbl_sala_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbl_sala_id_seq', 3, true);


--
-- TOC entry 2219 (class 0 OID 66966)
-- Dependencies: 200
-- Data for Name: tbl_usuario_publico; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tbl_usuario_publico (id, str_nombre, str_apellido, int_cedula, str_nacionalidad, str_telefono, int_edad, dtm_fecha_registro, str_sexo, str_direccion_personal, str_profesion_oficio, str_institucion_mision, str_direccion_institucion_mision, id_usuario_bibliotecafk, int_nro_carnet) VALUES (1, 'kevin', 'montana', 25367687, 'V', '04167590305', 21, NULL, 'M', 'hola', 'hola', 'hasd', 'asdasd', 1, 1);


--
-- TOC entry 2243 (class 0 OID 0)
-- Dependencies: 201
-- Name: tbl_usuario_publico_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbl_usuario_publico_id_seq', 1, true);


--
-- TOC entry 2244 (class 0 OID 0)
-- Dependencies: 199
-- Name: tbl_usuario_publico_nro_carnet_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbl_usuario_publico_nro_carnet_seq', 1, true);


--
-- TOC entry 2222 (class 0 OID 66977)
-- Dependencies: 203
-- Data for Name: tbl_usuario_biblioteca; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tbl_usuario_biblioteca (id, str_nombre, str_apellido, int_cedula, str_nacionalidad, str_nombre_usuario, str_clave_usuario, str_md5, str_telefono, str_cargo) VALUES (1, 'admin', 'admin', 123, 'V', 'admin', 'ee625ad30c89daa656e532c95e0bfcbc', '21232f297a57a5a743894a0e4a801fc3', NULL, NULL);


--
-- TOC entry 2245 (class 0 OID 0)
-- Dependencies: 202
-- Name: usuario_biblioteca_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_biblioteca_id_seq', 4, true);


--
-- TOC entry 2067 (class 2606 OID 66989)
-- Name: tbl_infantil_libro tbl_infantil_libro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_infantil_libro
    ADD CONSTRAINT tbl_infantil_libro_pkey PRIMARY KEY (id);


--
-- TOC entry 2065 (class 2606 OID 66991)
-- Name: tbl_infantil tbl_infantil_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_infantil
    ADD CONSTRAINT tbl_infantil_pkey PRIMARY KEY (id);


--
-- TOC entry 2069 (class 2606 OID 66993)
-- Name: tbl_libro tbl_libro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_libro
    ADD CONSTRAINT tbl_libro_pkey PRIMARY KEY (id);


--
-- TOC entry 2071 (class 2606 OID 66995)
-- Name: tbl_master_dewey tbl_master_dewey_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_master_dewey
    ADD CONSTRAINT tbl_master_dewey_pkey PRIMARY KEY (id);


--
-- TOC entry 2073 (class 2606 OID 66997)
-- Name: tbl_prestamo tbl_prestamo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_prestamo
    ADD CONSTRAINT tbl_prestamo_pkey PRIMARY KEY (id);


--
-- TOC entry 2075 (class 2606 OID 66999)
-- Name: tbl_sala tbl_sala_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_sala
    ADD CONSTRAINT tbl_sala_pkey PRIMARY KEY (id);


--
-- TOC entry 2077 (class 2606 OID 67001)
-- Name: tbl_usuario_publico tbl_usuario_publico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_usuario_publico
    ADD CONSTRAINT tbl_usuario_publico_pkey PRIMARY KEY (id);


--
-- TOC entry 2079 (class 2606 OID 67003)
-- Name: tbl_usuario_biblioteca tbl_usuario_biblioteca_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_usuario_biblioteca
    ADD CONSTRAINT tbl_usuario_biblioteca_pkey PRIMARY KEY (id);


--
-- TOC entry 2080 (class 2606 OID 67004)
-- Name: tbl_infantil_libro tbl_infantil_libro_id_generoinfantil_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_infantil_libro
    ADD CONSTRAINT tbl_infantil_libro_id_generoinfantil_fkey FOREIGN KEY (id_generoinfantil) REFERENCES public.tbl_infantil(id);


--
-- TOC entry 2081 (class 2606 OID 67009)
-- Name: tbl_infantil_libro tbl_infantil_libro_id_librofk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_infantil_libro
    ADD CONSTRAINT tbl_infantil_libro_id_librofk_fkey FOREIGN KEY (id_librofk) REFERENCES public.tbl_libro(id);


--
-- TOC entry 2082 (class 2606 OID 67014)
-- Name: tbl_libro tbl_libro_id_salafk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_libro
    ADD CONSTRAINT tbl_libro_id_salafk_fkey FOREIGN KEY (id_salafk) REFERENCES public.tbl_sala(id);


--
-- TOC entry 2083 (class 2606 OID 67019)
-- Name: tbl_prestamo tbl_prestamo_id_librofk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_prestamo
    ADD CONSTRAINT tbl_prestamo_id_librofk_fkey FOREIGN KEY (id_librofk) REFERENCES public.tbl_libro(id);


--
-- TOC entry 2084 (class 2606 OID 67024)
-- Name: tbl_prestamo tbl_prestamo_id_usuario_publicofk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_prestamo
    ADD CONSTRAINT tbl_prestamo_id_usuario_publicofk_fkey FOREIGN KEY (id_usuario_publicofk) REFERENCES public.tbl_usuario_publico(id);


--
-- TOC entry 2085 (class 2606 OID 67029)
-- Name: tbl_prestamo tbl_prestamo_id_usuario_bibliotecafk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_prestamo
    ADD CONSTRAINT tbl_prestamo_id_usuario_bibliotecafk_fkey FOREIGN KEY (id_usuario_bibliotecafk) REFERENCES public.tbl_usuario_biblioteca(id);


--
-- TOC entry 2086 (class 2606 OID 67034)
-- Name: tbl_usuario_publico tbl_usuario_publico_id_usuario_bibliotecafk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_usuario_publico
    ADD CONSTRAINT tbl_usuario_publico_id_usuario_bibliotecafk_fkey FOREIGN KEY (id_usuario_bibliotecafk) REFERENCES public.tbl_usuario_biblioteca(id);


-- Completed on 2018-11-12 16:34:37 -04

--
-- PostgreSQL database dump complete
--

