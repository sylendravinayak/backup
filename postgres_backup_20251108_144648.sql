--
-- PostgreSQL database dump
--

\restrict OpJX2vmEt8yockC7Ur2wgZfjePDLDhx5OvdEfeX8k7BOhOz2EWReC1yaVDvmDX5

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

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

DROP INDEX IF EXISTS public.ix_bookings_user_id;
DROP INDEX IF EXISTS public.ix_bookings_show_id;
DROP INDEX IF EXISTS public.ix_bookings_payment_id;
DROP INDEX IF EXISTS public.ix_bookings_discount_id;
DROP INDEX IF EXISTS public.ix_bookings_booking_reference;
DROP INDEX IF EXISTS public.ix_bookings_booking_id;
ALTER TABLE IF EXISTS ONLY public.bookings DROP CONSTRAINT IF EXISTS bookings_pkey;
ALTER TABLE IF EXISTS public.bookings ALTER COLUMN booking_id DROP DEFAULT;
DROP SEQUENCE IF EXISTS public.bookings_booking_id_seq;
DROP TABLE IF EXISTS public.bookings;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: bookings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bookings (
    booking_id integer NOT NULL,
    user_id integer NOT NULL,
    show_id integer NOT NULL,
    booking_date timestamp with time zone DEFAULT now() NOT NULL,
    booking_reference character varying(20) NOT NULL,
    booking_status public.booking_status_enum DEFAULT 'PENDING'::public.booking_status_enum NOT NULL,
    payment_id integer,
    discount_id integer,
    booking_time timestamp with time zone NOT NULL,
    amount integer
);


ALTER TABLE public.bookings OWNER TO postgres;

--
-- Name: bookings_booking_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bookings_booking_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bookings_booking_id_seq OWNER TO postgres;

--
-- Name: bookings_booking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bookings_booking_id_seq OWNED BY public.bookings.booking_id;


--
-- Name: bookings booking_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings ALTER COLUMN booking_id SET DEFAULT nextval('public.bookings_booking_id_seq'::regclass);


--
-- Data for Name: bookings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bookings (booking_id, user_id, show_id, booking_date, booking_reference, booking_status, payment_id, discount_id, booking_time, amount) FROM stdin;
48	1	22	2025-11-03 20:43:06.76044+05:30	BKNG-69037D5B	CANCELLED	12	2	2025-11-03 19:19:08.431+05:30	2294
50	1	23	2025-11-03 20:54:54.178807+05:30	BKNG-B19171C9	CANCELLED	13	2	2025-11-03 19:19:08.431+05:30	2294
14	1	1	2025-10-29 12:37:10.186329+05:30	BKNG-E3E985BC	PENDING	0	2	2025-10-29 11:22:09.832+05:30	475
15	1	1	2025-10-29 12:52:11.429377+05:30	BKNG-AE89AD42	PENDING	0	2	2025-10-29 11:22:09.832+05:30	527
16	1	1	2025-10-29 12:53:25.287824+05:30	BKNG-8763CA2D	PENDING	0	2	2025-10-29 11:22:09.832+05:30	527
17	1	1	2025-10-29 12:53:40.492283+05:30	BKNG-58DE7F84	PENDING	0	2	2025-10-29 11:22:09.832+05:30	527
18	1	1	2025-10-29 12:53:47.424883+05:30	BKNG-6BAF445F	PENDING	0	2	2025-10-29 11:22:09.832+05:30	527
19	1	1	2025-10-29 12:56:40.271618+05:30	BKNG-B1378B0D	PENDING	0	2	2025-10-29 11:22:09.832+05:30	527
57	1	30	2025-11-05 20:06:47.97232+05:30	BKNG-F8E3894D	CONFIRMED	17	1	2025-11-05 19:58:44.252+05:30	898
59	1	27	2025-11-05 20:11:03.505506+05:30	BKNG-C3C9B518	CONFIRMED	18	1	2025-11-05 14:41:03.503864+05:30	898
63	4	1	2025-11-08 19:07:26.289771+05:30	BKNG-EB24E83E	CANCELLED	19	2	2025-11-08 13:37:26.287377+05:30	808
64	4	1	2025-11-08 19:22:42.492689+05:30	BKNG-B49391E5	CONFIRMED	20	2	2025-11-08 13:52:42.489897+05:30	808
36	3	4	2025-10-31 16:04:38.092235+05:30	BKNG-4FB7EBA6	CONFIRMED	4	2	2025-10-31 16:04:38.084+05:30	756
37	1	4	2025-10-31 16:05:08.598678+05:30	BKNG-98CF63EB	CONFIRMED	5	2	2025-10-31 16:05:08.591+05:30	756
13	1	1	2025-10-29 12:33:25.404591+05:30	BKNG-D01CEEF2	CANCELLED	0	2	2025-10-29 11:22:09.832+05:30	475
32	1	3	2025-10-31 11:21:55.358059+05:30	BKNG-7950C041	CANCELLED	3	2	2025-10-31 10:01:26.106+05:30	1348
42	1	20	2025-11-03 19:23:23.589109+05:30	BKNG-2D7A2458	CONFIRMED	6	2	2025-11-03 19:19:08.431+05:30	2294
43	1	19	2025-11-03 19:30:35.186719+05:30	BKNG-3150E537	CONFIRMED	7	2	2025-11-03 19:19:08.431+05:30	2294
45	1	18	2025-11-03 19:33:28.907204+05:30	BKNG-3BB6D972	CONFIRMED	9	2	2025-11-03 19:19:08.431+05:30	2294
46	1	17	2025-11-03 19:37:43.640317+05:30	BKNG-42F4C1AE	CANCELLED	10	2	2025-11-03 19:19:08.431+05:30	2294
47	1	21	2025-11-03 19:47:16.393376+05:30	BKNG-9F5B82EC	CANCELLED	11	2	2025-11-03 19:19:08.431+05:30	2294
\.


--
-- Name: bookings_booking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bookings_booking_id_seq', 64, true);


--
-- Name: bookings bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_pkey PRIMARY KEY (booking_id);


--
-- Name: ix_bookings_booking_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_bookings_booking_id ON public.bookings USING btree (booking_id);


--
-- Name: ix_bookings_booking_reference; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ix_bookings_booking_reference ON public.bookings USING btree (booking_reference);


--
-- Name: ix_bookings_discount_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_bookings_discount_id ON public.bookings USING btree (discount_id);


--
-- Name: ix_bookings_payment_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_bookings_payment_id ON public.bookings USING btree (payment_id);


--
-- Name: ix_bookings_show_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_bookings_show_id ON public.bookings USING btree (show_id);


--
-- Name: ix_bookings_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_bookings_user_id ON public.bookings USING btree (user_id);


--
-- PostgreSQL database dump complete
--

\unrestrict OpJX2vmEt8yockC7Ur2wgZfjePDLDhx5OvdEfeX8k7BOhOz2EWReC1yaVDvmDX5

