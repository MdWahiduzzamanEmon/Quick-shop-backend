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
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public."User" (id, "createdAt", "updatedAt", email, mobile, password, username) FROM stdin;
cm2kz96ji0000uzo7qjistdur	2024-10-22 21:48:33.245	2024-10-22 21:48:33.245	admin@admin.com	123456789	$2b$10$hUZBJPBpIVTuT7JVC8rca.fUq.kmNtHoHi6LT7ir823Xm2RWCW1YK	admin
cm2kzs7n200005mrbo2rdt505	2024-10-22 22:03:21.135	2024-10-22 22:03:21.135	wemon3009@gmail.com	01703459656	$2b$10$iacqAi8q1Si3iNeRryHQPOWBhIkeGL4tStmRbFeJk85nOnPyn8Ve.	emon
cm2l07sxr0003arn5y14m2oe1	2024-10-22 22:15:28.576	2024-10-22 22:15:28.576	wahedemon09@gmail.com	01503459656	$2b$10$uuxrLpKvIZAtMl7VTz.R4u2Sj96AFNA3g7zLZWl/BP6oO2OPPlIb.	zaman
cm2l0b0b900007ygk0igt4vze	2024-10-22 22:17:58.102	2024-10-22 22:17:58.102	test@gmail.com	123321123	$2b$10$8uhb3cazKWio8YA5Him46ucKv7JpsrI0YRrGRdo9xcRikP.3Ijycu	neon
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
d068008a-7972-45d0-b592-a19919be81c5	f27234ad296e4ab58bb480f85e1ded2f0a76d113ff34856f7c5c72bdd63afae2	2024-10-22 21:46:33.226931+00	20241022200755_init	\N	\N	2024-10-22 21:46:31.590702+00	1
1608de06-86a3-4cbb-a632-3161a43a3f3f	560200134d3238b81f7973f7d23aea4496713b09fe312387c8e64a523e800066	2024-10-22 21:46:35.53416+00	20241022202412_y	\N	\N	2024-10-22 21:46:34.032741+00	1
8a9d642f-fd42-4761-87bd-6afa5b6530ae	d3710071a593d6983abf8a1f13c9f577cadb7c3213fb325a8950c6552dd2de4c	2024-10-22 21:46:37.501627+00	20241022203831_u	\N	\N	2024-10-22 21:46:36.095424+00	1
25524b3b-bfb8-4135-8df5-fd5d56fdf478	e919bbb8d6bbcfd7508b3992da9b3f80049d5fd58ba834810b8de2bfa23b8551	2024-10-22 21:46:39.575672+00	20241022210845_ii	\N	\N	2024-10-22 21:46:38.055641+00	1
a2354be2-61c0-4af1-904e-614087a924e4	bc6009d23d8ea94809513d8f2b047181694770c82d4882f6c4986c9762f16853	2024-10-22 21:46:41.623811+00	20241022211552_order	\N	\N	2024-10-22 21:46:40.19447+00	1
be00a922-5cc2-404e-a603-cf5f3afbbe65	171e3fcfe4889ea41b81b782a316014adf01fa0fdaf8e40a011101a5b07ae860	2024-10-22 21:46:43.788548+00	20241022213306_y	\N	\N	2024-10-22 21:46:42.239892+00	1
24ac943b-f4c3-4753-805e-b312249bf0c7	73f22ed5c75ab002fa96b1fa3c5cee1d077ec3735531a24bb9b70956a3dcc1de	2024-10-22 21:48:22.284924+00	20241022214819_init	\N	\N	2024-10-22 21:48:20.749851+00	1
91eafff9-0bfc-46c9-8a00-9a9b3b21e405	e0544aa685f426b9961f4680099167eaa3c457fccbd5240de8185edeab4c5da4	2024-10-22 22:10:09.822076+00	20241022221006_ui	\N	\N	2024-10-22 22:10:08.339676+00	1
028501b6-8d0c-49c3-9969-6e3655e920b3	2432d3a560840270934c22c86b338efa14ebc95610e038539a42f1d45a014acb	2024-10-22 22:27:42.928126+00	20241022222740_t	\N	\N	2024-10-22 22:27:41.620207+00	1
\.


--
-- Data for Name: logginInfo; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public."logginInfo" (id, "userId", "ipAddress", device, browser, os, location, status, note, "loginAt", "createdAt", "updatedAt") FROM stdin;
cm2l0g09a0001zsq2k4w8ybkq	cm2kzs7n200005mrbo2rdt505	::1	PostmanRuntime/7.42.0	PostmanRuntime/7.42.0	Unknown OS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-22 22:21:51.309	2024-10-22 22:21:51.309	2024-10-22 22:21:51.309
cm2l0imoz000110epg3vi5c80	cm2kz96ji0000uzo7qjistdur	::1	PostmanRuntime/7.42.0	PostmanRuntime/7.42.0	Unknown OS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-22 22:23:53.7	2024-10-22 22:23:53.7	2024-10-22 22:23:53.7
cm2l0o6ma0000o18lwp0fdeas	cm2kz96ji0000uzo7qjistdur	::1	PostmanRuntime/7.42.0	PostmanRuntime/7.42.0	Unknown OS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-22 22:28:12.802	2024-10-22 22:28:12.802	2024-10-22 22:28:12.802
cm2l0sjun0000fblnc7xe1hlo	cm2kz96ji0000uzo7qjistdur	::1	PostmanRuntime/7.42.0	PostmanRuntime/7.42.0	Unknown OS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-22 22:31:36.575	2024-10-22 22:31:36.575	2024-10-22 22:31:36.575
cm2l0wytp0000owhlc4p5nq9t	cm2kz96ji0000uzo7qjistdur	::1	PostmanRuntime/7.42.0	PostmanRuntime/7.42.0	Unknown OS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-22 22:35:02.606	2024-10-22 22:35:02.606	2024-10-22 22:35:02.606
cm2l10sig0000b3ordhpaciqq	cm2kz96ji0000uzo7qjistdur	::1	PostmanRuntime/7.42.0	PostmanRuntime/7.42.0	Unknown OS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-22 22:38:01.049	2024-10-22 22:38:01.049	2024-10-22 22:38:01.049
\.


--
-- Data for Name: otherUsers; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public."otherUsers" (id, "userId", "firstName", "lastName", profile_picture, role, "isActive", "createdAt", "updatedAt") FROM stdin;
cm2kz96ji0001uzo7d82etdis	cm2kz96ji0000uzo7qjistdur	admin	admin	{}	ADMINISTRATOR	ACTIVE	2024-10-22 21:48:33.245	2024-10-22 21:48:33.245
cm2l0b0b900017ygke2gb6o7o	cm2l0b0b900007ygk0igt4vze	Md	Zaman	{"url": "https://quick-shop-backend-phiq.onrender.com/media/2024-10-22-243-1685788329729.png", "size": 944594, "filename": "2024-10-22-243-1685788329729.png", "extension": "png", "fieldName": "profile_picture"}	GENERAL_USER	ACTIVE	2024-10-22 22:17:58.102	2024-10-22 22:17:58.102
\.


--
-- Data for Name: workers; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public.workers (id, "fullName", role, "fatherName", "employeeID", whatsapp, "NID", "NIDImage", education, "bankName", "branchName", "accountNumber", "mobileBanking", "mobileBankingNumber", address, "zipCode", "createdAt", "updatedAt", "isActive", "userId", profile_picture, "order") FROM stdin;
cm2kzs7n400015mrb6jnzeuae	Md Wahiduzzaman	OPERATOR	Wahed Morad	EM-2024923.0	01521724905	121312412	{"url": "https://quick-shop-backend-phiq.onrender.com/media/2024-10-22-108-1__6ooq0R60ba3UT5c-QVemA.png", "size": 34066, "filename": "2024-10-22-108-1__6ooq0R60ba3UT5c-QVemA.png", "extension": "png"}	BSC in CST	 	 	 	 	 	 	7420	2024-10-22 22:03:21.135	2024-10-22 22:03:24.114	ACTIVE	cm2kzs7n200005mrbo2rdt505	{"url": "https://quick-shop-backend-phiq.onrender.com/media/2024-10-22-952-1685788329729.png", "size": 944594, "filename": "2024-10-22-952-1685788329729.png", "extension": "png"}	1
cm2l07sxr0004arn5nkk7dswa	Md Wahiduzzaman	OPERATOR	Wahed Morad	EM-2024923.1	01721724905	12131241200	{"url": "https://quick-shop-backend-phiq.onrender.com/media/2024-10-22-495-1__6ooq0R60ba3UT5c-QVemA.png", "size": 34066, "filename": "2024-10-22-495-1__6ooq0R60ba3UT5c-QVemA.png", "extension": "png"}	BSC in CST							7420	2024-10-22 22:15:28.576	2024-10-22 22:15:30.957	ACTIVE	cm2l07sxr0003arn5y14m2oe1	{"url": "https://quick-shop-backend-phiq.onrender.com/media/2024-10-22-30-1685788329729.png", "size": 944594, "filename": "2024-10-22-30-1685788329729.png", "extension": "png"}	1
\.


--
-- PostgreSQL database dump complete
--

