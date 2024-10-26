--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3 (Debian 16.3-1.pgdg120+1)
-- Dumped by pg_dump version 16.4 (Homebrew)

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
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
b2eb13f6-e278-4eb4-9825-b6f8fb1c1950	a32edcc088a90e5957c8f8a7161619dd2f9c8d7757c4c8e8a64e369ca3d4ffe7	2024-10-25 18:47:10.296432+00	20241025184346_init	\N	\N	2024-10-25 18:47:08.812411+00	1
45e74a2d-eed7-471d-97be-31878dc29099	e6af2c4a43a49a1dd81b6e2d3f49aed921c1932f64ae21a2c8374eb3563c3643	2024-10-25 18:47:57.035559+00	20241025184754_init2	\N	\N	2024-10-25 18:47:55.560069+00	1
bc415262-b212-4395-bc45-e98ce29232f4	fd8e671a8b2edda636b3ee9cc33975fd0b8a928e17e0ed0113f0ae20230f96ab	2024-10-26 14:18:07.500628+00	20241026141804_product_image_model_add	\N	\N	2024-10-26 14:18:06.067982+00	1
c4cc0b31-836c-426d-a01c-7f2bc11f6391	e744e0a0b94c6394bbe4f1d4683bc00324527837eaa695a15a4d5d151c9d6f8a	2024-10-26 14:30:48.559399+00	20241026143045_	\N	\N	2024-10-26 14:30:47.116158+00	1
b57407a8-902a-49b8-913e-8ff4d16d6a13	ca3baebf970bdae087745f694df9b96ce501256dd873fee9e005ea056e429204	2024-10-26 22:01:58.986562+00	20241026220156_yyy	\N	\N	2024-10-26 22:01:57.562864+00	1
\.


--
-- Data for Name: vendor; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public.vendor (id, name, address, phone, "createdAt", "updatedAt", "isActive") FROM stdin;
cm2p39mis0000ijvh85q8mlcf	Logic-Nexus It Solutions	Jhikargaccha, Jashore	01703459656	2024-10-25 18:51:57.124	2024-10-25 18:51:57.124	ACTIVE
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public."user" (id, email, mobile, username, password, "createdAt", "updatedAt", "vendorId") FROM stdin;
cm2p39mis0001ijvhvfhnmxa0	admin@admin.com	123456789	admin	$2b$10$zkwgnzZGeOy53jv5XF8zrOBZWiGkhNkluttv/g/aZT.jFmtxzOrqS	2024-10-25 18:51:57.124	2024-10-25 18:51:57.124	cm2p39mis0000ijvh85q8mlcf
cm2p4icr60001q0lndzgvveee	wahedemon09@gmail.com	01503459656	zaman	$2b$10$iNaV3Ue8lwzrSLiiCCYXf.X8OUq4AsqVzGpX/8vu82i/t6xLTn582	2024-10-25 19:26:43.986	2024-10-25 19:26:43.986	cm2p39mis0000ijvh85q8mlcf
cm2p4s6670001myr6ocu6rbic	test@gmail.com	123321123	neon	$2b$10$ujFimrmuBSOMPdJVegRvwunV9b91AkYNIbi58LCVRmv/ItKMS3K8q	2024-10-25 19:34:22.013	2024-10-25 19:34:22.013	cm2p39mis0000ijvh85q8mlcf
\.


--
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public.admin (id, "userId", "fullName", role, "createdAt", "updatedAt", "isActive") FROM stdin;
cm2p39mis0002ijvh8ynl93a3	cm2p39mis0001ijvhvfhnmxa0	admin	ADMIN	2024-10-25 18:51:57.124	2024-10-25 18:51:57.124	ACTIVE
\.


--
-- Data for Name: logginInfo; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public."logginInfo" (id, "userId", "ipAddress", device, browser, os, location, status, note, "loginAt", "createdAt", "updatedAt") FROM stdin;
cm2p41dfb0000r04aj3twpcyu	cm2p39mis0001ijvhvfhnmxa0	::1	PostmanRuntime/7.42.0	PostmanRuntime/7.42.0	Unknown OS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-25 19:13:31.441	2024-10-25 19:13:31.441	2024-10-25 19:13:31.441
cm2p4jbrb0004q0ln0qg9ulzi	cm2p4icr60001q0lndzgvveee	::1	PostmanRuntime/7.42.0	PostmanRuntime/7.42.0	Unknown OS	undefined,undefined,undefined	FAILED	Incorrect password	2024-10-25 19:27:29.351	2024-10-25 19:27:29.351	2024-10-25 19:27:29.351
cm2p4kh2n0005q0lntqqrntay	cm2p4icr60001q0lndzgvveee	::1	PostmanRuntime/7.42.0	PostmanRuntime/7.42.0	Unknown OS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-25 19:28:22.895	2024-10-25 19:28:22.895	2024-10-25 19:28:22.895
cm2p4slbd0004myr64nxmpwey	cm2p4s6670001myr6ocu6rbic	::1	PostmanRuntime/7.42.0	PostmanRuntime/7.42.0	Unknown OS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-25 19:34:41.642	2024-10-25 19:34:41.642	2024-10-25 19:34:41.642
cm2p5kuuf0000tttf3agm2sz9	cm2p4s6670001myr6ocu6rbic	::1	PostmanRuntime/7.42.0	PostmanRuntime/7.42.0	Unknown OS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-25 19:56:40.36	2024-10-25 19:56:40.36	2024-10-25 19:56:40.36
cm2p5qrnj00001333jwsvv33w	cm2p39mis0001ijvhvfhnmxa0	::1	PostmanRuntime/7.42.0	PostmanRuntime/7.42.0	Unknown OS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-25 20:01:16.16	2024-10-25 20:01:16.16	2024-10-25 20:01:16.16
cm2p7jhtn00008fumv6oet81p	cm2p39mis0001ijvhvfhnmxa0	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-25 20:51:36.06	2024-10-25 20:51:36.06	2024-10-25 20:51:36.06
cm2p7juol00018fumc4jxji8t	cm2p39mis0001ijvhvfhnmxa0	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-25 20:51:52.725	2024-10-25 20:51:52.725	2024-10-25 20:51:52.725
cm2p9pspd0000jy35iogfbavg	cm2p39mis0001ijvhvfhnmxa0	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-25 21:52:29.33	2024-10-25 21:52:29.33	2024-10-25 21:52:29.33
cm2pb4vm80000qxj0i6m4ohfr	cm2p39mis0001ijvhvfhnmxa0	118.179.124.106	PostmanRuntime/7.42.0	PostmanRuntime/7.42.0	Unknown OS	Bangladesh,D,Jhingergācha	SUCCESS	Login successful	2024-10-25 22:32:12.56	2024-10-25 22:32:12.56	2024-10-25 22:32:12.56
cm2pb5vzd0001qxj0iws6370v	cm2p39mis0001ijvhvfhnmxa0	118.179.124.106	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	Bangladesh,D,Jhingergācha	SUCCESS	Login successful	2024-10-25 22:32:59.69	2024-10-25 22:32:59.69	2024-10-25 22:32:59.69
cm2pbfuj50001111effcet3h0	cm2p39mis0001ijvhvfhnmxa0	118.179.124.106	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	Bangladesh,D,Jhingergācha	SUCCESS	Login successful	2024-10-25 22:40:44.37	2024-10-25 22:40:44.37	2024-10-25 22:40:44.37
cm2q9pp230000qfrbwcf51i74	cm2p39mis0001ijvhvfhnmxa0	118.179.124.106	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	Bangladesh,D,Jhingergācha	SUCCESS	Login successful	2024-10-26 14:40:10.78	2024-10-26 14:40:10.78	2024-10-26 14:40:10.78
cm2q9qloj0001qfrbjnn00rba	cm2p39mis0001ijvhvfhnmxa0	118.179.124.106	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	Bangladesh,D,Jhingergācha	SUCCESS	Login successful	2024-10-26 14:40:53.06	2024-10-26 14:40:53.06	2024-10-26 14:40:53.06
cm2qazltj0005qfrbh8avbjb6	cm2p39mis0001ijvhvfhnmxa0	118.179.124.106	PostmanRuntime/7.42.0	PostmanRuntime/7.42.0	Unknown OS	Bangladesh,D,Jhingergācha	SUCCESS	Login successful	2024-10-26 15:15:52.759	2024-10-26 15:15:52.759	2024-10-26 15:15:52.759
cm2qbw4ns000fqfrbwiaw43cs	cm2p39mis0001ijvhvfhnmxa0	118.179.124.106	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	Bangladesh,D,Jhingergācha	SUCCESS	Login successful	2024-10-26 15:41:10.169	2024-10-26 15:41:10.169	2024-10-26 15:41:10.169
cm2qcnrc3000gqfrbq5tirt73	cm2p39mis0001ijvhvfhnmxa0	118.179.124.106	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	Bangladesh,D,Jhingergācha	SUCCESS	Login successful	2024-10-26 16:02:39.268	2024-10-26 16:02:39.268	2024-10-26 16:02:39.268
cm2qco8s4000hqfrbrq5psfby	cm2p39mis0001ijvhvfhnmxa0	118.179.124.106	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	Bangladesh,D,Jhingergācha	SUCCESS	Login successful	2024-10-26 16:03:01.877	2024-10-26 16:03:01.877	2024-10-26 16:03:01.877
cm2qfszkx0000c9bt087uekva	cm2p39mis0001ijvhvfhnmxa0	118.179.124.106	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	Bangladesh,D,Jhingergācha	SUCCESS	Login successful	2024-10-26 17:30:42.082	2024-10-26 17:30:42.082	2024-10-26 17:30:42.082
cm2qfw23k000013773562depw	cm2p39mis0001ijvhvfhnmxa0	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-26 17:33:03.653	2024-10-26 17:33:03.653	2024-10-26 17:33:03.653
cm2qghso7000013jud0iw4tlz	cm2p39mis0001ijvhvfhnmxa0	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-26 17:49:59.528	2024-10-26 17:49:59.528	2024-10-26 17:49:59.528
cm2qhnd3l00001239ogwqn7hi	cm2p39mis0001ijvhvfhnmxa0	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-26 18:22:18.897	2024-10-26 18:22:18.897	2024-10-26 18:22:18.897
cm2qiluwk0000puti0kept82r	cm2p4icr60001q0lndzgvveee	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-26 18:49:08.276	2024-10-26 18:49:08.276	2024-10-26 18:49:08.276
cm2qitfxb000013cqbwkvy5o0	cm2p4icr60001q0lndzgvveee	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-26 18:55:02.111	2024-10-26 18:55:02.111	2024-10-26 18:55:02.111
cm2qitr6l000113cqudhcunlm	cm2p4icr60001q0lndzgvveee	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-26 18:55:16.702	2024-10-26 18:55:16.702	2024-10-26 18:55:16.702
cm2qj1e8l000014emv1svvksw	cm2p4icr60001q0lndzgvveee	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-26 19:01:13.174	2024-10-26 19:01:13.174	2024-10-26 19:01:13.174
cm2qjnn0x0000x7o395yndtaz	cm2p39mis0001ijvhvfhnmxa0	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-26 19:18:29.004	2024-10-26 19:18:29.004	2024-10-26 19:18:29.004
cm2qjudf00000bnyvpszvdme3	cm2p39mis0001ijvhvfhnmxa0	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-26 19:23:43.613	2024-10-26 19:23:43.613	2024-10-26 19:23:43.613
cm2qjxjr10000yivyfqnf4mai	cm2p4icr60001q0lndzgvveee	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-26 19:26:13.309	2024-10-26 19:26:13.309	2024-10-26 19:26:13.309
cm2qjytc70001yivyxy3ggywu	cm2p4icr60001q0lndzgvveee	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-26 19:27:10.676	2024-10-26 19:27:10.676	2024-10-26 19:27:10.676
cm2qk2fsg0000rrs5gpb3mp3w	cm2p4icr60001q0lndzgvveee	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-26 19:29:59.784	2024-10-26 19:29:59.784	2024-10-26 19:29:59.784
cm2qk70dl0000cgxse06rj39u	cm2p4icr60001q0lndzgvveee	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-26 19:33:32.895	2024-10-26 19:33:32.895	2024-10-26 19:33:32.895
cm2qkc66r0001cgxs3rt92rnz	cm2p4icr60001q0lndzgvveee	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-26 19:37:35.323	2024-10-26 19:37:35.323	2024-10-26 19:37:35.323
cm2qkdcxc0002cgxskdzeka4s	cm2p4icr60001q0lndzgvveee	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-26 19:38:30.961	2024-10-26 19:38:30.961	2024-10-26 19:38:30.961
cm2qkqqjt0000354zfcdenfne	cm2p4icr60001q0lndzgvveee	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-26 19:48:55.145	2024-10-26 19:48:55.145	2024-10-26 19:48:55.145
cm2qkr05m0001354zdajd80tf	cm2p4icr60001q0lndzgvveee	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-26 19:49:07.594	2024-10-26 19:49:07.594	2024-10-26 19:49:07.594
cm2qkr6u60002354zusq38gtp	cm2p4icr60001q0lndzgvveee	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-26 19:49:15.95	2024-10-26 19:49:15.95	2024-10-26 19:49:15.95
cm2ql1abr0000xqx3pqla1t9n	cm2p39mis0001ijvhvfhnmxa0	118.179.124.106	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	Bangladesh,D,Jhingergācha	SUCCESS	Login successful	2024-10-26 19:57:07.335	2024-10-26 19:57:07.335	2024-10-26 19:57:07.335
cm2ql1ktm0001xqx376zyg0y7	cm2p4icr60001q0lndzgvveee	118.179.124.106	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	Bangladesh,D,Jhingergācha	SUCCESS	Login successful	2024-10-26 19:57:20.938	2024-10-26 19:57:20.938	2024-10-26 19:57:20.938
cm2qlqju40000d3ezbgpjtwmp	cm2p39mis0001ijvhvfhnmxa0	103.144.201.65	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Windows	Bangladesh,C,Dhaka	SUCCESS	Login successful	2024-10-26 20:16:46.061	2024-10-26 20:16:46.061	2024-10-26 20:16:46.061
cm2qm4kx80003d3eznhr701yi	cm2p4icr60001q0lndzgvveee	118.179.124.106	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	Bangladesh,D,Jhingergācha	SUCCESS	Login successful	2024-10-26 20:27:40.653	2024-10-26 20:27:40.653	2024-10-26 20:27:40.653
cm2qm50co0004d3ezfjogqp30	cm2p4icr60001q0lndzgvveee	118.179.124.106	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	Bangladesh,D,Jhingergācha	SUCCESS	Login successful	2024-10-26 20:28:00.648	2024-10-26 20:28:00.648	2024-10-26 20:28:00.648
cm2qm7jvf0005d3ez2tno2gr3	cm2p39mis0001ijvhvfhnmxa0	118.179.124.106	PostmanRuntime/7.42.0	PostmanRuntime/7.42.0	Unknown OS	Bangladesh,D,Jhingergācha	SUCCESS	Login successful	2024-10-26 20:29:59.259	2024-10-26 20:29:59.259	2024-10-26 20:29:59.259
cm2qorfvz0006d3ezw7d25hrq	cm2p39mis0001ijvhvfhnmxa0	103.144.201.65	PostmanRuntime/7.42.0	PostmanRuntime/7.42.0	Unknown OS	Bangladesh,C,Dhaka	SUCCESS	Login successful	2024-10-26 21:41:26.446	2024-10-26 21:41:26.446	2024-10-26 21:41:26.446
cm2qoth6q0007d3ezak6xa0re	cm2p39mis0001ijvhvfhnmxa0	103.144.201.65	PostmanRuntime/7.42.0	PostmanRuntime/7.42.0	Unknown OS	Bangladesh,C,Dhaka	FAILED	Incorrect password	2024-10-26 21:43:01.443	2024-10-26 21:43:01.443	2024-10-26 21:43:01.443
\.


--
-- Data for Name: otherUsers; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public."otherUsers" (id, "userId", "firstName", "lastName", profile_picture, role, "userUniqueId", "createdAt", "updatedAt", "order", "userJoinDate", "isActive") FROM stdin;
cm2p4s6670002myr6dt58d2lz	cm2p4s6670001myr6ocu6rbic	Md	Zaman	{"url": "https://quick-shop-backend-phiq.onrender.com/media/2024-10-25-599-1685788329729.png", "size": 944594, "filename": "2024-10-25-599-1685788329729.png", "extension": "png", "fieldName": "profile_picture"}	GENERAL_USER	CS-20249950-0	2024-10-25 19:34:22.013	2024-10-25 19:34:24.98	1	2024-10-25 19:34:22.013	ACTIVE
\.


--
-- Data for Name: product_category; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public.product_category (id, product_category_name, description, image, "isActive", "order", "createdAt", "updatedAt", "vendorId") FROM stdin;
cm2qbgjyr0006qfrb8oiwmdha	Keyboard		{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1729956540/uploads/cgobvqiepn4zmxa5tnsw.jpg", "size": 11226, "filename": "WeChat Image_20220722204517.jpg", "publicId": "uploads/cgobvqiepn4zmxa5tnsw", "extension": "jpeg", "fieldName": "image"}	ACTIVE	1	2024-10-26 15:29:03.477	2024-10-26 15:29:03.477	cm2p39mis0000ijvh85q8mlcf
cm2qbgjyr0007qfrbkbj4n754	Tws		{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1729956540/uploads/l2a9trrlgfuugw8wgsms.png", "size": 282191, "filename": "vecteezy_globe-icon-sign-symbol-design_10157349_354.png", "publicId": "uploads/l2a9trrlgfuugw8wgsms", "extension": "png", "fieldName": "image"}	ACTIVE	2	2024-10-26 15:29:03.477	2024-10-26 15:29:03.477	cm2p39mis0000ijvh85q8mlcf
cm2qbgjyr0008qfrbsa7upvsl	Microphone		{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1729956540/uploads/ihteay4nuoyv0q7toyhh.jpg", "size": 11226, "filename": "WeChat Image_20220722204517.jpg", "publicId": "uploads/ihteay4nuoyv0q7toyhh", "extension": "jpeg", "fieldName": "image"}	ACTIVE	3	2024-10-26 15:29:03.477	2024-10-26 15:29:03.477	cm2p39mis0000ijvh85q8mlcf
cm2qbgjyr000bqfrbom3nu67z	Guiter		{}	ACTIVE	6	2024-10-26 15:29:03.477	2024-10-26 15:29:03.477	cm2p39mis0000ijvh85q8mlcf
cm2qbgjyr000cqfrbp28fb7eg	Charger		{}	ACTIVE	7	2024-10-26 15:29:03.477	2024-10-26 15:29:03.477	cm2p39mis0000ijvh85q8mlcf
cm2qbgjyr000dqfrblx7yhm7v	Headphone		{}	ACTIVE	8	2024-10-26 15:29:03.477	2024-10-26 15:29:03.477	cm2p39mis0000ijvh85q8mlcf
cm2qbgjyr000eqfrbsk73mmuc	Mackbook		{}	ACTIVE	9	2024-10-26 15:29:03.477	2024-10-26 15:29:03.477	cm2p39mis0000ijvh85q8mlcf
cm2qbgjyr0009qfrb0ehmd9ie	Pendrive		{}	INACTIVE	4	2024-10-26 15:29:03.477	2024-10-26 15:50:01.863	cm2p39mis0000ijvh85q8mlcf
cm2qbgjyr000aqfrb05rbzjc5	Modem		{}	ACTIVE	5	2024-10-26 15:29:03.477	2024-10-26 15:51:27.1	cm2p39mis0000ijvh85q8mlcf
cm2q9sjq80002qfrbyveoqiny	Hub		{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1729953743/uploads/toycebwqihwzfszjus93.jpg", "size": 235431, "filename": "Logic Nexus.png", "publicId": "uploads/toycebwqihwzfszjus93", "extension": "png", "fieldName": "image"}	ACTIVE	1	2024-10-26 14:42:23.811	2024-10-26 14:42:23.811	cm2p39mis0000ijvh85q8mlcf
cm2q9sjq80003qfrbyowtuhi0	Monitor		{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1729953743/uploads/rg5eqqc7bcnaz3wgoazx.png", "size": 153320, "filename": "MD EMON.png", "publicId": "uploads/rg5eqqc7bcnaz3wgoazx", "extension": "png", "fieldName": "image"}	ACTIVE	2	2024-10-26 14:42:23.811	2024-10-26 14:42:23.811	cm2p39mis0000ijvh85q8mlcf
cm2q9sjq80004qfrb8jnsvks0	Watch		{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1729953864/uploads/vf7q5c2iuafaxhsh7bdh.jpg", "size": 106774, "filename": "pngtree-vector-globe-icon-png-image_3787753.jpg", "publicId": "uploads/vf7q5c2iuafaxhsh7bdh", "extension": "jpeg", "fieldName": "image"}	ACTIVE	3	2024-10-26 14:42:23.811	2024-10-26 14:44:25.314	cm2p39mis0000ijvh85q8mlcf
cm2qlwf130001d3ezxo4ef5ux	hhfgjh		{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1729974078/uploads/kp83dltkeex4arxos2dd.png", "size": 42854, "filename": "Hello Hatt Transparent.png", "publicId": "uploads/kp83dltkeex4arxos2dd", "extension": "png", "fieldName": "image"}	ACTIVE	1	2024-10-26 20:21:19.738	2024-10-26 20:21:19.738	cm2p39mis0000ijvh85q8mlcf
cm2qlwf130002d3ezon05nvi9	Logo	Logo	{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1729974078/uploads/xgf0ox29haumx1nxe7fo.jpg", "size": 95536, "filename": "460497417_552193207157253_7295978792091044629_n.jpg", "publicId": "uploads/xgf0ox29haumx1nxe7fo", "extension": "jpeg", "fieldName": "image"}	ACTIVE	2	2024-10-26 20:21:19.738	2024-10-26 20:22:24.689	cm2p39mis0000ijvh85q8mlcf
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public.product (id, description, stock, "isActive", "createdAt", "updatedAt", "vendorId", "categoryId", "createdById", buying_price, delivery_charge, delivery_charge_type, product_name, product_quantity_type, selling_price) FROM stdin;
\.


--
-- Data for Name: product_image; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public.product_image (id, image, "isActive", "createdAt", "updatedAt", "productId") FROM stdin;
\.


--
-- Data for Name: workers; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public.workers (id, "fullName", role, "fatherName", "employeeID", whatsapp, "NID", "NIDImage", education, "bankName", "branchName", "accountNumber", "mobileBanking", "mobileBankingNumber", profile_picture, address, "zipCode", "userJoinDate", "createdAt", "updatedAt", "order", "userId", "isActive") FROM stdin;
cm2p4icr60002q0ln0bfg81tn	Md Wahiduzzaman	OPERATOR	Wahed Morad	EM-20249189-0	01721724905	12131241200	{"url": "https://quick-shop-backend-phiq.onrender.com/media/2024-10-25-182-1__6ooq0R60ba3UT5c-QVemA.png", "size": 34066, "filename": "2024-10-25-182-1__6ooq0R60ba3UT5c-QVemA.png", "extension": "png"}	BSC in CST						{"url": "https://quick-shop-backend-phiq.onrender.com/media/2024-10-25-453-1685788329729.png", "size": 944594, "filename": "2024-10-25-453-1685788329729.png", "extension": "png"}		7420	2024-10-25 19:26:43.986	2024-10-25 19:26:43.986	2024-10-25 19:26:46.945	1	cm2p4icr60001q0lndzgvveee	ACTIVE
\.


--
-- PostgreSQL database dump complete
--

