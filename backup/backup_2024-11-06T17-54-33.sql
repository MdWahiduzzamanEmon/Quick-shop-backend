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
-- Data for Name: superAdmin; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public."superAdmin" (id, "firstName", "lastName", email, password, mobile, username, role, "isActive", "createdAt", "updatedAt") FROM stdin;
cm2uswab1000012okxu2rv8rl	Super	Admin	superadmin@admin.com	$2b$10$oISvmIN.yoaK8U2sFG/6ROBeNb1bvmg4tlw/xGxFrCQlzPqT/KqW2	1234567890	superAdmin	SUPER_ADMIN	ACTIVE	2024-10-29 18:48:15.661	2024-10-29 18:48:15.661
\.


--
-- Data for Name: supplier; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public.supplier (id, "supplierName", "srName", "dealerName", "srContactNo", "srWhatsappNo", "dealerContactNo", "dealerEmail", "dealerAddress", "supplierUniqueId", "companyLogo", "srPhoto", "isActive", role, "createdAt", "updatedAt") FROM stdin;
cm3082ath0000x6c8cg8pkodl	Pran RFL Group Limited	md rana	md hasan	012344473	012738354	01423423834	hasan@gmail.com	uttara, dhaka	SUP-DURIBFEQ	{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1730555500/uploads/ikxttj8fvftjttfasa0v.png", "size": 130661, "filename": "1.png", "extension": "png"}	{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1730555500/uploads/hzlnziatpb8jrkzo4z4f.jpg", "size": 27947, "filename": "Ali.jpg", "extension": "jpeg"}	ACTIVE	SUPPLIER	2024-11-02 13:51:41.381	2024-11-02 13:51:41.381
cm308407q0001x6c8fdyn7obn	Akij Limited	md rana	md hasan	0123454473	0123454534	01423423834	hasan@gmail.com	uttara, dhaka	SUP-Y5I7V976	{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1730555579/uploads/ioiq3f5jz7rttaqpahaz.png", "size": 130661, "filename": "1.png", "extension": "png"}	{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1730555579/uploads/mobzcqgnmy1ecr7dmi2y.jpg", "size": 27947, "filename": "Ali.jpg", "extension": "jpeg"}	ACTIVE	SUPPLIER	2024-11-02 13:53:00.951	2024-11-02 13:53:00.951
\.


--
-- Data for Name: vendor; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public.vendor (id, name, address, phone, vendor_image, "createdAt", "updatedAt", "isActive", "superAdminId") FROM stdin;
cm2uswab2000112ok44tt2s4f	Logic Nexus It Solutions	Jhikargaccha, Jashore	01703459656	{}	2024-10-29 18:48:15.661	2024-10-29 18:48:15.661	ACTIVE	cm2uswab1000012okxu2rv8rl
cm2uu1jb50001t4nwmb7rordo	New Vendor 1	Jashore	01703459656	{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1730229617/uploads/anvkj3aurv1gqto1wqbt.png", "size": 73571, "filename": "React-JS.png", "publicId": "uploads/anvkj3aurv1gqto1wqbt", "extension": "png", "fieldName": "vendor_image"}	2024-10-29 19:20:20.224	2024-10-29 19:20:20.224	ACTIVE	cm2uswab1000012okxu2rv8rl
\.


--
-- Data for Name: _SupplierToVendor; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public."_SupplierToVendor" ("A", "B") FROM stdin;
cm3082ath0000x6c8cg8pkodl	cm2uswab2000112ok44tt2s4f
cm308407q0001x6c8fdyn7obn	cm2uswab2000112ok44tt2s4f
\.


--
-- Data for Name: division; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public.division (id, name, bn_name, url) FROM stdin;
1	Chattagram	চট্টগ্রাম	www.chittagongdiv.gov.bd
2	Rajshahi	রাজশাহী	www.rajshahidiv.gov.bd
3	Khulna	খুলনা	www.khulnadiv.gov.bd
4	Barisal	বরিশাল	www.barisaldiv.gov.bd
5	Sylhet	সিলেট	www.sylhetdiv.gov.bd
6	Dhaka	ঢাকা	www.dhakadiv.gov.bd
7	Rangpur	রংপুর	www.rangpurdiv.gov.bd
8	Mymensingh	ময়মনসিংহ	www.mymensinghdiv.gov.bd
\.


--
-- Data for Name: district; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public.district (id, name, bn_name, lat, lon, url, division_id) FROM stdin;
1	Comilla	কুমিল্লা	23.4682747	91.1788135	www.comilla.gov.bd	1
2	Feni	ফেনী	23.023231	91.3840844	www.feni.gov.bd	1
3	Brahmanbaria	ব্রাহ্মণবাড়িয়া	23.9570904	91.1119286	www.brahmanbaria.gov.bd	1
4	Rangamati	রাঙ্গামাটি	22.65561018	92.17541121	www.rangamati.gov.bd	1
5	Noakhali	নোয়াখালী	22.869563	91.099398	www.noakhali.gov.bd	1
6	Chandpur	চাঁদপুর	23.2332585	90.6712912	www.chandpur.gov.bd	1
7	Lakshmipur	লক্ষ্মীপুর	22.942477	90.841184	www.lakshmipur.gov.bd	1
8	Chattogram	চট্টগ্রাম	22.335109	91.834073	www.chittagong.gov.bd	1
9	Coxsbazar	কক্সবাজার	21.44315751	91.97381741	www.coxsbazar.gov.bd	1
10	Khagrachhari	খাগড়াছড়ি	23.119285	91.984663	www.khagrachhari.gov.bd	1
11	Bandarban	বান্দরবান	22.1953275	92.2183773	www.bandarban.gov.bd	1
12	Sirajganj	সিরাজগঞ্জ	24.4533978	89.7006815	www.sirajganj.gov.bd	2
13	Pabna	পাবনা	23.998524	89.233645	www.pabna.gov.bd	2
14	Bogura	বগুড়া	24.8465228	89.377755	www.bogra.gov.bd	2
15	Rajshahi	রাজশাহী	24.37230298	88.56307623	www.rajshahi.gov.bd	2
16	Natore	নাটোর	24.420556	89.000282	www.natore.gov.bd	2
17	Joypurhat	জয়পুরহাট	25.09636876	89.0400428	www.joypurhat.gov.bd	2
18	Chapainawabganj	চাঁপাইনবাবগঞ্জ	24.5965034	88.2775122	www.chapainawabganj.gov.bd	2
19	Naogaon	নওগাঁ	24.83256191	88.92485205	www.naogaon.gov.bd	2
20	Jashore	যশোর	23.16643	89.2081126	www.jessore.gov.bd	3
21	Satkhira	সাতক্ষীরা	22.7180905	89.0687033	www.satkhira.gov.bd	3
22	Meherpur	মেহেরপুর	23.762213	88.631821	www.meherpur.gov.bd	3
23	Narail	নড়াইল	23.172534	89.512672	www.narail.gov.bd	3
24	Chuadanga	চুয়াডাঙ্গা	23.6401961	88.841841	www.chuadanga.gov.bd	3
25	Kushtia	কুষ্টিয়া	23.901258	89.120482	www.kushtia.gov.bd	3
26	Magura	মাগুরা	23.487337	89.419956	www.magura.gov.bd	3
27	Khulna	খুলনা	22.815774	89.568679	www.khulna.gov.bd	3
28	Bagerhat	বাগেরহাট	22.651568	89.785938	www.bagerhat.gov.bd	3
29	Jhenaidah	ঝিনাইদহ	23.5448176	89.1539213	www.jhenaidah.gov.bd	3
30	Jhalakathi	ঝালকাঠি	22.6422689	90.2003932	www.jhalakathi.gov.bd	4
31	Patuakhali	পটুয়াখালী	22.3596316	90.3298712	www.patuakhali.gov.bd	4
32	Pirojpur	পিরোজপুর	22.5781398	89.9983909	www.pirojpur.gov.bd	4
33	Barisal	বরিশাল	22.7004179	90.3731568	www.barisal.gov.bd	4
34	Bhola	ভোলা	22.685923	90.648179	www.bhola.gov.bd	4
35	Barguna	বরগুনা	22.159182	90.125581	www.barguna.gov.bd	4
36	Sylhet	সিলেট	24.8897956	91.8697894	www.sylhet.gov.bd	5
37	Moulvibazar	মৌলভীবাজার	24.482934	91.777417	www.moulvibazar.gov.bd	5
38	Habiganj	হবিগঞ্জ	24.374945	91.41553	www.habiganj.gov.bd	5
39	Sunamganj	সুনামগঞ্জ	25.0658042	91.3950115	www.sunamganj.gov.bd	5
40	Narsingdi	নরসিংদী	23.932233	90.71541	www.narsingdi.gov.bd	6
41	Gazipur	গাজীপুর	24.0022858	90.4264283	www.gazipur.gov.bd	6
42	Shariatpur	শরীয়তপুর	23.2060195	90.3477725	www.shariatpur.gov.bd	6
43	Narayanganj	নারায়ণগঞ্জ	23.63366	90.496482	www.narayanganj.gov.bd	6
44	Tangail	টাঙ্গাইল	24.264145	89.918029	www.tangail.gov.bd	6
45	Kishoreganj	কিশোরগঞ্জ	24.444937	90.776575	www.kishoreganj.gov.bd	6
46	Manikganj	মানিকগঞ্জ	23.8602262	90.0018293	www.manikganj.gov.bd	6
47	Dhaka	ঢাকা	23.7115253	90.4111451	www.dhaka.gov.bd	6
48	Munshiganj	মুন্সিগঞ্জ	23.5435742	90.5354327	www.munshiganj.gov.bd	6
49	Rajbari	রাজবাড়ী	23.7574305	89.6444665	www.rajbari.gov.bd	6
50	Madaripur	মাদারীপুর	23.164102	90.1896805	www.madaripur.gov.bd	6
51	Gopalganj	গোপালগঞ্জ	23.0050857	89.8266059	www.gopalganj.gov.bd	6
52	Faridpur	ফরিদপুর	23.6070822	89.8429406	www.faridpur.gov.bd	6
53	Panchagarh	পঞ্চগড়	26.3411	88.5541606	www.panchagarh.gov.bd	7
54	Dinajpur	দিনাজপুর	25.6217061	88.6354504	www.dinajpur.gov.bd	7
55	Lalmonirhat	লালমনিরহাট	25.9165451	89.4532409	www.lalmonirhat.gov.bd	7
56	Nilphamari	নীলফামারী	25.931794	88.856006	www.nilphamari.gov.bd	7
57	Gaibandha	গাইবান্ধা	25.328751	89.528088	www.gaibandha.gov.bd	7
58	Thakurgaon	ঠাকুরগাঁও	26.0336945	88.4616834	www.thakurgaon.gov.bd	7
59	Rangpur	রংপুর	25.7558096	89.244462	www.rangpur.gov.bd	7
60	Kurigram	কুড়িগ্রাম	25.805445	89.636174	www.kurigram.gov.bd	7
61	Sherpur	শেরপুর	25.0204933	90.0152966	www.sherpur.gov.bd	8
62	Mymensingh	ময়মনসিংহ	24.746567	90.4072093	www.mymensingh.gov.bd	8
63	Jamalpur	জামালপুর	24.937533	89.937775	www.jamalpur.gov.bd	8
64	Netrokona	নেত্রকোণা	24.870955	90.727887	www.netrokona.gov.bd	8
\.


--
-- Data for Name: upazila; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public.upazila (id, name, bn_name, url, district_id) FROM stdin;
1	Debidwar	দেবিদ্বার	debidwar.comilla.gov.bd	1
2	Barura	বরুড়া	barura.comilla.gov.bd	1
3	Brahmanpara	ব্রাহ্মণপাড়া	brahmanpara.comilla.gov.bd	1
4	Chandina	চান্দিনা	chandina.comilla.gov.bd	1
5	Chauddagram	চৌদ্দগ্রাম	chauddagram.comilla.gov.bd	1
6	Daudkandi	দাউদকান্দি	daudkandi.comilla.gov.bd	1
7	Homna	হোমনা	homna.comilla.gov.bd	1
8	Laksam	লাকসাম	laksam.comilla.gov.bd	1
9	Muradnagar	মুরাদনগর	muradnagar.comilla.gov.bd	1
10	Nangalkot	নাঙ্গলকোট	nangalkot.comilla.gov.bd	1
11	Comilla Sadar	কুমিল্লা সদর	comillasadar.comilla.gov.bd	1
12	Meghna	মেঘনা	meghna.comilla.gov.bd	1
13	Monohargonj	মনোহরগঞ্জ	monohargonj.comilla.gov.bd	1
14	Sadarsouth	সদর দক্ষিণ	sadarsouth.comilla.gov.bd	1
15	Titas	তিতাস	titas.comilla.gov.bd	1
16	Burichang	বুড়িচং	burichang.comilla.gov.bd	1
17	Lalmai	লালমাই	lalmai.comilla.gov.bd	1
18	Chhagalnaiya	ছাগলনাইয়া	chhagalnaiya.feni.gov.bd	2
19	Feni Sadar	ফেনী সদর	sadar.feni.gov.bd	2
20	Sonagazi	সোনাগাজী	sonagazi.feni.gov.bd	2
21	Fulgazi	ফুলগাজী	fulgazi.feni.gov.bd	2
22	Parshuram	পরশুরাম	parshuram.feni.gov.bd	2
23	Daganbhuiyan	দাগনভূঞা	daganbhuiyan.feni.gov.bd	2
24	Brahmanbaria Sadar	ব্রাহ্মণবাড়িয়া সদর	sadar.brahmanbaria.gov.bd	3
25	Kasba	কসবা	kasba.brahmanbaria.gov.bd	3
26	Nasirnagar	নাসিরনগর	nasirnagar.brahmanbaria.gov.bd	3
27	Sarail	সরাইল	sarail.brahmanbaria.gov.bd	3
28	Ashuganj	আশুগঞ্জ	ashuganj.brahmanbaria.gov.bd	3
29	Akhaura	আখাউড়া	akhaura.brahmanbaria.gov.bd	3
30	Nabinagar	নবীনগর	nabinagar.brahmanbaria.gov.bd	3
31	Bancharampur	বাঞ্ছারামপুর	bancharampur.brahmanbaria.gov.bd	3
32	Bijoynagar	বিজয়নগর	bijoynagar.brahmanbaria.gov.bd    	3
33	Rangamati Sadar	রাঙ্গামাটি সদর	sadar.rangamati.gov.bd	4
34	Kaptai	কাপ্তাই	kaptai.rangamati.gov.bd	4
35	Kawkhali	কাউখালী	kawkhali.rangamati.gov.bd	4
36	Baghaichari	বাঘাইছড়ি	baghaichari.rangamati.gov.bd	4
37	Barkal	বরকল	barkal.rangamati.gov.bd	4
38	Langadu	লংগদু	langadu.rangamati.gov.bd	4
39	Rajasthali	রাজস্থলী	rajasthali.rangamati.gov.bd	4
40	Belaichari	বিলাইছড়ি	belaichari.rangamati.gov.bd	4
41	Juraichari	জুরাছড়ি	juraichari.rangamati.gov.bd	4
42	Naniarchar	নানিয়ারচর	naniarchar.rangamati.gov.bd	4
43	Noakhali Sadar	নোয়াখালী সদর	sadar.noakhali.gov.bd	5
44	Companiganj	কোম্পানীগঞ্জ	companiganj.noakhali.gov.bd	5
45	Begumganj	বেগমগঞ্জ	begumganj.noakhali.gov.bd	5
46	Hatia	হাতিয়া	hatia.noakhali.gov.bd	5
47	Subarnachar	সুবর্ণচর	subarnachar.noakhali.gov.bd	5
48	Kabirhat	কবিরহাট	kabirhat.noakhali.gov.bd	5
49	Senbug	সেনবাগ	senbug.noakhali.gov.bd	5
50	Chatkhil	চাটখিল	chatkhil.noakhali.gov.bd	5
51	Sonaimori	সোনাইমুড়ী	sonaimori.noakhali.gov.bd	5
52	Haimchar	হাইমচর	haimchar.chandpur.gov.bd	6
53	Kachua	কচুয়া	kachua.chandpur.gov.bd	6
54	Shahrasti	শাহরাস্তি\t	shahrasti.chandpur.gov.bd	6
55	Chandpur Sadar	চাঁদপুর সদর	sadar.chandpur.gov.bd	6
56	Matlab South	মতলব দক্ষিণ	matlabsouth.chandpur.gov.bd	6
57	Hajiganj	হাজীগঞ্জ	hajiganj.chandpur.gov.bd	6
58	Matlab North	মতলব উত্তর	matlabnorth.chandpur.gov.bd	6
59	Faridgonj	ফরিদগঞ্জ	faridgonj.chandpur.gov.bd	6
60	Lakshmipur Sadar	লক্ষ্মীপুর সদর	sadar.lakshmipur.gov.bd	7
61	Kamalnagar	কমলনগর	kamalnagar.lakshmipur.gov.bd	7
62	Raipur	রায়পুর	raipur.lakshmipur.gov.bd	7
63	Ramgati	রামগতি	ramgati.lakshmipur.gov.bd	7
64	Ramganj	রামগঞ্জ	ramganj.lakshmipur.gov.bd	7
65	Rangunia	রাঙ্গুনিয়া	rangunia.chittagong.gov.bd	8
66	Sitakunda	সীতাকুন্ড	sitakunda.chittagong.gov.bd	8
67	Mirsharai	মীরসরাই	mirsharai.chittagong.gov.bd	8
68	Patiya	পটিয়া	patiya.chittagong.gov.bd	8
69	Sandwip	সন্দ্বীপ	sandwip.chittagong.gov.bd	8
70	Banshkhali	বাঁশখালী	banshkhali.chittagong.gov.bd	8
71	Boalkhali	বোয়ালখালী	boalkhali.chittagong.gov.bd	8
72	Anwara	আনোয়ারা	anwara.chittagong.gov.bd	8
73	Chandanaish	চন্দনাইশ	chandanaish.chittagong.gov.bd	8
74	Satkania	সাতকানিয়া	satkania.chittagong.gov.bd	8
75	Lohagara	লোহাগাড়া	lohagara.chittagong.gov.bd	8
76	Hathazari	হাটহাজারী	hathazari.chittagong.gov.bd	8
77	Fatikchhari	ফটিকছড়ি	fatikchhari.chittagong.gov.bd	8
78	Raozan	রাউজান	raozan.chittagong.gov.bd	8
79	Karnafuli	কর্ণফুলী	karnafuli.chittagong.gov.bd	8
80	Coxsbazar Sadar	কক্সবাজার সদর	sadar.coxsbazar.gov.bd	9
81	Chakaria	চকরিয়া	chakaria.coxsbazar.gov.bd	9
82	Kutubdia	কুতুবদিয়া	kutubdia.coxsbazar.gov.bd	9
83	Ukhiya	উখিয়া	ukhiya.coxsbazar.gov.bd	9
84	Moheshkhali	মহেশখালী	moheshkhali.coxsbazar.gov.bd	9
85	Pekua	পেকুয়া	pekua.coxsbazar.gov.bd	9
86	Ramu	রামু	ramu.coxsbazar.gov.bd	9
87	Teknaf	টেকনাফ	teknaf.coxsbazar.gov.bd	9
88	Khagrachhari Sadar	খাগড়াছড়ি সদর	sadar.khagrachhari.gov.bd	10
89	Dighinala	দিঘীনালা	dighinala.khagrachhari.gov.bd	10
90	Panchari	পানছড়ি	panchari.khagrachhari.gov.bd	10
91	Laxmichhari	লক্ষীছড়ি	laxmichhari.khagrachhari.gov.bd	10
92	Mohalchari	মহালছড়ি	mohalchari.khagrachhari.gov.bd	10
93	Manikchari	মানিকছড়ি	manikchari.khagrachhari.gov.bd	10
94	Ramgarh	রামগড়	ramgarh.khagrachhari.gov.bd	10
95	Matiranga	মাটিরাঙ্গা	matiranga.khagrachhari.gov.bd	10
96	Guimara	গুইমারা	guimara.khagrachhari.gov.bd	10
97	Bandarban Sadar	বান্দরবান সদর	sadar.bandarban.gov.bd	11
98	Alikadam	আলীকদম	alikadam.bandarban.gov.bd	11
99	Naikhongchhari	নাইক্ষ্যংছড়ি	naikhongchhari.bandarban.gov.bd	11
100	Rowangchhari	রোয়াংছড়ি	rowangchhari.bandarban.gov.bd	11
101	Lama	লামা	lama.bandarban.gov.bd	11
102	Ruma	রুমা	ruma.bandarban.gov.bd	11
103	Thanchi	থানচি	thanchi.bandarban.gov.bd	11
104	Belkuchi	বেলকুচি	belkuchi.sirajganj.gov.bd	12
105	Chauhali	চৌহালি	chauhali.sirajganj.gov.bd	12
106	Kamarkhand	কামারখন্দ	kamarkhand.sirajganj.gov.bd	12
107	Kazipur	কাজীপুর	kazipur.sirajganj.gov.bd	12
108	Raigonj	রায়গঞ্জ	raigonj.sirajganj.gov.bd	12
109	Shahjadpur	শাহজাদপুর	shahjadpur.sirajganj.gov.bd	12
110	Sirajganj Sadar	সিরাজগঞ্জ সদর	sirajganjsadar.sirajganj.gov.bd	12
111	Tarash	তাড়াশ	tarash.sirajganj.gov.bd	12
112	Ullapara	উল্লাপাড়া	ullapara.sirajganj.gov.bd	12
113	Sujanagar	সুজানগর	sujanagar.pabna.gov.bd	13
114	Ishurdi	ঈশ্বরদী	ishurdi.pabna.gov.bd	13
115	Bhangura	ভাঙ্গুড়া	bhangura.pabna.gov.bd	13
116	Pabna Sadar	পাবনা সদর	pabnasadar.pabna.gov.bd	13
117	Bera	বেড়া	bera.pabna.gov.bd	13
118	Atghoria	আটঘরিয়া	atghoria.pabna.gov.bd	13
119	Chatmohar	চাটমোহর	chatmohar.pabna.gov.bd	13
120	Santhia	সাঁথিয়া	santhia.pabna.gov.bd	13
121	Faridpur	ফরিদপুর	faridpur.pabna.gov.bd	13
122	Kahaloo	কাহালু	kahaloo.bogra.gov.bd	14
123	Bogra Sadar	বগুড়া সদর	sadar.bogra.gov.bd	14
124	Shariakandi	সারিয়াকান্দি	shariakandi.bogra.gov.bd	14
125	Shajahanpur	শাজাহানপুর	shajahanpur.bogra.gov.bd	14
126	Dupchanchia	দুপচাচিঁয়া	dupchanchia.bogra.gov.bd	14
127	Adamdighi	আদমদিঘি	adamdighi.bogra.gov.bd	14
128	Nondigram	নন্দিগ্রাম	nondigram.bogra.gov.bd	14
129	Sonatala	সোনাতলা	sonatala.bogra.gov.bd	14
130	Dhunot	ধুনট	dhunot.bogra.gov.bd	14
131	Gabtali	গাবতলী	gabtali.bogra.gov.bd	14
132	Sherpur	শেরপুর	sherpur.bogra.gov.bd	14
133	Shibganj	শিবগঞ্জ	shibganj.bogra.gov.bd	14
134	Paba	পবা	paba.rajshahi.gov.bd	15
135	Durgapur	দুর্গাপুর	durgapur.rajshahi.gov.bd	15
136	Mohonpur	মোহনপুর	mohonpur.rajshahi.gov.bd	15
137	Charghat	চারঘাট	charghat.rajshahi.gov.bd	15
138	Puthia	পুঠিয়া	puthia.rajshahi.gov.bd	15
139	Bagha	বাঘা	bagha.rajshahi.gov.bd	15
140	Godagari	গোদাগাড়ী	godagari.rajshahi.gov.bd	15
141	Tanore	তানোর	tanore.rajshahi.gov.bd	15
142	Bagmara	বাগমারা	bagmara.rajshahi.gov.bd	15
143	Natore Sadar	নাটোর সদর	natoresadar.natore.gov.bd	16
144	Singra	সিংড়া	singra.natore.gov.bd	16
145	Baraigram	বড়াইগ্রাম	baraigram.natore.gov.bd	16
146	Bagatipara	বাগাতিপাড়া	bagatipara.natore.gov.bd	16
147	Lalpur	লালপুর	lalpur.natore.gov.bd	16
148	Gurudaspur	গুরুদাসপুর	gurudaspur.natore.gov.bd	16
149	Naldanga	নলডাঙ্গা	naldanga.natore.gov.bd	16
150	Akkelpur	আক্কেলপুর	akkelpur.joypurhat.gov.bd	17
151	Kalai	কালাই	kalai.joypurhat.gov.bd	17
152	Khetlal	ক্ষেতলাল	khetlal.joypurhat.gov.bd	17
153	Panchbibi	পাঁচবিবি	panchbibi.joypurhat.gov.bd	17
154	Joypurhat Sadar	জয়পুরহাট সদর	joypurhatsadar.joypurhat.gov.bd	17
155	Chapainawabganj Sadar	চাঁপাইনবাবগঞ্জ সদর	chapainawabganjsadar.chapainawabganj.gov.bd	18
156	Gomostapur	গোমস্তাপুর	gomostapur.chapainawabganj.gov.bd	18
157	Nachol	নাচোল	nachol.chapainawabganj.gov.bd	18
158	Bholahat	ভোলাহাট	bholahat.chapainawabganj.gov.bd	18
159	Shibganj	শিবগঞ্জ	shibganj.chapainawabganj.gov.bd	18
160	Mohadevpur	মহাদেবপুর	mohadevpur.naogaon.gov.bd	19
161	Badalgachi	বদলগাছী	badalgachi.naogaon.gov.bd	19
162	Patnitala	পত্নিতলা	patnitala.naogaon.gov.bd	19
163	Dhamoirhat	ধামইরহাট	dhamoirhat.naogaon.gov.bd	19
164	Niamatpur	নিয়ামতপুর	niamatpur.naogaon.gov.bd	19
165	Manda	মান্দা	manda.naogaon.gov.bd	19
166	Atrai	আত্রাই	atrai.naogaon.gov.bd	19
167	Raninagar	রাণীনগর	raninagar.naogaon.gov.bd	19
168	Naogaon Sadar	নওগাঁ সদর	naogaonsadar.naogaon.gov.bd	19
169	Porsha	পোরশা	porsha.naogaon.gov.bd	19
170	Sapahar	সাপাহার	sapahar.naogaon.gov.bd	19
171	Manirampur	মণিরামপুর	manirampur.jessore.gov.bd	20
172	Abhaynagar	অভয়নগর	abhaynagar.jessore.gov.bd	20
173	Bagherpara	বাঘারপাড়া	bagherpara.jessore.gov.bd	20
174	Chougachha	চৌগাছা	chougachha.jessore.gov.bd	20
175	Jhikargacha	ঝিকরগাছা	jhikargacha.jessore.gov.bd	20
176	Keshabpur	কেশবপুর	keshabpur.jessore.gov.bd	20
177	Jessore Sadar	যশোর সদর	sadar.jessore.gov.bd	20
178	Sharsha	শার্শা	sharsha.jessore.gov.bd	20
179	Assasuni	আশাশুনি	assasuni.satkhira.gov.bd	21
180	Debhata	দেবহাটা	debhata.satkhira.gov.bd	21
181	Kalaroa	কলারোয়া	kalaroa.satkhira.gov.bd	21
182	Satkhira Sadar	সাতক্ষীরা সদর	satkhirasadar.satkhira.gov.bd	21
183	Shyamnagar	শ্যামনগর	shyamnagar.satkhira.gov.bd	21
184	Tala	তালা	tala.satkhira.gov.bd	21
185	Kaliganj	কালিগঞ্জ	kaliganj.satkhira.gov.bd	21
186	Mujibnagar	মুজিবনগর	mujibnagar.meherpur.gov.bd	22
187	Meherpur Sadar	মেহেরপুর সদর	meherpursadar.meherpur.gov.bd	22
188	Gangni	গাংনী	gangni.meherpur.gov.bd	22
189	Narail Sadar	নড়াইল সদর	narailsadar.narail.gov.bd	23
190	Lohagara	লোহাগড়া	lohagara.narail.gov.bd	23
191	Kalia	কালিয়া	kalia.narail.gov.bd	23
192	Chuadanga Sadar	চুয়াডাঙ্গা সদর	chuadangasadar.chuadanga.gov.bd	24
193	Alamdanga	আলমডাঙ্গা	alamdanga.chuadanga.gov.bd	24
194	Damurhuda	দামুড়হুদা	damurhuda.chuadanga.gov.bd	24
195	Jibannagar	জীবননগর	jibannagar.chuadanga.gov.bd	24
196	Kushtia Sadar	কুষ্টিয়া সদর	kushtiasadar.kushtia.gov.bd	25
197	Kumarkhali	কুমারখালী	kumarkhali.kushtia.gov.bd	25
198	Khoksa	খোকসা	khoksa.kushtia.gov.bd	25
199	Mirpur	মিরপুর	mirpurkushtia.kushtia.gov.bd	25
200	Daulatpur	দৌলতপুর	daulatpur.kushtia.gov.bd	25
201	Bheramara	ভেড়ামারা	bheramara.kushtia.gov.bd	25
202	Shalikha	শালিখা	shalikha.magura.gov.bd	26
203	Sreepur	শ্রীপুর	sreepur.magura.gov.bd	26
204	Magura Sadar	মাগুরা সদর	magurasadar.magura.gov.bd	26
205	Mohammadpur	মহম্মদপুর	mohammadpur.magura.gov.bd	26
206	Paikgasa	পাইকগাছা	paikgasa.khulna.gov.bd	27
207	Fultola	ফুলতলা	fultola.khulna.gov.bd	27
208	Digholia	দিঘলিয়া	digholia.khulna.gov.bd	27
209	Rupsha	রূপসা	rupsha.khulna.gov.bd	27
210	Terokhada	তেরখাদা	terokhada.khulna.gov.bd	27
211	Dumuria	ডুমুরিয়া	dumuria.khulna.gov.bd	27
212	Botiaghata	বটিয়াঘাটা	botiaghata.khulna.gov.bd	27
213	Dakop	দাকোপ	dakop.khulna.gov.bd	27
214	Koyra	কয়রা	koyra.khulna.gov.bd	27
215	Fakirhat	ফকিরহাট	fakirhat.bagerhat.gov.bd	28
216	Bagerhat Sadar	বাগেরহাট সদর	sadar.bagerhat.gov.bd	28
217	Mollahat	মোল্লাহাট	mollahat.bagerhat.gov.bd	28
218	Sarankhola	শরণখোলা	sarankhola.bagerhat.gov.bd	28
219	Rampal	রামপাল	rampal.bagerhat.gov.bd	28
220	Morrelganj	মোড়েলগঞ্জ	morrelganj.bagerhat.gov.bd	28
221	Kachua	কচুয়া	kachua.bagerhat.gov.bd	28
222	Mongla	মোংলা	mongla.bagerhat.gov.bd	28
223	Chitalmari	চিতলমারী	chitalmari.bagerhat.gov.bd	28
224	Jhenaidah Sadar	ঝিনাইদহ সদর	sadar.jhenaidah.gov.bd	29
225	Shailkupa	শৈলকুপা	shailkupa.jhenaidah.gov.bd	29
226	Harinakundu	হরিণাকুন্ডু	harinakundu.jhenaidah.gov.bd	29
227	Kaliganj	কালীগঞ্জ	kaliganj.jhenaidah.gov.bd	29
228	Kotchandpur	কোটচাঁদপুর	kotchandpur.jhenaidah.gov.bd	29
229	Moheshpur	মহেশপুর	moheshpur.jhenaidah.gov.bd	29
230	Jhalakathi Sadar	ঝালকাঠি সদর	sadar.jhalakathi.gov.bd	30
231	Kathalia	কাঠালিয়া	kathalia.jhalakathi.gov.bd	30
232	Nalchity	নলছিটি	nalchity.jhalakathi.gov.bd	30
233	Rajapur	রাজাপুর	rajapur.jhalakathi.gov.bd	30
234	Bauphal	বাউফল	bauphal.patuakhali.gov.bd	31
235	Patuakhali Sadar	পটুয়াখালী সদর	sadar.patuakhali.gov.bd	31
236	Dumki	দুমকি	dumki.patuakhali.gov.bd	31
237	Dashmina	দশমিনা	dashmina.patuakhali.gov.bd	31
238	Kalapara	কলাপাড়া	kalapara.patuakhali.gov.bd	31
239	Mirzaganj	মির্জাগঞ্জ	mirzaganj.patuakhali.gov.bd	31
240	Galachipa	গলাচিপা	galachipa.patuakhali.gov.bd	31
241	Rangabali	রাঙ্গাবালী	rangabali.patuakhali.gov.bd	31
242	Pirojpur Sadar	পিরোজপুর সদর	sadar.pirojpur.gov.bd	32
243	Nazirpur	নাজিরপুর	nazirpur.pirojpur.gov.bd	32
244	Kawkhali	কাউখালী	kawkhali.pirojpur.gov.bd	32
245	Zianagar	জিয়ানগর	zianagar.pirojpur.gov.bd	32
246	Bhandaria	ভান্ডারিয়া	bhandaria.pirojpur.gov.bd	32
247	Mathbaria	মঠবাড়ীয়া	mathbaria.pirojpur.gov.bd	32
248	Nesarabad	নেছারাবাদ	nesarabad.pirojpur.gov.bd	32
249	Barisal Sadar	বরিশাল সদর	barisalsadar.barisal.gov.bd	33
250	Bakerganj	বাকেরগঞ্জ	bakerganj.barisal.gov.bd	33
251	Babuganj	বাবুগঞ্জ	babuganj.barisal.gov.bd	33
252	Wazirpur	উজিরপুর	wazirpur.barisal.gov.bd	33
253	Banaripara	বানারীপাড়া	banaripara.barisal.gov.bd	33
254	Gournadi	গৌরনদী	gournadi.barisal.gov.bd	33
255	Agailjhara	আগৈলঝাড়া	agailjhara.barisal.gov.bd	33
256	Mehendiganj	মেহেন্দিগঞ্জ	mehendiganj.barisal.gov.bd	33
257	Muladi	মুলাদী	muladi.barisal.gov.bd	33
258	Hizla	হিজলা	hizla.barisal.gov.bd	33
259	Bhola Sadar	ভোলা সদর	sadar.bhola.gov.bd	34
260	Borhan Sddin	বোরহান উদ্দিন	borhanuddin.bhola.gov.bd	34
261	Charfesson	চরফ্যাশন	charfesson.bhola.gov.bd	34
262	Doulatkhan	দৌলতখান	doulatkhan.bhola.gov.bd	34
263	Monpura	মনপুরা	monpura.bhola.gov.bd	34
264	Tazumuddin	তজুমদ্দিন	tazumuddin.bhola.gov.bd	34
265	Lalmohan	লালমোহন	lalmohan.bhola.gov.bd	34
266	Amtali	আমতলী	amtali.barguna.gov.bd	35
267	Barguna Sadar	বরগুনা সদর	sadar.barguna.gov.bd	35
268	Betagi	বেতাগী	betagi.barguna.gov.bd	35
269	Bamna	বামনা	bamna.barguna.gov.bd	35
270	Pathorghata	পাথরঘাটা	pathorghata.barguna.gov.bd	35
271	Taltali	তালতলি	taltali.barguna.gov.bd	35
272	Balaganj	বালাগঞ্জ	balaganj.sylhet.gov.bd	36
273	Beanibazar	বিয়ানীবাজার	beanibazar.sylhet.gov.bd	36
274	Bishwanath	বিশ্বনাথ	bishwanath.sylhet.gov.bd	36
275	Companiganj	কোম্পানীগঞ্জ	companiganj.sylhet.gov.bd	36
276	Fenchuganj	ফেঞ্চুগঞ্জ	fenchuganj.sylhet.gov.bd	36
277	Golapganj	গোলাপগঞ্জ	golapganj.sylhet.gov.bd	36
278	Gowainghat	গোয়াইনঘাট	gowainghat.sylhet.gov.bd	36
279	Jaintiapur	জৈন্তাপুর	jaintiapur.sylhet.gov.bd	36
280	Kanaighat	কানাইঘাট	kanaighat.sylhet.gov.bd	36
281	Sylhet Sadar	সিলেট সদর	sylhetsadar.sylhet.gov.bd	36
282	Zakiganj	জকিগঞ্জ	zakiganj.sylhet.gov.bd	36
283	Dakshinsurma	দক্ষিণ সুরমা	dakshinsurma.sylhet.gov.bd	36
284	Osmaninagar	ওসমানী নগর	osmaninagar.sylhet.gov.bd	36
285	Barlekha	বড়লেখা	barlekha.moulvibazar.gov.bd	37
286	Kamolganj	কমলগঞ্জ	kamolganj.moulvibazar.gov.bd	37
287	Kulaura	কুলাউড়া	kulaura.moulvibazar.gov.bd	37
288	Moulvibazar Sadar	মৌলভীবাজার সদর	moulvibazarsadar.moulvibazar.gov.bd	37
289	Rajnagar	রাজনগর	rajnagar.moulvibazar.gov.bd	37
290	Sreemangal	শ্রীমঙ্গল	sreemangal.moulvibazar.gov.bd	37
291	Juri	জুড়ী	juri.moulvibazar.gov.bd	37
292	Nabiganj	নবীগঞ্জ	nabiganj.habiganj.gov.bd	38
293	Bahubal	বাহুবল	bahubal.habiganj.gov.bd	38
294	Ajmiriganj	আজমিরীগঞ্জ	ajmiriganj.habiganj.gov.bd	38
295	Baniachong	বানিয়াচং	baniachong.habiganj.gov.bd	38
296	Lakhai	লাখাই	lakhai.habiganj.gov.bd	38
297	Chunarughat	চুনারুঘাট	chunarughat.habiganj.gov.bd	38
298	Habiganj Sadar	হবিগঞ্জ সদর	habiganjsadar.habiganj.gov.bd	38
299	Madhabpur	মাধবপুর	madhabpur.habiganj.gov.bd	38
300	Sunamganj Sadar	সুনামগঞ্জ সদর	sadar.sunamganj.gov.bd	39
301	South Sunamganj	দক্ষিণ সুনামগঞ্জ	southsunamganj.sunamganj.gov.bd	39
302	Bishwambarpur	বিশ্বম্ভরপুর	bishwambarpur.sunamganj.gov.bd	39
303	Chhatak	ছাতক	chhatak.sunamganj.gov.bd	39
304	Jagannathpur	জগন্নাথপুর	jagannathpur.sunamganj.gov.bd	39
305	Dowarabazar	দোয়ারাবাজার	dowarabazar.sunamganj.gov.bd	39
306	Tahirpur	তাহিরপুর	tahirpur.sunamganj.gov.bd	39
307	Dharmapasha	ধর্মপাশা	dharmapasha.sunamganj.gov.bd	39
308	Jamalganj	জামালগঞ্জ	jamalganj.sunamganj.gov.bd	39
309	Shalla	শাল্লা	shalla.sunamganj.gov.bd	39
310	Derai	দিরাই	derai.sunamganj.gov.bd	39
311	Belabo	বেলাবো	belabo.narsingdi.gov.bd	40
312	Monohardi	মনোহরদী	monohardi.narsingdi.gov.bd	40
313	Narsingdi Sadar	নরসিংদী সদর	narsingdisadar.narsingdi.gov.bd	40
314	Palash	পলাশ	palash.narsingdi.gov.bd	40
315	Raipura	রায়পুরা	raipura.narsingdi.gov.bd	40
316	Shibpur	শিবপুর	shibpur.narsingdi.gov.bd	40
317	Kaliganj	কালীগঞ্জ	kaliganj.gazipur.gov.bd	41
318	Kaliakair	কালিয়াকৈর	kaliakair.gazipur.gov.bd	41
319	Kapasia	কাপাসিয়া	kapasia.gazipur.gov.bd	41
320	Gazipur Sadar	গাজীপুর সদর	sadar.gazipur.gov.bd	41
321	Sreepur	শ্রীপুর	sreepur.gazipur.gov.bd	41
322	Shariatpur Sadar	শরিয়তপুর সদর	sadar.shariatpur.gov.bd	42
323	Naria	নড়িয়া	naria.shariatpur.gov.bd	42
324	Zajira	জাজিরা	zajira.shariatpur.gov.bd	42
325	Gosairhat	গোসাইরহাট	gosairhat.shariatpur.gov.bd	42
326	Bhedarganj	ভেদরগঞ্জ	bhedarganj.shariatpur.gov.bd	42
327	Damudya	ডামুড্যা	damudya.shariatpur.gov.bd	42
328	Araihazar	আড়াইহাজার	araihazar.narayanganj.gov.bd	43
329	Bandar	বন্দর	bandar.narayanganj.gov.bd	43
330	Narayanganj Sadar	নারায়নগঞ্জ সদর	narayanganjsadar.narayanganj.gov.bd	43
331	Rupganj	রূপগঞ্জ	rupganj.narayanganj.gov.bd	43
332	Sonargaon	সোনারগাঁ	sonargaon.narayanganj.gov.bd	43
333	Basail	বাসাইল	basail.tangail.gov.bd	44
334	Bhuapur	ভুয়াপুর	bhuapur.tangail.gov.bd	44
335	Delduar	দেলদুয়ার	delduar.tangail.gov.bd	44
336	Ghatail	ঘাটাইল	ghatail.tangail.gov.bd	44
337	Gopalpur	গোপালপুর	gopalpur.tangail.gov.bd	44
338	Madhupur	মধুপুর	madhupur.tangail.gov.bd	44
339	Mirzapur	মির্জাপুর	mirzapur.tangail.gov.bd	44
340	Nagarpur	নাগরপুর	nagarpur.tangail.gov.bd	44
341	Sakhipur	সখিপুর	sakhipur.tangail.gov.bd	44
342	Tangail Sadar	টাঙ্গাইল সদর	tangailsadar.tangail.gov.bd	44
343	Kalihati	কালিহাতী	kalihati.tangail.gov.bd	44
344	Dhanbari	ধনবাড়ী	dhanbari.tangail.gov.bd	44
345	Itna	ইটনা	itna.kishoreganj.gov.bd	45
346	Katiadi	কটিয়াদী	katiadi.kishoreganj.gov.bd	45
347	Bhairab	ভৈরব	bhairab.kishoreganj.gov.bd	45
348	Tarail	তাড়াইল	tarail.kishoreganj.gov.bd	45
349	Hossainpur	হোসেনপুর	hossainpur.kishoreganj.gov.bd	45
350	Pakundia	পাকুন্দিয়া	pakundia.kishoreganj.gov.bd	45
351	Kuliarchar	কুলিয়ারচর	kuliarchar.kishoreganj.gov.bd	45
352	Kishoreganj Sadar	কিশোরগঞ্জ সদর	kishoreganjsadar.kishoreganj.gov.bd	45
353	Karimgonj	করিমগঞ্জ	karimgonj.kishoreganj.gov.bd	45
354	Bajitpur	বাজিতপুর	bajitpur.kishoreganj.gov.bd	45
355	Austagram	অষ্টগ্রাম	austagram.kishoreganj.gov.bd	45
356	Mithamoin	মিঠামইন	mithamoin.kishoreganj.gov.bd	45
357	Nikli	নিকলী	nikli.kishoreganj.gov.bd	45
358	Harirampur	হরিরামপুর	harirampur.manikganj.gov.bd	46
359	Saturia	সাটুরিয়া	saturia.manikganj.gov.bd	46
360	Manikganj Sadar	মানিকগঞ্জ সদর	sadar.manikganj.gov.bd	46
361	Gior	ঘিওর	gior.manikganj.gov.bd	46
362	Shibaloy	শিবালয়	shibaloy.manikganj.gov.bd	46
363	Doulatpur	দৌলতপুর	doulatpur.manikganj.gov.bd	46
364	Singiar	সিংগাইর	singiar.manikganj.gov.bd	46
365	Savar	সাভার	savar.dhaka.gov.bd	47
366	Dhamrai	ধামরাই	dhamrai.dhaka.gov.bd	47
367	Keraniganj	কেরাণীগঞ্জ	keraniganj.dhaka.gov.bd	47
368	Nawabganj	নবাবগঞ্জ	nawabganj.dhaka.gov.bd	47
369	Dohar	দোহার	dohar.dhaka.gov.bd	47
370	Munshiganj Sadar	মুন্সিগঞ্জ সদর	sadar.munshiganj.gov.bd	48
371	Sreenagar	শ্রীনগর	sreenagar.munshiganj.gov.bd	48
372	Sirajdikhan	সিরাজদিখান	sirajdikhan.munshiganj.gov.bd	48
373	Louhajanj	লৌহজং	louhajanj.munshiganj.gov.bd	48
374	Gajaria	গজারিয়া	gajaria.munshiganj.gov.bd	48
375	Tongibari	টংগীবাড়ি	tongibari.munshiganj.gov.bd	48
376	Rajbari Sadar	রাজবাড়ী সদর	sadar.rajbari.gov.bd	49
377	Goalanda	গোয়ালন্দ	goalanda.rajbari.gov.bd	49
378	Pangsa	পাংশা	pangsa.rajbari.gov.bd	49
379	Baliakandi	বালিয়াকান্দি	baliakandi.rajbari.gov.bd	49
380	Kalukhali	কালুখালী	kalukhali.rajbari.gov.bd	49
381	Madaripur Sadar	মাদারীপুর সদর	sadar.madaripur.gov.bd	50
382	Shibchar	শিবচর	shibchar.madaripur.gov.bd	50
383	Kalkini	কালকিনি	kalkini.madaripur.gov.bd	50
384	Rajoir	রাজৈর	rajoir.madaripur.gov.bd	50
385	Gopalganj Sadar	গোপালগঞ্জ সদর	sadar.gopalganj.gov.bd	51
386	Kashiani	কাশিয়ানী	kashiani.gopalganj.gov.bd	51
387	Tungipara	টুংগীপাড়া	tungipara.gopalganj.gov.bd	51
388	Kotalipara	কোটালীপাড়া	kotalipara.gopalganj.gov.bd	51
389	Muksudpur	মুকসুদপুর	muksudpur.gopalganj.gov.bd	51
390	Faridpur Sadar	ফরিদপুর সদর	sadar.faridpur.gov.bd	52
391	Alfadanga	আলফাডাঙ্গা	alfadanga.faridpur.gov.bd	52
392	Boalmari	বোয়ালমারী	boalmari.faridpur.gov.bd	52
393	Sadarpur	সদরপুর	sadarpur.faridpur.gov.bd	52
394	Nagarkanda	নগরকান্দা	nagarkanda.faridpur.gov.bd	52
395	Bhanga	ভাঙ্গা	bhanga.faridpur.gov.bd	52
396	Charbhadrasan	চরভদ্রাসন	charbhadrasan.faridpur.gov.bd	52
397	Madhukhali	মধুখালী	madhukhali.faridpur.gov.bd	52
398	Saltha	সালথা	saltha.faridpur.gov.bd	52
399	Panchagarh Sadar	পঞ্চগড় সদর	panchagarhsadar.panchagarh.gov.bd	53
400	Debiganj	দেবীগঞ্জ	debiganj.panchagarh.gov.bd	53
401	Boda	বোদা	boda.panchagarh.gov.bd	53
402	Atwari	আটোয়ারী	atwari.panchagarh.gov.bd	53
403	Tetulia	তেতুলিয়া	tetulia.panchagarh.gov.bd	53
404	Nawabganj	নবাবগঞ্জ	nawabganj.dinajpur.gov.bd	54
405	Birganj	বীরগঞ্জ	birganj.dinajpur.gov.bd	54
406	Ghoraghat	ঘোড়াঘাট	ghoraghat.dinajpur.gov.bd	54
407	Birampur	বিরামপুর	birampur.dinajpur.gov.bd	54
408	Parbatipur	পার্বতীপুর	parbatipur.dinajpur.gov.bd	54
409	Bochaganj	বোচাগঞ্জ	bochaganj.dinajpur.gov.bd	54
410	Kaharol	কাহারোল	kaharol.dinajpur.gov.bd	54
411	Fulbari	ফুলবাড়ী	fulbari.dinajpur.gov.bd	54
412	Dinajpur Sadar	দিনাজপুর সদর	dinajpursadar.dinajpur.gov.bd	54
413	Hakimpur	হাকিমপুর	hakimpur.dinajpur.gov.bd	54
414	Khansama	খানসামা	khansama.dinajpur.gov.bd	54
415	Birol	বিরল	birol.dinajpur.gov.bd	54
416	Chirirbandar	চিরিরবন্দর	chirirbandar.dinajpur.gov.bd	54
417	Lalmonirhat Sadar	লালমনিরহাট সদর	sadar.lalmonirhat.gov.bd	55
418	Kaliganj	কালীগঞ্জ	kaliganj.lalmonirhat.gov.bd	55
419	Hatibandha	হাতীবান্ধা	hatibandha.lalmonirhat.gov.bd	55
420	Patgram	পাটগ্রাম	patgram.lalmonirhat.gov.bd	55
421	Aditmari	আদিতমারী	aditmari.lalmonirhat.gov.bd	55
422	Syedpur	সৈয়দপুর	syedpur.nilphamari.gov.bd	56
423	Domar	ডোমার	domar.nilphamari.gov.bd	56
424	Dimla	ডিমলা	dimla.nilphamari.gov.bd	56
425	Jaldhaka	জলঢাকা	jaldhaka.nilphamari.gov.bd	56
426	Kishorganj	কিশোরগঞ্জ	kishorganj.nilphamari.gov.bd	56
427	Nilphamari Sadar	নীলফামারী সদর	nilphamarisadar.nilphamari.gov.bd	56
428	Sadullapur	সাদুল্লাপুর	sadullapur.gaibandha.gov.bd	57
429	Gaibandha Sadar	গাইবান্ধা সদর	gaibandhasadar.gaibandha.gov.bd	57
430	Palashbari	পলাশবাড়ী	palashbari.gaibandha.gov.bd	57
431	Saghata	সাঘাটা	saghata.gaibandha.gov.bd	57
432	Gobindaganj	গোবিন্দগঞ্জ	gobindaganj.gaibandha.gov.bd	57
433	Sundarganj	সুন্দরগঞ্জ	sundarganj.gaibandha.gov.bd	57
434	Phulchari	ফুলছড়ি	phulchari.gaibandha.gov.bd	57
435	Thakurgaon Sadar	ঠাকুরগাঁও সদর	thakurgaonsadar.thakurgaon.gov.bd	58
436	Pirganj	পীরগঞ্জ	pirganj.thakurgaon.gov.bd	58
437	Ranisankail	রাণীশংকৈল	ranisankail.thakurgaon.gov.bd	58
438	Haripur	হরিপুর	haripur.thakurgaon.gov.bd	58
439	Baliadangi	বালিয়াডাঙ্গী	baliadangi.thakurgaon.gov.bd	58
440	Rangpur Sadar	রংপুর সদর	rangpursadar.rangpur.gov.bd	59
441	Gangachara	গংগাচড়া	gangachara.rangpur.gov.bd	59
442	Taragonj	তারাগঞ্জ	taragonj.rangpur.gov.bd	59
443	Badargonj	বদরগঞ্জ	badargonj.rangpur.gov.bd	59
444	Mithapukur	মিঠাপুকুর	mithapukur.rangpur.gov.bd	59
445	Pirgonj	পীরগঞ্জ	pirgonj.rangpur.gov.bd	59
446	Kaunia	কাউনিয়া	kaunia.rangpur.gov.bd	59
447	Pirgacha	পীরগাছা	pirgacha.rangpur.gov.bd	59
448	Kurigram Sadar	কুড়িগ্রাম সদর	kurigramsadar.kurigram.gov.bd	60
449	Nageshwari	নাগেশ্বরী	nageshwari.kurigram.gov.bd	60
450	Bhurungamari	ভুরুঙ্গামারী	bhurungamari.kurigram.gov.bd	60
451	Phulbari	ফুলবাড়ী	phulbari.kurigram.gov.bd	60
452	Rajarhat	রাজারহাট	rajarhat.kurigram.gov.bd	60
453	Ulipur	উলিপুর	ulipur.kurigram.gov.bd	60
454	Chilmari	চিলমারী	chilmari.kurigram.gov.bd	60
455	Rowmari	রৌমারী	rowmari.kurigram.gov.bd	60
456	Charrajibpur	চর রাজিবপুর	charrajibpur.kurigram.gov.bd	60
457	Sherpur Sadar	শেরপুর সদর	sherpursadar.sherpur.gov.bd	61
458	Nalitabari	নালিতাবাড়ী	nalitabari.sherpur.gov.bd	61
459	Sreebordi	শ্রীবরদী	sreebordi.sherpur.gov.bd	61
460	Nokla	নকলা	nokla.sherpur.gov.bd	61
461	Jhenaigati	ঝিনাইগাতী	jhenaigati.sherpur.gov.bd	61
462	Fulbaria	ফুলবাড়ীয়া	fulbaria.mymensingh.gov.bd	62
463	Trishal	ত্রিশাল	trishal.mymensingh.gov.bd	62
464	Bhaluka	ভালুকা	bhaluka.mymensingh.gov.bd	62
465	Muktagacha	মুক্তাগাছা	muktagacha.mymensingh.gov.bd	62
466	Mymensingh Sadar	ময়মনসিংহ সদর	mymensinghsadar.mymensingh.gov.bd	62
467	Dhobaura	ধোবাউড়া	dhobaura.mymensingh.gov.bd	62
468	Phulpur	ফুলপুর	phulpur.mymensingh.gov.bd	62
469	Haluaghat	হালুয়াঘাট	haluaghat.mymensingh.gov.bd	62
470	Gouripur	গৌরীপুর	gouripur.mymensingh.gov.bd	62
471	Gafargaon	গফরগাঁও	gafargaon.mymensingh.gov.bd	62
472	Iswarganj	ঈশ্বরগঞ্জ	iswarganj.mymensingh.gov.bd	62
473	Nandail	নান্দাইল	nandail.mymensingh.gov.bd	62
474	Tarakanda	তারাকান্দা	tarakanda.mymensingh.gov.bd	62
475	Jamalpur Sadar	জামালপুর সদর	jamalpursadar.jamalpur.gov.bd	63
476	Melandah	মেলান্দহ	melandah.jamalpur.gov.bd	63
477	Islampur	ইসলামপুর	islampur.jamalpur.gov.bd	63
478	Dewangonj	দেওয়ানগঞ্জ	dewangonj.jamalpur.gov.bd	63
479	Sarishabari	সরিষাবাড়ী	sarishabari.jamalpur.gov.bd	63
480	Madarganj	মাদারগঞ্জ	madarganj.jamalpur.gov.bd	63
481	Bokshiganj	বকশীগঞ্জ	bokshiganj.jamalpur.gov.bd	63
482	Barhatta	বারহাট্টা	barhatta.netrokona.gov.bd	64
483	Durgapur	দুর্গাপুর	durgapur.netrokona.gov.bd	64
484	Kendua	কেন্দুয়া	kendua.netrokona.gov.bd	64
485	Atpara	আটপাড়া	atpara.netrokona.gov.bd	64
486	Madan	মদন	madan.netrokona.gov.bd	64
487	Khaliajuri	খালিয়াজুরী	khaliajuri.netrokona.gov.bd	64
488	Kalmakanda	কলমাকান্দা	kalmakanda.netrokona.gov.bd	64
489	Mohongonj	মোহনগঞ্জ	mohongonj.netrokona.gov.bd	64
490	Purbadhala	পূর্বধলা	purbadhala.netrokona.gov.bd	64
491	Netrokona Sadar	নেত্রকোণা সদর	netrokonasadar.netrokona.gov.bd	64
492	Eidgaon	ঈদগাঁও	null	9
493	Madhyanagar	মধ্যনগর	null	39
494	Dasar	ডাসার	null	50
\.


--
-- Data for Name: union; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public."union" (id, name, bn_name, url, upazila_id) FROM stdin;
536	Durgapur	দূর্গাপুর	durgapurup.chandpur.gov.bd	58
537	Kalakanda	কালাকান্দা	kalakandaup.chandpur.gov.bd	58
538	Mohanpur	মোহনপুর	mohanpurup.chandpur.gov.bd	58
539	Eklaspur	এখলাছপুর	eklaspurup.chandpur.gov.bd	58
541	Fatehpur (East)	ফতেহপুর (পূর্ব)	eastfatehpur.chandpur.gov.bd	58
542	Fatehpur (West)	ফতেহপুর (পশ্চিম)	westfatehpurup.chandpur.gov.bd	58
544	Islamabad	ইসলামাবাদ	islamabadup.chandpur.gov.bd	58
545	Sultanabad	সুলতানাবাদ	sultanabadup.chandpur.gov.bd	58
546	Gazra	গজরা	gazraup.chandpur.gov.bd	58
547	Balithuba (West)	বালিথুবা (পশ্চিম)	balithubawestup.chandpur.gov.bd	59
548	Balithuba (East)	বালিথুবা (পূর্ব)	balithubaeastup.chandpur.gov.bd	59
549	Subidpur (East)	সুবিদপুর (পূর্ব)	subidpureastup.chandpur.gov.bd	59
551	Gupti (West)	গুপ্তি (পশ্চিম)	guptiwestup.chandpur.gov.bd	59
552	Gupti (East)	গুপ্তি (পূর্ব)	guptieastup.chandpur.gov.bd	59
553	Paikpara (North)	পাইকপাড়া (উত্তর)	paikparanorthup.chandpur.gov.bd	59
554	Paikpara (South)	পাইকপাড়া (দক্ষিণ)	paikparasouthup.chandpur.gov.bd	59
556	Gobindapur (South)	গবিন্দপুর (দক্ষিণ)	gobindapursouthup.chandpur.gov.bd	59
557	Chardukhia (East)	চরদুখিয়া (পূর্ব)	chardukhiaeastup.chandpur.gov.bd	59
559	Faridgonj (South)	ফরিদ্গঞ্জ (দক্ষিণ)	faridgonjsouthup.chandpur.gov.bd	59
560	Rupsha (South)	রুপসা (দক্ষিণ)	rupshasouthup.chandpur.gov.bd	59
561	Rupsha (North)	রুপসা (উত্তর)	rupshanorthup.chandpur.gov.bd	59
563	Hamsadi (South)	হামছাদী (দক্ষিন)	southhamsadiup.lakshmipur.gov.bd	60
564	Dalalbazar	দালাল বাজার	dalalbazarup.lakshmipur.gov.bd	60
565	Charruhita	চররুহিতা	charruhitaup.lakshmipur.gov.bd	60
566	Parbotinagar	পার্বতীনগর	parbotinagarup.lakshmipur.gov.bd	60
567	Bangakha	বাঙ্গাখাঁ	bangakhaup.lakshmipur.gov.bd	60
568	Dattapara	দত্তপাড়া	dattaparaup.lakshmipur.gov.bd	60
569	Basikpur	বশিকপুর	basikpurup.lakshmipur.gov.bd	60
571	Nourthjoypur	উত্তর জয়পুর	nourthjoypurup.lakshmipur.gov.bd	60
572	Hazirpara	হাজিরপাড়া	hazirparaup.lakshmipur.gov.bd	60
573	Charshahi	চরশাহী	charshahiup.lakshmipur.gov.bd	60
574	Digli	দিঘলী	digliup.lakshmipur.gov.bd	60
575	Laharkandi	লাহারকান্দি	laharkandiup.lakshmipur.gov.bd	60
576	Vobanigonj	ভবানীগঞ্জ	vobanigonjup.lakshmipur.gov.bd	60
577	Kusakhali	কুশাখালী	kusakhaliup.lakshmipur.gov.bd	60
578	Sakchor	শাকচর	sakchorup.lakshmipur.gov.bd	60
579	Tearigonj	তেয়ারীগঞ্জ	tearigonjup.lakshmipur.gov.bd	60
580	Tumchor	টুমচর	tumchorup.lakshmipur.gov.bd	60
582	Charkalkini	চর কালকিনি	charkalkiniup.lakshmipur.gov.bd	61
583	Shaheberhat	সাহেবেরহাট	shaheberhatup.lakshmipur.gov.bd	61
584	Char Martin	চর মার্টিন	charmartinup.lakshmipur.gov.bd	61
585	Char Folcon	চর ফলকন	charfolconup.lakshmipur.gov.bd	61
586	Patarirhat	পাটারীরহাট	patarirhatup.lakshmipur.gov.bd	61
890	Kabakhali	কবাখালী	kabakhaliup.khagrachhari.gov.bd	89
891	Dighinala	দিঘীনালা	dighinalaup.khagrachhari.gov.bd	89
892	Babuchara	বাবুছড়া	babucharaup.khagrachhari.gov.bd	89
893	Logang	লোগাং	logangup.khagrachhari.gov.bd	90
894	Changi	চেংগী	changiup.khagrachhari.gov.bd	90
895	Panchari	পানছড়ি	panchariup.khagrachhari.gov.bd	90
896	Latiban	লতিবান	latibanup.khagrachhari.gov.bd	90
897	Dullyatali	দুল্যাতলী	dullyataliup.khagrachhari.gov.bd	91
898	Barmachari	বর্মাছড়ি	barmachariup.khagrachhari.gov.bd	91
900	Bhaibonchara	ভাইবোনছড়া	bhaiboncharaup.khagrachhari.gov.bd	92
901	Mahalchari	মহালছড়ি	mahalchariup.khagrachhari.gov.bd	92
902	Mobachari	মুবাছড়ি	mobachariup.khagrachhari.gov.bd	92
903	Kayanghat	ক্যায়াংঘাট	kayanghatup.khagrachhari.gov.bd	92
904	Maischari	মাইসছড়ি	maischariup.khagrachhari.gov.bd	92
905	Manikchari	মানিকছড়ি	manikchariup.khagrachhari.gov.bd	93
906	Batnatali	বাটনাতলী	batnataliup.khagrachhari.gov.bd	93
907	Jogyachola	যোগ্যছোলা	jogyacholaup.khagrachhari.gov.bd	93
908	Tintahari	তিনটহরী	tintahariup.khagrachhari.gov.bd	93
909	Ramgarh	রামগড়	ramgarhup.khagrachhari.gov.bd	94
910	Patachara	পাতাছড়া	patacharaup.khagrachhari.gov.bd	94
911	Hafchari	হাফছড়ি	hafchariup.khagrachhari.gov.bd	94
912	Taindong	তাইন্দং	taindongup.khagrachhari.gov.bd	95
913	Tabalchari	তবলছড়ি	tabalchariup.khagrachhari.gov.bd	95
1768	Uthali	উথলী	uthaliup.chuadanga.gov.bd	195
3307	Suvadda	শুভাঢ্যা	suvaddaup.dhaka.gov.bd	367
3308	Taghoria	তেঘরিয়া	taghoriaup.dhaka.gov.bd	367
534	Banganbari	বাগানবাড়ী	banganbariup.chandpur.gov.bd	58
592	North Char Bangshi	উত্তর চর বংশী	northcharbangshiup.lakshmipur.gov.bd	62
594	Sonapur	সোনাপুর	sonapurup.lakshmipur.gov.bd	62
595	Charpata	চর পাতা	charpataup.lakshmipur.gov.bd	62
596	Bamni	বামনী	bamniup.lakshmipur.gov.bd	62
597	South Char Bangshi	দক্ষিন চর বংশী	southcharbangshiup.lakshmipur.gov.bd	62
599	Raipur	রায়পুর	raipurup.lakshmipur.gov.bd	62
600	Keora	কেরোয়া	keoraup.lakshmipur.gov.bd	62
601	Char Poragacha	চর পোড়াগাছা	charporagachaup.lakshmipur.gov.bd	63
602	Charbadam	চর বাদাম	charbadamup.lakshmipur.gov.bd	63
603	Char Abdullah	চর আবদুল্যাহ	charabdullahup.lakshmipur.gov.bd	63
604	Alxendar	আলেকজান্ডার	alxendarup.lakshmipur.gov.bd	63
605	Char Algi	চর আলগী	charalgiup.lakshmipur.gov.bd	63
606	Char Ramiz	চর রমিজ	charramizup.lakshmipur.gov.bd	63
607	Borokheri	বড়খেড়ী	borokheriup.lakshmipur.gov.bd	63
608	Chargazi	চরগাজী	chargaziup.lakshmipur.gov.bd	63
609	Kanchanpur	কাঞ্চনপুর	kanchanpurup.lakshmipur.gov.bd	64
610	Noagaon	নোয়াগাঁও	noagaonup.lakshmipur.gov.bd	64
611	Bhadur	ভাদুর	bhadurup.lakshmipur.gov.bd	64
612	Ichhapur	ইছাপুর	ichhapurup.lakshmipur.gov.bd	64
613	Chandipur	চন্ডিপুর	chandipurup.lakshmipur.gov.bd	64
614	Lamchar	লামচর	lamcharup.lakshmipur.gov.bd	64
615	Darbeshpur	দরবেশপুর	darbeshpurup.lakshmipur.gov.bd	64
616	Karpara	করপাড়া	karparaup.lakshmipur.gov.bd	64
617	Bholakot	ভোলাকোট	bholakotup.lakshmipur.gov.bd	64
618	Bhatra	ভাটরা	bhatraup.lakshmipur.gov.bd	64
619	Rajanagar	রাজানগর	rajanagarup.chittagong.gov.bd	65
620	Hosnabad	হোছনাবাদ	hosnabadup.chittagong.gov.bd	65
621	Swanirbor Rangunia	স্বনির্ভর রাঙ্গুনিয়া	swanirborranguniaup.chittagong.gov.bd	65
622	Mariumnagar	মরিয়মনগর	mariumnagarup.chittagong.gov.bd	65
623	Parua	পারুয়া	paruaup.chittagong.gov.bd	65
624	Pomra	পোমরা	pomraup.chittagong.gov.bd	65
625	Betagi	বেতাগী	betagiup.chittagong.gov.bd	65
626	Sharafbhata	সরফভাটা	sharafbhataup.chittagong.gov.bd	65
627	Shilok	শিলক	shilokup.chittagong.gov.bd	65
628	Chandraghona	চন্দ্রঘোনা	chandraghonaup.chittagong.gov.bd	65
629	Kodala	কোদালা	kodalaup.chittagong.gov.bd	65
630	Islampur	ইসলামপুর	islampurup.chittagong.gov.bd	65
631	South Rajanagar	দক্ষিণ রাজানগর	southrajanagarup.chittagong.gov.bd	65
632	Lalanagar	লালানগর	lalanagarup.chittagong.gov.bd	65
633	Kumira	কুমিরা	kumiraup.chittagong.gov.bd	66
634	Banshbaria	বাঁশবারীয়া	banshbariaup.chittagong.gov.bd	66
635	Barabkunda	বারবকুন্ড	barabkundaup.chittagong.gov.bd	66
636	Bariadyala	বাড়িয়াডিয়ালা	bariadyalaup.chittagong.gov.bd	66
637	Muradpur	মুরাদপুর	muradpurup.chittagong.gov.bd	66
638	Saidpur	সাঈদপুর	saidpurup.chittagong.gov.bd	66
639	Salimpur	সালিমপুর	salimpurup.chittagong.gov.bd	66
640	Sonaichhari	সোনাইছড়ি	sonaichhariup.chittagong.gov.bd	66
641	Bhatiari	ভাটিয়ারী	bhatiariup.chittagong.gov.bd	66
642	Korerhat	করেরহাট	korerhatup.chittagong.gov.bd	67
643	Hinguli	হিংগুলি	hinguliup.chittagong.gov.bd	67
644	Jorarganj	জোরারগঞ্জ	jorarganjup.chittagong.gov.bd	67
645	Dhoom	ধুম	dhoomup.chittagong.gov.bd	67
646	Osmanpur	ওসমানপুর	osmanpurup.chittagong.gov.bd	67
647	Ichakhali	ইছাখালী	ichakhaliup.chittagong.gov.bd	67
648	Katachhara	কাটাছরা	katachharaup.chittagong.gov.bd	67
649	Durgapur	দূর্গাপুর	durgapurup.chittagong.gov.bd	67
650	Mirsharai	মীরসরাই	mirsharaiup.chittagong.gov.bd	67
651	Mithanala	মিঠানালা	mithanalaup.chittagong.gov.bd	67
652	Maghadia	মঘাদিয়া	maghadiaup.chittagong.gov.bd	67
653	Khaiyachhara	খৈয়াছরা	khaiyachharaup.chittagong.gov.bd	67
654	Mayani	মায়ানী	mayaniup.chittagong.gov.bd	67
655	Haitkandi	হাইতকান্দি	haitkandiup.chittagong.gov.bd	67
656	Wahedpur	ওয়াহেদপুর	wahedpurup.chittagong.gov.bd	67
657	Saherkhali	সাহেরখালী	saherkhaliup.chittagong.gov.bd	67
658	Asia	আশিয়া	asiaup.chittagong.gov.bd	68
659	Kachuai	কাচুয়াই	kachuaiup.chittagong.gov.bd	68
660	Kasiais	কাশিয়াইশ	kasiaisup.chittagong.gov.bd	68
661	Kusumpura	কুসুমপুরা	kusumpuraup.chittagong.gov.bd	68
662	Kelishahar	কেলিশহর	kelishaharup.chittagong.gov.bd	68
1154	Nasaratpur	নশরতপুর	nasaratpurup.bogra.gov.bd	127
1769	Andulbaria	আন্দুলবাড়ীয়া	andulbaria.chuadanga.gov.bd	195
3309	Konda	কোন্ডা	kondaup.dhaka.gov.bd	367
3310	Aganagar	আগানগর	aganagarup.dhaka.gov.bd	367
3311	Shikaripara	শিকারীপাড়া	shikariparaup.dhaka.gov.bd	368
915	Gomti	গোমতি	gomtiup.khagrachhari.gov.bd	95
916	Balchari	বেলছড়ি	balchariup.khagrachhari.gov.bd	95
917	Matiranga	মাটিরাঙ্গা	matirangaup.khagrachhari.gov.bd	95
918	Guimara	গুইমারা	guimaraup.khagrachhari.gov.bd	95
919	Amtali	আমতলি	amtaliup.khagrachhari.gov.bd	95
920	Rajbila	রাজবিলা	rajbilaup.bandarban.gov.bd	97
1006	Khokshabari	খোকশাবাড়ী	khokshabariup.nilphamari.gov.bd	110
1007	Songacha	ছোনগাছা	songachaup.sirajganj.gov.bd	110
1008	Mesra	মেছড়া	mesraup.sirajganj.gov.bd	110
1009	Kowakhola	কাওয়াখোলা	kowakholaup.sirajganj.gov.bd	110
1010	Kaliahoripur	কালিয়াহরিপুর	kaliahoripurup.sirajganj.gov.bd	110
1011	Soydabad	সয়দাবাদ	soydabadup.sirajganj.gov.bd	110
1012	Baruhas	বারুহাস	baruhasup.sirajganj.gov.bd	111
1013	Talam	তালম	talamup.sirajganj.gov.bd	111
1014	Soguna	সগুনা	sogunaup.sirajganj.gov.bd	111
1015	Magura Binod	মাগুড়া বিনোদ	magurabinodup.sirajganj.gov.bd	111
1016	Naogaon	নওগাঁ	naogaonup.sirajganj.gov.bd	111
1017	Tarash Sadar	তাড়াশ সদর	tarashsadarup.sirajganj.gov.bd	111
1018	Madhainagar	মাধাইনগর	madhainagarup.sirajganj.gov.bd	111
1019	Deshigram	দেশীগ্রাম	deshigramup.sirajganj.gov.bd	111
1021	Ramkrisnopur	রামকৃষ্ণপুর	ramkrisnopurup.sirajganj.gov.bd	112
1022	Bangala	বাঙ্গালা	bangalaup.sirajganj.gov.bd	112
1023	Udhunia	উধুনিয়া	udhuniaup.sirajganj.gov.bd	112
1024	Boropangashi	বড়পাঙ্গাসী	boropangashiup.sirajganj.gov.bd	112
1025	Durga Nagar	দুর্গা নগর	durganagarup.sirajganj.gov.bd	112
1026	Purnimagati	পূর্ণিমাগাতী	purnimagatiup.sirajganj.gov.bd	112
1027	Salanga	সলঙ্গা	salangaup.sirajganj.gov.bd	112
1028	Hatikumrul	হটিকুমরুল	hatikumrulup.sirajganj.gov.bd	112
1029	Borohor	বড়হর	borohorup.sirajganj.gov.bd	112
1031	Salo	সলপ	salopup.sirajganj.gov.bd	112
1032	Mohonpur	মোহনপুর	mohonpurup.sirajganj.gov.bd	112
1033	Vaina	ভায়না	vainaup.pabna.gov.bd	113
1034	Tantibonda	তাঁতিবন্দ	tantibondaup.pabna.gov.bd	113
1035	Manikhat	মানিকহাট	manikhatup.pabna.gov.bd	113
1036	Dulai	দুলাই	dulaiup.pabna.gov.bd	113
1037	Ahammadpur	আহম্মদপুর	ahammadpurup.pabna.gov.bd	113
1038	Raninagar	রাণীনগর	raninagarup.pabna.gov.bd	113
1039	Satbaria	সাতবাড়ীয়া	satbariaup.pabna.gov.bd	113
1040	Hatkhali	হাটখালী	hatkhaliup.pabna.gov.bd	113
1041	Nazirganj	নাজিরগঞ্জ	nazirganjup.pabna.gov.bd	113
1042	Sagorkandi	সাগরকান্দি	sagorkandiup.pabna.gov.bd	113
1043	Sara	সাঁড়া	saraup.pabna.gov.bd	114
1044	Pakshi	পাকশী	pakshiup.pabna.gov.bd	114
1045	Muladuli	মুলাডুলি	muladuliup.pabna.gov.bd	114
1046	Dashuria	দাশুরিয়া	dashuriaup.pabna.gov.bd	114
1047	Silimpur	ছলিমপুর	silimpurup.pabna.gov.bd	114
1048	Sahapur	সাহাপুর	sahapurup.pabna.gov.bd	114
1049	Luxmikunda	লক্ষীকুন্ডা	luxmikundaup.pabna.gov.bd	114
1050	Bhangura	ভাঙ্গুড়া	bhanguraup.pabna.gov.bd	115
1051	Khanmarich	খানমরিচ	khanmarichup.pabna.gov.bd	115
1052	Ashtamanisha	অষ্টমণিষা	ashtamanishaup.pabna.gov.bd	115
1053	Dilpasar	দিলপাশার	dilpasarup.pabna.gov.bd	115
1054	Parbhangura	পারভাঙ্গুড়া	parbhanguraup.pabna.gov.bd	115
1055	Maligachha	মালিগাছা	maligachhaup.pabna.gov.bd	116
1056	Malanchi	মালঞ্চি	malanchiup.pabna.gov.bd	116
1057	Gayeshpur	গয়েশপুর	gayeshpurup.pabna.gov.bd	116
1058	Ataikula	আতাইকুলা	ataikulaup.pabna.gov.bd	116
1059	Chartarapur	চরতারাপুর	chartarapurup.pabna.gov.bd	116
1060	Sadullahpur	সাদুল্লাপুর	sadullahpurup.pabna.gov.bd	116
1061	Bharara	ভাঁড়ারা	bhararaup.pabna.gov.bd	116
1062	Dogachi	দোগাছী	dogachiup.pabna.gov.bd	116
1063	Hemayetpur	হেমায়েতপুর	hemayetpurup.pabna.gov.bd	116
1064	Dapunia	দাপুনিয়া	dapuniaup.pabna.gov.bd	116
1065	Haturia Nakalia	হাটুরিয়া নাকালিয়া	haturianakaliaup.pabna.gov.bd	117
1066	Notun Varenga	নতুন ভারেঙ্গা	notunvarengaup.pabna.gov.bd	117
1067	Koitola	কৈটোলা	koitolaup.pabna.gov.bd	117
1068	Chakla	চাকলা	chaklaup.pabna.gov.bd	117
1069	Jatsakhini	জাতসাখিনি	jatsakhiniup.pabna.gov.bd	117
1070	Puran Varenga	পুরান ভারেঙ্গা	puranvarengaup.pabna.gov.bd	117
1071	Ruppur	রূপপুর	ruppurup.pabna.gov.bd	117
1072	Masumdia	মাসুমদিয়া	masumdiaup.pabna.gov.bd	117
1073	Dhalar Char	ঢালার চর	dhalarcharup.pabna.gov.bd	117
1074	Majhpara	মাজপাড়া	majhparaup.pabna.gov.bd	118
1770	Banka	বাঁকা	bankaup.chuadanga.gov.bd	195
3312	Joykrishnapur	জয়কৃষ্ণপুর	joykrishnapurup.dhaka.gov.bd	368
914	Barnal	বর্ণাল	barnalup.khagrachhari.gov.bd	95
670	Juldha	জুলধা	juldhaup.chittagong.gov.bd	68
671	Dakkhin Bhurshi	দক্ষিণ ভূর্ষি	dakhinbhurshiup.chittagong.gov.bd	68
672	Dhalghat	ধলঘাট	dhalghatup.chittagong.gov.bd	68
673	Bara Uthan	বড় উঠান	barauthanup.chittagong.gov.bd	68
674	Baralia	বরলিয়া	baraliaup.chittagong.gov.bd	68
675	Bhatikhain	ভাটিখাইন	bhatikhainup.chittagong.gov.bd	68
676	Sikalbaha	শিকলবাহা	sikalbahaup.chittagong.gov.bd	68
921	Tongkaboty	টংকাবতী	tongkabotyup.bandarban.gov.bd	97
922	Suwalok	সুয়ালক	suwalokup.bandarban.gov.bd	97
923	Bandarban Sadar	বান্দরবান সদর	bandarbansadarup.bandarban.gov.bd	97
924	Kuhalong	কুহালং	kuhalongup.bandarban.gov.bd	97
925	Alikadam Sadar	আলীকদম সদর	alikadamsadarup.bandarban.gov.bd	98
926	Chwekhyong	চৈক্ষ্যং	chwekhyongup.bandarban.gov.bd	98
927	Naikhyongchari Sadar	নাইক্ষ্যংছড়ি সদর	naikhyongcharisadarup.bandarban.gov.bd	99
928	Gumdhum	ঘুমধুম	gumdhumup.bandarban.gov.bd	99
929	Baishari	বাইশারী	baishariup.bandarban.gov.bd	99
930	Sonaychari	সোনাইছড়ি	sonaychariup.bandarban.gov.bd	99
931	Duwchari	দোছড়ি	duwchariup.bandarban.gov.bd	99
932	Rowangchari Sadar	রোয়াংছড়ি সদর	rowangcharisadarup.bandarban.gov.bd	100
933	Taracha	তারাছা	tarachaup.bandarban.gov.bd	100
935	Nawapotong	নোয়াপতং	nawapotongup.bandarban.gov.bd	100
936	Gajalia	গজালিয়া	gajaliaup.bandarban.gov.bd	101
937	Lama Sadar	লামা সদর	lamasadarup.bandarban.gov.bd	101
938	Fasiakhali	ফাসিয়াখালী	fasiakhaliup.bandarban.gov.bd	101
939	Fythong	ফাইতং	fythongup.bandarban.gov.bd	101
940	Rupushipara	রূপসীপাড়া	rupushiparaup.bandarban.gov.bd	101
941	Sarai	সরই	saraiup.bandarban.gov.bd	101
942	Aziznagar	আজিজনগর	aziznagarup.bandarban.gov.bd	101
943	Paind	পাইন্দু	painduup.bandarban.gov.bd	102
944	Ruma Sadar	রুমা সদর	rumasadarup.bandarban.gov.bd	102
945	Ramakreprangsa	রেমাক্রীপ্রাংসা	ramakreprangsaup.bandarban.gov.bd	102
946	Galanggya	গ্যালেংগ্যা	galanggyaup.bandarban.gov.bd	102
947	Remakre	রেমাক্রী	remakreup.bandarban.gov.bd	103
948	Tind	তিন্দু	tinduup.bandarban.gov.bd	103
949	Thanchi Sadar	থানচি সদর	thanchisadarup.bandarban.gov.bd	103
950	Balipara	বলিপাড়া	baliparaup.bandarban.gov.bd	103
951	Rajapur	রাজাপুর	rajapurup.sirajganj.gov.bd	104
952	Baradhul	বড়ধুল	baradhulup.sirajganj.gov.bd	104
953	Belkuchi Sadar	বেলকুচি সদর	belkuchisadarup.sirajganj.gov.bd	104
955	Doulatpur	দৌলতপুর	doulatpurup.sirajganj.gov.bd	104
956	Bhangabari	ভাঙ্গাবাড়ী	bhangabariup.sirajganj.gov.bd	104
957	Baghutia	বাঘুটিয়া	baghutiaup.sirajganj.gov.bd	105
958	Gharjan	ঘোরজান	gharjanup.sirajganj.gov.bd	105
959	Khaskaulia	খাসকাউলিয়া	khaskauliaup.sirajganj.gov.bd	105
960	Khaspukuria	খাসপুকুরিয়া	khaspukuriaup.sirajganj.gov.bd	105
961	Omarpur	উমারপুর	omarpurup.sirajganj.gov.bd	105
962	Sadia Chandpur	সদিয়া চাঁদপুর	sadiachandpurup.sirajganj.gov.bd	105
963	Sthal	স্থল	sthalup.sirajganj.gov.bd	105
964	Bhadraghat	ভদ্রঘাট	bhadraghatup.sirajganj.gov.bd	106
965	Jamtail	জামতৈল	jamtailup.sirajganj.gov.bd	106
966	Jhawail	ঝাঐল	jhawailup.sirajganj.gov.bd	106
967	Roydaulatpur	রায়দৌলতপুর	roydaulatpurup.sirajganj.gov.bd	106
968	Chalitadangha	চালিতাডাঙ্গা	chalitadanghaup.sirajganj.gov.bd	107
969	Chargirish	চরগিরিশ	chargirishup.sirajganj.gov.bd	107
970	Gandail	গান্ধাইল	gandailup.sirajganj.gov.bd	107
971	Kazipur Sadar	কাজিপুর সদর	kazipursadarup.sirajganj.gov.bd	107
972	Khasrajbari	খাসরাজবাড়ী	khasrajbariup.sirajganj.gov.bd	107
973	Maijbari	মাইজবাড়ী	maijbariup.sirajganj.gov.bd	107
974	Monsur Nagar	মনসুর নগর	monsurnagarup.sirajganj.gov.bd	107
975	Natuarpara	নাটুয়ারপাড়া	natuarparaup.sirajganj.gov.bd	107
976	Nishchintapur	নিশ্চিন্তপুর	nishchintapurup.sirajganj.gov.bd	107
977	Sonamukhi	সোনামুখী	sonamukhiup.sirajganj.gov.bd	107
978	Subhagacha	শুভগাছা	subhagachaup.sirajganj.gov.bd	107
979	Tekani	তেকানী	tekaniup.sirajganj.gov.bd	107
980	Brommogacha	ব্রহ্মগাছা	brommogachaup.sirajganj.gov.bd	108
981	Chandaikona	চান্দাইকোনা	chandaikonaup.sirajganj.gov.bd	108
982	Dhamainagar	ধামাইনগর	dhamainagarup.sirajganj.gov.bd	108
983	Dhangora	ধানগড়া	dhangoraup.sirajganj.gov.bd	108
984	Dhubil	ধুবিল	dhubilup.sirajganj.gov.bd	108
985	Ghurka	ঘুড়কা	ghurkaup.sirajganj.gov.bd	108
986	Nalka	নলকা	nalkaup.sirajganj.gov.bd	108
1771	Shimanto	সীমান্ত	shimanto.chuadanga.gov.bd	195
3313	Baruakhali	বারুয়াখালী	baruakhaliup.dhaka.gov.bd	368
669	Jiri	জিরি	jiriup.chittagong.gov.bd	68
683	Amanullah	আমানউল্যা	amanullahup.chittagong.gov.bd	69
684	Santoshpur	সন্তোষপুর	santoshpurup.chittagong.gov.bd	69
685	Gachhua	গাছুয়া	gachhuaup.chittagong.gov.bd	69
686	Bauria	বাউরিয়া	bauriaup.chittagong.gov.bd	69
687	Haramia	হারামিয়া	haramiaup.chittagong.gov.bd	69
688	Magdhara	মগধরা	magdharaup.chittagong.gov.bd	69
690	Sarikait	সারিকাইত	sarikaitup.chittagong.gov.bd	69
691	Musapur	মুছাপুর	musapurup.chittagong.gov.bd	69
692	Azimpur	আজিমপুর	azimpurup.chittagong.gov.bd	69
693	Urirchar	উড়িরচর	urircharup.chittagong.gov.bd	69
694	Pukuria	পুকুরিয়া	pukuriaup.chittagong.gov.bd	70
695	Sadhanpur	সাধনপুর	sadhanpurup.chittagong.gov.bd	70
696	Khankhanabad	খানখানাবাদ	khankhanabadup.chittagong.gov.bd	70
697	Baharchhara	বাহারছড়া	baharchharaup.chittagong.gov.bd	70
698	Kalipur	কালীপুর	kalipurup.chittagong.gov.bd	70
699	Bailchhari	বৈলছড়ি	bailchhariup.chittagong.gov.bd	70
700	Katharia	কাথরিয়া	kathariaup.chittagong.gov.bd	70
701	Saral	সরল	saralup.chittagong.gov.bd	70
702	Silk	শীলকুপ	silkupup.chittagong.gov.bd	70
703	Chambal	চাম্বল	chambalup.chittagong.gov.bd	70
704	Gandamara	গন্ডামারা	gandamaraup.chittagong.gov.bd	70
705	Sekherkhil	শেখেরখীল	sekherkhilup.chittagong.gov.bd	70
706	Puichhari	পুঁইছড়ি	puichhariup.chittagong.gov.bd	70
707	Chhanua	ছনুয়া	chhanuaup.chittagong.gov.bd	70
708	Kandhurkhil	কধুরখীল	kandhurkhilup.chittagong.gov.bd	71
710	Purba Gomdandi	পুর্ব গোমদন্ডী	purbagomdandiup.chittagong.gov.bd	71
711	Sakpura	শাকপুরা	sakpuraup.chittagong.gov.bd	71
712	Saroatali	সারোয়াতলী	saroataliup.chittagong.gov.bd	71
713	Popadia	পোপাদিয়া	popadiaup.chittagong.gov.bd	71
714	Charandwi	চরনদ্বীপ	charandwipup.chittagong.gov.bd	71
715	Sreepur-Kharandwi	শ্রীপুর-খরন্দীপ	sreepurkharandwipup.chittagong.gov.bd	71
716	Amuchia	আমুচিয়া	amuchiaup.chittagong.gov.bd	71
718	Boirag	বৈরাগ	boiragup.chittagong.gov.bd	72
719	Barasat	বারশত	barasatup.chittagong.gov.bd	72
720	Raipur	রায়পুর	raipurup.chittagong.gov.bd	72
721	Battali	বটতলী	battaliup.chittagong.gov.bd	72
722	Barumchara	বরম্নমচড়া	barumcharaup.chittagong.gov.bd	72
723	Baroakhan	বারখাইন	baroakhanup.chittagong.gov.bd	72
724	Anwara	আনোয়ারা	anwaraup.chittagong.gov.bd	72
725	Chatari	চাতরী	chatariup.chittagong.gov.bd	72
726	Paraikora	পরৈকোড়া	paraikoraup.chittagong.gov.bd	72
727	Haildhar	হাইলধর	haildharup.chittagong.gov.bd	72
728	Juidandi	জুঁইদন্ডী	juidandiup.chittagong.gov.bd	72
729	Kanchanabad	কাঞ্চনাবাদ	kanchanabadup.chittagong.gov.bd	73
730	Joara	জোয়ারা	joaraup.chittagong.gov.bd	73
731	Barkal	বরকল	barkalup.chittagong.gov.bd	73
732	Barama	বরমা	baramaup.chittagong.gov.bd	73
733	Bailtali	বৈলতলী	bailtaliup.chittagong.gov.bd	73
734	Satbaria	সাতবাড়িয়া	satbariaup.chittagong.gov.bd	73
735	Hashimpur	হাশিমপুর	hashimpurup.chittagong.gov.bd	73
736	Dohazari	দোহাজারী	dohazariup.chittagong.gov.bd	73
737	Dhopachhari	ধোপাছড়ী	dhopachhariup.chittagong.gov.bd	73
738	Charati	চরতী	charatiup.chittagong.gov.bd	74
739	Khagaria	খাগরিয়া	khagariaup.chittagong.gov.bd	74
740	Nalua	নলুয়া	naluaup.chittagong.gov.bd	74
987	Pangashi	পাঙ্গাসী	pangashiup.sirajganj.gov.bd	108
988	Sonakhara	সোনাখাড়া	sonakharaup.sirajganj.gov.bd	108
989	Beltail	বেলতৈল	beltailup.sirajganj.gov.bd	109
990	Jalalpur	জালালপুর	jalalpurup.sirajganj.gov.bd	109
991	Kayempure	কায়েমপুর	kayempureup.sirajganj.gov.bd	109
992	Garadah	গাড়াদহ	garadahup.sirajganj.gov.bd	109
993	Potazia	পোতাজিয়া	potaziaup.sirajganj.gov.bd	109
994	Rupbati	রূপবাটি	rupbatiup.sirajganj.gov.bd	109
995	Gala	গালা	galaup.sirajganj.gov.bd	109
996	Porzona	পোরজনা	porzonaup.sirajganj.gov.bd	109
997	Habibullah Nagar	হাবিবুল্লাহ নগর	habibullahnagarup.sirajganj.gov.bd	109
998	Khukni	খুকনী	khukniup.sirajganj.gov.bd	109
999	Koizuri	কৈজুরী	koizuriup.sirajganj.gov.bd	109
1000	Sonatoni	সোনাতনী	sonatoniup.sirajganj.gov.bd	109
1001	Narina	নরিনা	narinaup.sirajganj.gov.bd	109
1002	Bagbati	বাগবাটি	bagbatiup.sirajganj.gov.bd	110
1772	Raypur	রায়পুর	raypurup.chuadanga.gov.bd	195
1773	Hasadah	হাসাদাহ	hasadahup.chuadanga.gov.bd	195
1774	Hatash Haripur	হাটশ হরিপুর	1nohatashharipurup.kushtia.gov.bd	196
3314	Nayansree	নয়নশ্রী	nayansreeup.dhaka.gov.bd	368
682	Kalapania	কালাপানিয়া	kalapaniaup.chittagong.gov.bd	69
3315	Sholla	শোল্লা	shollaup.dhaka.gov.bd	368
745	Dhemsa	ঢেমশা	dhemsaup.chittagong.gov.bd	74
746	Paschim Dhemsa	পশ্চিম ঢেমশা	paschimdhemsaup.chittagong.gov.bd	74
747	Keochia	কেঁওচিয়া	keochiaup.chittagong.gov.bd	74
748	Kaliais	কালিয়াইশ	kaliaisup.chittagong.gov.bd	74
749	Bazalia	বাজালিয়া	bazaliaup.chittagong.gov.bd	74
750	Puranagar	পুরানগড়	puranagarup.chittagong.gov.bd	74
751	Sadaha	ছদাহা	sadahaup.chittagong.gov.bd	74
752	Satkania	সাতকানিয়া	satkaniaup.chittagong.gov.bd	74
753	Sonakania	সোনাকানিয়া	sonakaniaup.chittagong.gov.bd	74
754	Padua	পদুয়া	paduaup.chittagong.gov.bd	75
755	Barahatia	বড়হাতিয়া	barahatiaup.chittagong.gov.bd	75
756	Amirabad	আমিরাবাদ	amirabadup.chittagong.gov.bd	75
757	Charamba	চরম্বা	charambaup.chittagong.gov.bd	75
758	Kalauzan	কলাউজান	kalauzanup.chittagong.gov.bd	75
759	Lohagara	লোহাগাড়া	lohagaraup.chittagong.gov.bd	75
760	Putibila	পুটিবিলা	putibilaup.chittagong.gov.bd	75
761	Chunati	চুনতি	chunatiup.chittagong.gov.bd	75
762	Adhunagar	আধুনগর	adhunagarup.chittagong.gov.bd	75
763	Farhadabad	ফরহাদাবাদ	farhadabadup.chittagong.gov.bd	76
764	Dhalai	ধলই	dhalaiup.chittagong.gov.bd	76
765	Mirjapur	মির্জাপুর	mirjapurup.chittagong.gov.bd	76
766	Nangolmora	নাঙ্গলমোরা	nangolmoraup.chittagong.gov.bd	76
767	Gomanmordan	গুমানমর্দ্দন	gomanmordanup.chittagong.gov.bd	76
768	Chipatali	ছিপাতলী	chipataliup.chittagong.gov.bd	76
769	Mekhal	মেখল	mekhalup.chittagong.gov.bd	76
770	Garduara	গড়দুয়ারা	garduaraup.chittagong.gov.bd	76
771	Fathepur	ফতেপুর	fathepurup.chittagong.gov.bd	76
772	Chikondandi	চিকনদন্ডী	chikondandiup.chittagong.gov.bd	76
774	Dakkin Madrasha	দক্ষিন মাদার্শা	dakkinmadrashaup.chittagong.gov.bd	76
775	Sikarpur	শিকারপুর	sikarpurup.chittagong.gov.bd	76
776	Budirchar	বুডিরশ্চর	budircharup.chittagong.gov.bd	76
777	Hathazari	হাটহাজারী	hathazariup.chittagong.gov.bd	76
778	Dharmapur	ধর্মপুর	dharmapurup.chittagong.gov.bd	77
779	Baganbazar	বাগান বাজার	baganbazarup.chittagong.gov.bd	77
780	Dantmara	দাঁতমারা	dantmaraup.chittagong.gov.bd	77
781	Narayanhat	নারায়নহাট	narayanhatup.chittagong.gov.bd	77
782	Bhujpur	ভূজপুর	bhujpurup.chittagong.gov.bd	77
783	Harualchari	হারুয়ালছড়ি	harualchariup.chittagong.gov.bd	77
784	Paindong	পাইনদং	paindongup.chittagong.gov.bd	77
785	Kanchannagor	কাঞ্চনগর	kanchannagorup.chittagong.gov.bd	77
786	Sunderpur	সুনদরপুর	sunderpurup.chittagong.gov.bd	77
787	Suabil	সুয়াবিল	Suabilup.chittagong.gov.bd	77
788	Abdullapur	আবদুল্লাপুর	abdullapurup.chittagong.gov.bd	77
789	Samitirhat	সমিতির হাট	samitirhatup.chittagong.gov.bd	77
790	Jafathagar	জাফতনগর	jafathagarup.chittagong.gov.bd	77
791	Bokhtapur	বক্তপুর	bokhtapurup.chittagong.gov.bd	77
792	Roshangiri	রোসাংগিরী	roshangiriup.chittagong.gov.bd	77
793	Nanupur	নানুপুর	nanupurup.chittagong.gov.bd	77
794	Lelang	লেলাং	lelangup.chittagong.gov.bd	77
795	Daulatpur	দৌলতপুর	daulatpurup.chittagong.gov.bd	77
796	Raozan	রাউজান	raozanup.chittagong.gov.bd	78
797	Bagoan	বাগোয়ান	bagoanup.chittagong.gov.bd	78
798	Binajuri	বিনাজুরী	binajuriup.chittagong.gov.bd	78
799	Chikdair	চিকদাইর	chikdairup.chittagong.gov.bd	78
800	Dabua	ডাবুয়া	dabuaup.chittagong.gov.bd	78
801	Purbagujra	পূর্ব গুজরা	purbagujraup.chittagong.gov.bd	78
802	Paschim Gujra	পশ্চিম গুজরা	paschimgujraup.chittagong.gov.bd	78
803	Gohira	গহিরা	gohiraup.chittagong.gov.bd	78
804	Holdia	হলদিয়া	holdiaup.chittagong.gov.bd	78
805	Kodolpur	কদলপূর	kodolpurup.chittagong.gov.bd	78
806	Noapara	নোয়াপাড়া	noaparaup.chittagong.gov.bd	78
807	Pahartali	পাহাড়তলী	pahartaliup.chittagong.gov.bd	78
808	Urkirchar	উড়কিরচর	urkircharup.chittagong.gov.bd	78
809	Nowajushpur	নওয়াজিশপুর	nowajushpurup.chittagong.gov.bd	78
810	Char Patharghata	চর পাথরঘাটা	charpatharghataup.chittagong.gov.bd	79
811	Char Lakshya	চর লক্ষ্যা	charlakshyaup.chittagong.gov.bd	79
812	Juldha	জুলধা	juldhaup.chittagong.gov.bd	79
813	Barauthan	বড় উঠান	barauthanup.chittagong.gov.bd	79
1003	Ratankandi	রতনকান্দি	ratankandiup.sirajganj.gov.bd	110
1004	Bohuli	বহুলী	bohuliup.sirajganj.gov.bd	110
1005	Sheyalkol	শিয়ালকোল	sheyalkolup.sirajganj.gov.bd	110
2083	Jadabpur	যাদবপুর	jadabpurup.jhenaidah.gov.bd	229
3316	Jantrail	যন্ত্রাইল	jantrailup.dhaka.gov.bd	368
744	Madarsa	মাদার্শা	madarsaup.chittagong.gov.bd	74
3317	Bandura	বান্দুরা	banduraup.dhaka.gov.bd	368
818	Eidgaon	ঈদগাঁও	eidgaonup.coxsbazar.gov.bd	80
819	Jalalabad	জালালাবাদ	jalalabadup.coxsbazar.gov.bd	80
820	Chowfaldandi	চৌফলদন্ডী	chowfaldandi.coxsbazar.gov.bd	80
821	Varuakhali	ভারুয়াখালী	varuakhaliup.coxsbazar.gov.bd	80
822	Pmkhali	পিএমখালী	pmkhaliup.coxsbazar.gov.bd	80
823	Khurushkhul	খুরুশকুল	khurushkhulup.coxsbazar.gov.bd	80
824	Jhilongjha	ঝিলংঝা	jhilongjhaup.coxsbazar.gov.bd	80
825	Kakhara	কাকারা	Kakharaup.coxsbazar.gov.bd	81
826	Kaiar Bil	কাইয়ার বিল	kaiarbilup.coxsbazar.gov.bd	81
827	Konakhali	কোনাখালী	konakhaliup.coxsbazar.gov.bd	81
828	Khuntakhali	খুটাখালী	khuntakhaliup.coxsbazar.gov.bd	81
829	Chiringa	চিরিঙ্গা	chiringaup.coxsbazar.gov.bd	81
830	Demusia	ঢেমুশিয়া	demusiaup.coxsbazar.gov.bd	81
831	Dulahazara	ডুলাহাজারা	dulahazaraup.coxsbazar.gov.bd	81
833	Badarkhali	বদরখালী	badarkhaliup.coxsbazar.gov.bd	81
835	Baraitali	বড়ইতলী	baraitaliup.coxsbazar.gov.bd	81
836	Bheola Manik Char	ভেওলা মানিক চর	bheolamanikcharup.coxsbazar.gov.bd	81
837	Saharbil	শাহারবিল	saharbilup.coxsbazar.gov.bd	81
838	Surajpur Manikpur	সুরজপুর মানিকপুর	surajpurmanikpurup.coxsbazar.gov.bd	81
839	Harbang	হারবাঙ্গ	harbangup.coxsbazar.gov.bd	81
840	Fashiakhali	ফাঁসিয়াখালী	fashiakhaliup.coxsbazar.gov.bd	81
841	Ali Akbar Deil	আলি আকবর ডেইল	aliakbardeilup.coxsbazar.gov.bd	82
842	Uttar Dhurung	উত্তর ধুরুং	uttardhurungup.coxsbazar.gov.bd	82
843	Kaiyarbil	কৈয়ারবিল	kaiyarbilup.coxsbazar.gov.bd	82
2459	Lauta	লাউতা	lautaup.sylhet.gov.bd	273
844	Dakshi Dhurung	দক্ষিণ ধুরুং	dakshidhurungup.coxsbazar.gov.bd	82
845	Baragho	বড়ঘোপ	baraghopup.coxsbazar.gov.bd	82
846	Lemsikhali	লেমসিখালী	lemsikhaliup.coxsbazar.gov.bd	82
847	Rajapalong	রাজাপালং	rajapalongup.coxsbazar.gov.bd	83
848	Jaliapalong	জালিয়াপালং	jaliapalongup.coxsbazar.gov.bd	83
849	Holdiapalong	হলদিয়াপালং	holdiapalongup.coxsbazar.gov.bd	83
850	Ratnapalong	রত্নাপালং	ratnapalongup.coxsbazar.gov.bd	83
851	Palongkhali	পালংখালী	palongkhali.coxsbazar.gov.bd	83
852	Boro Moheshkhali	বড় মহেশখালী	boramoheshkhaliup.coxsbazar.gov.bd	84
853	Choto Moheshkhali	ছোট মহেশখালী	chotamoheshkhaliup.coxsbazar.gov.bd	84
854	Shaplapur	শাপলাপুর	shaplapurup.coxsbazar.gov.bd	84
855	Kutubjum	কুতুবজোম	kutubjumup.coxsbazar.gov.bd	84
856	Hoanak	হোয়ানক	hoanakup.coxsbazar.gov.bd	84
858	Matarbari	মাতারবাড়ী	matarbariup.coxsbazar.gov.bd	84
859	Dhalghata	ধলঘাটা	dhalghataup.coxsbazar.gov.bd	84
860	Ujantia	উজানটিয়া	ujantiaup.coxsbazar.gov.bd	85
861	Taitong	টাইটং	taitongup.coxsbazar.gov.bd	85
862	Pekua	পেকুয়া	pekuaup.coxsbazar.gov.bd	85
863	Barabakia	বড় বাকিয়া	barabakiaup.coxsbazar.gov.bd	85
864	Magnama	মগনামা	magnamaup.coxsbazar.gov.bd	85
865	Rajakhali	রাজাখালী	rajakhaliup.coxsbazar.gov.bd	85
866	Shilkhali	শীলখালী	shilkhaliup.coxsbazar.gov.bd	85
867	Fotekharkul	ফতেখাঁরকুল	fotekharkulup.coxsbazar.gov.bd	86
868	Rajarkul	রাজারকুল	rajarkulup.coxsbazar.gov.bd	86
869	Rashidnagar	রশীদনগর	rashidnagarup.coxsbazar.gov.bd	86
870	Khuniapalong	খুনিয়াপালং	khuniapalongup.coxsbazar.gov.bd	86
871	Eidghar	ঈদগড়	eidgharup.coxsbazar.gov.bd	86
872	Chakmarkul	চাকমারকুল	chakmarkulup.coxsbazar.gov.bd	86
873	Kacchapia	কচ্ছপিয়া	kacchapiaup.coxsbazar.gov.bd	86
874	Kauwarkho	কাউয়ারখোপ	kauwarkhopup.coxsbazar.gov.bd	86
875	Dakkhin Mithachhari	দক্ষিণ মিঠাছড়ি	dakkhinmithachhariup.coxsbazar.gov.bd	86
876	Jouarianala	জোয়ারিয়া নালা	jouarianalaup.coxsbazar.gov.bd	86
877	Garjoniya	গর্জনিয়া	garjoniyaup.coxsbazar.gov.bd	86
878	Subrang	সাবরাং	subrangup.coxsbazar.gov.bd	87
879	Baharchara	বাহারছড়া	baharcharaup.coxsbazar.gov.bd	87
880	Hnila	হ্নীলা	hnilaup.coxsbazar.gov.bd	87
881	Whykong	হোয়াইক্যং	whykongup.coxsbazar.gov.bd	87
883	Teknaf Sadar	টেকনাফ সদর	teknafsadarup.coxsbazar.gov.bd	87
884	Khagrachhari Sadar	খাগরাছড়ি সদর	sadarup.khagrachhari.gov.bd	88
886	Parachara	পেরাছড়া	paracharaup.khagrachhari.gov.bd	88
887	Kamalchari	কমলছড়ি	kamalchariup.khagrachhari.gov.bd	88
888	Merung	মেরুং	merungup.khagrachhari.gov.bd	89
889	Boalkhali	বোয়ালখালী	boalkhaliup.khagrachhari.gov.bd	89
1075	Chandba	চাঁদভা	chandbaup.pabna.gov.bd	118
1775	Barkhada	বারখাদা	2nobarkhadaup.kushtia.gov.bd	196
3318	Kalakopa	কলাকোপা	kalakopaup.dhaka.gov.bd	368
3319	Bakshanagar	বক্সনগর	bakshanagarup.dhaka.gov.bd	368
817	Pokkhali	পোকখালী	pokkhaliup.coxsbazar.gov.bd	80
1080	Chhaikola	ছাইকোলা	chhaikolaup.pabna.gov.bd	119
1081	Nimaichara	নিমাইচড়া	nimaicharaup.pabna.gov.bd	119
1082	Gunaigachha	গুনাইগাছা	gunaigachhaup.pabna.gov.bd	119
1083	Parshadanga	পার্শ্বডাঙ্গা	parshadangaup.pabna.gov.bd	119
1084	Failjana	ফৈলজানা	failjanaup.pabna.gov.bd	119
1085	Mulgram	মুলগ্রাম	mulgramup.pabna.gov.bd	119
1086	Haripur	হরিপুর	haripurup.pabna.gov.bd	119
1087	Mothurapur	মথুরাপুর	mothurapurup.pabna.gov.bd	119
1088	Bilchalan	বিলচলন	bilchalanup.pabna.gov.bd	119
1089	Danthia Bamangram	দাতিয়া বামনগ্রাম	danthiabamangramup.pabna.gov.bd	119
1091	Dhulauri	ধুলাউড়ি	dhulauriup.pabna.gov.bd	120
1092	Bhulbaria	ভুলবাড়ীয়া	bhulbariaup.pabna.gov.bd	120
1093	Dhopadaha	ধোপাদহ	dhopadahaup.pabna.gov.bd	120
1094	Karamja	করমজা	karamjaup.pabna.gov.bd	120
1095	Kashinathpur	কাশিনাথপুর	kashinathpurup.pabna.gov.bd	120
1096	Gaurigram	গৌরীগ্রাম	gaurigramup.pabna.gov.bd	120
1097	Nandanpur	নন্দনপুর	nandanpurup.pabna.gov.bd	120
1098	Khetupara	ক্ষেতুপাড়া	khetuparaup.pabna.gov.bd	120
1099	Ar-Ataikula	আর-আতাইকুলা	rataiqulaup.pabna.gov.bd	120
1100	Brilahiribari	বৃলাহিড়ীবাড়ী	brilahiribariup.pabna.gov.bd	121
1101	Pungali	পুঙ্গুলি	pungaliup.pabna.gov.bd	121
1102	Faridpur	ফরিদপুর	faridpurup.pabna.gov.bd	121
1103	Hadal	হাদল	hadalup.pabna.gov.bd	121
1104	Banwarinagar	বনওয়ারীনগর	banwarinagarup.pabna.gov.bd	121
1105	Demra	ডেমড়া	demraup.pabna.gov.bd	121
1106	Birkedar	বীরকেদার	birkedarup.bogra.gov.bd	122
1107	Kalai	কালাই	kalaiup.bogra.gov.bd	122
1108	Paikar	পাইকড়	paikarup.bogra.gov.bd	122
1109	Narhatta	নারহট্ট	narhattaup.bogra.gov.bd	122
1110	Murail	মুরইল	murailup.bogra.gov.bd	122
1111	Kahaloo	কাহালু	kahalooup.bogra.gov.bd	122
1112	Durgapur	দূর্গাপুর	durgapurup.bogra.gov.bd	122
1113	Jamgaon	জামগ্রাম	jamgaonup.bogra.gov.bd	122
1114	Malancha	মালঞ্চা	malanchaup.bogra.gov.bd	122
1115	Fapore	ফাঁপোর	faporeup.bogra.gov.bd	123
1116	Shabgram	সাবগ্রাম	shabgramup.bogra.gov.bd	123
1117	Nishindara	নিশিন্দারা	nishindaraup.bogra.gov.bd	123
1118	Erulia	এরুলিয়া	eruliaup.bogra.gov.bd	123
1119	Rajapur	রাজাপুর	rajapurup.bogra.gov.bd	123
1120	Shakharia	শাখারিয়া	shakhariaup.bogra.gov.bd	123
1121	Sekherkola	শেখেরকোলা	sekherkolaup.bogra.gov.bd	123
1122	Gokul	গোকুল	gokulup.bogra.gov.bd	123
1123	Noongola	নুনগোলা	noongolaup.bogra.gov.bd	123
1124	Lahiripara	লাহিড়ীপাড়া	lahiriparaup.bogra.gov.bd	123
1125	Namuja	নামুজা	namujaup.bogra.gov.bd	123
1126	Sariakandi Sadar	সারিয়াকান্দি সদর	sariakandisadarup.bogra.gov.bd	124
1127	Narchi	নারচী	narchiup.bogra.gov.bd	124
1128	Bohail	বোহাইল	bohailup.bogra.gov.bd	124
1129	Chaluabari	চালুয়াবাড়ী	chaluabariup.bogra.gov.bd	124
1130	Chandanbaisha	চন্দনবাইশা	chandanbaishaup.bogra.gov.bd	124
1131	Hatfulbari	হাটফুলবাড়ী	hatfulbariup.bogra.gov.bd	124
1132	Hatsherpur	হাটশেরপুর	hatsherpurup.bogra.gov.bd	124
1133	Karnibari	কর্ণিবাড়ী	karnibariup.bogra.gov.bd	124
1134	Kazla	কাজলা	kazlaup.bogra.gov.bd	124
1135	Kutubpur	কুতুবপুর	kutubpurup.bogra.gov.bd	124
1136	Kamalpur	কামালপুর	kamalpur.bogra.gov.bd	124
1137	Bhelabari	ভেলাবাড়ী	bhelabari.bogra.gov.bd	124
1138	Asekpur	আশেকপুর	asekpurup.bogra.gov.bd	125
1139	Madla	মাদলা	madlaup.bogra.gov.bd	125
1140	Majhira	মাঝিড়া	majhiraup.bogra.gov.bd	125
1141	Aria	আড়িয়া	ariaup.bogra.gov.bd	125
1142	Kharna	খরনা	kharnaup.bogra.gov.bd	125
1143	Khottapara	খোট্টাপাড়া	Khottaparaup.bogra.gov.bd	125
1144	Chopinagar	চোপিনগর	chopinagarup.bogra.gov.bd	125
1145	Amrul	আমরুল	amrulup.bogra.gov.bd	125
1146	Gohail	গোহাইল	gohailup.bogra.gov.bd	125
1147	Zianagar	জিয়ানগর	zianagarup.bogra.gov.bd	126
1148	Chamrul	চামরুল	chamrulup.bogra.gov.bd	126
1149	Dupchanchia	দুপচাঁচিয়া	dupchanchiaup.bogra.gov.bd	126
1150	Gunahar	গুনাহার	gunaharup.bogra.gov.bd	126
1151	Gobindapur	গোবিন্দপুর	gobindapurup.bogra.gov.bd	126
1152	Talora	তালোড়া	taloraup.bogra.gov.bd	126
1153	Chhatiangram	ছাতিয়ানগ্রাম	chhatiangramup.bogra.gov.bd	127
1776	Mazampur	মজমপুর	3nomazampurup.kushtia.gov.bd	196
1777	Bottail	বটতৈল	4nobottailup.kushtia.gov.bd	196
1778	Alampur	আলামপুর	5noalampurup.kushtia.gov.bd	196
1779	Ziaraakhi	জিয়ারাখী	6noziaraakhiup.kushtia.gov.bd	196
3320	Barrah	বাহ্রা	barrahup.dhaka.gov.bd	368
1079	Handial	হান্ডিয়াল	handialup.pabna.gov.bd	119
1158	Shantahar	সান্তাহার	shantaharup.bogra.gov.bd	127
1159	Burail	বুড়ইল	burailup.bogra.gov.bd	128
1160	Nandigram	নন্দিগ্রাম	nandigramup.bogra.gov.bd	128
1161	Bhatra	ভাটরা	bhatraup.bogra.gov.bd	128
1162	Thalta Majhgram	থালতা মাঝগ্রাম	thaltamajhgramup.bogra.gov.bd	128
1163	Bhatgram	ভাটগ্রাম	bhatgramup.bogra.gov.bd	128
1164	Sonatala	সোনাতলা	sonatalaup.bogra.gov.bd	129
1165	Balua	বালুয়া	baluaup.bogra.gov.bd	129
1166	Zorgacha	জোড়গাছা	zorgachaup.bogra.gov.bd	129
1167	Digdair	দিগদাইড়	digdairup.bogra.gov.bd	129
1168	Madhupur	মধুপুর	madhupurup.bogra.gov.bd	129
1169	Pakulla	পাকুল্ল্যা	pakullaup.bogra.gov.bd	129
1170	Tekani Chukinagar	তেকানী চুকাইনগর	tekanichukinagarup.bogra.gov.bd	129
1171	Nimgachi	নিমগাছি	nimgachiup.bogra.gov.bd	130
1172	Kalerpara	কালেরপাড়া	kalerparaup.bogra.gov.bd	130
1173	Chikashi	চিকাশী	chikashiup.bogra.gov.bd	130
1174	Gossainbari	গোসাইবাড়ী	gossainbariup.bogra.gov.bd	130
1175	Bhandarbari	ভান্ডারবাড়ী	bhandarbariup.bogra.gov.bd	130
1176	Gopalnagar	১গোপালনগর	gopalnagarup.bogra.gov.bd	130
1177	Mothurapur	মথুরাপুর	mothurapurup.bogra.gov.bd	130
1178	Chowkibari	চৌকিবাড়ী	chowkibariup.bogra.gov.bd	130
1179	Elangi	এলাঙ্গী	elangiup.bogra.gov.bd	130
1180	Dhunat Sadar	ধুনট সদর	dhunatsadarup.bogra.gov.bd	130
1181	Baliadighi	বালিয়া দিঘী	baliadighiup.bogra.gov.bd	131
1182	Dakshinpara	দক্ষিণপাড়া	dakshinparaup.bogra.gov.bd	131
1183	Durgahata	দুর্গাহাটা	durgahataup.bogra.gov.bd	131
1184	Kagail	কাগইল	kagailup.bogra.gov.bd	131
1185	Sonarai	সোনারায়	sonaraiup.bogra.gov.bd	131
1186	Rameshwarpur	রামেশ্বরপুর	rameshwarpurup.bogra.gov.bd	131
1187	Naruamala	নাড়ুয়ামালা	naruamalaup.bogra.gov.bd	131
1188	Nepaltali	নেপালতলী	nepaltaliup.bogra.gov.bd	131
1189	Gabtali	গাবতলি	gabtaliup.bogra.gov.bd	131
1190	Mahishaban	মহিষাবান	mahishabanup.bogra.gov.bd	131
1191	Nasipur	নশিপুর	nasipurup.bogra.gov.bd	131
1192	Mirzapur	মির্জাপুর	mirzapurup.bogra.gov.bd	132
1193	Khamarkandi	খামারকান্দি	khamarkandiup.bogra.gov.bd	132
1194	Garidaha	গাড়িদহ	garidahaup.bogra.gov.bd	132
1195	Kusumbi	কুসুম্বী	kusumbiup.bogra.gov.bd	132
1196	Bishalpur	বিশালপুর	bishalpurup.bogra.gov.bd	132
1197	Shimabari	সীমাবাড়ি	shimabariup.bogra.gov.bd	132
1198	Shahbondegi	শাহবন্দেগী	shahbondegiup.bogra.gov.bd	132
1199	Sughat	সুঘাট	sughatup.bogra.gov.bd	132
1200	Khanpur	খানপুর	khanpurup.bogra.gov.bd	132
1201	Bhabanipur	ভবানীপুর	bhabanipurup.bogra.gov.bd	132
1202	Moidanhatta	ময়দানহাট্টা	moidanhattaup.bogra.gov.bd	133
1203	Kichok	কিচক	kichokup.bogra.gov.bd	133
1204	Atmul	আটমূল	atmulup.bogra.gov.bd	133
1205	Pirob	পিরব	pirobup.bogra.gov.bd	133
1206	Majhihatta	মাঝিহট্ট	majhihattaup.bogra.gov.bd	133
1207	Buriganj	বুড়িগঞ্জ	buriganjup.bogra.gov.bd	133
1353	Dharanji	ধরঞ্জি	dharanjiup.joypurhat.gov.bd	153
1354	Aymarasulpur	আয়মারসুলপুর	aymarasulpurup.joypurhat.gov.bd	153
1355	Balighata	বালিঘাটা	balighataup.joypurhat.gov.bd	153
550	Subidpur (West)	সুবিদপুর (পশ্চিম)	subidpurwestup.chandpur.gov.bd	59
555	Gobindapur (North)	গবিন্দপুর (উত্তর)	gobindapurnorthup.chandpur.gov.bd	59
558	Chardukhia (West)	চরদুঃখিয়া (পশ্চিম)	chardukhiawestup.chandpur.gov.bd	59
562	Hamsadi (North)	হামছাদী (উত্তর)	northhamsadiup.lakshmipur.gov.bd	60
570	Chandrogonj	চন্দ্রগঞ্জ	chandrogonjup.lakshmipur.gov.bd	60
581	Charramoni Mohon	চররমনী মোহন	charramonimohonup.lakshmipur.gov.bd	60
587	Hajirhat	হাজিরহাট	hajirhatup.lakshmipur.gov.bd	61
588	Char Kadira	চর কাদিরা	charkadiraup.lakshmipur.gov.bd	61
593	Char Mohana	চর মোহনা	charmohanaup.lakshmipur.gov.bd	62
663	Kolagaon	কোলাগাঁও	kolagaonup.chittagong.gov.bd	68
666	Char Lakshya	চর লক্ষ্যা	charlakshyaup.chittagong.gov.bd	68
678	Habilasdwi	হাবিলাসদ্বীপ	habilasdwipup.chittagong.gov.bd	68
679	Haidgaon	হাইদগাঁও	haidgaonup.chittagong.gov.bd	68
1155	Adamdighi	আদমদিঘি	adamdighiup.bogra.gov.bd	127
1156	Kundagram	কুন্দগ্রাম	kundagramup.bogra.gov.bd	127
1157	Chapapur	চাঁপাপুর	chapapurup.bogra.gov.bd	127
1356	Atapur	আটাপুর	atapurup.joypurhat.gov.bd	153
1357	Mohammadpur	মোহাম্মদপুর	mohammadpurup.joypurhat.gov.bd	153
1358	Aolai	আওলাই	aolaiup.joypurhat.gov.bd	153
3321	Kailail	কৈলাইল	kailailup.dhaka.gov.bd	368
3322	Agla	আগলা	aglaup.dhaka.gov.bd	368
3323	Galimpur	গালিমপুর	galimpurup.dhaka.gov.bd	368
814	Sikalbaha	শিকলবাহা	sikalbahaup.chittagong.gov.bd	79
832	Paschim Bara Bheola	পশ্চিম বড় ভেওলা	paschimbarabheolaup.coxsbazar.gov.bd	81
857	Kalarmarchhara	কালারমারছড়া	kalarmarchharaup.coxsbazar.gov.bd	84
882	Saintmartin	সেন্ট মার্টিন	saintmartinup.coxsbazar.gov.bd	87
885	Golabari	গোলাবাড়ী	golabariup.khagrachhari.gov.bd	88
899	Laxmichhari	লক্ষীছড়ি	laxmichhariup.khagrachhari.gov.bd	91
934	Alekyong	আলেক্ষ্যং	alekyongup.bandarban.gov.bd	100
954	Dhukuriabera	ধুকুরিয়া বেড়া	dhukuriaberaup.sirajganj.gov.bd	104
1020	Ullapara Sadar	উল্লাপাড়া সদর	ullaparasadarup.sirajganj.gov.bd	112
1030	Ponchocroshi	পঞ্চক্রোশী	ponchocroshiup.sirajganj.gov.bd	112
1076	Debottar	দেবোত্তর	debottarup.pabna.gov.bd	118
1090	Nagdemra	নাগডেমড়া	nagdemraup.pabna.gov.bd	120
1208	Bihar	বিহার	biharup.bogra.gov.bd	133
1209	Shibganj	শিবগঞ্জ	shibganjup.bogra.gov.bd	133
1210	Deuly	দেউলি	deulyup.bogra.gov.bd	133
1211	Sayedpur	সৈয়দপুর	sayedpurup.bogra.gov.bd	133
1212	Mokamtala	মোকামতলা	mokamtalaup.bogra.gov.bd	133
1213	Raynagar	রায়নগর	raynagarup.bogra.gov.bd	133
1214	Darsanpara	দর্শনপাড়া	darsanparaup.rajshahi.gov.bd	134
1215	Hujuripara	হুজুরী পাড়া	hujuriparaup.rajshahi.gov.bd	134
1216	Damkura	দামকুড়া	damkuraup.rajshahi.gov.bd	134
1217	Horipur	হরিপুর	horipurup.rajshahi.gov.bd	134
1218	Horogram	হড়গ্রাম	horogramup.rajshahi.gov.bd	134
1219	Harian	হরিয়ান	harianup.rajshahi.gov.bd	134
1220	Borgachi	বড়্গাছি	borgachiup.rajshahi.gov.bd	134
1221	Parila	পারিলা	parilaup.rajshahi.gov.bd	134
1222	Naopara	নওপাড়া	naoparaup.rajshahi.gov.bd	135
1224	Pananagar	পানানগর	pananagarup.rajshahi.gov.bd	135
1225	Deluabari	দেলুয়াবাড়ী	deluabariup.rajshahi.gov.bd	135
1226	Jhaluka	ঝালুকা	jhalukaup.rajshahi.gov.bd	135
1227	Maria	মাড়িয়া	mariaup.rajshahi.gov.bd	135
1228	Joynogor	জয়নগর	joynogorup.rajshahi.gov.bd	135
1229	Dhuroil	ধুরইল	dhuroilup.rajshahi.gov.bd	136
1230	Ghasigram	ঘষিগ্রাম	ghasigramup.rajshahi.gov.bd	136
1231	Raighati	রায়ঘাটি	raighatiup.rajshahi.gov.bd	136
1232	Mougachi	মৌগাছি	mougachiup.rajshahi.gov.bd	136
1233	Baksimoil	বাকশিমইল	baksimoilup.rajshahi.gov.bd	136
1234	Jahanabad	জাহানাবাদ	jahanabadup.rajshahi.gov.bd	136
1235	Yousufpur	ইউসুফপুর	yousufpurup.rajshahi.gov.bd	137
1236	Solua	শলুয়া	soluaup.rajshahi.gov.bd	137
1237	Sardah	সরদহ	sardahup.rajshahi.gov.bd	137
1238	Nimpara	নিমপাড়া	nimparaup.rajshahi.gov.bd	137
1239	Charghat	চারঘাট	charghatup.rajshahi.gov.bd	137
1240	Vialuxmipur	ভায়ালক্ষ্মীপুর	vialuxmipurup.rajshahi.gov.bd	137
1241	Puthia	পুঠিয়া	puthiaup.rajshahi.gov.bd	138
1242	Belpukuria	বেলপুকুরিয়া	belpukuriaup.rajshahi.gov.bd	138
1243	Baneswar	বানেশ্বর	baneswarup.rajshahi.gov.bd	138
1244	Valukgachi	ভালুক গাছি	valukgachiup.rajshahi.gov.bd	138
1245	Shilmaria	শিলমাড়িয়া	shilmariaup.rajshahi.gov.bd	138
1246	Jewpara	জিউপাড়া	jewparaup.rajshahi.gov.bd	138
1247	Bajubagha	বাজুবাঘা	bajubaghaup.rajshahi.gov.bd	139
1248	Gorgori	গড়গড়ি	gorgoriup.rajshahi.gov.bd	139
1249	Pakuria	পাকুড়িয়া	pakuriaup.rajshahi.gov.bd	139
1250	Monigram	মনিগ্রাম	monigramup.rajshahi.gov.bd	139
1251	Bausa	বাউসা	bausaup.rajshahi.gov.bd	139
1252	Arani	আড়ানী	araniup.rajshahi.gov.bd	139
1253	Godagari	গোদাগাড়ী	godagariup.rajshahi.gov.bd	140
1254	Mohonpur	মোহনপুর	mohonpurup.rajshahi.gov.bd	140
1255	Pakri	পাকড়ী	pakriup.rajshahi.gov.bd	140
1256	Risikul	রিশিকুল	risikulup.rajshahi.gov.bd	140
1257	Gogram	গোগ্রাম	gogramup.rajshahi.gov.bd	140
1259	Dewpara	দেওপাড়া	dewparaup.rajshahi.gov.bd	140
1260	Basudebpur	বাসুদেবপুর	basudebpurup.rajshahi.gov.bd	140
1261	Asariadaha	আষাড়িয়াদহ	asariadahaup.rajshahi.gov.bd	140
1262	Kalma	কলমা	kalmaup.rajshahi.gov.bd	141
1263	Badhair	বাধাইড়	badhairup.rajshahi.gov.bd	141
1264	Panchandar	পাঁচন্দর	panchandarup.rajshahi.gov.bd	141
1265	Saranjai	সরঞ্জাই	saranjaiup.rajshahi.gov.bd	141
1266	Talondo	তালন্দ	talondoup.rajshahi.gov.bd	141
1267	Kamargaon	কামারগাঁ	kamargaonup.rajshahi.gov.bd	141
1268	Chanduria	চান্দুড়িয়া	chanduriaup.rajshahi.gov.bd	141
1269	Gobindopara	গোবিন্দপাড়া	gobindoparaup.rajshahi.gov.bd	142
1270	Nordas	নরদাস	nordasup.rajshahi.gov.bd	142
1271	Dippur	দ্বীপপুর	dippurup.rajshahi.gov.bd	142
3324	Churain	চুড়াইন	churainup.dhaka.gov.bd	368
3325	Nayabari	নয়াবাড়ী	nayabariup.dhaka.gov.bd	369
1274	Sreepur	শ্রীপুর	sreepurup.rajshahi.gov.bd	142
1275	Basupara	বাসুপাড়া	basuparaup.rajshahi.gov.bd	142
1277	Suvodanga	শুভডাঙ্গা	suvodangaup.rajshahi.gov.bd	142
1278	Mariaup	মাড়িয়া	mariaup10.rajshahi.gov.bd	142
1279	Ganipur	গণিপুর	ganipurup.rajshahi.gov.bd	142
1280	Zhikara	ঝিকড়া	zhikaraup.rajshahi.gov.bd	142
1281	Gualkandi	গোয়ালকান্দি	gualkandiup.rajshahi.gov.bd	142
1282	Hamirkutsa	হামিরকুৎসা	hamirkutsaup.rajshahi.gov.bd	142
1283	Jogipara	যোগিপাড়া	jogiparaup.rajshahi.gov.bd	142
1284	Sonadanga	সোনাডাঙ্গা	sonadangaup.rajshahi.gov.bd	142
1285	Brahmapur	ব্রহ্মপুর	brahmapurup.natore.gov.bd	143
1286	Madhnagar	মাধনগর	madhnagar.natore.gov.bd	143
1287	Khajura	খাজুরা	khajura.bdgovportal.com	143
1288	Piprul	পিপরুল	piprulup.natore.gov.bd	143
1289	Biprobelghoria	বিপ্রবেলঘড়িয়া	biprobelghoria.bdgovportal.com	143
1290	Chhatni	ছাতনী	chhatni.bdgovportal.com	143
1291	Tebaria	তেবাড়িয়া	tebariaup.natore.gov.bd	143
1292	Dighapatia	দিঘাপতিয়া	dighapatiaup.natore.gov.bd	143
1293	Luxmipurkholabaria	লক্ষীপুর খোলাবাড়িয়া	luxmipurkholabariaup.natore.gov.bd	143
1294	Barahorispur	বড়হরিশপুর	barahorispur.bdgovportal.com	143
1295	Kaphuria	কাফুরিয়া	kaphuria.bdgovportal.com	143
1296	Halsa	হালসা	halsa.natore.gov.bd	143
1297	Sukash	শুকাশ	sukashup.natore.gov.bd	144
1298	Dahia	ডাহিয়া	dahiaup.natore.gov.bd	144
1299	Italy	ইটালী	italyup.natore.gov.bd	144
1300	Kalam	কলম	kalamup.natore.gov.bd	144
1301	Chamari	চামারী	chamariup.natore.gov.bd	144
1302	Hatiandaha	হাতিয়ানদহ	hatiandahaup.natore.gov.bd	144
1303	Lalore	লালোর	laloreup.natore.gov.bd	144
1304	Sherkole	শেরকোল	sherkoleup.natore.gov.bd	144
1305	Tajpur	তাজপুর	tajpurup.natore.gov.bd	144
1306	Chaugram	চৌগ্রাম	chaugramup.natore.gov.bd	144
1307	Chhatardighi	ছাতারদিঘী	chhatardighiup.natore.gov.bd	144
1309	Joari	জোয়াড়ী	joariup.natore.gov.bd	145
1310	Baraigram	বড়াইগ্রাম	baraigramup.natore.gov.bd	145
1311	Zonail	জোনাইল	zonailup.natore.gov.bd	145
1312	Nagor	নগর	nagorup.natore.gov.bd	145
1313	Majgoan	মাঝগাও	majgoanup.natore.gov.bd	145
1314	Gopalpur	গোপালপুর	gopalpurup.natore.gov.bd	145
1315	Chandai	চান্দাই	chandai.bdgovportal.com	145
1316	Panka	পাঁকা	pankaup.natore.gov.bd	146
1317	Jamnagor	জামনগর	jamnagorup.natore.gov.bd	146
1318	Bagatipara	বাগাতিপাড়া	bagatiparaup.natore.gov.bd	146
1319	Dayarampur	দয়ারামপুর	dayarampurup.natore.gov.bd	146
1320	Faguardiar	ফাগুয়ারদিয়াড়	faguardiarup.natore.gov.bd	146
1321	Lalpur	লালপুর	lalpurup.natore.gov.bd	147
1322	Iswardi	ঈশ্বরদী	iswardiup.natore.gov.bd	147
1323	Chongdhupoil	চংধুপইল	chongdhupoilup.natore.gov.bd	147
1324	Arbab	আড়বাব	arbabup.natore.gov.bd	147
1325	Bilmaria	বিলমাড়িয়া	bilmariaup.natore.gov.bd	147
1326	Duaria	দুয়ারিয়া	duariaup.natore.gov.bd	147
1327	Oalia	ওয়ালিয়া	oaliaup.natore.gov.bd	147
1328	Durduria	দুড়দুরিয়া	durduriaup.natore.gov.bd	147
1329	Arjunpur	অর্জুনপুর বরমহাটী	arjunpurup.natore.gov.bd	147
1330	Kadimchilan	কদিমচিলান	kadimchilanup.natore.gov.bd	147
1331	Nazirpur	নাজিরপুর	nazirpurup.natore.gov.bd	148
1332	Biaghat	বিয়াঘাট	biaghatup.natore.gov.bd	148
1333	Khubjipur	খুবজীপুর	khubjipurup.natore.gov.bd	148
1334	Dharabarisha	ধারাবারিষা	dharabarishaup.natore.gov.bd	148
1335	Moshindha	মসিন্দা	moshindhaup.natore.gov.bd	148
1336	Chapila	চাপিলা	chapilaup.natore.gov.bd	148
1337	Rukindipur	রুকিন্দীপুর	rukindipurup.joypurhat.gov.bd	150
1338	Sonamukhi	সোনামূখী	sonamukhiup.joypurhat.gov.bd	150
1339	Tilakpur	তিলকপুর	tilakpurup.joypurhat.gov.bd	150
1341	Gopinathpur	গোপীনাথপুর	gopinathpurup.joypurhat.gov.bd	150
1342	Matrai	মাত্রাই	matraiup.joypurhat.gov.bd	151
1343	Ahammedabad	আহম্মেদাবাদ	ahammedabadup.joypurhat.gov.bd	151
1344	Punot	পুনট	punotup.joypurhat.gov.bd	151
1345	Zindarpur	জিন্দারপুর	zindarpurup.joypurhat.gov.bd	151
1346	Udaipur	উদয়পুর	udaipurup.joypurhat.gov.bd	151
1347	Alampur	আলমপুর	alampurup.joypurhat.gov.bd	152
1348	Borail	বড়াইল	borailup.joypurhat.gov.bd	152
1350	Mamudpur	মামুদপুর	mamudpurup.joypurhat.gov.bd	152
1351	Boratara	বড়তারা	borataraup.joypurhat.gov.bd	152
1352	Bagjana	বাগজানা	bagjanaup.joypurhat.gov.bd	153
3326	Kusumhathi	কুসুমহাটি	kusumhathiup.dhaka.gov.bd	369
1361	Bamb	বম্বু	bambuup.joypurhat.gov.bd	154
1362	Dogachi	দোগাছি	dogachiup.joypurhat.gov.bd	154
1364	Jamalpur	জামালপুর	jamalpurup.joypurhat.gov.bd	154
1365	Chakborkat	চকবরকত	chakborkatup.joypurhat.gov.bd	154
1366	Mohammadabad	মোহাম্মদাবাদ	mohammadabadup.joypurhat.gov.bd	154
1367	Dhalahar	ধলাহার	dhalaharup.joypurhat.gov.bd	154
1368	Bhadsha	ভাদসা	bhadshaup.joypurhat.gov.bd	154
1369	Alatuli	আলাতুলী	alatuliup.chapainawabganj.gov.bd	155
1370	Baroghoria	বারঘরিয়া	baroghoriaup.chapainawabganj.gov.bd	155
1371	Moharajpur	মহারাজপুর	moharajpurup.chapainawabganj.gov.bd	155
1372	Ranihati	রানীহাটি	ranihatiup.chapainawabganj.gov.bd	155
1373	Baliadanga	বালিয়াডাঙ্গা	baliadangaup.chapainawabganj.gov.bd	155
1374	Gobratola	গোবরাতলা	gobratolaup.chapainawabganj.gov.bd	155
1375	Jhilim	ঝিলিম	jhilimup.chapainawabganj.gov.bd	155
1376	Char Anupnagar	চর অনুপনগর	charaunupnagarup.chapainawabganj.gov.bd	155
1377	Debinagar	দেবীনগর	debinagarup.chapainawabganj.gov.bd	155
1378	Shahjahanpur	শাহজাহানপুর	shahjahanpurup.chapainawabganj.gov.bd	155
1379	Islampur	ইসলামপুর	islampurup.chapainawabganj.gov.bd	155
1380	Charbagdanga	চরবাগডাঙ্গা	charbagdangaup.chapainawabganj.gov.bd	155
1381	Narayanpur	নারায়নপুর	narayanpurup.chapainawabganj.gov.bd	155
1382	Sundarpur	সুন্দরপুর	sundarpurup.chapainawabganj.gov.bd	155
1383	Radhanagar	রাধানগর	radhanagarup.chapainawabganj.gov.bd	156
1384	Rahanpur	রহনপুর	rahanpurup.chapainawabganj.gov.bd	156
1385	Boalia	বোয়ালিয়া	boaliaup.chapainawabganj.gov.bd	156
1386	Bangabari	বাঙ্গাবাড়ী	bangabariup.chapainawabganj.gov.bd	156
1388	Chowdala	চৌডালা	chowdalaup.chapainawabganj.gov.bd	156
1389	Gomostapur	গোমস্তাপুর	gomostapurup.chapainawabganj.gov.bd	156
1390	Alinagar	আলীনগর	alinagarup.chapainawabganj.gov.bd	156
1391	Fhotepur	ফতেপুর	fhotepurup.chapainawabganj.gov.bd	157
1392	Kosba	কসবা	kosbaup.chapainawabganj.gov.bd	157
1393	Nezampur	নেজামপুর	nezampurup.chapainawabganj.gov.bd	157
1394	Nachol	নাচোল	nacholup.chapainawabganj.gov.bd	157
1395	Bholahat	ভোলাহাট	bholahatup.chapainawabganj.gov.bd	158
1396	Jambaria	জামবাড়িয়া	jambariaup.chapainawabganj.gov.bd	158
1397	Gohalbari	গোহালবাড়ী	gohalbariup.chapainawabganj.gov.bd	158
1398	Daldoli	দলদলী	daldoliup.chapainawabganj.gov.bd	158
1399	Binodpur	বিনোদপুর	binodpurup.chapainawabganj.gov.bd	159
1400	Chakkirti	চককির্তী	chakkirtiup.chapainawabganj.gov.bd	159
1401	Daipukuria	দাইপুকুরিয়া	daipukuriaup.chapainawabganj.gov.bd	159
1402	Dhainagar	ধাইনগর	dhainagarup.chapainawabganj.gov.bd	159
1403	Durlovpur	দুর্লভপুর	durlovpurup.chapainawabganj.gov.bd	159
1404	Ghorapakhia	ঘোড়াপাখিয়া	ghorapakhiaup.chapainawabganj.gov.bd	159
1405	Mobarakpur	মোবারকপুর	mobarakpurup.chapainawabganj.gov.bd	159
1406	Monakasha	মনাকষা	monakashaup.chapainawabganj.gov.bd	159
1407	Noyalavanga	নয়ালাভাঙ্গা	noyalavangaup.chapainawabganj.gov.bd	159
1408	Panka	পাঁকা	pankaup.chapainawabganj.gov.bd	159
2460	Rampasha	রামপাশা	rampashaup.sylhet.gov.bd	274
1409	Chatrajitpur	ছত্রাজিতপুর	chhatrajitpurup.chapainawabganj.gov.bd	159
1410	Shahabajpur	শাহাবাজপুর	shahabajpurup.chapainawabganj.gov.bd	159
1411	Shyampur	শ্যামপুর	shyampurup.chapainawabganj.gov.bd	159
1412	Kansat	কানসাট	kansatup.bdgovportal.com	159
1413	Ujirpur	উজিরপুর	ujirpurup.chapainawabganj.gov.bd	159
1414	1nomohadevpur	মহাদেবপুর	1nomohadevpurup.naogaon.gov.bd	160
1415	Hatur	হাতুড়	2nohaturup.naogaon.gov.bd	160
1416	Khajur	খাজুর	3nokhajurup.naogaon.gov.bd	160
1417	Chandas	চাঁন্দাশ	4nochandasup.naogaon.gov.bd	160
1419	Sofapur	সফাপুর	7nosofapurup.naogaon.gov.bd	160
1420	Uttargram	উত্তরগ্রাম	8nouttargramup.naogaon.gov.bd	160
1421	Cheragpur	চেরাগপুর	9nocheragpurup.naogaon.gov.bd	160
1422	Vimpur	ভীমপুর	10novimpurup.naogaon.gov.bd	160
1423	Roygon	রাইগাঁ	roygonup.naogaon.gov.bd	160
1424	Badalgachi	বদলগাছী	1nobadalgachiup.naogaon.gov.bd	161
1425	Mothurapur	মথুরাপুর	2nomothurapurup.naogaon.gov.bd	161
1426	Paharpur	পাহারপুর	3nopaharpurup.naogaon.gov.bd	161
1427	Mithapur	মিঠাপুর	4nomithapurup.naogaon.gov.bd	161
1428	Kola	কোলা	5nokolaup.naogaon.gov.bd	161
1429	Bilashbari	বিলাশবাড়ী	6nobilashbariup.naogaon.gov.bd	161
1430	Adhaipur	আধাইপুর	7noadhaipurup.naogaon.gov.bd	161
1431	Balubhara	বালুভরা	8nobalubharaup.naogaon.gov.bd	161
1432	Patnitala	পত্নীতলা	1nopatnitalaup.naogaon.gov.bd	162
1433	Nirmail	নিমইল	2nonirmailup.naogaon.gov.bd	162
1434	Dibar	দিবর	3nodibarup.naogaon.gov.bd	162
1435	Akbarpur	আকবরপুর	4noakbarpurup.naogaon.gov.bd	162
1436	Matindar	মাটিন্দর	5nomatindarup.naogaon.gov.bd	162
3327	Raipara	রাইপাড়া	raiparaup.dhaka.gov.bd	369
1439	Nazipur	নজিপুর	8nonazipurup.naogaon.gov.bd	162
1440	Ghasnagar	ঘষনগর	9noghasnagarup.naogaon.gov.bd	162
1441	Amair	আমাইড়	10noamairup.naogaon.gov.bd	162
1442	Shihara	শিহারা	11noahiharaup.naogaon.gov.bd	162
1444	Alampur	আলমপুর	3noalampurup.naogaon.gov.bd	163
1445	Umar	উমার	4noumarup.naogaon.gov.bd	163
1446	Aranagar	আড়ানগর	5noaranagarup.naogaon.gov.bd	163
1447	Jahanpur	জাহানপুর	6nojahanpurup.naogaon.gov.bd	163
1448	Isabpur	ইসবপুর	7noisabpurup.naogaon.gov.bd	163
1449	Khelna	খেলনা	8nokhelnaup.naogaon.gov.bd	163
1450	Agradigun	আগ্রাদ্বিগুন	2noagradigunup.naogaon.gov.bd	163
1451	Hajinagar	হাজীনগর	1nohajinagarup.naogaon.gov.bd	164
1452	Chandannagar	চন্দননগর	2nochandannagarup.naogaon.gov.bd	164
1453	Bhabicha	ভাবিচা	3nobhabichaup.naogaon.gov.bd	164
1454	Niamatpur	নিয়ামতপুর	4noniamatpurup.naogaon.gov.bd	164
1455	Rasulpur	রসুলপুর	5norasulpurup.naogaon.gov.bd	164
1456	Paroil	পাড়ইল	6noparoilup.naogaon.gov.bd	164
1458	Bahadurpur	বাহাদুরপুর	8nobahadurpurup.naogaon.gov.bd	164
1459	Varsho	ভারশো	1novarshoup.naogaon.gov.bd	165
1460	Valain	ভালাইন	2novalainup.naogaon.gov.bd	165
1461	Paranpur	পরানপুর	3noparanpurup.naogaon.gov.bd	165
1462	Manda	মান্দা	4nomandaup.naogaon.gov.bd	165
1463	Goneshpur	গনেশপুর	5nogoneshpurup.naogaon.gov.bd	165
1464	Moinom	মৈনম	6nomoinomup.naogaon.gov.bd	165
1465	Proshadpur	প্রসাদপুর	7noproshadpurup.naogaon.gov.bd	165
1466	Kosomba	কুসুম্বা	8nokosombaup.naogaon.gov.bd	165
1467	Tetulia	তেঁতুলিয়া	9notetuliaup.naogaon.gov.bd	165
1468	Nurullabad	নূরুল্যাবাদ	10nonurullabadup.naogaon.gov.bd	165
1469	Kalikapur	কালিকাপুর	11nokalikapurup.naogaon.gov.bd	165
1470	Kashopara	কাঁশোকাপুর	12nokashoparaup.naogaon.gov.bd	165
1471	Koshob	কশব	13nokoshobup.naogaon.gov.bd	165
1472	Bisnopur	বিষ্ণপুর	14nobisnopurup.naogaon.gov.bd	165
1473	Shahagola	শাহাগোলা	1noshahagolaup.naogaon.gov.bd	166
1474	Bhonpara	ভোঁপড়া	2nobhonparaup.naogaon.gov.bd	166
1475	Ahsanganj	আহসানগঞ্জ	3noahsanganjup.naogaon.gov.bd	166
1476	Panchupur	পাঁচুপুর	4nopanchupurup.naogaon.gov.bd	166
1477	Bisha	বিশা	5nobishaup.naogaon.gov.bd	166
1478	Maniary	মনিয়ারী	6nomaniaryup.naogaon.gov.bd	166
1479	Kalikapur	কালিকাপুর	7nokalikapurup.naogaon.gov.bd	166
1480	Hatkalupara	হাটকালুপাড়া	8nohatkaluparaup.naogaon.gov.bd	166
1482	Kashimpur	কাশিমপুর	2nokashimpurup.naogaon.gov.bd	167
1483	Gona	গোনা	3nogonaup.naogaon.gov.bd	167
1484	Paroil	পারইল	4noparoilup.naogaon.gov.bd	167
1485	Borgoca	বরগাছা	5noborgocaup.naogaon.gov.bd	167
1486	Kaligram	কালিগ্রাম	6nokaligramup.naogaon.gov.bd	167
1487	Ekdala	একডালা	7noekdalaup.naogaon.gov.bd	167
1488	Mirat	মিরাট	8nomiratup.naogaon.gov.bd	167
1489	Barshail	বর্ষাইল	1nobarshailup.naogaon.gov.bd	168
1490	Kritipur	কির্ত্তিপুর	2nokritipurup.naogaon.gov.bd	168
1491	Baktiarpur	বক্তারপুর	3nobaktiarpurup.naogaon.gov.bd	168
1492	Tilakpur	তিলোকপুর	4notilakpurup.naogaon.gov.bd	168
1493	Hapaniya	হাপানিয়া	5nohapaniyaup.naogaon.gov.bd	168
1494	Dubalhati	দুবলহাটী	6nodubalhatiup.naogaon.gov.bd	168
1495	Boalia	বোয়ালিয়া	7noboaliaup.naogaon.gov.bd	168
1496	Hashaigari	হাঁসাইগাড়ী	8nohashaigariup.naogaon.gov.bd	168
1497	Chandipur	চন্ডিপুর	9nochandipurup.naogaon.gov.bd	168
1498	Bolihar	বলিহার	10noboliharup.naogaon.gov.bd	168
1499	Shekerpur	শিকারপুর	11noshekerpurup.naogaon.gov.bd	168
1500	Shailgachhi	শৈলগাছী	12noshailgachhiup.naogaon.gov.bd	168
1501	Nitpur	নিতপুর	nitpurup.naogaon.gov.bd	169
1502	Tetulia	তেঁতুলিয়া	2notetuliaup.naogaon.gov.bd	169
1503	Chhaor	ছাওড়	3nochhaorup.naogaon.gov.bd	169
1504	Ganguria	গাঙ্গুরিয়া	4noganguriaup.naogaon.gov.bd	169
1505	Ghatnagar	ঘাটনগর	5noghatnagarup.naogaon.gov.bd	169
1506	Moshidpur	মশিদপুর	6nomoshidpurup.naogaon.gov.bd	169
1507	Sapahar	সাপাহার	1nosapaharup.naogaon.gov.bd	170
1508	Tilna	তিলনা	3notilnaup.naogaon.gov.bd	170
1509	Aihai	আইহাই	4noaihaiup.naogaon.gov.bd	170
1510	Shironti	শিরন্টী	6noshirontiup.naogaon.gov.bd	170
1511	Goala	গোয়ালা	goalaup.naogaon.gov.bd	170
1512	Patari	পাতাড়ী	patariup.naogaon.gov.bd	170
1513	Nehalpur	নেহালপুর	nehalpurup.jessore.gov.bd	171
1514	Hariharnagar	হরিহরনগর	hariharnagarup.jessore.gov.bd	171
1515	Haridaskati	হরিদাসকাটি	haridaskatiup.jessore.gov.bd	171
1516	Shyamkur	শ্যামকুড়	shyamkurup.jessore.gov.bd	171
1517	Rohita	রোহিতা	rohitaup.jessore.gov.bd	171
3328	Sutarpara	সুতারপাড়া	sutarparaup.dhaka.gov.bd	369
3329	Narisha	নারিশা	narishaup.dhaka.gov.bd	369
1520	Manirampur	মনিরামপুর	manirampurup.jessore.gov.bd	171
1521	Bhojgati	ভোজগাতি	bhojgatiup.jessore.gov.bd	171
1522	Durbadanga	দুর্বাডাংগা	durbadangaup.jessore.gov.bd	171
1523	Dhakuria	ঢাকুরিয়া	dhakuriaup.jessore.gov.bd	171
1524	Jhanpa	ঝাঁপা	jhanpaup.jessore.gov.bd	171
1526	Khedapara	খেদাপাড়া	khedaparaup.jessore.gov.bd	171
1527	Khanpur	খানপুর	khanpurup.jessore.gov.bd	171
1528	Kultia	কুলটিয়া	kultiaup.jessore.gov.bd	171
1529	Kashimnagar	কাশিমনগর	kashimnagarup.jessore.gov.bd	171
1530	Baghutia	বাঘুটিয়া	baghutia.jessore.gov.bd	172
1531	Chalishia	চলিশিয়া	chalishiaup.jessore.gov.bd	172
1532	Sundoli	সুন্দলী	sundoliup.jessore.gov.bd	172
1533	Siddhipasha	সিদ্দিপাশা	siddhipashaup.jessore.gov.bd	172
1535	Subharara	শুভরাড়া	subhararaup.jessore.gov.bd	172
1536	Prambag	প্রেমবাগ	prambagup.jessore.gov.bd	172
1537	Payra	পায়রা	payraup.jessore.gov.bd	172
1538	Jaharpur	জহুরপুর	jaharpurup.jessore.gov.bd	173
1539	Jamdia	জামদিয়া	jamdiaup.jessore.gov.bd	173
1540	Darajhat	দরাজহাট	darajhatup.jessore.gov.bd	173
1541	Dhalgram	ধলগ্রাম	dhalgramup.jessore.gov.bd	173
1542	Narikelbaria	নারিকেলবাড়ীয়া	narikelbariaup.jessore.gov.bd	173
1543	Bandabilla	বন্দবিলা	bandabillaup.jessore.gov.bd	173
1544	Basuari	বাসুয়াড়ী	basuariup.jessore.gov.bd	173
1545	Roypur	রায়পুর	roypurup.jessore.gov.bd	173
1546	Dohakula	দোহাকুলা	dohakulaup.jessore.gov.bd	173
1547	Chougachha	চৌগাছা	chougachhaup5.jessore.gov.bd	174
1548	Jagadishpur	জগদীশপুর	jagadishpurup6.jessore.gov.bd	174
1549	Dhuliani	ধুলিয়ানী	dhulianiup4.jessore.gov.bd	174
1550	Narayanpur	নারায়নপুর	narayanpurup10.jessore.gov.bd	174
1551	Patibila	পাতিবিলা	patibilaup7.jessore.gov.bd	174
1552	Pashapole	পাশাপোল	pashapoleup2.jessore.gov.bd	174
1553	Fulsara	ফুলসারা	fulsaraup1.jessore.gov.bd	174
1555	Sukpukhuria	সুখপুকুরিয়া	sukpukhuriaup11.jessore.gov.bd	174
1556	Swarupdaha	সরুপদাহ	swarupdahaup9.jessore.gov.bd	174
1557	Hakimpur	হাকিমপুর	hakimpurup8.jessore.gov.bd	174
1558	Gangananda	গংগানন্দপুর	ganganandapurup.jessore.gov.bd	175
1559	Gadkhali	গদখালী	gadkhaliup.jessore.gov.bd	175
1560	Jhikargachha	ঝিকরগাছা	jhikargachhaup.jessore.gov.bd	175
1561	Nabharan	নাভারন	nabharanup.jessore.gov.bd	175
1562	Nibaskhola	নির্বাসখোলা	nibaskholaup.jessore.gov.bd	175
1563	Panisara	পানিসারা	panisaraup.jessore.gov.bd	175
1564	Bankra	বাঁকড়া	bankraup.jessore.gov.bd	175
1565	Shankarpur	শংকরপুর	shankarpurup10.jessore.gov.bd	175
1566	Shimulia	শিমুলিয়া	shimuliaup3.jessore.gov.bd	175
1567	Hajirbagh	হাজিরবাগ	hajirbaghup9.jessore.gov.bd	175
1568	Magura	মাগুরা	maguraup.jessore.gov.bd	175
1569	Sufalakati	সুফলাকাটি	sufalakatiup8.jessore.gov.bd	176
1570	Sagardari	সাগরদাড়ী	sagardariup2.jessore.gov.bd	176
1571	Majidpur	মজিদপুর	majidpurup3.jessore.gov.bd	176
1572	Mongolkot	মঙ্গলকোর্ট	mongolkotup5.jessore.gov.bd	176
1573	Bidyanandakati	বিদ্যানন্দকাটি	bidyanandakatiup4.jessore.gov.bd	176
1574	Panjia	পাজিয়া	panjiaup7.jessore.gov.bd	176
1575	Trimohini	ত্রিমোহিনী	trimohiniup1.jessore.gov.bd	176
1576	Gaurighona	গৌরিঘোনা	gaurighonaup9.jessore.gov.bd	176
1577	Keshabpur	কেশবপুর	keshabpurup6.jessore.gov.bd	176
1578	Lebutala	লেবুতলা	lebutalaup.jessore.gov.bd	177
1579	Ichhali	ইছালী	ichhaliup.jessore.gov.bd	177
1580	Arabpur	আরবপুর	arabpurup9.jessore.gov.bd	177
1581	Upasahar	উপশহর	upasaharup.jessore.gov.bd	177
1582	Kachua	কচুয়া	kachuaup13.jessore.gov.bd	177
1584	Chanchra	চাঁচড়া	chanchraup.jessore.gov.bd	177
1585	Churamankati	চূড়ামনকাটি	churamankatiup.jessore.gov.bd	177
1586	Narendrapur	নরেন্দ্রপুর	narendrapurup.jessore.gov.bd	177
1587	Noapara	নওয়াপাড়া	noaparaup4.jessore.gov.bd	177
1588	Fathehpur	ফতেপুর	fathehpurup.jessore.gov.bd	177
1589	Basundia	বসুন্দিয়া	basundiaup.jessore.gov.bd	177
1590	Ramnagar	রামনগর	ramnagarup.jessore.gov.bd	177
1591	Haibatpur	হৈবতপুর	haibatpurup.jessore.gov.bd	177
1592	Dearamodel	দেয়ারা মডেল	dearamodelup.jessore.gov.bd	177
1593	Ulshi	উলশী	ulshiup9.jessore.gov.bd	178
1594	Sharsha	শার্শা	sharshaup10.jessore.gov.bd	178
1595	Lakshmanpur	লক্ষণপুর	lakshmanpurup2.jessore.gov.bd	178
1596	Benapole	বেনাপোল	benapoleup4.jessore.gov.bd	178
1597	Bahadurpur	বাহাদুরপুর	bahadurpurup3.jessore.gov.bd	178
3330	Muksudpur	মুকসুদপুর	muksudpurup.dhaka.gov.bd	369
1600	Nizampur	নিজামপুর	nizampurup11.jessore.gov.bd	178
1601	Dihi	ডিহি	dihiup1.jessore.gov.bd	178
1602	Goga	গোগা	gogaup6.jessore.gov.bd	178
1603	Kayba	কায়বা	kaybaup7.jessore.gov.bd	178
1605	Assasuni	আশাশুনি	assasuniup.satkhira.gov.bd	179
1606	Kadakati	কাদাকাটি	kadakatiup.satkhira.gov.bd	179
1607	Kulla	কুল্যা	kullaup.satkhira.gov.bd	179
1608	Khajra	খাজরা	khajraup.satkhira.gov.bd	179
1609	Durgapur	দরগাহপুর	durgapurup.satkhira.gov.bd	179
1610	Pratapnagar	প্রতাপনগর	pratapnagarup.satkhira.gov.bd	179
1611	Budhhata	বুধহাটা	budhhataup.satkhira.gov.bd	179
1612	Baradal	বড়দল	baradalup.satkhira.gov.bd	179
1613	Sreeula	শ্রীউলা	sreeulaup.satkhira.gov.bd	179
1614	Sobhnali	শোভনালী	sobhnaliup.satkhira.gov.bd	179
1615	Kulia	কুলিয়া	kuliaup.satkhira.gov.bd	180
1616	Debhata	দেবহাটা	debhataup.satkhira.gov.bd	180
1617	Noapara	নওয়াপাড়া	noaparaup.satkhira.gov.bd	180
1618	Parulia	পারুলিয়া	paruliaup.satkhira.gov.bd	180
1619	Sakhipur	সখিপুর	sakhipurup.satkhira.gov.bd	180
1620	Kushadanga	কুশোডাংগা	kushadangaup.satkhira.gov.bd	181
1621	Keralkata	কেরালকাতা	keralkataup.satkhira.gov.bd	181
1622	Keragachhi	কেঁড়াগাছি	keragachhiup.satkhira.gov.bd	181
1623	Kaila	কয়লা	kailaup.satkhira.gov.bd	181
1624	Jallabad	জালালাবাদ	jallabadup.satkhira.gov.bd	181
1625	Jogikhali	যুগিখালী	jogikhaliup.satkhira.gov.bd	181
1627	Sonabaria	সোনাবাড়িয়া	sonabariaup.satkhira.gov.bd	181
1628	Helatala	হেলাতলা	helatalaup.satkhira.gov.bd	181
1629	Chandanpur	চন্দনপুর	chandanpurup.satkhira.gov.bd	181
1630	Deara	দেয়ারা	dearaup.satkhira.gov.bd	181
1631	Joynagar	জয়নগর	joynagarup.satkhira.gov.bd	181
1632	Shibpur	শিবপুর	shibpurup.satkhira.gov.bd	182
1633	Labsa	লাবসা	labsaup.satkhira.gov.bd	182
1634	Bhomra	ভোমরা	bhomraup.satkhira.gov.bd	182
1635	Brahmarajpur	ব্রক্ষ্মরাজপুর	brahmarajpurup.satkhira.gov.bd	182
1636	Balli	বল্লী	balliup.satkhira.gov.bd	182
1637	Banshdaha	বাঁশদহ	banshdahaup.satkhira.gov.bd	182
1638	Baikari	বৈকারী	baikariup.satkhira.gov.bd	182
1639	Fingri	ফিংড়ি	fingriup.satkhira.gov.bd	182
1640	Dhulihar	ধুলিহর	dhuliharup.satkhira.gov.bd	182
1641	Jhaudanga	ঝাউডাঙ্গা	jhaudangaup.satkhira.gov.bd	182
1642	Ghona	ঘোনা	ghonaup.satkhira.gov.bd	182
1643	Kuskhali	কুশখালী	kuskhaliup.satkhira.gov.bd	182
1644	Alipur	আলিপুর	alipurup.satkhira.gov.bd	182
1645	Agardari	আগরদাড়ী	agardariup.satkhira.gov.bd	182
1646	Atulia	আটুলিয়া	atuliaup.satkhira.gov.bd	183
1647	Ishwaripur	ঈশ্বরীপুর	ishwaripurup.satkhira.gov.bd	183
1648	Kaikhali	কৈখালী	kaikhaliup.satkhira.gov.bd	183
1649	Kashimari	কাশিমাড়ী	kashimariup.satkhira.gov.bd	183
1650	Nurnagar	নুরনগর	nurnagarup.satkhira.gov.bd	183
1651	Padmapukur	পদ্মপুকুর	padmapukurup.satkhira.gov.bd	183
1653	Bhurulia	ভুরুলিয়া	bhuruliaup.satkhira.gov.bd	183
1654	Munshiganj	মুন্সীগজ্ঞ	munshiganjup.satkhira.gov.bd	183
1655	Ramjannagar	রমজাননগর	ramjannagarup.satkhira.gov.bd	183
1656	Shyamnagar	শ্যামনগর	shyamnagarup.satkhira.gov.bd	183
1657	Gabura	গাবুরা	gaburaup.satkhira.gov.bd	183
1658	Sarulia	সরুলিয়া	saruliaup3.satkhira.gov.bd	184
1659	Magura	মাগুরা	maguraup8.satkhira.gov.bd	184
1660	Nagarghata	নগরঘাটা	nagarghataup1.satkhira.gov.bd	184
1661	Dhandia	ধানদিয়া	dhandiaup1.satkhira.gov.bd	184
1662	Tentulia	তেতুলিয়া	tentuliaup5.satkhira.gov.bd	184
1663	Tala	তালা	talaup6.satkhira.gov.bd	184
1664	Jalalpur	জালালপুর	jalalpurup11.satkhira.gov.bd	184
1665	Khesra	খেশরা	khesraup10.satkhira.gov.bd	184
1666	Khalishkhali	খলিশখালী	khalishkhaliup9.satkhira.gov.bd	184
1667	Khalilnagar	খলিলনগর	khalilnagarup12.satkhira.gov.bd	184
1668	Kumira	কুমিরা	kumiraup4.satkhira.gov.bd	184
1669	Islamkati	ইসলামকাটি	islamkatiup7.satkhira.gov.bd	184
1670	Kushlia	কুশুলিয়া	kushliaup.satkhira.gov.bd	185
1671	Champaphul	চাম্পাফুল	champaphulup.satkhira.gov.bd	185
1672	Tarali	তারালী	taraliup.satkhira.gov.bd	185
1674	Dhalbaria	ধলবাড়িয়া	dhalbariaup.satkhira.gov.bd	185
1675	Nalta	নলতা	naltaup.satkhira.gov.bd	185
1676	Bishnupur	বিষ্ণুপুর	bishnupurup.satkhira.gov.bd	185
1677	Bharasimla	ভাড়াশিমলা	bharasimlaup.satkhira.gov.bd	185
1678	Mathureshpur	মথুরেশপুর	mathureshpurup.satkhira.gov.bd	185
1679	Ratanpur	রতনপুর	ratanpurup.satkhira.gov.bd	185
3331	Mahmudpur	মাহমুদপুর	mahmudpurup.dhaka.gov.bd	369
3332	Bilaspur	বিলাসপুর	bilaspurup.dhaka.gov.bd	369
1683	Monakhali	মোনাখালী	monakhali.meherpur.gov.bd	186
1684	Bagowan	বাগোয়ান	bagowanup.meherpur.gov.bd	186
1685	Mohajanpur	মহাজনপুর	mohajanpurup.meherpur.gov.bd	186
1686	Amjhupi	আমঝুপি	amjhupi.meherpur.gov.bd	187
1687	Pirojpur	পিরোজপুর	pirojpurup.meherpur.gov.bd	187
1688	Kutubpur	কতুবপুর	kutubpurup.meherpur.gov.bd	187
1689	Amdah	আমদহ	amdahup.meherpur.gov.bd	187
1690	Buripota	বুড়িপোতা	buripotaup.meherpur.gov.bd	187
1692	Kazipur	কাজিপুর	kazipurup.meherpur.gov.bd	188
1693	Bamondi	বামন্দী	bamondiup.meherpur.gov.bd	188
1694	Motmura	মটমুড়া	motmuraup.meherpur.gov.bd	188
1695	Sholotaka	ষোলটাকা	sholotakaup.meherpur.gov.bd	188
1696	Shaharbati	সাহারবাটী	shaharbatiup.meherpur.gov.bd	188
1697	Dhankolla	ধানখোলা	dhankollaup.meherpur.gov.bd	188
1698	Raipur	রায়পুর	raipurup.meherpur.gov.bd	188
1699	Kathuli	কাথুলী	kathuli.meherpur.gov.bd	188
1700	Sheikhati	সেখহাটী	sheikhatiup.narail.gov.bd	189
1701	Tularampur	তুলারামপুর	tularampurup.narail.gov.bd	189
1702	Kalora	কলোড়া	kaloraup.narail.gov.bd	189
1703	Shahabad	শাহাবাদ	shahabadup.narail.gov.bd	189
1704	Bashgram	বাশগ্রাম	bashgramup.narail.gov.bd	189
1705	Habokhali	হবখালী	habokhaliup.narail.gov.bd	189
1706	Maijpara	মাইজপাড়া	maijparaup.narail.gov.bd	189
1707	Bisali	বিছালী	bisaliup.narail.gov.bd	189
1708	Chandiborpur	চন্ডিবরপুর	chandiborpurup.narail.gov.bd	189
1709	Bhadrabila	ভদ্রবিলা	bhadrabilaup.narail.gov.bd	189
1710	Auria	আউড়িয়া	auriaup.narail.gov.bd	189
1711	Singasholpur	সিঙ্গাশোলপুর	singasholpurup.narail.gov.bd	189
1712	Mulia	মুলিয়া	muliaup.narail.gov.bd	189
1713	Lohagora	লোহাগড়া	lohagoraup.narail.gov.bd	190
1714	Kashipur	কাশিপুর	kashipurup.narail.gov.bd	190
1715	Naldi	নলদী	naldiup.narail.gov.bd	190
1716	Noagram	নোয়াগ্রাম	noagramup.narail.gov.bd	190
1717	Lahuria	লাহুড়িয়া	lahuriaup.narail.gov.bd	190
1718	Mallikpur	মল্লিকপুর	mallikpurup.narail.gov.bd	190
1719	Salnagar	শালনগর	salnagarup.narail.gov.bd	190
1720	Lakshmipasha	লক্ষীপাশা	lakshmipashaup.narail.gov.bd	190
1721	Joypur	জয়পুর	joypurup.narail.gov.bd	190
1722	Kotakol	কোটাকোল	kotakolup.narail.gov.bd	190
1723	Digholia	দিঘলিয়া	digholiaup1.narail.gov.bd	190
1724	Itna	ইতনা	itnaup.narail.gov.bd	190
1725	Jaynagor	জয়নগর	jaynagorup.narail.gov.bd	191
1726	Pahordanga	পহরডাঙ্গা	pahordangaup.narail.gov.bd	191
1727	Babrahasla	বাবরা-হাচলা	babrahaslaup.narail.gov.bd	191
1728	Salamabad	সালামাবাদ	salamabadup.narail.gov.bd	191
1729	Baioshona	বাঐসোনা	baioshonaup.narail.gov.bd	191
1730	Chacuri	চাচুড়ী	chacuriup.narail.gov.bd	191
1731	Hamidpur	হামিদপুর	hamidpurup.narail.gov.bd	191
1732	Peroli	পেড়লী	peroliup.narail.gov.bd	191
1733	Khashial	খাসিয়াল	khashialup.narail.gov.bd	191
1734	Purulia	পুরুলিয়া	puruliaup.narail.gov.bd	191
1735	Kalabaria	কলাবাড়ীয়া	kalabariaup.narail.gov.bd	191
1736	Mauli	মাউলী	mauliup.narail.gov.bd	191
1737	Boronaleliasabad	বড়নাল-ইলিয়াছাবাদ	boronaleliasabadup.narail.gov.bd	191
1738	Panchgram	পাঁচগ্রাম	panchgramup.narail.gov.bd	191
1739	Alukdia	আলুকদিয়া	alukdia.chuadanga.gov.bd	192
1740	Mominpur	মোমিনপুর	mominpur.chuadanga.gov.bd	192
1741	Titudah	তিতুদাহ	titudah.chuadanga.gov.bd	192
1742	Shankarchandra	শংকরচন্দ্র	shankarchandra.chuadanga.gov.bd	192
1743	Begumpur	বেগমপুর	begumpur.chuadanga.gov.bd	192
1744	Kutubpur	কুতুবপুর	kutubpur.chuadanga.gov.bd	192
1745	Padmabila	পদ্মবিলা	padmabila.chuadanga.gov.bd	192
1746	Bhangbaria	ভাংবাড়ীয়া	bhangbaria.chuadanga.gov.bd	193
1747	Baradi	বাড়াদী	baradiup.chuadanga.gov.bd	193
1748	Gangni	গাংনী	gangniup.chuadanga.gov.bd	193
1749	Khadimpur	খাদিমপুর	khadimpurup.chuadanga.gov.bd	193
1750	Jehala	জেহালা	jehalaup.chuadanga.gov.bd	193
1751	Belgachi	বেলগাছি	belgachiup.chuadanga.gov.bd	193
1752	Dauki	ডাউকী	daukiup.chuadanga.gov.bd	193
1753	Jamjami	জামজামি	jamjamiup.chuadanga.gov.bd	193
1754	Nagdah	নাগদাহ	nagdahup.chuadanga.gov.bd	193
1755	Kashkorara	খাসকররা	kashkoraraup.chuadanga.gov.bd	193
1756	Chitla	চিৎলা	chitlaup.chuadanga.gov.bd	193
1757	Kalidashpur	কালিদাসপুর	kalidashpurup.chuadanga.gov.bd	193
1758	Kumari	কুমারী	kumariup.chuadanga.gov.bd	193
1759	Hardi	হারদী	hardiup.chuadanga.gov.bd	193
1760	Ailhash	আইলহাঁস	ailhashup.chuadanga.gov.bd	193
3333	Rampal	রামপাল	rampalup.munshiganj.gov.bd	370
3334	Panchashar	পঞ্চসার	panchasharup.munshiganj.gov.bd	370
1765	Kurulgachhi	কুড়ালগাছী	kurulgachhi.chuadanga.gov.bd	194
1767	Juranpur	জুড়ানপুর	juranpurup.chuadanga.gov.bd	194
1780	Ailchara	আইলচারা	7noailcharaup.kushtia.gov.bd	196
1781	Patikabari	পাটিকাবাড়ী	8nopatikabariup.kushtia.gov.bd	196
1782	Jhaudia	ঝাউদিয়া	9nojhaudiaup.kushtia.gov.bd	196
1783	Ujangram	উজানগ্রাম	10noujangramup.kushtia.gov.bd	196
1784	Abdulpur	আব্দালপুর	11noabdulpurup.kushtia.gov.bd	196
1785	Harinarayanpur	হরিনারায়নপুর	12noharinarayanpurup.kushtia.gov.bd	196
1786	Monohardia	মনোহরদিয়া	13nomonohardiaup.kushtia.gov.bd	196
1788	Kaya	কয়া	1nokayaup.kushtia.gov.bd	197
1789	Jagonnathpur	জগন্নাথপুর	3nojagonnathpurup.kushtia.gov.bd	197
1790	Sadki	সদকী	4nosadkiup.kushtia.gov.bd	197
1791	Shelaidah	শিলাইদহ	2noshelaidahup.kushtia.gov.bd	197
1792	Nandolalpur	নন্দলালপুর	5nonandolalpurup.kushtia.gov.bd	197
1793	Chapra	চাপড়া	6nochapraup.kushtia.gov.bd	197
1794	Bagulat	বাগুলাট	7nobagulatup.kushtia.gov.bd	197
1795	Jaduboyra	যদুবয়রা	8nojaduboyraup.kushtia.gov.bd	197
1796	Chadpur	চাঁদপুর	9nochadpurup.kushtia.gov.bd	197
1797	Panti	পান্টি	10nopantiup.kushtia.gov.bd	197
1798	Charsadipur	চরসাদীপুর	11nocharsadipurup.kushtia.gov.bd	197
1799	Khoksa	খোকসা	1nokhoksaup.kushtia.gov.bd	198
1800	Osmanpur	ওসমানপুর	2noosmanpurup.kushtia.gov.bd	198
1801	Janipur	জানিপুর	4nojanipurup.kushtia.gov.bd	198
1802	Shimulia	শিমুলিয়া	5noshimuliaup.kushtia.gov.bd	198
1803	Joyntihazra	জয়ন্তীহাজরা	8nojoyntihazraup.kushtia.gov.bd	198
1804	Ambaria	আমবাড়ীয়া	9noambariaup.kushtia.gov.bd	198
1805	Bethbaria	বেতবাড়ীয়া	3nobethbariaup.kushtia.gov.bd	198
1806	Shomospur	শোমসপুর	6noshomospurup.kushtia.gov.bd	198
1807	Gopgram	গোপগ্রাম	gopgram7up.kushtia.gov.bd	198
1808	Chithalia	চিথলিয়া	chithaliaup.kushtia.gov.bd	199
1809	Bahalbaria	বহলবাড়ীয়া	bahalbariaup.kushtia.gov.bd	199
1810	Talbaria	তালবাড়ীয়া	talbariaup.kushtia.gov.bd	199
1811	Baruipara	বারুইপাড়া	baruiparaup.kushtia.gov.bd	199
1812	Fulbaria	ফুলবাড়ীয়া	fulbariaup.kushtia.gov.bd	199
1813	Amla	আমলা	amlaup.kushtia.gov.bd	199
1814	Sadarpur	সদরপুর	sadarpurup.kushtia.gov.bd	199
1815	Chhatian	ছাতিয়ান	chhatianup.kushtia.gov.bd	199
1816	Poradaha	পোড়াদহ	poradahaup.kushtia.gov.bd	199
1817	Kursha	কুর্শা	kurshaup.kushtia.gov.bd	199
1818	Ambaria	আমবাড়ীয়া	ambariaup.kushtia.gov.bd	199
1819	Dhubail	ধূবইল	dhubailup.kushtia.gov.bd	199
1820	Malihad	মালিহাদ	11nomalihadup.kushtia.gov.bd	199
1821	Daulatpur	দৌলতপুর	daulatpurup.kushtia.gov.bd	200
1822	Adabaria	ড়ীয়া	adabariaup.kushtia.gov.bd	200
1823	Hogolbaria	হোগলবাড়ীয়া	hogolbariaup.kushtia.gov.bd	200
1824	Boalia	বোয়ালি	boaliaup.kushtia.gov.bd	200
1825	Philipnagor	ফিলিপনগর	philipnagorup.kushtia.gov.bd	200
1826	Aria	আড়িয়া	ariaup.kushtia.gov.bd	200
1827	Khalishakundi	খলিশাকুন্ডি	khalishakundiup.kushtia.gov.bd	200
1828	Chilmary	চিলমারী	chilmaryup.kushtia.gov.bd	200
1829	Mothurapur	মথুরাপুর	mothurapurup.kushtia.gov.bd	200
1830	Pragpur	প্রাগপুর	pragpurup.kushtia.gov.bd	200
1831	Piarpur	পিয়ারপুর	piarpurup.kushtia.gov.bd	200
1832	Moricha	মরিচা	morichaup.kushtia.gov.bd	200
1833	Refaitpur	রিফাইতপুর	9norefaitpurup.kushtia.gov.bd	200
1834	Ramkrishnopur	রামকৃষ্ণপুর	5noramkrishnopurup.kushtia.gov.bd	200
1835	Dharampur	ধরমপুর	5nodharampurup.kushtia.gov.bd	201
1836	Bahirchar	বাহিরচর	3nobahircharup.kushtia.gov.bd	201
1837	Mukarimpur	মোকারিমপুর	2nomukarimpurup.kushtia.gov.bd	201
1838	Juniadah	জুনিয়াদহ	6nojuniadahup.kushtia.gov.bd	201
1839	Chandgram	চাঁদগ্রাম	4nochandgramup.kushtia.gov.bd	201
1840	Bahadurpur	বাহাদুরপুর	1nobahadurpurup.kushtia.gov.bd	201
1841	Dhaneshwargati	ধনেশ্বরগাতী	dhaneshwargatiup.magura.gov.bd	202
1842	Talkhari	তালখড়ি	talkhariup.magura.gov.bd	202
1843	Arpara	আড়পাড়া	arparaup.magura.gov.bd	202
1844	Shatakhali	শতখালী	shatakhaliup.magura.gov.bd	202
1845	Shalikha	শালিখা	shalikhaup.magura.gov.bd	202
1846	Bunagati	বুনাগাতী	bunagatiup.magura.gov.bd	202
1847	Gongarampur	গঙ্গারামপুর	gongarampurup.magura.gov.bd	202
1848	Goyespur	গয়েশপুর	goyespurup.magura.gov.bd	203
1849	Sreekol	শ্রীকোল	sreekolup.magura.gov.bd	203
3335	Bajrajogini	বজ্রযোগিনী	bajrajoginiup.munshiganj.gov.bd	370
3336	Mohakali	মহাকালী	mohakaliup.munshiganj.gov.bd	370
1764	Hawli	হাওলী	hawli.chuadanga.gov.bd	194
3337	Charkewar	চরকেওয়ার	charkewarup.munshiganj.gov.bd	370
1853	Sreepur	শ্রীপুর	sreepurup.magura.gov.bd	203
1854	Nakol	নাকোল	nakolup.magura.gov.bd	203
1855	Amalshar	আমলসার	amalsharup.magura.gov.bd	203
1856	Hazipur	হাজীপুর	hazipurup.magura.gov.bd	204
1857	Atharokhada	আঠারখাদা	atharokhadaup.magura.gov.bd	204
1858	Kosundi	কছুন্দী	kosundiup.magura.gov.bd	204
1859	Bogia	বগিয়া	bogiaup.magura.gov.bd	204
1860	Hazrapur	হাজরাপুর	hazrapurup.magura.gov.bd	204
1861	Raghobdair	রাঘবদাইড়	raghobdairup.magura.gov.bd	204
1862	Jagdal	জগদল	jagdalup.magura.gov.bd	204
1863	Chawlia	চাউলিয়া	chawliaup.magura.gov.bd	204
1864	Satrijitpur	শত্রুজিৎপুর	satrijitpurup.magura.gov.bd	204
1865	Baroilpolita	বেরইল পলিতা	baroilpolitaup.magura.gov.bd	204
1866	Kuchiamora	কুচিয়ামো	kuchiamoraup.magura.gov.bd	204
1867	Gopalgram	গোপালগ্রাম	gopalgramup.magura.gov.bd	204
1868	Moghi	মঘী	moghiup.magura.gov.bd	204
1869	Digha	দীঘা	dighaup.magura.gov.bd	205
1870	Nohata	নহাটা	nohataup.magura.gov.bd	205
1871	Palashbaria	পলাশবাড়ীয়া	palashbariaup.magura.gov.bd	205
1872	Babukhali	বাবুখালী	babukhaliup.magura.gov.bd	205
1873	Balidia	বালিদিয়া	balidiaup.magura.gov.bd	205
1874	Binodpur	বিনোদপুর	binodpurup.magura.gov.bd	205
1875	Mohammadpur	মহম্মদপুর	mohammadpurup.magura.gov.bd	205
1876	Rajapur	রাজাপুর	rajapurup.magura.gov.bd	205
1877	Horidhali	হরিঢালী	horidhaliup.khulna.gov.bd	206
1878	Goroikhali	গড়ইখালী	goroikhaliup.khulna.gov.bd	206
1879	Kopilmuni	কপিলমুনি	kopilmuniup.khulna.gov.bd	206
1880	Lota	লতা	lotaup.khulna.gov.bd	206
1881	Deluti	দেলুটি	delutiup.khulna.gov.bd	206
1882	Loskor	লস্কর	loskorup.khulna.gov.bd	206
1883	Godaipur	গদাইপুর	godaipurup.khulna.gov.bd	206
1884	Raruli	রাড়ুলী	www.raruliup.khulna.gov.bd	206
1885	Chandkhali	চাঁদখালী	chandkhaliup.khulna.gov.bd	206
1886	Soladana	সোলাদানা	soladanaup.khulna.gov.bd	206
1887	Fultola	ফুলতলা	www.fultolaup.khulna.gov.bd	207
1888	Damodar	দামোদর	www.damodarup.khulna.gov.bd	207
1889	Atra Gilatola	আটরা গিলাতলা	www.atragilatolaup.khulna.gov.bd	207
1890	Jamira	জামিরা	www.jamiraup.khulna.gov.bd	207
1891	Senhati	সেনহাটি	www.senhatiup.khulna.gov.bd	208
1892	Gajirhat	গাজীরহাট	www.gajirhatup.khulna.gov.bd	208
1893	Barakpur	বারাকপুর	www.barakpurup.khulna.gov.bd	208
1894	Aronghata	আড়ংঘাটা	www.aronghataup.khulna.gov.bd	208
1895	Jogipol	যোগীপোল	www.jogipolup.khulna.gov.bd	208
1896	Digholia	দিঘলিয়া	www.digholiaup.khulna.gov.bd	208
1897	Aichgati	আইচগাতী	aichgatiup.khulna.gov.bd	209
1898	Srifoltola	শ্রীফলতলা	srifoltolaup.khulna.gov.bd	209
1899	Noihati	নৈহাটি	noihatiup.khulna.gov.bd	209
1900	Tsb	টিএসবি	tsbup.khulna.gov.bd	209
1901	Ghatvog	ঘাটভোগ	ghatvogup.khulna.gov.bd	209
1902	Terokhada	তেরখাদা	terokhadaup.khulna.gov.bd	210
1903	Chagladoho	ছাগলাদহ	chagladohoup.khulna.gov.bd	210
1904	Barasat	বারাসাত	www.barasatup.khulna.gov.bd	210
1905	Sochiadaho	সাচিয়াদাহ	www.sochiadahoup.khulna.gov.bd	210
1906	Modhupur	মধুপুর	www.modhupurup.khulna.gov.bd	210
1907	Ajgora	আজগড়া	www.ajgoraup.khulna.gov.bd	210
1908	Dumuria	ডুমুরিয়া	dumuriaup.khulna.gov.bd	211
1909	Magurghona	মাগুরাঘোনা	magurghonaup.khulna.gov.bd	211
1910	Vandarpara	ভান্ডারপাড়া	vandarparaup.khulna.gov.bd	211
1911	Sahos	সাহস	sahosup.khulna.gov.bd	211
1912	Rudaghora	রুদাঘরা	rudaghoraup.khulna.gov.bd	211
1913	Ghutudia	গুটুদিয়া	ghutudiaup.khulna.gov.bd	211
1914	Shovna	শোভনা	shovnaup.khulna.gov.bd	211
1915	Khornia	খর্ণিয়া	khorniaup.khulna.gov.bd	211
1916	Atlia	আটলিয়া	atliaup.khulna.gov.bd	211
1917	Dhamalia	ধামালিয়া	dhamaliaup.khulna.gov.bd	211
1918	Raghunathpur	রঘুনাথপুর	raghunathpurup.khulna.gov.bd	211
1919	Rongpur	রংপুর	rongpurup.khulna.gov.bd	211
1920	Shorafpur	শরাফপুর	shorafpurup.khulna.gov.bd	211
1921	Magurkhali	মাগুরখালি	magurkhaliup.khulna.gov.bd	211
1922	Botiaghata	বটিয়াঘাটা	www.botiaghataup.khulna.gov.bd	212
1923	Amirpur	আমিরপুর	www.amirpurup.khulna.gov.bd	212
1924	Gongarampur	গঙ্গারামপুর	www.gongarampurup.khulna.gov.bd	212
1925	Surkhali	সুরখালী	www.surkhaliup.khulna.gov.bd	212
1926	Vandarkot	ভান্ডারকোট	www.vandarkotup.khulna.gov.bd	212
1927	Baliadanga	বালিয়াডাঙ্গা	www.baliadangaup.khulna.gov.bd	212
3338	Mollakandi	মোল্লাকান্দি	mollakandiup.munshiganj.gov.bd	370
1852	Shobdalpur	সব্দালপুর	shobdalpurup.magura.gov.bd	203
3339	Adhara	আধারা	adharaup.munshiganj.gov.bd	370
1932	Tildanga	তিলডাঙ্গা	www.tildangaup.khulna.gov.bd	213
1933	Sutarkhali	সুতারখালী	www.sutarkhaliup.khulna.gov.bd	213
1934	Laudoba	লাউডোব	laudobaup.khulna.gov.bd	213
1935	Pankhali	পানখালী	pankhaliup.khulna.gov.bd	213
1936	Banishanta	বানিশান্তা	banishantaup.khulna.gov.bd	213
1937	Koilashgonj	কৈলাশগঞ্জ	koilashgonjup.khulna.gov.bd	213
1938	Koyra	কয়রা	koyraup.khulna.gov.bd	214
1939	Moharajpur	মহারাজপুর	moharajpurup.khulna.gov.bd	214
1940	Moheswaripur	মহেশ্বরীপুর	moheswaripurup.khulna.gov.bd	214
1941	North Bedkashi	উত্তর বেদকাশী	northbedkashiup.khulna.gov.bd	214
1942	South Bedkashi	দক্ষিণ বেদকাশী	southbedkashiup.khulna.gov.bd	214
1943	Amadi	আমাদি	amadiup.khulna.gov.bd	214
1944	Bagali	বাগালী	bagaliup.khulna.gov.bd	214
1945	Betaga	বেতাগা	betagaup.bagerhat.gov.bd	215
1946	Lakhpur	লখপুর	lakhpurup.bagerhat.gov.bd	215
1947	Fakirhat	ফকিরহাট	fakirhatup.bagerhat.gov.bd	215
1948	Bahirdia-Mansa	বাহিরদিয়া-মানসা	bahirdiamansaup.bagerhat.gov.bd	215
1949	Piljanga	পিলজংগ	piljangaup.bagerhat.gov.bd	215
1951	Mulghar	মূলঘর	mulgharup.bagerhat.gov.bd	215
1952	Suvhadia	শুভদিয়া	suvhadiaup.bagerhat.gov.bd	215
1953	Karapara	কাড়াপাড়া	karaparaup.bagerhat.gov.bd	216
1954	Bamorta	বেমরতা	bamortaup.bagerhat.gov.bd	216
1955	Gotapara	গোটাপাড়া	gotaparaup.bagerhat.gov.bd	216
1956	Bishnapur	বিষ্ণুপুর	bishnapurup.bagerhat.gov.bd	216
1957	Baruipara	বারুইপাড়া	baruiparaup.bagerhat.gov.bd	216
1958	Jatharapur	যাত্রাপুর	jatharapurup.bagerhat.gov.bd	216
1959	Shaitgomboj	ষাটগুম্বজ	shaitgombojup.bagerhat.gov.bd	216
1960	Khanpur	খানপুর	khanpurup.bagerhat.gov.bd	216
1961	Rakhalgachi	রাখালগাছি	rakhalgachiup.bagerhat.gov.bd	216
1962	Dema	ডেমা	demaup.bagerhat.gov.bd	216
1963	Udoypur	উদয়পুর	udoypurup.bagerhat.gov.bd	217
1964	Chunkhola	চুনখোলা	chunkholaup.bagerhat.gov.bd	217
1965	Gangni	গাংনী	gangniup.bagerhat.gov.bd	217
1966	Kulia	কুলিয়া	kuliaup.bagerhat.gov.bd	217
1967	Gaola	গাওলা	gaolaup.bagerhat.gov.bd	217
1968	Kodalia	কোদালিয়া	kodaliaup.bagerhat.gov.bd	217
1969	Atjuri	আটজুড়ী	atjuriup.bagerhat.gov.bd	217
1970	Dhanshagor	ধানসাগর	dhanshagorup.bagerhat.gov.bd	218
1971	Khontakata	খোন্তাকাটা	khontakataup.bagerhat.gov.bd	218
1972	Rayenda	রায়েন্দা	rayendaup.bagerhat.gov.bd	218
1973	Southkhali	সাউথখালী	southkhaliup.bagerhat.gov.bd	218
1974	Gouramva	গৌরম্ভা	gouramvaup.bagerhat.gov.bd	219
1975	Uzzalkur	উজলকুড়	uzzalkurup.bagerhat.gov.bd	219
1976	Baintala	বাইনতলা	baintalaup.bagerhat.gov.bd	219
1977	Rampal	রামপাল	rampalup.bagerhat.gov.bd	219
1978	Rajnagar	রাজনগর	rajnagarup.bagerhat.gov.bd	219
1979	Hurka	হুড়কা	hurkaup.bagerhat.gov.bd	219
1980	Perikhali	পেড়িখালী	perikhaliup.bagerhat.gov.bd	219
1981	Vospatia	ভোজপাতিয়া	vospatiaup.bagerhat.gov.bd	219
1982	Mollikerbar	মল্লিকেরবেড়	mollikerbarup.bagerhat.gov.bd	219
1983	Bastoli	বাঁশতলী	bastoliup.bagerhat.gov.bd	219
1984	Teligati	তেলিগাতী	teligatiup.bagerhat.gov.bd	220
1985	Panchakaran	পঞ্চকরণ	panchakaranup.bagerhat.gov.bd	220
1986	Putikhali	পুটিখালী	putikhaliup.bagerhat.gov.bd	220
1987	Daibagnyahati	দৈবজ্ঞহাটি	daibagnyahatiup.bagerhat.gov.bd	220
1988	Ramchandrapur	রামচন্দ্রপুর	ramchandrapurup.bagerhat.gov.bd	220
1989	Chingrakhali	চিংড়াখালী	chingrakhaliup.bagerhat.gov.bd	220
1990	Jiudhara	জিউধরা	jiudharaup.bagerhat.gov.bd	220
1991	Hoglapasha	হোগলাপাশা	hoglapashaup.bagerhat.gov.bd	220
1992	Banagram	বনগ্রাম	banagramup.bagerhat.gov.bd	220
1993	Balaibunia	বলইবুনিয়া	balaibuniaup.bagerhat.gov.bd	220
1994	Hoglabunia	হোগলাবুনিয়া	hoglabuniaup.bagerhat.gov.bd	220
1995	Baharbunia	বহরবুনিয়া	baharbuniaup.bagerhat.gov.bd	220
1996	Morrelganj	মোড়েলগঞ্জ	morrelganjup.bagerhat.gov.bd	220
1997	Khaulia	খাউলিয়া	khauliaup.bagerhat.gov.bd	220
1998	Nishanbaria	নিশানবাড়িয়া	nishanbariaup.bagerhat.gov.bd	220
1930	Bajua	বাজুয়া	bajuaup.khulna.gov.bd	213
1999	Baraikhali	বারইখালী	baraikhaliup.bagerhat.gov.bd	220
2000	Gojalia	গজালিয়া	gojaliaup.bagerhat.gov.bd	221
2001	Dhopakhali	ধোপাখালী	dhopakhaliup.bagerhat.gov.bd	221
2002	Moghia	মঘিয়া	moghiaup.bagerhat.gov.bd	221
2003	Kachua	কচুয়া	kachuaup.bagerhat.gov.bd	221
2004	Gopalpur	গোপালপুর	gopalpurup.bagerhat.gov.bd	221
2005	Raripara	রাড়ীপাড়া	rariparaup.bagerhat.gov.bd	221
3340	Shiloy	শিলই	shiloyup.munshiganj.gov.bd	370
3341	Banglabazar	বাংলাবাজার	banglabazarup.munshiganj.gov.bd	370
2008	Mithakhali	মিঠাখালী	mithakhaliup.bagerhat.gov.bd	222
2009	Sonailtala	সোনাইলতলা	sonailtalaup.bagerhat.gov.bd	222
2010	Chadpai	চাঁদপাই	chadpaiup.bagerhat.gov.bd	222
2011	Chila	চিলা	chilaup.bagerhat.gov.bd	222
2012	Sundarban	সুন্দরবন	sundarbanup.bagerhat.gov.bd	222
2013	Barobaria	বড়বাড়িয়া	barobariaup.bagerhat.gov.bd	223
2014	Kalatala	কলাতলা	kalatalaup.bagerhat.gov.bd	223
2015	Hizla	হিজলা	hizlaup.bagerhat.gov.bd	223
2016	Shibpur	শিবপুর	shibpurup.bagerhat.gov.bd	223
2017	Chitalmari	চিতলমারী	chitalmariup.bagerhat.gov.bd	223
2018	Charbaniri	চরবানিয়ারী	charbaniriup.bagerhat.gov.bd	223
2019	Shantoshpur	সন্তোষপুর	shantoshpurup.bagerhat.gov.bd	223
2020	Sadhuhati	সাধুহাটী	sadhuhatiup.jhenaidah.gov.bd	224
2021	Modhuhati	মধুহাটী	modhuhatiup.jhenaidah.gov.bd	224
2022	Saganna	সাগান্না	sagannaup.jhenaidah.gov.bd	224
2023	Halidhani	হলিধানী	halidhaniup.jhenaidah.gov.bd	224
2024	Kumrabaria	কুমড়াবাড়ীয়া	kumrabariaup.jhenaidah.gov.bd	224
2025	Ganna	গান্না	gannaup.jhenaidah.gov.bd	224
2026	Maharazpur	মহারাজপুর	maharazpurup.jhenaidah.gov.bd	224
2027	Paglakanai	পাগলাকানাই	paglakanaiup.jhenaidah.gov.bd	224
2028	Porahati	পোড়াহাটী	porahatiup.jhenaidah.gov.bd	224
2029	Harishongkorpur	হরিশংকরপুর	harishongkorpurup.jhenaidah.gov.bd	224
2030	Padmakar	পদ্মাকর	padmakarup.jhenaidah.gov.bd	224
2031	Dogachhi	দোগাছি	dogachhiup.jhenaidah.gov.bd	224
2032	Furshondi	ফুরসন্দি	furshondiup.jhenaidah.gov.bd	224
2033	Ghorshal	ঘোড়শাল	ghorshalup.jhenaidah.gov.bd	224
2034	Kalicharanpur	কালীচরণপুর	kalicharanpurup.jhenaidah.gov.bd	224
2035	Surat	সুরাট	suratup.jhenaidah.gov.bd	224
2036	Naldanga	নলডাঙ্গা	naldangaup.jhenaidah.gov.bd	224
2037	Tribeni	ত্রিবেনী	tribeniup.jhenaidah.gov.bd	225
2038	Mirzapur	মির্জাপুর	mirzapurup.jhenaidah.gov.bd	225
2039	Dignagore	দিগনগর	dignagoreup.jhenaidah.gov.bd	225
2040	Kancherkol	কাঁচেরকোল	kancherkolup.jhenaidah.gov.bd	225
2041	Sarutia	সারুটিয়া	sarutiaup.jhenaidah.gov.bd	225
2042	Hakimpur	হাকিমপুর	hakimpurup.jhenaidah.gov.bd	225
2043	Dhaloharachandra	ধলহরাচন্দ্র	dhaloharachandraup.jhenaidah.gov.bd	225
2044	Manoharpur	মনোহরপুর	manoharpurup.jhenaidah.gov.bd	225
2045	Bogura	বগুড়া	boguraup.jhenaidah.gov.bd	225
2046	Abaipur	আবাইপুর	abaipurup.jhenaidah.gov.bd	225
2047	Nityanandapur	নিত্যানন্দপুর	nityanandapurup.jhenaidah.gov.bd	225
2048	Umedpur	উমেদপুর	umedpurup.jhenaidah.gov.bd	225
2049	Dudshar	দুধসর	dudsharup.jhenaidah.gov.bd	225
2050	Fulhari	ফুলহরি	fulhariup.jhenaidah.gov.bd	225
2051	Bhayna	ভায়না	bhaynaup.jhenaidah.gov.bd	226
2052	Joradah	জোড়াদহ	joradahup.jhenaidah.gov.bd	226
2053	Taherhuda	তাহেরহুদা	taherhudaup.jhenaidah.gov.bd	226
2054	Daulatpur	দৌলতপুর	daulatpurup.jhenaidah.gov.bd	226
2055	Kapashatia	কাপাশহাটিয়া	kapashatiaup.jhenaidah.gov.bd	226
2056	Falsi	ফলসী	falsiup.jhenaidah.gov.bd	226
2057	Raghunathpur	রঘুনাথপুর	raghunathpurup.jhenaidah.gov.bd	226
2058	Chandpur	চাঁদপুর	chandpurup.jhenaidah.gov.bd	226
2059	Sundarpurdurgapur	সুন্দরপুর-দূর্গাপুর	sundarpurdurgapurup.jhenaidah.gov.bd	227
2060	Jamal	জামাল	jamalup.jhenaidah.gov.bd	227
2061	Kola	কোলা	kolaup.jhenaidah.gov.bd	227
2062	Niamatpur	নিয়ামতপুর	niamatpurup.jhenaidah.gov.bd	227
2064	Trilochanpur	ত্রিলোচনপুর	trilochanpurup.jhenaidah.gov.bd	227
2065	Raygram	রায়গ্রাম	raygramup.jhenaidah.gov.bd	227
2066	Maliat	মালিয়াট	maliatup.jhenaidah.gov.bd	227
2067	Barabazar	বারবাজার	barabazarup.jhenaidah.gov.bd	227
2068	Kashtabhanga	কাষ্টভাঙ্গা	kashtabhangaup.jhenaidah.gov.bd	227
2069	Rakhalgachhi	রাখালগাছি	rakhalgachhiup.jhenaidah.gov.bd	227
2070	Sabdalpur	সাবদালপুর	sabdalpurup.jhenaidah.gov.bd	228
2071	Dora	দোড়া	doraup.jhenaidah.gov.bd	228
2072	Kushna	কুশনা	kushnaup.jhenaidah.gov.bd	228
2073	Baluhar	বলুহর	baluharup.jhenaidah.gov.bd	228
2074	Elangi	এলাঙ্গী	elangiup.jhenaidah.gov.bd	228
2075	Sbk	এস, বি, কে	sbkup.jhenaidah.gov.bd	229
2076	Fatepur	ফতেপুর	fatepurup.jhenaidah.gov.bd	229
2077	Panthapara	পান্থপাড়া	panthaparaup.jhenaidah.gov.bd	229
2078	Swaruppur	স্বরুপপুর	swaruppurup.jhenaidah.gov.bd	229
2079	Shyamkur	শ্যামকুড়	shyamkurup.jhenaidah.gov.bd	229
2080	Nepa	নেপা	nepaup.jhenaidah.gov.bd	229
2081	Kazirber	কাজীরবেড়	kazirberup.jhenaidah.gov.bd	229
2082	Banshbaria	বাঁশবাড়ীয়া	banshbariaup.jhenaidah.gov.bd	229
3342	Baraikhali	বাড়েখাল	baraikhaliup.munshiganj.gov.bd	371
3343	Hashara	হাসাড়া	hasharaup.munshiganj.gov.bd	371
2086	Azampur	আজমপুর	azampurup.jhenaidah.gov.bd	229
2087	Basanda	বাসন্ডা	basandaup.jhalakathi.gov.bd	230
2088	Binoykati	বিনয়কাঠী	binoykatiup.jhalakathi.gov.bd	230
2090	Keora	কেওড়া	keoraup.jhalakathi.gov.bd	230
2091	Kirtipasha	কীর্তিপাশা	kirtipashaup.jhalakathi.gov.bd	230
2092	Nabagram	নবগ্রাম	nabagramup.jhalakathi.gov.bd	230
2093	Nathullabad	নথুলল্লাবাদ	nathullabadup.jhalakathi.gov.bd	230
2094	Ponabalia	পোনাবালিয়া	ponabaliaup.jhalakathi.gov.bd	230
2095	Sekherhat	শেখেরহাট	sekherhatup.jhalakathi.gov.bd	230
2096	Gabkhandhansiri	গাবখান ধানসিঁড়ি	gabkhandhansiriup.jhalakathi.gov.bd	230
2097	Amua	আমুয়া	amuaup.jhalakathi.gov.bd	231
2098	Awrabunia	আওরাবুনিয়া	awrabuniaup.jhalakathi.gov.bd	231
2099	Chenchrirampur	চেঁচরীরামপুর	chenchrirampurup.jhalakathi.gov.bd	231
2100	Kanthalia	কাঠালিয়া	kanthaliaup.jhalakathi.gov.bd	231
2101	Patikhalghata	পাটিখালঘাটা	patikhalghataup.jhalakathi.gov.bd	231
2102	Shaulajalia	শৌলজালিয়া	shaulajaliaup.jhalakathi.gov.bd	231
2103	Subidpur	সুবিদপুর	subidpurup.jhalakathi.gov.bd	232
2105	Ranapasha	রানাপাশা	ranapashaup.jhalakathi.gov.bd	232
2106	Nachanmohal	নাচনমহল	nachanmohalup.jhalakathi.gov.bd	232
2107	Mollahat	মোল্লারহাট	mollahatup.jhalakathi.gov.bd	232
2108	Magar	মগর	magarup.jhalakathi.gov.bd	232
2109	Kusanghal	কুশঙ্গল	kusanghalup.jhalakathi.gov.bd	232
2110	Kulkathi	কুলকাঠী	kulkathiup.jhalakathi.gov.bd	232
2111	Dapdapia	দপদপিয়া	dapdapiaup.jhalakathi.gov.bd	232
2112	Bharabpasha	ভৈরবপাশা	bharabpashaup.jhalakathi.gov.bd	232
2113	Suktagarh	শুক্তাগড়	suktagarhup.jhalakathi.gov.bd	233
2114	Saturia	সাতুরিয়া	saturiaup.jhalakathi.gov.bd	233
2115	Mathbari	মঠবাড়ী	mathbariup.jhalakathi.gov.bd	233
2116	Galua	গালুয়া	galuaup.jhalakathi.gov.bd	233
2117	Baraia	বড়ইয়া	baraiaup.jhalakathi.gov.bd	233
2118	Rajapur	রাজাপুর	rajapurup.jhalakathi.gov.bd	233
2119	Adabaria	আদাবারিয়া	adabariaup.gazipur.gov.bd	234
2120	Bauphal	বাউফল	bauphalup.patuakhali.gov.bd	234
2121	Daspara	দাস পাড়া	dasparaup.gazipur.gov.bd	234
2122	Kalaiya	কালাইয়া	kalaiyaup.gazipur.gov.bd	234
2123	Nawmala	নওমালা	nawmalaup.patuakhali.gov.bd	234
2124	Najirpur	নাজিরপুর	najirpurup.patuakhali.gov.bd	234
2125	Madanpura	মদনপুরা	madanpuraup.patuakhali.gov.bd	234
2126	Boga	বগা	bogaup.patuakhali.gov.bd	234
2127	Kanakdia	কনকদিয়া	kanakdiaup.patuakhali.gov.bd	234
2128	Shurjamoni	সূর্য্যমনি	shurjamoniup.patuakhali.gov.bd	234
2129	Keshabpur	কেশবপুর	keshabpurup.patuakhali.gov.bd	234
2130	Dhulia	ধুলিয়া	dhuliaup.patuakhali.gov.bd	234
2131	Kalisuri	কালিশুরী	kalisuriup.patuakhali.gov.bd	234
2132	Kachipara	কাছিপাড়া	kachiparaup.patuakhali.gov.bd	234
2133	Laukathi	লাউকাঠী	laukathiup.patuakhali.gov.bd	235
2134	Lohalia	লোহালিয়া	lohaliaup.patuakhali.gov.bd	235
2135	Kamalapur	কমলাপুর	kamalapurup.patuakhali.gov.bd	235
2136	Jainkathi	জৈনকাঠী	jainkathiup.patuakhali.gov.bd	235
2137	Kalikapur	কালিকাপুর	kalikapurup.patuakhali.gov.bd	235
2138	Badarpur	বদরপুর	badarpurup.patuakhali.gov.bd 	235
2139	Itbaria	ইটবাড়ীয়া	itbariaup.patuakhali.gov.bd 	235
2140	Marichbunia	মরিচবুনিয়া	marichbuniaup.patuakhali.gov.bd 	235
2141	Auliapur	আউলিয়াপুর	auliapurup.patuakhali.gov.bd	235
2142	Chotobighai	ছোট বিঘাই	chotobighaiup.patuakhali.gov.bd	235
2143	Borobighai	বড় বিঘাই	borobighaiup.patuakhali.gov.bd	235
2144	Madarbunia	মাদারবুনিয়া	madarbuniaup.patuakhali.gov.bd	235
2145	Pangasia	পাংগাশিয়া	pangasiaup.patuakhali.gov.bd	236
2146	Muradia	মুরাদিয়া	muradiaup.patuakhali.gov.bd	236
2147	Labukhali	লেবুখালী	labukhaliup.patuakhali.gov.bd	236
2148	Angaria	আংগারিয়া	angariaup.patuakhali.gov.bd	236
2149	Sreerampur	শ্রীরামপুর	sreerampurup.patuakhali.gov.bd	236
2151	Rangopaldi	রণগোপালদী	rangopaldiup.patuakhali.gov.bd	237
2152	Alipur	আলীপুর	alipurup.patuakhali.gov.bd	237
2153	Betagi Shankipur	বেতাগী সানকিপুর	betagishankipurup.patuakhali.gov.bd	237
2154	Dashmina	দশমিনা	dashminaup.patuakhali.gov.bd	237
2155	Baharampur	বহরমপুর	baharampurup.patuakhali.gov.bd	237
2156	Chakamaia	চাকামইয়া	chakamaiaup.patuakhali.gov.bd	238
2157	Tiakhali	টিয়াখালী	tiakhaliup.patuakhali.gov.bd	238
2158	Lalua	লালুয়া	laluaup.patuakhali.gov.bd	238
2159	Dhankhali	ধানখালী	dhankhaliup.patuakhali.gov.bd	238
2160	Mithagonj	মিঠাগঞ্জ	mithagonjup.patuakhali.gov.bd	238
2161	Nilgonj	নীলগঞ্জ	nilgonjup.patuakhali.gov.bd	238
3344	Birtara	বাড়তারা	birtaraup.munshiganj.gov.bd	371
589	Torabgonj	তোরাবগঞ্জ	torabgonjup.lakshmipur.gov.bd	61
598	South Char Ababil	দক্ষিন চর আবাবিল	southcharababilup.lakshmipur.gov.bd	62
664	Kharana	খরনা	kharanaup.chittagong.gov.bd	68
667	Chanhara	ছনহরা	chanharaup.chittagong.gov.bd	68
2162	Dulaser	ধুলাসার	dulaserup.patuakhali.gov.bd	238
2163	Latachapli	লতাচাপলী	latachapliup.patuakhali.gov.bd	238
2164	Mahipur	মহিপুর	mahipurup.patuakhali.gov.bd	238
2165	Dalbugonj	ডালবুগঞ্জ	dalbugonjup.patuakhali.gov.bd	238
2166	Baliatali	বালিয়াতলী	baliataliup.patuakhali.gov.bd	238
2167	Champapur	চম্পাপুর	champapurup.patuakhali.gov.bd	238
2168	Madhabkhali	মাধবখালী	madhabkhaliup.patuakhali.gov.bd	239
2170	Amragachia	আমড়াগাছিয়া	amragachiaup.patuakhali.gov.bd	239
2171	Deuli Subidkhali	দেউলী সুবিদখালী	deulisubidkhaliup.patuakhali.gov.bd	239
2173	Majidbaria	মজিদবাড়িয়া	majidbariaup.patuakhali.gov.bd	239
2174	Amkhola	আমখোলা	amkholaup.patuakhali.gov.bd	240
2175	Golkhali	গোলখালী	golkhaliup.patuakhali.gov.bd	240
2176	Galachipa	গলাচিপা	galachipaup.patuakhali.gov.bd	240
2177	Panpatty	পানপট্টি	panpattyup.patuakhali.gov.bd	240
2178	Ratandi Taltali	রতনদী তালতলী	ratanditaltaliup.patuakhali.gov.bd	240
2179	Dakua	ডাকুয়া	dakuaup.patuakhali.gov.bd	240
2180	Chiknikandi	চিকনিকান্দী	chiknikandiup.patuakhali.gov.bd	240
2181	Gazalia	গজালিয়া	gazaliaup.patuakhali.gov.bd	240
2182	Charkajol	চরকাজল	charkajolup.patuakhali.gov.bd	240
2183	Charbiswas	চরবিশ্বাস	charbiswasup.patuakhali.gov.bd	240
2184	Bakulbaria	বকুলবাড়ীয়া	bakulbariaup.patuakhali.gov.bd	240
2185	Kalagachhia	কলাগাছিয়া	kalagachhiaup.patuakhali.gov.bd	240
2186	Rangabali	রাঙ্গাবালী	rangabaliup.patuakhali.gov.bd	241
2187	Barobaisdia	বড়বাইশদিয়া	barobaisdiaup.patuakhali.gov.bd	241
2188	Chattobaisdia	ছোটবাইশদিয়া	chattobaisdiaup.patuakhali.gov.bd	241
2189	Charmontaz	চরমোন্তাজ	charmontaz.patuakhali.gov.bd	241
2190	Chalitabunia	চালিতাবুনিয়া	chalitabuniaup.patuakhali.gov.bd	241
2191	Shikder Mallik	শিকদার মল্লিক	shikdermallikup.pirojpur.gov.bd	242
2192	Kodomtala	কদমতলা	kodomtalaup.pirojpur.gov.bd	242
2193	Durgapur	দূর্গাপুর	durgapurup.pirojpur.gov.bd	242
2194	Kolakhali	কলাখালী	kolakhaliup.pirojpur.gov.bd	242
2195	Tona	টোনা	tonaup.pirojpur.gov.bd	242
2196	Shariktola	শরিকতলা	shariktolaup.pirojpur.gov.bd	242
2197	Shankorpasa	শংকরপাশা	shankorpasaup.pirojpur.gov.bd	242
2198	Mativangga	মাটিভাংগা	mativanggaup.pirojpur.gov.bd	243
2199	Malikhali	মালিখালী	malikhaliup.pirojpur.gov.bd	243
2200	Daulbari Dobra	দেউলবাড়ী দোবড়া	daulbaridobraup.pirojpur.gov.bd	243
2201	Dirgha	দীর্ঘা	dirghaup.pirojpur.gov.bd	243
2202	Kolardoania	কলারদোয়ানিয়া	kolardoaniaup.pirojpur.gov.bd	243
2203	Sriramkathi	শ্রীরামকাঠী	sriramkathiup.pirojpur.gov.bd	243
2204	Shakhmatia	সেখমাটিয়া	shakhmatiaup.pirojpur.gov.bd	243
2205	Nazirpur Sadar	নাজিরপুর সদর	nazirpursadarup.pirojpur.gov.bd	243
2206	Shakharikathi	শাখারীকাঠী	shakharikathiup.pirojpur.gov.bd	243
2207	Sayna Rogunathpur	সয়না রঘুনাথপুর	saynarogunathpurup.pirojpur.gov.bd	244
2208	Amrazuri	আমড়াজুড়ি	amrazuriup.pirojpur.gov.bd	244
2209	Kawkhali Sadar	কাউখালি সদর	kawkhalisadarup.pirojpur.gov.bd	244
2210	Chirapara	চিরাপাড়া	chiraparaup.pirojpur.gov.bd	244
2211	Shialkhathi	শিয়ালকাঠী	shialkhathiup.pirojpur.gov.bd	244
2212	Balipara	বালিপাড়া	baliparaup.pirojpur.gov.bd	245
2213	Pattashi	পত্তাশি	pattashiup.pirojpur.gov.bd	245
2214	Parerhat	পাড়েরহাট	parerhatup.pirojpur.gov.bd	245
2215	Vitabaria	ভিটাবাড়িয়া	vitabariaup.pirojpur.gov.bd	246
2216	Nodmulla	নদমূলা শিয়ালকাঠী	nodmullaup.pirojpur.gov.bd	246
2217	Telikhali	তেলিখালী	telikhaliup.pirojpur.gov.bd	246
2218	Ekree	ইকড়ী	ekreeup.pirojpur.gov.bd	246
2219	Dhaoa	ধাওয়া	dhaoaup.pirojpur.gov.bd	246
2220	Vandaria Sadar	ভান্ডারিয়া সদর	vandariasadarup.pirojpur.gov.bd	246
2221	Gouripur	গৌরীপুর	gouripurup.pirojpur.gov.bd	246
2222	Tuskhali	তুষখালী	tuskhaliup.pirojpur.gov.bd	247
2223	Dhanisafa	ধানীসাফা	dhanisafaup.pirojpur.gov.bd	247
2224	Mirukhali	মিরুখালী	mirukhaliup.pirojpur.gov.bd	247
2225	Tikikata	টিকিকাটা	tikikataup.pirojpur.gov.bd	247
2226	Betmor Rajpara	বেতমোর রাজপাড়া	betmorrajparaup.pirojpur.gov.bd	247
2227	Amragachia	আমড়াগাছিয়া	amragachiaup.pirojpur.gov.bd	247
3345	Shologhor	ষোলঘর	shologhorup.munshiganj.gov.bd	371
3346	Sreenagar	শ্রীনগর	sreenagarup.munshiganj.gov.bd	371
3347	Patabhog	পাঢাভোগ	patabhogup.munshiganj.gov.bd	371
815	Islamabad	ইসলামাবাদ	islamabadup.coxsbazar.gov.bd	80
1077	Ekdanta	একদন্ত	ekdantaup.pabna.gov.bd	118
1223	Kismatgankoir	কিসমতগণকৈড়	kismatgankoirup.rajshahi.gov.bd	135
1258	Matikata	মাটিকাটা	matikataup.rajshahi.gov.bd	140
1272	Borobihanoli	বড়বিহানলী	borobihanoliup.rajshahi.gov.bd	142
1276	Kacharikoalipara	কাচাড়ী কোয়লিপাড়া	kacharikoaliparaup.rajshahi.gov.bd	142
1308	Ramanandakhajura	রামান্দখাজুরা	ramanandakhajuraup.natore.gov.bd	144
1349	Tulshiganga	 তুলশীগংগা	tulshigangaup.joypurhat.gov.bd	152
1359	Kusumba	কুসুম্বা	kusumbaup.joypurhat.gov.bd	153
1363	Puranapail	পুরানাপৈল	puranapailup.joypurhat.gov.bd	154
1387	Parbotipur	পার্বতীপুর	parbotipurup.chapainawabganj.gov.bd	156
1418	Enayetpur	এনায়েতপুর	6noenayetpurup.naogaon.gov.bd	160
1437	Krishnapur	কৃষ্ণপুর	6nokrishnapurup.naogaon.gov.bd	162
1457	Sremantapur	শ্রীমন্তপুর	7nosremantapurup.naogaon.gov.bd	164
1481	Khatteshawr	খট্টেশ্বর রাণীনগর	1nokhatteshawrup.naogaon.gov.bd	167
1518	Maswimnagar	মশ্মিমনগর	maswimnagarup.jessore.gov.bd	171
1525	Chaluahati	চালুয়াহাটি	chaluahatiup.jessore.gov.bd	171
1554	Singhajhuli	সিংহঝুলি	singhajhuliup3.jessore.gov.bd	174
1583	Kashimpur	কাশিমপুর	kashimpurup6.jessore.gov.bd	177
1598	Bagachra	বাগআচড়া	bagachraup8.jessore.gov.bd	178
1604	Anulia	আনুলিয়া	anuliaup.satkhira.gov.bd	179
1626	Langaljhara	লাঙ্গলঝাড়া	langaljharaup.satkhira.gov.bd	181
1652	Burigoalini	বুড়িগোয়ালিনী	burigoaliniup.satkhira.gov.bd	183
1680	Mautala	মৌতলা	mautalaup.satkhira.gov.bd	185
1681	Krishnanagar	কৃষ্ণনগর	krishnanagarup.satkhira.gov.bd	185
1761	Damurhuda	দামুড়হুদা	damurhudaup.chuadanga.gov.bd	194
1762	Karpashdanga	কার্পাসডাঙ্গা	karpashdanga.chuadanga.gov.bd	194
1787	Goswami Durgapur	গোস্বামী দুর্গাপুর	14nogoswamidurgapurup.kushtia.gov.bd	196
1850	Dariapur	দ্বারিয়াপুর	dariapurup.magura.gov.bd	203
1928	Jolma	জলমা	www.jolmaup.khulna.gov.bd	212
1950	Naldha-Mouvhog	নলধা-মৌভোগ	naldhamauvhogup.bagerhat.gov.bd	215
2228	Shapleza	শাপলেজা	shaplezaup.pirojpur.gov.bd	247
2229	Daudkhali	দাউদখালী	daudkhaliup.pirojpur.gov.bd	247
2230	Mathbaria	মঠবাড়িয়া	mathbariaup.pirojpur.gov.bd	247
2231	Baramasua	বড়মাছুয়া	baramasuaup.pirojpur.gov.bd	247
2232	Haltagulishakhali	হলতাগুলিশাখালী	haltagulishakhaliup.pirojpur.gov.bd	247
2233	Boldia	বলদিয়া	boldiaup.pirojpur.gov.bd	248
2234	Sohagdal	সোহাগদল	sohagdalup.pirojpur.gov.bd	248
2236	Jolabari	জলাবাড়ী	jolabariup.pirojpur.gov.bd	248
2237	Doyhary	দৈহারী	doyharyup.pirojpur.gov.bd	248
2238	Guarekha	গুয়ারেখা	guarekhaup.pirojpur.gov.bd	248
2239	Somudoykathi	সমুদয়কাঠী	somudoykathiup.pirojpur.gov.bd	248
2240	Sutiakathi	সুটিয়াকাঠী	sutiakathiup.pirojpur.gov.bd	248
2241	Sarengkathi	সারেংকাঠী	sarengkathiup.pirojpur.gov.bd	248
2243	Raipasha Karapur	রায়পাশা কড়াপুর	raipashakarapurup.barisal.gov.bd	249
2244	Kashipur	কাশীপুর	kashipurup.barisal.gov.bd	249
2245	Charbaria	চরবাড়িয়া	charbariaup.barisal.gov.bd	249
2246	Shyastabad	সায়েস্তাবাদ	shyastabadup.barisal.gov.bd	249
2247	Charmonai	চরমোনাই	charmonaiup.barisal.gov.bd	249
2248	Zagua	জাগুয়া	zaguaup.barisal.gov.bd	249
2249	Charcowa	চরকাউয়া	charcowaup.barisal.gov.bd	249
2250	Chandpura	চাঁদপুরা	chandpuraup.barisal.gov.bd	249
2251	Tungibaria	টুঙ্গীবাড়িয়া	tungibariaup.barisal.gov.bd	249
2252	Chandramohan	চন্দ্রমোহন	chandramohanup.barisal.gov.bd	249
2253	Charamaddi	চরামদ্দি	charamaddiup.barisal.gov.bd	250
2254	Charade	চরাদি	charadeup.barisal.gov.bd	250
2255	Darial	দাড়িয়াল	darialup.barisal.gov.bd	250
2256	Dudhal	দুধল	dudhalup.barisal.gov.bd	250
2257	Durgapasha	দুর্গাপাশা	durgapashaup.barisal.gov.bd	250
2258	Faridpur	ফরিদপুর	faridpurup.barisal.gov.bd	250
2259	Kabai	কবাই	kabaiup.barisal.gov.bd	250
2260	Nalua	নলুয়া	naluaup.barisal.gov.bd	250
2261	Kalashkathi	কলসকাঠী	kalashkathiup.barisal.gov.bd	250
2262	Garuria	গারুরিয়া	garuriaup.barisal.gov.bd	250
2263	Bharpasha	ভরপাশা	bharpashaup.barisal.gov.bd	250
2264	Rangasree	রঙ্গশ্রী	rangasreeup.barisal.gov.bd	250
2265	Padreeshibpur	পাদ্রিশিবপুর	padreeshibpurup.barisal.gov.bd	250
2266	Niamoti	নিয়ামতি	niamotiup.barisal.gov.bd	250
2267	Jahangir Nagar	জাহাঙ্গীর নগর	jahangirnagorup.barisal.gov.bd	251
2268	Kaderpur	কেদারপুর	kaderpurup.barisal.gov.bd	251
3348	Shamshiddi	শ্যামসিদ্দি	shamshiddiup.munshiganj.gov.bd	371
2272	Madhbpasha	মাধবপাশা	madhbpashaup.barisal.gov.bd	251
2273	Shatla	সাতলা	shatlaup.barisal.gov.bd	252
2274	Harta	হারতা	hartaup.barisal.gov.bd	252
2275	Jalla	জল্লা	jallaup.barisal.gov.bd	252
2276	Otra	ওটরা	otraup.barisal.gov.bd	252
2277	Sholok	শোলক	sholokup.barisal.gov.bd	252
2278	Barakhota	বরাকোঠা	barakhotaup.barisal.gov.bd	252
2279	Bamrail	বামরাইল	bamrailup.barisal.gov.bd	252
2280	Shikerpur Wazirpur	শিকারপুর উজিরপুর	shikerpurwazirpurup.barisal.gov.bd	252
2281	Gouthia	গুঠিয়া	gouthiaup.barisal.gov.bd	252
2282	Bisharkandi	বিশারকান্দি	bisharkandiup.barisal.gov.bd	253
2283	Illuhar	ইলুহার	illuharup.barisal.gov.bd	253
2284	Sayedkathi	সৈয়দকাঠী	sayedkathiup.barisal.gov.bd	253
2285	Chakhar	চাখার	chakharup.barisal.gov.bd	253
2286	Saliabakpur	সলিয়াবাকপুর	saliabakpurup.barisal.gov.bd	253
2287	Baishari	বাইশারী	baishariup.barisal.gov.bd	253
2288	Banaripara	বানারিপাড়া	banariparaup.barisal.gov.bd	253
2289	Udykhati	উদয়কাঠী	udykhatiup.barisal.gov.bd	253
2290	Khanjapur	খাঞ্জাপুর	khanjapurup.barisal.gov.bd	254
2291	Barthi	বার্থী	barthiup.barisal.gov.bd	254
2292	Chandshi	চাঁদশী	chandshiup.barisal.gov.bd	254
2293	Mahilara	মাহিলারা	mahilaraup.barisal.gov.bd	254
2294	Nalchira	নলচিড়া	nalchiraup.barisal.gov.bd	254
2295	Batajore	বাটাজোর	batajoreup.barisal.gov.bd	254
2296	Sarikal	সরিকল	sarikalup.barisal.gov.bd	254
2297	Rajihar	রাজিহার	rajiharup.barisal.gov.bd	255
2298	Bakal	বাকাল	bakalup.barisal.gov.bd	255
2299	Bagdha	বাগধা	bagdhaup.barisal.gov.bd	255
2300	Goila	গৈলা	goilaup.barisal.gov.bd	255
2301	Ratnapur	রত্নপুর	ratnapurup.barisal.gov.bd	255
2302	Andarmanik	আন্দারমানিক	andarmanikup.barisal.gov.bd	256
2303	Lata	লতা	lataup.barisal.gov.bd	256
2304	Charakkorea	চরএককরিয়া	charakkoreaup.barisal.gov.bd	256
2305	Ulania	উলানিয়া	ulaniaup.barisal.gov.bd	256
2306	Mehendigong	মেহেন্দিগঞ্জ	mehendigongup.barisal.gov.bd	256
2307	Biddanandapur	বিদ্যানন্দনপুর	biddanandapurup.barisal.gov.bd	256
2308	Bhashanchar	ভাষানচর	bhashancharup.barisal.gov.bd	256
2309	Jangalia	জাঙ্গালিয়া	jangaliaup.barisal.gov.bd	256
2310	Alimabad	আলিমাবাদ	alimabadup.barisal.gov.bd	256
2311	Chandpur	চানপুর	chandpurup.barisal.gov.bd	256
2312	Darirchar Khajuria	দড়িরচর খাজুরিয়া	darircharkhajuriaup.barisal.gov.bd	256
2313	Gobindapur	গোবিন্দপুর	gobindapurup.barisal.gov.bd	256
2314	Chargopalpur	চরগোপালপুর	chargopalpurup.barisal.gov.bd	256
2315	Batamara	বাটামারা	batamaraup.barisal.gov.bd	257
2316	Nazirpur	নাজিরপুর	nazirpurup.barisal.gov.bd	257
2317	Safipur	সফিপুর	safipurup.barisal.gov.bd	257
2318	Gaschua	গাছুয়া	gaschuaup.barisal.gov.bd	257
2319	Charkalekha	চরকালেখা	charkalekhaup.barisal.gov.bd	257
2320	Muladi	মুলাদী	muladiup.barisal.gov.bd	257
2321	Kazirchar	কাজিরচর	kazircharup.barisal.gov.bd	257
2322	Harinathpur	হরিনাথপুর	harinathpurup.barisal.gov.bd	258
2323	Memania	মেমানিয়া	memaniaup.barisal.gov.bd	258
2324	Guabaria	গুয়াবাড়িয়া	guabariaup.barisal.gov.bd	258
2325	Barjalia	বড়জালিয়া	barjaliaup.barisal.gov.bd	258
2326	Hizla Gourabdi	হিজলা গৌরাব্দি	hizlagourabdiup.barisal.gov.bd	258
2327	Dhulkhola	ধুলখোলা	dhulkholaup.barisal.gov.bd	258
2328	Razapur	রাজাপুর	razapurup.bhola.gov.bd	259
2329	Ilisha	ইলিশা	ilishaup.bhola.gov.bd	259
2330	Westilisa	পশ্চিম ইলিশা	westilisaup.bhola.gov.bd	259
2331	Kachia	কাচিয়া	kachiaup.bhola.gov.bd	259
2332	Bapta	বাপ্তা	baptaup.bhola.gov.bd	259
2333	Dhania	ধনিয়া	dhaniaup.bhola.gov.bd	259
2334	Shibpur	শিবপুর	shibpurup.bhola.gov.bd	259
2335	Alinagor	আলীনগর	alinagorup.bhola.gov.bd	259
2336	Charshamya	চরসামাইয়া	charshamyaup.bhola.gov.bd	259
2337	Vhelumia	 ভেলুমিয়া	vhelumiaup.bhola.gov.bd	259
2338	Vheduria	ভেদুরিয়া	vheduriaup.bhola.gov.bd	259
2339	North Digholdi	উত্তর দিঘলদী	northdigholdiup.bhola.gov.bd	259
2340	South Digholdi	দক্ষিণ দিঘলদী	southdigholdiup.bhola.gov.bd	259
2341	Boromanika	বড় মানিকা	boromanikaup.bhola.gov.bd	260
2342	Deula	দেউলা	deulaup.bhola.gov.bd	260
2343	Kutuba	কুতুবা	kutubaup.bhola.gov.bd	260
2344	Pakshia	পক্ষিয়া	pakshiaup.bhola.gov.bd	260
2345	Kachia	কাচিয়া	kachiaup4.bhola.gov.bd	260
3349	Kolapara	কুলাপাড়া	kolaparaup.munshiganj.gov.bd	371
3350	Vaggakol	ভাগ্যকুল	vaggakolup.munshiganj.gov.bd	371
3351	Bagra	বাঘড়া	bagraup.munshiganj.gov.bd	371
3352	Rarikhal	রাঢ়ীখাল	rarikhalup.munshiganj.gov.bd	371
2348	Zinnagor	জিন্নাগড়	zinnagorup.bhola.gov.bd	261
2349	Aminabad	আমিনাবাদ	aminabadup.bhola.gov.bd	261
2350	Nilkomol	নীলকমল	nilkomolup.bhola.gov.bd	261
2351	Charmadraj	চরমাদ্রাজ	charmadrajup.bhola.gov.bd	261
2352	Awajpur	আওয়াজপুর	awajpurup.bhola.gov.bd	261
2354	Charkolmi	চরকলমী	charkolmiup.bhola.gov.bd	261
2355	Charmanika	চরমানিকা	charmanikaup.bhola.gov.bd	261
2356	Hazarigonj	হাজারীগঞ্জ	hazarigonjup.bhola.gov.bd	261
2357	Jahanpur	জাহানপুর	jahanpurup.bhola.gov.bd	261
2358	Nurabad	নুরাবাদ	nurabadup.bhola.gov.bd	261
2359	Rasulpur	রসুলপুর	rasulpurup.bhola.gov.bd	261
2360	Kukrimukri	কুকরীমূকরী	kukrimukriup.bhola.gov.bd	261
2361	Abubakarpur	আবুবকরপুর	abubakarpurup.bhola.gov.bd	261
2362	Abdullahpur	আবদুল্লাহ	abdullahpurup.bhola.gov.bd	261
2363	Nazrulnagar	নজরুল নগর	nazrulnagarup.bhola.gov.bd	261
2364	Mujibnagar	মুজিব নগর	mujibnagarup.bhola.gov.bd	261
2365	Dalchar	ঢালচর	dalcharup.bhola.gov.bd	261
2366	Madanpur	মদনপুর	madanpurup.bhola.gov.bd	262
2367	Madua	মেদুয়া	maduaup.bhola.gov.bd	262
2368	Charpata	চরপাতা	charpataup.bhola.gov.bd	262
2369	North Joy Nagar	উত্তর জয়নগর	northjoynagarup.bhola.gov.bd	262
2371	Char Khalipa	চর খলিফা	charkhalipaup.bhola.gov.bd	262
2372	Sayedpur	সৈয়দপুর	sayedpurup.bhola.gov.bd	262
2373	Hazipur	হাজীপুর	hazipurup.bhola.gov.bd	262
2374	Vhovanipur	ভবানীপুর	vhovanipurup.bhola.gov.bd	262
2375	Hazirhat	হাজীর হাট	hazirhatup.bhola.gov.bd	263
2376	Monpura	মনপুরা	monpuraup.bhola.gov.bd	263
2461	Lamakazi	লামাকাজী	lamakaziup.sylhet.gov.bd	274
2377	North Sakuchia	উত্তর সাকুচিয়া	sakuchianorthup.bhola.gov.bd	263
2378	South Sakuchia	দক্ষিন সাকুচিয়া	sakuchiasouthup.bhola.gov.bd	263
2379	Chanchra	চাচঁড়া	chanchraup.bhola.gov.bd	264
2380	Shambupur	শম্ভুপুর	shambupurup.bhola.gov.bd	264
2381	Sonapur	সোনাপুর	sonapurup.bhola.gov.bd	264
2382	Chadpur	চাঁদপুর	chadpurup.bhola.gov.bd	264
2383	Baro Molongchora	বড় মলংচড়া	baromolongchoraup.bhola.gov.bd	264
2384	Badarpur	বদরপুর	badarpurup.bhola.gov.bd	265
2385	Charbhuta	চরভূতা	charbhutaup.bhola.gov.bd	265
2386	Kalma	 কালমা	kalmaup.bhola.gov.bd	265
2387	Dholigour Nagar	ধলীগৌর নগর	dholigournagarup.bhola.gov.bd	265
2388	Lalmohan	লালমোহন	lalmohanup.bhola.gov.bd	265
2389	Lord Hardinge	লর্ড হার্ডিঞ্জ	lordhardingeup.bhola.gov.bd	265
2390	Ramagonj	রমাগঞ্জ	ramagonjup.bhola.gov.bd	265
2391	Paschim Char Umed	পশ্চিম চর উমেদ	paschimcharumedup.bhola.gov.bd	265
2392	Farajgonj	ফরাজগঞ্জ	farajgonjup.bhola.gov.bd	265
2393	Amtali	আমতলী	amtaliup.barguna.gov.bd	266
2394	Gulishakhali	গুলিশাখালী	gulishakhaliup.barguna.gov.bd	266
2395	Athrogasia	আঠারগাছিয়া	athrogasiaup.barguna.gov.bd	266
2396	Kukua	কুকুয়া	kukuaup.barguna.gov.bd	266
2397	Haldia	হলদিয়া	haldiaup.barguna.gov.bd	266
2398	Chotobogi	ছোটবগী	chotobogiup.barguna.gov.bd	266
2399	Arpangasia	আড়পাঙ্গাশিয়া	arpangasiaup.barguna.gov.bd	266
2400	Chowra	চাওড়া	chowraup.barguna.gov.bd	266
2401	M. Baliatali	এম. বালিয়াতলী	m.baliataliup.barguna.gov.bd	267
2402	Noltona	নলটোনা	noltonaup.barguna.gov.bd	267
2403	Bodorkhali	বদরখালী	bodorkhaliup.barguna.gov.bd	267
2404	Gowrichanna	গৌরিচন্না	gowrichannaup.barguna.gov.bd	267
2405	Fuljhuri	ফুলঝুড়ি	fuljhuriup.barguna.gov.bd	267
2406	Keorabunia	কেওড়াবুনিয়া	keorabuniaup.barguna.gov.bd	267
2407	Ayla Patakata	আয়লা পাতাকাটা	aylaPatakataup.barguna.gov.bd	267
2408	Burirchor	বুড়িরচর	burirchorup.barguna.gov.bd	267
2409	Dhalua	ঢলুয়া	dhaluaup.barguna.gov.bd	267
2410	Barguna	বরগুনা	bargunaup.barguna.gov.bd	267
2411	Bibichini	বিবিচিন	bibichiniup.barguna.gov.bd	268
2412	Betagi	বেতাগী	betagiup.barguna.gov.bd	268
2413	Hosnabad	হোসনাবাদ	hosnabadup.barguna.gov.bd	268
2414	Mokamia	মোকামিয়া	mokamiaup.barguna.gov.bd	268
2415	Buramajumder	বুড়ামজুমদার	buramajumderup.barguna.gov.bd	268
2416	Kazirabad	কাজীরাবাদ	kazirabadup.barguna.gov.bd	268
2417	Sarisamuri	সরিষামুড়ী	sarisamuriup.barguna.gov.bd	268
2418	Bukabunia	বুকাবুনিয়া	bukabuniaup.barguna.gov.bd	269
2419	Bamna	বামনা	bamnaup.barguna.gov.bd	269
2420	Ramna	রামনা	ramnaup.barguna.gov.bd	269
2421	Doutola	ডৌয়াতলা	doutolaup.barguna.gov.bd	269
2422	Raihanpur	রায়হানপুর	raihanpurup.barguna.gov.bd	270
2423	Nachnapara	নাচনাপাড়া	nachnaparaup.barguna.gov.bd	270
3353	Kukutia	কুকুটিয়া	kukutiaup.munshiganj.gov.bd	371
2426	Kalmegha	কালমেঘা	kalmeghaup.barguna.gov.bd	270
2427	Kakchira	কাকচিঢ়া	kakchiraup.barguna.gov.bd	270
2428	Kathaltali	কাঠালতলী	kathaltaliup.barguna.gov.bd	270
2429	Karibaria	কড়ইবাড়ীয়া	karibariaup.barguna.gov.bd	271
2430	Panchakoralia	পচাকোড়ালিয়া	panchakoraliaup.barguna.gov.bd	271
2431	Barabagi	বড়বগি	barabagiup.barguna.gov.bd	271
2432	Chhotabagi	ছোটবগি	chhotabagiup.barguna.gov.bd	271
2434	Sarikkhali	শারিকখালি	sarikkhaliup.barguna.gov.bd	271
2435	Sonakata	সোনাকাটা	sonakataup.barguna.gov.bd	271
2436	Tazpur	তাজপুর	tazpurup.sylhet.gov.bd	284
2437	Umorpur	উমরপুর	umorpurup.sylhet.gov.bd	284
2438	West Poilanpur	পশ্চিম পৈলনপুর	westpoilanpurup.sylhet.gov.bd	284
2439	East Poilanpur	পূর্ব পৈলনপুর	eastpoilanpurup.sylhet.gov.bd	272
2440	Boaljur	বোয়ালজুর	boaljurup.sylhet.gov.bd	272
2441	Burungabazar	বুরুঙ্গাবাজার	burungabazarup.sylhet.gov.bd	284
2442	Goalabazar	গোয়ালাবাজার	goalabazarup.sylhet.gov.bd	284
2443	Doyamir	দয়ামীর	doyamirup.sylhet.gov.bd	284
2444	Usmanpur	উসমানপুর	usmanpurup.sylhet.gov.bd	284
2446	West Gouripur	পশ্চিম গৌরীপুর	westgouripurup.sylhet.gov.bd	272
2447	East Gouripur	পূর্ব গৌরীপুর	eastgouripurup.sylhet.gov.bd	272
2448	Balaganj	বালাগঞ্জ	balaganjup.sylhet.gov.bd	272
2449	Sadipur	সাদিরপুর	sadipurup.sylhet.gov.bd	284
2450	Tilpara	তিলপাড়া	tilparaup.sylhet.gov.bd	273
2451	Alinagar	আলীনগর	alinagarup.sylhet.gov.bd	273
2452	Charkhai	চরখাই	charkhaiup.sylhet.gov.bd	273
2453	Dubag	দুবাগ	dubagup.sylhet.gov.bd	273
2454	Sheola	শেওলা	sheolaup.sylhet.gov.bd	273
2455	Kurarbazar	কুড়ারবাজার	kurarbazarup.sylhet.gov.bd	273
2456	Mathiura	মাথিউরা	mathiuraup.sylhet.gov.bd	273
2457	Mullapur	মোল্লাপুর	mullapurup.sylhet.gov.bd	273
2458	Muria	মুড়িয়া	muriaup.sylhet.gov.bd	273
2462	Khajanchi	খাজাঞ্চী	khajanchiup.sylhet.gov.bd	274
2463	Alankari	অলংকারী	alankariup.sylhet.gov.bd	274
2464	Dewkalash	দেওকলস	dewkalashup.sylhet.gov.bd	274
2465	Bishwanath	বিশ্বনাথ	bishwanathup.sylhet.gov.bd	274
2466	Doshghar	দশঘর	doshgharup.sylhet.gov.bd	274
2467	Daulatpur	দৌলতপুর	daulatpurup.sylhet.gov.bd	274
2468	Telikhal	তেলিখাল	telikhalup.sylhet.gov.bd	275
2470	Islampur Purba	ইসলামপুর পূর্ব	islampurpurbaup.sylhet.gov.bd	275
2471	Isakalas	ইসাকলস	isakalasup.sylhet.gov.bd	275
2472	Uttor Ronikhai	উত্তর রনিখাই	uttorronikhaiup.sylhet.gov.bd	275
2473	Dakkin Ronikhai	দক্ষিন রনিখাই	dakkinronikhaiup.sylhet.gov.bd	275
2474	Ghilachora	ঘিলাছড়া	ghilachoraup.sylhet.gov.bd	276
2475	Fenchuganj	ফেঞ্চুগঞ্জ	1nofenchuganjup.sylhet.gov.bd	276
2476	Uttar Kushiara	উত্তর কুশিয়ারা	uttarkushiaraup.sylhet.gov.bd	276
2477	Uttar Fenchuganj	উত্তর ফেঞ্চুগঞ্জ	uttarfenchuganjup.sylhet.gov.bd	276
2478	Maijgaon	মাইজগাঁও	maijgaonup.sylhet.gov.bd	276
2479	Golapganj	গোলাপগঞ্জ	golapganjup.sylhet.gov.bd	277
2480	Fulbari	ফুলবাড়ী	fulbariup.sylhet.gov.bd	277
2481	Lakshmipasha	লক্ষ্মীপাশা	lakshmipashaup.sylhet.gov.bd	277
2482	Budhbaribazar	বুধবারীবাজার	budhbaribazarup.sylhet.gov.bd	277
2483	Dhakadakshin	ঢাকাদক্ষিন	dhakadakshinup.sylhet.gov.bd	277
2484	Sharifganj	শরিফগঞ্জ	sharifganjup.sylhet.gov.bd	277
2486	Lakshanaband	লক্ষনাবন্দ	lakshanabandup.sylhet.gov.bd	277
2487	Bhadeshwar	ভাদেশ্বর	bhadeshwarup.sylhet.gov.bd	277
2488	West Amura	পশ্চিম আমুরা	westamuraup.sylhet.gov.bd	277
2489	Fothepur	ফতেপুর	fothepurup.sylhet.gov.bd	278
2490	Rustampur	রুস্তমপুর	rustampurup.sylhet.gov.bd	278
2491	Paschim Jaflong	পশ্চিম জাফলং	paschimjaflongup.sylhet.gov.bd	278
2492	Purba Jaflong	পূর্ব জাফলং	purbajaflongup.sylhet.gov.bd	278
2493	Lengura	লেঙ্গুড়া	lenguraup.sylhet.gov.bd	278
2494	Alirgaon	আলীরগাঁও	alirgaonup.sylhet.gov.bd	278
2495	Nandirgaon	নন্দিরগাঁও	nandirgaonup.sylhet.gov.bd	278
2496	Towakul	তোয়াকুল	towakulup.sylhet.gov.bd	278
2497	Daubari	ডৌবাড়ী	daubariup.sylhet.gov.bd	278
2498	Nijpat	নিজপাট	nijpatup.sylhet.gov.bd	279
2499	Jaintapur	জৈন্তাপুর	jaintapurup.sylhet.gov.bd	279
3354	Atpara	আটপাড়া	atparaup.munshiganj.gov.bd	371
3355	Tantor	তন্তর	tantorup.munshiganj.gov.bd	371
3356	Chitracoat	চিত্রকোট	chitracoatup.munshiganj.gov.bd	372
3357	Sekhornagar	শেখরনগার	sekhornagarup.munshiganj.gov.bd	372
2502	Fatehpur	ফতেপুর	fatehpurup.sylhet.gov.bd	279
2503	Chiknagul	চিকনাগুল	chiknagulup.sylhet.gov.bd	279
2504	Rajagonj	রাজাগঞ্জ	rajagonjup.sylhet.gov.bd	280
2507	Digirpar Purbo	দিঘিরপার পূর্ব	digirparpurboup.sylhet.gov.bd	280
2508	Satbakh	সাতবাক	satbakhup.sylhet.gov.bd	280
2509	Barachotul	বড়চতুল	barachotulup.sylhet.gov.bd	280
2510	Kanaighat	কানাইঘাট	kanaighatup.sylhet.gov.bd	280
2512	Jinghabari	ঝিঙ্গাবাড়ী	jinghabariup.sylhet.gov.bd	280
2513	Jalalabad	জালালাবাদ	jalalabadup.sylhet.gov.bd	281
2514	Hatkhula	হাটখোলা	hatkhulaup.sylhet.gov.bd	281
2515	Khadimnagar	খাদিমনগর	khadimnagarup.sylhet.gov.bd	281
2516	Khadimpara	খাদিমপাড়া	khadimparaup.sylhet.gov.bd	281
2517	Tultikor	টুলটিকর	tultikorup.sylhet.gov.bd	281
2518	Tukerbazar	টুকেরবাজার	tukerbazarup.sylhet.gov.bd	281
2519	Mugolgaon	মোগলগাও	mugolgaonup.sylhet.gov.bd	281
2520	Kandigaon	কান্দিগাও	kandigaonup.sylhet.gov.bd	281
2521	Manikpur	মানিকপুর	manikpurup.sylhet.gov.bd	282
2522	Sultanpur	সুলতানপুর	sultanpurup.sylhet.gov.bd	282
2523	Barohal	বারহাল	barohalup.sylhet.gov.bd	282
2524	Birorsri	বিরশ্রী	birorsriup.sylhet.gov.bd	282
2525	Kajalshah	কাজলশার	kajalshahup.sylhet.gov.bd	282
2526	Kolachora	কলাছড়া	kolachora.sylhet.gov.bd	282
2527	Zakiganj	জকিগঞ্জ	zakiganjup.sylhet.gov.bd	282
2528	Barothakuri	বারঠাকুরী	barothakuriup.sylhet.gov.bd	282
2529	Kaskanakpur	কসকনকপুর	kaskanakpurup.sylhet.gov.bd	282
2530	Lalabazar	লালাবাজার	lalabazarup.sylhet.gov.bd	283
2531	Moglabazar	মোগলাবাজার	moglabazarup.sylhet.gov.bd	283
2532	Boroikandi	বড়ইকান্দি	boroikandiup.sylhet.gov.bd	283
2533	Silam	সিলাম	silamup.sylhet.gov.bd	283
2534	Daudpur	দাউদপুর	daudpurup.sylhet.gov.bd	283
2535	Mollargaon	মোল্লারগাঁও	mollargaonup.sylhet.gov.bd	283
2536	Kuchai	কুচাই	kuchaiup.sylhet.gov.bd	283
2537	Kamalbazar	কামালবাজার	kamalbazarup.sylhet.gov.bd	283
2538	Jalalpur	জালালপুর	jalalpurup.sylhet.gov.bd	283
2539	Tetli	তেতলী	tetliup.sylhet.gov.bd	283
2540	Talimpur	তালিমপুর	talimpurup.moulvibazar.gov.bd	285
2541	Borni	বর্ণি	borniup.moulvibazar.gov.bd	285
2542	Dasherbazar	দাসেরবাজার	dasherbazarup.moulvibazar.gov.bd	285
2543	Nizbahadurpur	নিজবাহাদুরপুর	nizbahadurpurup.moulvibazar.gov.bd	285
2544	Uttar Shahbajpur	উত্তর শাহবাজপুর	shahbajpuruttarup.moulvibazar.gov.bd	285
2546	Talimpur	তালিমপুর	talimpurup.moulvibazar.gov.bd	285
2547	Baralekha	বড়লেখা	baralekhaup.moulvibazar.gov.bd	285
2548	Dakshinbhag Uttar	দক্ষিণভাগ (উত্তর)	dakshinbhaguttarup.moulvibazar.gov.bd	285
2549	Dakshinbhag Dakkhin	দক্ষিণভাগ (দক্ষিণ)	dakshinbhagdakshinup.moulvibazar.gov.bd	285
2550	Sujanagar	সুজানগর	sujanagarup.moulvibazar.gov.bd	285
2551	Adampur	আদমপুর	adampurup.moulvibazar.gov.bd	286
2552	Patanushar	পতনঊষার	patanusharup.moulvibazar.gov.bd	286
2553	Madhabpur	মাধবপুর	madhabpurup.moulvibazar.gov.bd	286
2554	Rahimpur	রহিমপুর	rahimpurup.moulvibazar.gov.bd	286
2555	Shamshernagar	শমশেরনগর	shamshernagarup.moulvibazar.gov.bd	286
2556	Kamalgonj	কমলগঞ্জ	kamalgonjup.moulvibazar.gov.bd	286
2557	Islampur	ইসলামপুর	islampurup.moulvibazar.gov.bd	286
2558	Munshibazar	মুন্সিবাজার	munshibazarup3.moulvibazar.gov.bd	286
2559	Alinagar	আলী নগর	alinagarup.moulvibazar.gov.bd	286
2560	Baramchal	বরমচাল	baramchalup.moulvibazar.gov.bd	287
2561	Bhukshimail	ভূকশিমইল	bhukshimailup.moulvibazar.gov.bd	287
2562	Joychandi	জয়চন্ডি	joychandiup.moulvibazar.gov.bd	287
2563	Brammanbazar	ব্রাহ্মণবাজার	brammanbazarup.moulvibazar.gov.bd	287
2564	Kadipur	কাদিপুর	kadipurup.moulvibazar.gov.bd	287
2565	Kulaura	কুলাউড়া	kulauraup.moulvibazar.gov.bd	287
2566	Rauthgaon	রাউৎগাঁও	rauthgaonup.moulvibazar.gov.bd	287
2567	Tilagaon	টিলাগাঁও	tilagaonup.moulvibazar.gov.bd	287
2568	Sharifpur	শরীফপুর	sharifpurup.moulvibazar.gov.bd	287
2569	Prithimpassa	পৃথিমপাশা	prithimpassaup.moulvibazar.gov.bd	287
2570	Kormodha	কর্মধা	kormodhaup.moulvibazar.gov.bd	287
2571	Bhatera	ভাটেরা	bhateraup.moulvibazar.gov.bd	287
2572	Hazipur	হাজীপুর	hazipurup.moulvibazar.gov.bd	287
2573	Amtail	আমতৈল	amtailup.moulvibazar.gov.bd	288
2574	Khalilpur	খলিলপুর	khalilpurup.moulvibazar.gov.bd	288
2575	Monumukh	মনুমুখ	monumukhup.moulvibazar.gov.bd	288
2576	Kamalpur	কামালপুর	kamalpurup.moulvibazar.gov.bd	288
2577	Apar Kagabala	আপার কাগাবলা	uparkagabalaup.moulvibazar.gov.bd	288
3358	Rajanagar	রাজানগর	rajanagarup.munshiganj.gov.bd	372
2580	Chadnighat	চাঁদনীঘাট	chadnighatup.moulvibazar.gov.bd	288
2581	Konokpur	কনকপুর	konokpurup.moulvibazar.gov.bd	288
2582	Nazirabad	নাজিরাবাদ	nazirabadup.moulvibazar.gov.bd	288
2583	Mostafapur	মোস্তফাপুর	mostafapurup.moulvibazar.gov.bd	288
2584	Giasnagar	গিয়াসনগর	giasnagarup.moulvibazar.gov.bd	288
2586	Uttorbhag	উত্তরভাগ	uttorbhagup.moulvibazar.gov.bd	289
2587	Munsibazar	মুন্সিবাজার	munsibazarup.moulvibazar.gov.bd	289
2588	Panchgaon	পাঁচগাঁও	panchgaonup.moulvibazar.gov.bd	289
2589	Rajnagar	রাজনগর	rajnagarup.moulvibazar.gov.bd	289
2590	Tengra	টেংরা	tengraup.moulvibazar.gov.bd	289
2592	Munsurnagar	মনসুরনগর	munsurnagarup.moulvibazar.gov.bd	289
2593	Mirzapur	মির্জাপুর	mirzapurup.moulvibazar.gov.bd	290
2594	Bhunabir	ভূনবীর	bhunabirup.moulvibazar.gov.bd	290
2595	Sreemangal	শ্রীমঙ্গল	sreemangalup.moulvibazar.gov.bd	290
2596	Sindurkhan	সিন্দুরখান	sindurkhanup.moulvibazar.gov.bd	290
2597	Kalapur	কালাপুর	kalapurup.moulvibazar.gov.bd	290
2598	Ashidron	আশিদ্রোন	ashidronup.moulvibazar.gov.bd	290
2599	Rajghat	রাজঘাট	rajghatup.moulvibazar.gov.bd	290
2600	Kalighat	কালীঘাট	kalighatup.moulvibazar.gov.bd	290
2601	Satgaon	সাতগাঁও	satgaonup.moulvibazar.gov.bd	290
2602	Jafornagar	জায়ফরনগর	jafornagarup.moulvibazar.gov.bd	291
2603	West Juri	পশ্চিম জুড়ী	westjuriup.moulvibazar.gov.bd	291
2604	Gualbari	গোয়ালবাড়ী	gualbariup.moulvibazar.gov.bd	291
2605	Sagornal	সাগরনাল	sagornalup.moulvibazar.gov.bd	291
2606	Fultola	ফুলতলা	fultolaup.moulvibazar.gov.bd	291
2607	Eastjuri	পুর্ব জুড়ী	eastjuriup.moulvibazar.gov.bd	291
2609	Barabhakoir Purba	বড় ভাকৈর (পূর্ব)	barabhakoirpurbaup.habiganj.gov.bd	292
2610	Inatganj	ইনাতগঞ্জ	inatganjup.habiganj.gov.bd	292
2611	Digholbak	দীঘলবাক	digholbakup.habiganj.gov.bd	292
2612	Aushkandi	আউশকান্দি	aushkandiup.habiganj.gov.bd	292
2613	Kurshi	কুর্শি	kurshiup.habiganj.gov.bd	292
2614	Kargoan	করগাঁও	kargoanup.habiganj.gov.bd	292
2615	Nabiganj Sadar	নবীগঞ্জ সদর	nabiganjsadarup.habiganj.gov.bd	292
2616	Bausha	বাউসা	baushaup.habiganj.gov.bd	292
2617	Debparra	দেবপাড়া	debparraup.habiganj.gov.bd	292
2618	Gaznaipur	গজনাইপুর	gaznaipurup.habiganj.gov.bd	292
2619	Kaliarbhanga	কালিয়ারভাংগা	kaliarbhangaup.habiganj.gov.bd	292
2620	Paniumda	পানিউমদা	paniumdaup.habiganj.gov.bd	292
2622	Putijuri	পুটিজুরী	putijuriup.habiganj.gov.bd	293
2623	Satkapon	সাতকাপন	satkaponup.habiganj.gov.bd	293
2624	Bahubal Sadar	বাহুবল সদর	bahubalsadarup.habiganj.gov.bd	293
2625	Lamatashi	লামাতাশী	lamatashiup.habiganj.gov.bd	293
2626	Mirpur	মিরপুর	mirpurup.habiganj.gov.bd	293
2627	Bhadeshwar	ভাদেশ্বর	bhadeshwarup.habiganj.gov.bd	293
2628	Shibpasha	শিবপাশা	shibpashaup.habiganj.gov.bd	294
2629	Kakailsao	কাকাইলছেও	kakailsaoup.habiganj.gov.bd	294
2630	Ajmiriganj Sadar	আজমিরীগঞ্জ সদর	ajmiriganjsadarup.habiganj.gov.bd	294
2631	Badolpur	বদলপুর	badolpurup.habiganj.gov.bd	294
2632	Jolsuka	জলসুখা	jolsukaup.habiganj.gov.bd	294
2634	Baniachong North West	বানিয়াচং উত্তর পশ্চিম	baniachongnorthwestup.habiganj.gov.bd	295
2635	Baniachong South East	বানিয়াচং দক্ষিণ পূর্ব	baniachongsoutheastup.habiganj.gov.bd	295
2637	Daulatpur	দৌলতপুর	daulatpur.habiganj.gov.bd	295
2638	Khagaura	খাগাউড়া	khagauraup.habiganj.gov.bd	295
2639	Baraiuri	বড়ইউড়ি	baraiuriup.habiganj.gov.bd	295
2640	Kagapasha	কাগাপাশা	kagapashaup.habiganj.gov.bd	295
2641	Pukra	পুকড়া	pukraup.habiganj.gov.bd	295
2642	Subidpur	সুবিদপুর	subidpurup.habiganj.gov.bd	295
2643	Makrampur	মক্রমপুর	makrampurup.habiganj.gov.bd	295
2644	Sujatpur	সুজাতপুর	sujatpurup.habiganj.gov.bd	295
2645	Mandari	মন্দরী	mandariup.habiganj.gov.bd	295
2646	Muradpur	মুরাদপুর	muradpurup.habiganj.gov.bd	295
2647	Pailarkandi	পৈলারকান্দি	pailarkandiup.habiganj.gov.bd	295
2648	Lakhai	লাখাই	lakhaiup.habiganj.gov.bd	296
2649	Murakari	মোড়াকরি	murakariup.habiganj.gov.bd	296
2650	Muriauk	মুড়িয়াউক	muriaukup.habiganj.gov.bd	296
2651	Bamoi	বামৈ	bamoiup.habiganj.gov.bd	296
2652	Karab	করাব	karabup.habiganj.gov.bd	296
2653	Bulla	বুল্লা	bullaup6.habiganj.gov.bd	296
2654	Gazipur	গাজীপুর	gazipurup.habiganj.gov.bd	297
2655	Ahammadabad	আহম্মদাবাদ	ahammadabadup.habiganj.gov.bd	297
2731	Mannargaon	মান্নারগাঁও	mannargaonup.sunamganj.gov.bd	305
3359	Keyain	কেয়াইন	keyainup.munshiganj.gov.bd	372
3360	Basail	বাসাইল	basailup.munshiganj.gov.bd	372
2658	Shankhala	শানখলা	shankhalaup.habiganj.gov.bd	297
2659	Chunarughat	চুনারুঘাট	chunarughatup.habiganj.gov.bd	297
2660	Ubahata	উবাহাটা	ubahataup.habiganj.gov.bd	297
2661	Shatiajuri	সাটিয়াজুরী	shatiajuriup.habiganj.gov.bd	297
2662	Ranigaon	রাণীগাঁও	ranigaonup.habiganj.gov.bd	297
2663	Mirashi	মিরাশী	mirashiup.habiganj.gov.bd	297
2664	Lukra	লুকড়া	lukraup.habiganj.gov.bd	298
2665	Richi	রিচি	richiup.habiganj.gov.bd	298
2666	Teghoria	তেঘরিয়া	teghoriaup.habiganj.gov.bd	298
2667	Poil	পইল	poilup.habiganj.gov.bd	298
2668	Gopaya	গোপায়া	gopayaup.habiganj.gov.bd	298
2669	Rajiura	রাজিউড়া	rajiuraup.habiganj.gov.bd	298
2670	Nurpur	নুরপুর	nurpurup.habiganj.gov.bd	298
2671	Shayestaganj	শায়েস্তাগঞ্জ	shayestaganjup.habiganj.gov.bd	298
2672	Nijampur	নিজামপুর	nijampurup.habiganj.gov.bd	298
2673	Laskerpur	লস্করপুর	laskerpurup.habiganj.gov.bd	298
2674	Dharmaghar	ধর্মঘর	dharmagharup.habiganj.gov.bd	299
2675	Choumohani	চৌমুহনী	choumohaniup.habiganj.gov.bd	299
2676	Bahara	বহরা	baharaup.habiganj.gov.bd	299
2677	Adaoir	আদাঐর	adaoirup.habiganj.gov.bd	299
2678	Andiura	আন্দিউড়া	andiuraup.habiganj.gov.bd	299
2679	Shahjahanpur	শাহজাহানপুর	shahjahanpurup.habiganj.gov.bd	299
2680	Jagadishpur	জগদীশপুর	jagadishpurup.habiganj.gov.bd	299
2681	Bulla	বুল্লা	bullaup.habiganj.gov.bd	299
2682	Noapara	নোয়াপাড়া	noaparaup.habiganj.gov.bd	299
2683	Chhatiain	ছাতিয়াইন	chhatiainup.habiganj.gov.bd	299
2684	Bagashura	বাঘাসুরা	bagashuraup.habiganj.gov.bd	299
2685	Jahangirnagar	জাহাঙ্গীরনগর	jahangirnagarup.sunamganj.gov.bd	300
2686	Rangarchar	রংগারচর	rangarcharup.sunamganj.gov.bd	300
2687	Aptabnagar	আপ্তাবনগর	aptabnagarup.sunamganj.gov.bd	300
2688	Gourarang	গৌরারং	gourarang.sunamganj.gov.bd	300
2689	Mollapara	মোল্লাপাড়া	mollaparaup.sunamganj.gov.bd	300
2690	Laxmansree	লক্ষণশ্রী	laxmansreeup.sunamganj.gov.bd	300
2691	Kathair	কাঠইর	kathairup.sunamganj.gov.bd	300
2692	Surma	সুরমা	surmaup.sunamganj.gov.bd	300
2693	Mohonpur	মোহনপুর	mohonpurup.sunamganj.gov.bd	300
2694	Shimulbak	শিমুলবাক	shimulbak.sunamganj.gov.bd	301
2695	Paschim Pagla	পশ্চিম পাগলা	paschimpagla.sunamganj.gov.bd	301
2696	Joykalash	জয়কলস	joykalashup.sunamganj.gov.bd	301
2697	Purba Pagla	পূর্ব পাগলা	purbapaglaup.sunamganj.gov.bd	301
2698	Patharia	পাথারিয়া	pathariaup.sunamganj.gov.bd	301
2699	Purba Birgaon	পূর্ব বীরগাঁও	purbabirgaonup.sunamganj.gov.bd	301
2700	Dargapasha	দরগাপাশা	dargapashaup.sunamganj.gov.bd	301
2701	Paschim Birgaon	পশ্চিম বীরগাঁও	paschimbirgaonup.sunamganj.gov.bd	301
2702	Palash	পলাশ	palashup.sunamganj.gov.bd	302
2703	Solukabad	সলুকাবাদ	solukabadup.sunamganj.gov.bd	302
2704	Dhanpur	ধনপুর	dhanpurup.sunamganj.gov.bd	302
2705	Badaghat South	বাদাঘাট দক্ষিণ	badaghatsouthup.sunamganj.gov.bd	302
2706	Fatepur	ফতেপুর	fatepurup.sunamganj.gov.bd	302
2707	Islampur	ইসলামপুর	islampurup.sunamganj.gov.bd	303
2708	Noarai	নোয়ারাই	noaraiup.sunamganj.gov.bd	303
2709	Chhatak Sadar	ছাতক সদর	chhataksadarup.sunamganj.gov.bd	303
2710	Kalaruka	কালারুকা	kalarukaup.sunamganj.gov.bd	303
2712	Chhaila Afjalabad	ছৈলা আফজলাবাদ	chhailaafjalabadup.sunamganj.gov.bd	303
2713	Khurma North	খুরমা উত্তর	khurmanorthup.sunamganj.gov.bd	303
2714	Khurma South	খুরমা দক্ষিণ	khurmasouthup.sunamganj.gov.bd	303
2715	Chormohalla	চরমহল্লা	chormohallaup.sunamganj.gov.bd	303
2716	Jauwabazar	জাউয়া বাজার	jauwabazarup.sunamganj.gov.bd	303
2717	Singchapair	সিংচাপইড়	singchapairup.sunamganj.gov.bd	303
2718	Dolarbazar	দোলারবাজার	dolarbazarup.sunamganj.gov.bd	303
2719	Bhatgaon	ভাতগাঁও	bhatgaonup.sunamganj.gov.bd	303
2720	Kolkolia	কলকলিয়া	kolkoliaup.sunamganj.gov.bd	304
2721	Patli	পাটলী	patliup.sunamganj.gov.bd	304
2722	Mirpur	মীরপুর	mirpurup.sunamganj.gov.bd	304
2723	Chilaura Holdipur	চিলাউড়া হলদিপুর	chilauraholdipurup.sunamganj.gov.bd	304
2724	Raniganj	রানীগঞ্জ	raniganjup.sunamganj.gov.bd	304
2725	Syedpur Shaharpara	সৈয়দপুর শাহাড়পাড়া	syedpurshaharparaup.sunamganj.gov.bd	304
2726	Asharkandi	আশারকান্দি	asharkandiup.sunamganj.gov.bd	304
2727	Pailgaon	পাইলগাঁও	pailgaonup.sunamganj.gov.bd	304
2728	Banglabazar	বাংলাবাজার	banglabazarup.sunamganj.gov.bd	305
2729	Norsingpur	নরসিংহপুর	norsingpurup.sunamganj.gov.bd	305
2730	Dowarabazar	দোয়ারাবাজার	dowarabazarup.sunamganj.gov.bd	305
3361	Baluchar	বালুচর	balucharup.munshiganj.gov.bd	372
2734	Laxmipur	লক্ষীপুর	laxmipurup.sunamganj.gov.bd	305
2736	Surma	সুরমা	surma2up.sunamganj.gov.bd	305
2737	Sreepur North	শ্রীপুর উত্তর	sreepurnorthup.sunamganj.gov.bd	306
2738	Sreepur South	শ্রীপুর দক্ষিণ	sreepursouthup.sunamganj.gov.bd	306
2740	Bordal North	বড়দল উত্তর	bordalnorthup.sunamganj.gov.bd	306
2741	Badaghat	বাদাঘাট	badaghatup.sunamganj.gov.bd	306
2742	Tahirpur Sadar	তাহিরপুর সদর	tahirpursadarup.sunamganj.gov.bd	306
2743	Balijuri	বালিজুরী	balijuriup.sunamganj.gov.bd	306
2744	Bongshikunda North	বংশীকুন্ডা উত্তর	bongshikundanorthup.sunamganj.gov.bd	307
2745	Bongshikunda South	বংশীকুন্ডা দক্ষিণ	bongshikundasouthup.sunamganj.gov.bd	307
2746	Chamordani	চামরদানী	chamordaniup.sunamganj.gov.bd	307
2747	Madhyanagar	মধ্যনগর	madhyanagarup.sunamganj.gov.bd	307
2748	Paikurati	পাইকুরাটী	paikuratiup.sunamganj.gov.bd	307
2749	Selbarash	সেলবরষ	selbarashup.sunamganj.gov.bd	307
2750	Dharmapasha Sadar	ধর্মপাশা সদর	dharmapashasadarup.sunamganj.gov.bd	307
2751	Joyasree	জয়শ্রী	joyasreeup.sunamganj.gov.bd	307
2753	Sukhair Rajapur South	সুখাইড় রাজাপুর দক্ষিণ	sukhairrajapursouthup.sunamganj.gov.bd	307
2754	Beheli	বেহেলী	beheliup.sunamganj.gov.bd	308
2755	Sachnabazar	সাচনাবাজার	sachnabazarup.sunamganj.gov.bd	308
2756	Bhimkhali	ভীমখালী	bhimkhaliup.sunamganj.gov.bd	308
2757	Fenerbak	ফেনারবাক	fenerbakup.sunamganj.gov.bd	308
2759	Atgaon	আটগাঁও	atgaonup.sunamganj.gov.bd	309
2760	Habibpur	হবিবপুর	habibpurup.sunamganj.gov.bd	309
2761	Bahara	বাহারা	baharaup.sunamganj.gov.bd	309
2762	Shalla Sadar	শাল্লা সদর	shallasadarup.sunamganj.gov.bd	309
2763	Rafinagar	রফিনগর	rafinagarup.sunamganj.gov.bd	310
2764	Bhatipara	ভাটিপাড়া	bhatiparaup.sunamganj.gov.bd	310
2765	Rajanagar	রাজানগর	rajanagarup.sunamganj.gov.bd	310
2767	Derai Sarmangal	দিরাই সরমঙ্গল	deraisarmangalup.sunamganj.gov.bd	310
2768	Karimpur	করিমপুর	karimpurup.sunamganj.gov.bd	310
2769	Jagddol	জগদল	jagddolup.sunamganj.gov.bd	310
2770	Taral	তাড়ল	taralup.sunamganj.gov.bd	310
2771	Kulanj	কুলঞ্জ	kulanjup.sunamganj.gov.bd	310
2772	Amlaba	আমলাব	amlabaup.narsingdi.gov.bd	311
2773	Bajnaba	বাজনাব	bajnabaup.narsingdi.gov.bd	311
2774	Belabo	বেলাব	belaboup.narsingdi.gov.bd	311
2775	Binnabayd	বিন্নাবাইদ	binnabaydup.narsingdi.gov.bd	311
2776	Charuzilab	চরউজিলাব	charuzilabup.narsingdi.gov.bd	311
2777	Naraynpur	নারায়নপুর	naraynpurup.narsingdi.gov.bd	311
2778	Sallabad	সল্লাবাদ	sallabadup.narsingdi.gov.bd	311
2779	Patuli	পাটুলী	patuliup.narsingdi.gov.bd	311
2780	Diara	দেয়ারা মডেল	diaraup.narsingdi.gov.bd	311
2781	Barachapa	বড়চাপা	barachapaup.narsingdi.gov.bd	312
2782	Chalakchar	চালাকচর	chalakcharup.narsingdi.gov.bd	312
2783	Charmandalia	চরমান্দালিয়া	charmandaliaup.narsingdi.gov.bd	312
2784	Ekduaria	একদুয়ারিয়া	ekduariaup.narsingdi.gov.bd	312
2785	Gotashia	গোতাশিয়া	gotashiaup.narsingdi.gov.bd	312
2786	Kanchikata	কাচিকাটা	kanchikataup.narsingdi.gov.bd	312
2788	Shukundi	শুকুন্দি	shukundiup.narsingdi.gov.bd	312
2789	Dawlatpur	দৌলতপুর	dawlatpurup.narsingdi.gov.bd	312
2790	Krisnopur	কৃষ্ণপুর	krisnopurup.narsingdi.gov.bd	312
2791	Labutala	লেবুতলা	labutalaup.narsingdi.gov.bd	312
2792	Chandanbari	চন্দনবাড়ী	chandanbariup.narsingdi.gov.bd	312
2793	Alokbali	আলোকবালী	alokbaliup.narsingdi.gov.bd	313
2794	Chardighaldi	চরদিঘলদী	chardighaldiup.narsingdi.gov.bd	313
2795	Chinishpur	চিনিশপুর	chinishpurup.narsingdi.gov.bd	313
2796	Hajipur	হাজীপুর	hajipurup.narsingdi.gov.bd	313
2797	Karimpur	করিমপুর	karimpurup.narsingdi.gov.bd	313
2798	Khathalia	কাঠালিয়া	khathaliaup.narsingdi.gov.bd	313
2799	Nuralapur	নূরালাপুর	nuralapurup.narsingdi.gov.bd	313
2800	Mahishasura	মহিষাশুড়া	mahishasuraup.narsingdi.gov.bd	313
2801	Meherpara	মেহেড়পাড়া	meherparaup.narsingdi.gov.bd	313
2802	Nazarpur	নজরপুর	nazarpurup.narsingdi.gov.bd	313
2803	Paikarchar	পাইকারচর	paikarcharup.narsingdi.gov.bd	313
2804	Panchdona	পাঁচদোনা	panchdonaup.narsingdi.gov.bd	313
2805	Silmandi	শিলমান্দী	silmandiup.narsingdi.gov.bd	313
2806	Amdia	আমদিয়া ২	amdiaup.narsingdi.gov.bd	313
2807	Danga	ডাংঙ্গা	dangaup.narsingdi.gov.bd	314
2808	Charsindur	চরসিন্দুর	charsindurup.narsingdi.gov.bd	314
2809	Jinardi	জিনারদী	jinardiup.narsingdi.gov.bd	314
2810	Gazaria	গজারিয়া	gazariaup.narsingdi.gov.bd	314
2811	Chanpur	চানপুর	chanpurup.narsingdi.gov.bd	315
3362	Latabdi	লতাব্দী	latabdiup.munshiganj.gov.bd	372
2814	Adiabad	আদিয়াবাদ	adiabadup.narsingdi.gov.bd	315
2815	Banshgari	বাঁশগাড়ী	banshgariup.narsingdi.gov.bd	315
2816	Chanderkandi	চান্দেরকান্দি	chanderkandiup.narsingdi.gov.bd	315
2817	Chararalia	চরআড়ালিয়া	chararaliaup.narsingdi.gov.bd	315
2818	Charmadhua	চরমধুয়া	charmadhuaup.narsingdi.gov.bd	315
2820	Daukarchar	ডৌকারচর	daukarcharup.narsingdi.gov.bd	315
2821	Hairmara	হাইরমারা	hairmaraup.narsingdi.gov.bd	315
2822	Maheshpur	মহেষপুর	maheshpurup.narsingdi.gov.bd	315
2823	Mirzanagar	মির্জানগর	mirzanagarup.narsingdi.gov.bd	315
2824	Mirzarchar	মির্জারচর	mirzarcharup.narsingdi.gov.bd	315
2825	Nilakhya	নিলক্ষ্যা	nilakhyaup.narsingdi.gov.bd	315
2826	Palashtali	পলাশতলী	palashtaliup.narsingdi.gov.bd	315
2827	Paratali	পাড়াতলী	parataliup.narsingdi.gov.bd	315
2828	Sreenagar	শ্রীনগর	sreenagarup.narsingdi.gov.bd	315
2829	Roypura	রায়পুরা	roypuraup.narsingdi.gov.bd	315
2830	Musapur	মুছাপুর	musapurup.narsingdi.gov.bd	315
2831	Uttar Bakharnagar	উত্তর বাখরনগর	uttarbakharnagarup.narsingdi.gov.bd	315
2832	Marjal	মরজাল	marjal2up.narsingdi.gov.bd	315
2833	Dulalpur	দুলালপুর	dulalpurup.narsingdi.gov.bd	316
2834	Joynagar	জয়নগর	joynagarup.narsingdi.gov.bd	316
2835	Sadharchar	সাধারচর	sadharcharup.narsingdi.gov.bd	316
2836	Masimpur	মাছিমপুর	masimpurup.narsingdi.gov.bd	316
2837	Chakradha	চক্রধা	chakradhaup.narsingdi.gov.bd	316
2838	Joshar	যোশর	josharup.narsingdi.gov.bd	316
2839	Baghabo	বাঘাব	baghaboup.narsingdi.gov.bd	316
2840	Ayubpur	আয়ুবপুর	ayubpurup.narsingdi.gov.bd	316
2841	Putia	পুটিয়া	putiaup.narsingdi.gov.bd	316
2842	Bahadursadi	বাহাদুরশাদী	bahadursadi.gazipur.gov.bd	317
2843	Baktarpur	বক্তারপুর	baktarpur.gazipur.gov.bd	317
2844	Jamalpurnew	জামালপুর	jamalpurnew.gazipur.gov.bd	317
2845	Jangalia	জাঙ্গালিয়া	jangalia.gazipur.gov.bd	317
2846	Moktarpur	মোক্তারপুর	moktarpur.gazipur.gov.bd	317
2847	Nagari	নাগরী	nagari.gazipur.gov.bd	317
2848	Tumulia	তুমুলিয়া	tumulia.gazipur.gov.bd	317
2849	Atabaha	আটাবহ	atabahaup.gazipur.gov.bd	318
2850	Boali	বোয়ালী	boaliup.gazipur.gov.bd	318
2851	Chapair	চাপাইর	chapairup.gazipur.gov.bd	318
2852	Dhaliora	ঢালজোড়া	dhalioraup.gazipur.gov.bd	318
2853	Fulbaria	ফুলবাড়ীয়া	fulbariaup.gazipur.gov.bd	318
2854	Madhyapara	মধ্যপাড়া	madhyapara.gazipur.gov.bd	318
2855	Mouchak	মৌচাক	mouchakup.gazipur.gov.bd	318
2856	Sutrapur	সূত্রাপুর	sutrapurup.gazipur.gov.bd	318
2857	Srifaltali	শ্রীফলতলী	srifaltaliup.gazipur.gov.bd	318
2858	Barishaba	বারিষাব	barishabaup.gazipur.gov.bd	319
2859	Ghagotia	ঘাগটিয়া	ghagotiaup.gazipur.gov.bd	319
2860	Kapasia	কাপাসিয়া	kapasiaup.gazipur.gov.bd	319
2861	Chandpur	চাঁদপুর	chandpur.gazipur.gov.bd	319
2862	Targoan	তরগাঁও	targoan.gazipur.gov.bd	319
2863	Karihata	কড়িহাতা	karihata.gazipur.gov.bd	319
2864	Tokh	টোক	tokh.gazipur.gov.bd	319
2865	Sinhasree	সিংহশ্রী	sinhasree.gazipur.gov.bd	319
2866	Durgapur	দূর্গাপুর	durgapurup.gazipur.gov.bd	319
2867	Sonmania	সনমানিয়া	sonmaniaup.gazipur.gov.bd	319
2868	Rayed	রায়েদ	rayedup.gazipur.gov.bd	319
2869	Baria	বাড়ীয়া	bariaup.gazipur.gov.bd	320
2870	Basan	বাসন	basanup.gazipur.gov.bd	320
2871	Gachha	গাছা	gachhaup.gazipur.gov.bd	320
2872	Kashimpur	কাশিমপুর	kashimpurup.gazipur.gov.bd	320
2873	Kayaltia	কাউলতিয়া	kayaltiaup.gazipur.gov.bd	320
2874	Konabari	কোনাবাড়ী	konabariup.gazipur.gov.bd	320
2875	Mirzapur	মির্জাপুর	mirzapurup.gazipur.gov.bd	320
2876	Pubail	পূবাইল	pubailup.gazipur.gov.bd	320
2877	Barmi	বরমী	barmiup.gazipur.gov.bd	321
2878	Gazipur	গাজীপুর	gazipurup.gazipur.gov.bd	321
2879	Gosinga	গোসিংগা	gosingaup.gazipur.gov.bd	321
2880	Maona	মাওনা	maonaup.gazipur.gov.bd	321
2881	Kaoraid	কাওরাইদ	kaoraidup.gazipur.gov.bd	321
2882	Prahladpur	প্রহলাদপুর	prahladpurup.gazipur.gov.bd	321
2883	Rajabari	রাজাবাড়ী	rajabariup.gazipur.gov.bd	321
2884	Telihati	তেলিহাটী	telihatiup.gazipur.gov.bd	321
2885	Binodpur	বিনোদপুর	binodpurup.shariatpur.gov.bd	322
2886	Tulasar	তুলাসার	tulasarup.shariatpur.gov.bd	322
2887	Palong	পালং	palongup.shariatpur.gov.bd	322
3363	Rasunia	রশুনিয়া	rasuniaup.munshiganj.gov.bd	372
3364	Ichhapura	ইছাপুরা	ichhapuraup.munshiganj.gov.bd	372
3365	Bairagadi	বয়রাগাদি	bairagadiup.munshiganj.gov.bd	372
3366	Malkhanagar	মালখানগর	malkhanagarup.munshiganj.gov.bd	372
3367	Madhypara	মধ্যপাড়া	madhyparaup.munshiganj.gov.bd	372
3368	Kola	কোলা	kolaup.munshiganj.gov.bd	372
2890	Angaria	আংগারিয়া	angariaup.shariatpur.gov.bd	322
2891	Chitolia	চিতলয়া	chitoliaup.shariatpur.gov.bd	322
2892	Mahmudpur	মাহমুদপুর	mahmudpurup.shariatpur.gov.bd	322
2893	Chikondi	চিকন্দি	chikondiup.shariatpur.gov.bd	322
2894	Chandrapur	চন্দ্রপুর	chandrapurup.shariatpur.gov.bd	322
2895	Shulpara	শৌলপাড়া	shulparaup.shariatpur.gov.bd	322
2896	Kedarpur	কেদারপুর	kedarpurup.shariatpur.gov.bd	323
2897	Dingamanik	ডিংগামানিক	dingamanikup.shariatpur.gov.bd	323
2898	Garishar	ঘড়িষার	garisharup.shariatpur.gov.bd	323
2899	Nowpara	নওপাড়া	nowparaup.shariatpur.gov.bd	323
2900	Moktererchar	মোত্তারেরচর	mokterercharup.shariatpur.gov.bd	323
2901	Charatra	চরআত্রা	charatraup.shariatpur.gov.bd	323
2903	Japsa	জপসা	japsaup.shariatpur.gov.bd	323
2904	Vojeshwar	ভোজেশ্বর	vojeshwarup.shariatpur.gov.bd	323
2905	Fategongpur	ফতেজংপুর	fategongpurup.shariatpur.gov.bd	323
2906	Bijari	বিঝারি	bijariup.shariatpur.gov.bd	323
2907	Vumkhara	ভূমখাড়া	vumkharaup.shariatpur.gov.bd	323
2908	Nashason	নশাসন	nashasonup.shariatpur.gov.bd	323
2909	Zajira Sadar	জাজিরা সদর	zajirasadarup.shariatpur.gov.bd	324
2910	Mulna	মূলনা	mulnaup.shariatpur.gov.bd	324
2911	Barokandi	বড়কান্দি	barokandiup.shariatpur.gov.bd	324
2912	Bilaspur	বিলাসপুর	bilaspurup.shariatpur.gov.bd	324
2913	Kundarchar	কুন্ডেরচর	kundarcharup.shariatpur.gov.bd	324
2914	Palerchar	পালেরচর	palercharup.shariatpur.gov.bd	324
2915	Purba Nawdoba	পুর্ব নাওডোবা	purbanawdobaup.shariatpur.gov.bd	324
2916	Nawdoba	নাওডোবা	nawdobaup.shariatpur.gov.bd	324
2917	Shenerchar	সেনেরচর	shenercharup.shariatpur.gov.bd	324
2918	Bknagar	বি. কে. নগর	bknagarup.shariatpur.gov.bd	324
2920	Jaynagor	জয়নগর	jaynagorup.shariatpur.gov.bd	324
2921	Nager Para	নাগের পাড়া	nagerparaup.shariatpur.gov.bd	325
2922	Alaolpur	আলাওলপুর	alaolpurup.shariatpur.gov.bd	325
2923	Kodalpur	কোদালপুর	kodalpurup.shariatpur.gov.bd	325
2924	Goshairhat	গোসাইরহাট	goshairhatup.shariatpur.gov.bd	325
2925	Edilpur	ইদিলপুর	edilpurup.shariatpur.gov.bd	325
2926	Nalmuri	নলমুড়ি	nalmuriup.shariatpur.gov.bd	325
2927	Samontasar	সামন্তসার	samontasarup.shariatpur.gov.bd	325
2928	Kuchipatti	কুচাইপট্টি	kuchipattiup.shariatpur.gov.bd	325
2929	Ramvadrapur	রামভদ্রপুর	ramvadrapurup.shariatpur.gov.bd	326
2930	Mahisar	মহিষার	mahisarup.shariatpur.gov.bd	326
2931	Saygaon	ছয়গাঁও	saygaonup.shariatpur.gov.bd	326
2932	Narayanpur	নারায়নপুর	narayanpurup.shariatpur.gov.bd	326
2933	D.M Khali	ডি.এম খালি	dmkhaliup.shariatpur.gov.bd	326
2934	Charkumaria	চরকুমারিয়া	charkumariaup.shariatpur.gov.bd	326
2935	Sakhipur	সখিপুর	sakhipurup.shariatpur.gov.bd	326
2936	Kachikata	কাচিকাঁটা	kachikataup.shariatpur.gov.bd	326
2938	Charvaga	চরভাগা	charvagaup.shariatpur.gov.bd	326
2939	Arsinagar	আরশিনগর	arsinagarup.shariatpur.gov.bd	326
2940	South Tarabunia	দক্ষিন তারাবুনিয়া	southtarabuniaup.shariatpur.gov.bd	326
2941	Charsensas	চরসেনসাস	charsensasup.shariatpur.gov.bd	326
2942	Shidulkura	শিধলকুড়া	shidulkuraup.shariatpur.gov.bd	327
2943	Kaneshar	কনেস্বর	kanesharup.shariatpur.gov.bd	327
2944	Purba Damudya	পুর্ব ডামুড্যা	purbadamudyaup.shariatpur.gov.bd	327
2945	Islampur	ইসলামপুর	islampurup.shariatpur.gov.bd	327
2946	Dankati	ধানকাটি	dankatiup.shariatpur.gov.bd	327
2947	Sidya	সিড্যা	sidyaup.shariatpur.gov.bd	327
2948	Darulaman	দারুল আমান	darulamanup.shariatpur.gov.bd	327
2949	Satgram	সাতগ্রাম	satgramup.narayanganj.gov.bd	328
2950	Duptara	দুপ্তারা	duptaraup.narayanganj.gov.bd	328
2952	Fatepur	ফতেপুর	fatepurup.narayanganj.gov.bd	328
2953	Bishnandi	বিশনন্দী	bishnandiup.narayanganj.gov.bd	328
2954	Mahmudpur	মাহমুদপুর	mahmudpurup.narayanganj.gov.bd	328
2955	Highjadi	হাইজাদী	highjadiup.narayanganj.gov.bd	328
2956	Uchitpura	উচিৎপুরা	uchitpuraup.narayanganj.gov.bd	328
2957	Kalapaharia	কালাপাহাড়িয়া	kalapahariaup.narayanganj.gov.bd	328
2958	Kagkanda	খাগকান্দা	kagkandaUP.narayanganj.gov.bd	328
2959	Musapur	মুছাপুর	musapurup.narayanganj.gov.bd	329
2960	Modonpur	মদনপুর	modonpurup.narayanganj.gov.bd	329
2961	Bandar	বন্দর	bandarup.narayanganj.gov.bd	329
2962	Dhamgar	ধামগর	dhamgar.narayanganj.gov.bd	329
2963	Kolagathia	 কলাগাছিয়া	kolagathiaup.narayanganj.gov.bd	329
2964	Alirtek	আলিরটেক	alirtekup.narayanganj.gov.bd	330
2965	Kashipur	কাশীপুর	kashipurup.narayanganj.gov.bd	330
2966	Kutubpur	কুতুবপুর	kutubpurup.narayanganj.gov.bd	330
3369	Joyinshar	জৈনসার	joyinsharup.munshiganj.gov.bd	372
2969	Enayetnagor	এনায়েত নগর	enayetnagorup.narayanganj.gov.bd	330
2970	Murapara	মুড়াপাড়া	muraparaup.narayanganj.gov.bd	331
2971	Bhulta	ভূলতা	bhultaup.narayanganj.gov.bd	331
2973	Daudpur	দাউদপুর	daudpurup.narayanganj.gov.bd	331
2974	Rupganj	রূপগঞ্জ	rupganjup.narayanganj.gov.bd	331
2975	Kayetpara	কায়েতপাড়া	kayetparaup.narayanganj.gov.bd	331
2976	Bholobo	ভোলাব	bholoboup.narayanganj.gov.bd	331
2977	Pirojpur	পিরোজপুর	pirojpurup.narayanganj.gov.bd	332
2978	Shambhupura	শম্ভুপুরা	shambhupura.narayanganj.gov.bd	332
2980	Baidyerbazar	বৈদ্যেরবাজার	baidyerbazar.narayanganj.gov.bd	332
2981	Baradi	বারদী	baradiup.narayanganj.gov.bd	332
2982	Noagaon	নোয়াগাঁও	noagaonup.narayanganj.gov.bd	332
2983	Jampur	জামপুর	jampurup.narayanganj.gov.bd	332
2984	Sadipur	সাদীপুর	sadipurup.narayanganj.gov.bd	332
2985	Sonmandi	সনমান্দি	sonmandiup.narayanganj.gov.bd	332
2986	Kanchpur	কাচপুর	kanchpurup.narayanganj.gov.bd	332
2987	Basail	বাসাইল	basailup.tangail.gov.bd	333
2988	Kanchanpur	কাঞ্চনপুর	kanchanpurup.tangail.gov.bd	333
2989	Habla	হাবলা	hablaup.tangail.gov.bd	333
2990	Kashil	কাশিল	kashilup.tangail.gov.bd	333
2991	Fulki	ফুলকি	fulkiup.tangail.gov.bd	333
2992	Kauljani	কাউলজানী	kauljaniup.tangail.gov.bd	333
2993	Arjuna	অর্জুনা	arjunaup.tangail.gov.bd	334
2994	Gabshara	গাবসারা	gabsharaup.tangail.gov.bd	334
2995	Falda	ফলদা	faldaup.tangail.gov.bd	334
2996	Gobindashi	গোবিন্দাসী	gobindashiup.tangail.gov.bd	334
2997	Aloa	আলোয়া	aloaup.tangail.gov.bd	334
2998	Nikrail	নিকরাইল	nikrailup.tangail.gov.bd	334
2999	Deuli	দেউলী	deuliup.tangail.gov.bd	335
3000	Lauhati	লাউহাটি	lauhatiup.tangail.gov.bd	335
3001	Patharail	পাথরাইল	patharailup.tangail.gov.bd	335
3002	Delduar	দেলদুয়ার	delduarup.tangail.gov.bd	335
3003	Fazilhati	ফাজিলহাটি	fazilhatiup.tangail.gov.bd	335
3004	Elasin	এলাসিন	elasinup.tangail.gov.bd	335
3005	Atia	আটিয়া	atiaup.tangail.gov.bd	335
3006	Dubail	ডুবাইল	dubailup.tangail.gov.bd	335
3007	Deulabari	দেউলাবাড়ী	deulabariup.tangail.gov.bd	336
3008	Ghatail	ঘাটাইল	ghatailup.tangail.gov.bd	336
3009	Jamuria	জামুরিয়া	jamuriaup.tangail.gov.bd	336
3010	Lokerpara	লোকেরপাড়া	lokerparaup.tangail.gov.bd	336
3011	Anehola	আনেহলা	aneholaup.tangail.gov.bd	336
3012	Dighalkandia	দিঘলকান্দি	dighalkandiaup.tangail.gov.bd	336
3013	Digar	দিগড়	digarup.tangail.gov.bd	336
3014	Deopara	দেওপাড়া	deoparaup.tangail.gov.bd	336
3015	Sandhanpur	সন্ধানপুর	sandhanpurup.tangail.gov.bd	336
3016	Rasulpur	রসুলপুর	rasulpurup.tangail.gov.bd	336
3017	Dhalapara	ধলাপাড়া	dhalaparaup.tangail.gov.bd	336
3018	Hadera	হাদিরা	haderaup.tangail.gov.bd	337
3019	Jhawail	ঝাওয়াইল	jhawailup.tangail.gov.bd	337
3020	Nagdashimla	নগদাশিমলা	nagdashimlaup.tangail.gov.bd	337
3021	Dhopakandi	ধোপাকান্দি	dhopakandiup.tangail.gov.bd	337
3022	Alamnagor	আলমনগর	alamnagorup.tangail.gov.bd	337
3023	Hemnagor	হেমনগর	hemnagorup.tangail.gov.bd	337
3024	Mirzapur	মির্জাপুর	mirzapurup.tangail.gov.bd	337
3025	Alokdia	আলোকদিয়া	alokdiaup.tangail.gov.bd	338
3026	Aushnara	আউশনারা	aushnaraup.tangail.gov.bd	338
3027	Aronkhola	অরণখোলা	aronkholaup.tangail.gov.bd	338
3028	Sholakuri	শোলাকুড়ি	sholakuriup.tangail.gov.bd	338
3029	Golabari	গোলাবাড়ী	golabariup.tangail.gov.bd	338
3030	Mirjabari	মির্জাবাড়ী	mirjabariup.tangail.gov.bd	338
3031	Mahera	মহেড়া	maheraup.tangail.gov.bd	339
3032	Jamurki	জামুর্কী	jamurkiup.tangail.gov.bd	339
3033	Fatepur	ফতেপুর	fatepurup.tangail.gov.bd	339
3034	Banail	বানাইল	banailup.tangail.gov.bd	339
3035	Anaitara	আনাইতারা	anaitaraup.tangail.gov.bd	339
3036	Warshi	ওয়ার্শী	warshiup.tangail.gov.bd	339
3037	Bhatram	ভাতগ্রাম	bhatramup.tangail.gov.bd	339
3038	Bahuria	বহুরিয়া	bahuriaup.tangail.gov.bd	339
3039	Gorai	গোড়াই	goraiup.tangail.gov.bd	339
3040	Ajgana	আজগানা	ajganaup.tangail.gov.bd	339
3041	Tarafpur	তরফপুর	tarafpurup.tangail.gov.bd	339
3042	Bastail	বাঁশতৈল	bastailup.tangail.gov.bd	339
3043	Baora	ভাওড়া	baoraup.tangail.gov.bd	339
3370	Medinimandal	মেদিনীমন্ডল	medinimandalup.munshiganj.gov.bd	373
3371	Kumarbhog	কুমারভোগ	kumarbhogup.munshiganj.gov.bd	373
3372	Haldia	হলদিয়া	haldiaup.munshiganj.gov.bd	373
3373	Kanaksar	কনকসার	kanaksarup.munshiganj.gov.bd	373
3454	Jhaoudi	ঝাউদী	jhaoudiup.madaripur.gov.bd	381
3046	Sahabathpur	সহবতপুর	sahabathpurup.tangail.gov.bd	340
3047	Goyhata	গয়হাটা	goyhataup.tangail.gov.bd	340
3048	Solimabad	সলিমাবাদ	solimabadup.tangail.gov.bd	340
3050	Mamudnagor	মামুদনগর	mamudnagorup.tangail.gov.bd	340
3051	Mokna	মোকনা	moknaup.tangail.gov.bd	340
3052	Pakutia	পাকুটিয়া	pakutiaup.tangail.gov.bd	340
3053	Bekrah Atgram	বেকরা আটগ্রাম	bekrahatgramup.tangail.gov.bd	340
3054	Dhuburia	ধুবড়িয়া	dhuburiaup.tangail.gov.bd	340
3055	Bhadra	ভাদ্রা	bhadraup.tangail.gov.bd	340
3056	Doptior	দপ্তিয়র	doptiorup.tangail.gov.bd	340
3057	Kakrajan	কাকড়াজান	kakrajanup.tangail.gov.bd	341
3058	Gajaria	গজারিয়া	gajariaup.tangail.gov.bd	341
3059	Jaduppur	যাদবপুর	jaduppurup.tangail.gov.bd	341
3060	Hatibandha	হাতীবান্ধা	hatibandhaup.tangail.gov.bd	341
3061	Kalia	কালিয়া	kaliaup.tangail.gov.bd	341
3062	Dariapur	দরিয়াপুর	dariapurup.tangail.gov.bd	341
3063	Kalmegha	কালমেঘা	kalmeghaup.tangail.gov.bd	341
3064	Baharatoil	বহেড়াতৈল	baharatoilup.tangail.gov.bd	341
3065	Mogra	মগড়া	mograup.tangail.gov.bd	342
3066	Gala	গালা	galaup.tangail.gov.bd	342
3067	Gharinda	ঘারিন্দা	gharindaup.tangail.gov.bd	342
3068	Karatia	করটিয়া	karatiaup.tangail.gov.bd	342
3069	Silimpur	ছিলিমপুর	silimpurup.tangail.gov.bd	342
3070	Porabari	পোড়াবাড়ী	porabariup.tangail.gov.bd	342
3071	Dyenna	দাইন্যা	dyennaup.tangail.gov.bd	342
3072	Baghil	বাঘিল	baghilup.tangail.gov.bd	342
3073	Kakua	কাকুয়া	kakuaup.tangail.gov.bd	342
3074	Hugra	হুগড়া	hugraup.tangail.gov.bd	342
3075	Katuli	কাতুলী	katuliup.tangail.gov.bd	342
3076	Mahamudnagar	মাহমুদনগর	mahamudnagarup.tangail.gov.bd	342
3077	Durgapur	দুর্গাপুর	durgapurup.tangail.gov.bd	343
3078	Birbashinda	বীরবাসিন্দা	birbashindaup.tangail.gov.bd	343
3079	Narandia	নারান্দিয়া	narandiaup.tangail.gov.bd	343
3080	Shahadebpur	সহদেবপুর	shahadebpurup.tangail.gov.bd	343
3081	Kokdahara	কোকডহরা	kokdaharaup.tangail.gov.bd	343
3082	Balla	বল্লা	ballaup.tangail.gov.bd	343
3083	Salla	সল্লা	sallaup.tangail.gov.bd	343
3084	Nagbari	নাগবাড়ী	nagbariup.tangail.gov.bd	343
3085	Bangra	বাংড়া	bangraup.tangail.gov.bd	343
3086	Paikora	পাইকড়া	paikoraup.tangail.gov.bd	343
3087	Dashokia	দশকিয়া	dashokiaup.tangail.gov.bd	343
3374	Lohajang-Teotia	লৌহজং-তেওটিয়া	lohajangteotiaup.munshiganj.gov.bd	373
531	Gandharbapur (North)	গন্ধর্ব্যপুর (উত্তর)	gandharbapurnorthup.chandpur.gov.bd	57
680	Rahmatpur	রহমতপুর	rahmatpurup.chittagong.gov.bd	69
689	Maitbhanga	মাইটভাঙ্গা	maitbhangaup.chittagong.gov.bd	69
709	Pashchim Gamdandi	পশ্চিম গোমদন্ডী	pashchimgamdandiup.chittagong.gov.bd	71
717	Ahla Karaldenga	আহল্লা করলডেঙ্গা	ahlakaraldengaup.chittagong.gov.bd	71
1443	Dhamoirhat	ধামইরহাট	1nodhamoirhatup.naogaon.gov.bd	163
1673	Dakshin Sreepur	দক্ষিণ শ্রীপুর	dakshinsreepurup.satkhira.gov.bd	185
1691	Tentulbaria	তেঁতুলবাড়ীয়া	tentulbaria.meherpur.gov.bd	188
2006	Badhal	বাধাল	badhalup.bagerhat.gov.bd	221
2063	Simla-Rokonpur	শিমলা-রোকনপুর	simlarokonpurup.jhenaidah.gov.bd	227
2084	Natima	নাটিমা	natimaup.jhenaidah.gov.bd	229
2104	Siddhakati	সিদ্ধকাঠী	siddhakatiup.jhalakathi.gov.bd	232
2150	Bashbaria	বাঁশবাড়ীয়া	bashbariaup.patuakhali.gov.bd	237
2169	Mirzaganj	মির্জাগঞ্জ	mirzaganjup.patuakhali.gov.bd	239
2172	Kakrabunia	কাকড়াবুনিয়া	kakrabuniaup.patuakhali.gov.bd	239
2235	Atghorkuriana	আটঘর কুড়িয়ানা	atghorkurianaup.pirojpur.gov.bd	248
2242	Shorupkathi	স্বরুপকাঠী	shorupkathiup.pirojpur.gov.bd	248
2269	Deherhoti	দেহেরগতি	deherhotiup.barisal.gov.bd	251
2271	Rahamtpur	রহমতপুর	rahamtpurup.barisal.gov.bd	251
2346	Osmangonj	ওসমানগঞ্জ	osmangonjup.bhola.gov.bd	261
2353	Awajpur	আওয়াজপুর	awajpurup.bhola.gov.bd	261
2424	Charduany	চরদুয়ানী	charduanyup.barguna.gov.bd	270
2433	Nishanbaria	নিশানবাড়ীয়া	nishanbariaup.barguna.gov.bd	271
2445	Dewanbazar	দেওয়ান বাজার	dewanbazarup.sylhet.gov.bd	272
2485	Uttar Badepasha	উত্তর বাদেপাশা	uttarbadepashaup.sylhet.gov.bd	277
3045	Bharra	ভারড়া	bharraup.tangail.gov.bd	340
3375	Bejgaon	বেজগাঁও	bejgaonup.munshiganj.gov.bd	373
3376	Baultoli	বৌলতলী	baultoliup.munshiganj.gov.bd	373
3377	Khidirpara	খিদিরপাড়া	khidirparaup.munshiganj.gov.bd	373
3378	Gaodia	গাওদিয়া	gaodiaup.munshiganj.gov.bd	373
3379	Kalma	কলমা	kalmaup.munshiganj.gov.bd	373
3380	Gajaria	গজারিয়া	gajariaup.munshiganj.gov.bd	374
2505	Lakshiprashad Purbo	লক্ষীপ্রাসাদ পূর্ব	lakshiprashadpurboup.sylhet.gov.bd	280
2511	Dakhin Banigram	দক্ষিন বানিগ্রাম	dakhinbanigramup.sylhet.gov.bd	280
2545	Dakkhin Shahbajpur	দক্ষিণ শাহবাজপুর	shahbajpurdakshinup.moulvibazar.gov.bd	285
2578	Akhailkura	আখাইলকুড়া	akhailkuraup.moulvibazar.gov.bd	288
2585	Fotepur	ফতেপুর	fotepurup.moulvibazar.gov.bd	289
2591	Kamarchak	কামারচাক	kamarchakup.moulvibazar.gov.bd	289
2608	Barabhakoir Paschim	বড় ভাকৈর (পশ্চিম)	barabhakoirpaschimup.habiganj.gov.bd	292
2621	Snanghat	স্নানঘাট	snanghatup.habiganj.gov.bd	293
2656	Deorgach	দেওরগাছ	deorgachup.habiganj.gov.bd	297
2732	Pandargaon	পান্ডারগাঁও	pandargaonup.sunamganj.gov.bd	305
2739	Bordal South	বড়দল দক্ষিণ	bordalsouthup.sunamganj.gov.bd	306
2752	Sukhair Rajapur North	সুখাইড় রাজাপুর উত্তর	sukhairrajapurnorthup.sunamganj.gov.bd	307
2758	Jamalganj Sadar	জামালগঞ্জ সদর	jamalganjsadarup.sunamganj.gov.bd	308
2766	Charnarchar	চরনারচর	charnarcharup.sunamganj.gov.bd	310
2787	Khidirpur	খিদিরপুর	khidirpurup.narsingdi.gov.bd	312
2812	Alipura	অলিপুরা	alipuraup.narsingdi.gov.bd	315
2819	Charsubuddi	চরসুবুদ্দি	charsubuddiup.narsingdi.gov.bd	315
2888	Domshar	ডোমসার	domsharup.shariatpur.gov.bd	322
2902	Rajnagar	রাজনগর	rajnagarup.shariatpur.gov.bd	323
2919	Barogopalpur	বড়গোপালপুর	barogopalpurup.shariatpur.gov.bd	324
2937	North Tarabunia	উত্তর তারাবুনিয়া	northtarabuniaup.shariatpur.gov.bd	326
2951	Brahammandi	ব্রা‏হ্মন্দী	brahammandiup.narayanganj.gov.bd	328
2967	Gognagar	গোগনগর	gognagarup.narayanganj.gov.bd	330
2979	Mograpara	মোগরাপাড়া	mograpara.narayanganj.gov.bd	332
3044	Latifpur	লতিফপুর	latifpurup.tangail.gov.bd	339
3049	Nagorpur	নাগরপুর	nagorpurup.tangail.gov.bd	340
3088	Parkhi	পারখী	parkhiup.tangail.gov.bd	343
3089	Gohaliabari	গোহালিয়াবাড়ী	gohaliabariup.tangail.gov.bd	343
3090	Dhopakhali	ধোপাখালী	dhopakhaliup.tangail.gov.bd	344
3091	Paiska	পাইস্কা	paiskaup.tangail.gov.bd	344
3092	Mushuddi	মুশুদ্দি	mushuddiup.tangail.gov.bd	344
3093	Bolibodrow	বলিভদ্র	bolibodrowup.tangail.gov.bd	344
3094	Birtara	বীরতারা	birtaraup.tangail.gov.bd	344
3095	Baniajan	বানিয়াজান	baniajanup.tangail.gov.bd	344
3096	Jadunathpur	যদুনাথপুর	jadunathpurup.tangail.gov.bd	344
3097	Chawganga	চৌগাংগা	chawgangaup.kishoreganj.gov.bd      	345
3098	Joysiddi	জয়সিদ্ধি	joysiddiup.kishoreganj.gov.bd	345
3099	Alonjori	এলংজুরী	alonjoriup.kishoreganj.gov.bd	345
3100	Badla	বাদলা	badlaup.kishoreganj.gov.bd	345
3101	Boribari	বড়িবাড়ি	boribariup.kishoreganj.gov.bd	345
3102	Itna	ইটনা	itnaup.kishoreganj.gov.bd	345
3103	Mriga	মৃগা	mrigaup.kishoreganj.gov.bd	345
3104	Dhonpur	ধনপুর	dhonpurup.kishoreganj.gov.bd	345
3105	Raytoti	রায়টুটি	raytotiup.kishoreganj.gov.bd	345
3106	Banagram	বনগ্রাম	banagramup.kishoreganj.gov.bd	346
3107	Shahasram Dhuldia	সহশ্রাম ধুলদিয়া	shahasramdhuldiaup.kishoreganj.gov.bd	346
3108	Kargaon	কারগাঁও	kargaonup.kishoreganj.gov.bd	346
3109	Chandpur	চান্দপুর	chandpurup.kishoreganj.gov.bd	346
3110	Mumurdia	মুমুরদিয়া	mumurdiaup.kishoreganj.gov.bd	346
3111	Acmita	আচমিতা	acmitaup.kishoreganj.gov.bd	346
3112	Mosua	মসূয়া	mosuaup.kishoreganj.gov.bd	346
3113	Lohajuree	লোহাজুরী	lohajureeup.kishoreganj.gov.bd	346
3114	Jalalpur	জালালপুর	jalalpurup.kishoreganj.gov.bd	346
3115	Sadekpur	সাদেকপুর	sadekpurup.kishoreganj.gov.bd	347
3116	Aganagar	আগানগর	aganagarup.kishoreganj.gov.bd	347
3117	Shimulkandi	শিমুলকান্দি	shimulkandiup.kishoreganj.gov.bd	347
3118	Gajaria	গজারিয়া	gajariaup.kishoreganj.gov.bd	347
3120	Sreenagar	শ্রীনগর	sreenagarup.kishoreganj.gov.bd	347
3121	Shibpur	শিবপুর	shibpurup.kishoreganj.gov.bd	347
3122	Taljanga	তালজাঙ্গা	taljangaup.kishoreganj.gov.bd	348
3123	Rauti	রাউতি	rautiup.kishoreganj.gov.bd	348
3124	Dhola	ধলা	dholaup.kishoreganj.gov.bd	348
3125	Jawar	জাওয়ার	jawarup.kishoreganj.gov.bd	348
3126	Damiha	দামিহা	damihaup.kishoreganj.gov.bd	348
3127	Digdair	দিগদাইর	digdairup.kishoreganj.gov.bd	348
3128	Tarail-Sachail	তাড়াইল-সাচাইল	tarailsachailup.kishoreganj.gov.bd	348
3129	Jinari	জিনারী	jinariup.kishoreganj.gov.bd	349
3130	Gobindapur	গোবিন্দপুর	gobindapurup.kishoreganj.gov.bd	349
3131	Sidhla	সিদলা	sidhlaup.kishoreganj.gov.bd	349
3132	Araibaria	আড়াইবাড়িয়া	araibariaup.kishoreganj.gov.bd	349
3133	Sahedal	সাহেদল	sahedalup.kishoreganj.gov.bd	349
3134	Pumdi	পুমদি	pumdiup.kishoreganj.gov.bd	349
3135	Jangalia	জাঙ্গালিয়া	jangaliaup.kishoreganj.gov.bd	350
3137	Narandi	নারান্দি	narandiup.kishoreganj.gov.bd	350
3138	Shukhia	সুখিয়া	shukhiaup.kishoreganj.gov.bd	350
3139	Patuavabga	পটুয়াভাঙ্গা	patuavabgaup.kishoreganj.gov.bd	350
3140	Chandipasha	চান্দিপাশা	chandipashaup.kishoreganj.gov.bd	350
3141	Charfaradi	চারফারাদি	charfaradiup.kishoreganj.gov.bd	350
3142	Burudia	বুড়ুদিয়া	burudiaup.kishoreganj.gov.bd	350
3144	Pakundia	পাকন্দিয়া	pakundiaup.kishoreganj.gov.bd	350
3145	Ramdi	রামদী	ramdiup.kishoreganj.gov.bd	351
3146	Osmanpur	উছমানপুর	osmanpurup.kishoreganj.gov.bd	351
3147	Chhaysuti	ছয়সূতী	chhaysutiup.kishoreganj.gov.bd	351
3148	Salua	সালুয়া	saluaup.kishoreganj.gov.bd	351
3149	Gobaria Abdullahpur	গোবরিয়া আব্দুল্লাহপুর	gobariaabdullahpurup.kishoreganj.gov.bd	351
3150	Faridpur	ফরিদপুর	faridpurup.kishoreganj.gov.bd	351
3151	Rashidabad	রশিদাবাদ	rashidabadup.kishoreganj.gov.bd	352
3152	Latibabad	লতিবাবাদ	latibabadup.kishoreganj.gov.bd	352
3153	Maizkhapan	মাইজখাপন	maizkhapanup.kishoreganj.gov.bd	352
3154	Mohinanda	মহিনন্দ	mohinandaup.kishoreganj.gov.bd	352
3155	Joshodal	যশোদল	joshodalup.kishoreganj.gov.bd	352
3156	Bowlai	বৌলাই	bowlaiup.kishoreganj.gov.bd	352
3157	Binnati	বিন্নাটি	binnatiup.kishoreganj.gov.bd	352
3158	Maria	মারিয়া	mariaup.kishoreganj.gov.bd	352
3159	Chowddoshata	চৌদ্দশত	chowddoshataup.kishoreganj.gov.bd	352
3160	Karshakarial	কর্শাকড়িয়াইল	karshakarialup.kishoreganj.gov.bd	352
3161	Danapatuli	দানাপাটুলী	danapatuliup.kishoreganj.gov.bd	352
3162	Kadirjangal	কাদিরজঙ্গল	kadirjangalup.kishoreganj.gov.bd	353
3163	Gujadia	গুজাদিয়া	gujadiaup.kishoreganj.gov.bd	353
3164	Kiraton	কিরাটন	kiratonup.kishoreganj.gov.bd	353
3165	Barogharia	বারঘড়িয়া	baroghariaup.kishoreganj.gov.bd	353
3166	Niamatpur	নিয়ামতপুর	niamatpurup.kishoreganj.gov.bd	353
3167	Dehunda	দেহুন্দা	dehundaup.kishoreganj.gov.bd	353
3168	Sutarpara	সুতারপাড়া	sutarparaup.kishoreganj.gov.bd	353
3169	Gunodhar	গুনধর	gunodharup.kishoreganj.gov.bd	353
3170	Joyka	জয়কা	joykaup.kishoreganj.gov.bd	353
3171	Zafrabad	জাফরাবাদ	zafrabadup.kishoreganj.gov.bd	353
3172	Noabad	নোয়াবাদ	noabadup.kishoreganj.gov.bd	353
3173	Kailag	কৈলাগ	kailagup.kishoreganj.gov.bd	354
3174	Pirijpur	পিরিজপুর	pirijpurup.kishoreganj.gov.bd	354
3175	Gazirchar	গাজীরচর	gazircharup.kishoreganj.gov.bd	354
3176	Hilochia	হিলচিয়া	hilochiaup.kishoreganj.gov.bd	354
3178	Homypur	হুমাইপর	homypurup.kishoreganj.gov.bd	354
3179	Halimpur	হালিমপুর	halimpurup.kishoreganj.gov.bd	354
3180	Sararchar	সরারচর	sararcharup.kishoreganj.gov.bd	354
3181	Dilalpur	দিলালপুর	dilalpurup.kishoreganj.gov.bd	354
3182	Dighirpar	দিঘীরপাড়	dighirparup.kishoreganj.gov.bd	354
3183	Boliardi	বলিয়ার্দী	boliardiup.kishoreganj.gov.bd	354
3184	Dewghar	দেওঘর	dewgharup.kishoreganj.gov.bd	355
3185	Kastul	কাস্তুল	kastulup.kishoreganj.gov.bd	355
3186	Austagram Sadar	অষ্টগ্রাম সদর	austagramsadarup.kishoreganj.gov.bd	355
3187	Bangalpara	বাঙ্গালপাড়া	bangalparaup.kishoreganj.gov.bd	355
3188	Kalma	কলমা	kalmaup.kishoreganj.gov.bd	355
3189	Adampur	আদমপুর	adampurup.kishoreganj.gov.bd	355
3191	Purba Austagram	পূর্ব অষ্টগ্রাম	purbaaustagramup.kishoreganj.gov.bd	355
3192	Gopdighi	গোপদিঘী	gopdighiup.kishoreganj.gov.bd	356
3193	Mithamoin	মিঠামইন	mithamoinup.kishoreganj.gov.bd	356
3194	Dhaki	ঢাকী	dhakiup.kishoreganj.gov.bd	356
3195	Ghagra	ঘাগড়া	ghagraup.kishoreganj.gov.bd	356
3196	Keoarjore	কেওয়ারজোর	keoarjoreup.kishoreganj.gov.bd	356
3197	Katkhal	কাটখাল	katkhalup.kishoreganj.gov.bd	356
3198	Bairati	বৈরাটি	bairatiup.kishoreganj.gov.bd	356
3199	Chatirchar	ছাতিরচর	chatircharup.kishoreganj.gov.bd	357
3200	Guroi	গুরই	guroiup.kishoreganj.gov.bd	357
3201	Jaraitala	জারইতলা	jaraitalaup.kishoreganj.gov.bd	357
3202	Nikli Sadar	নিকলী সদর	niklisadarup.kishoreganj.gov.bd	357
3203	Karpasa	কারপাশা	karpasaup.kishoreganj.gov.bd	357
3204	Dampara	দামপাড়া	damparaup.kishoreganj.gov.bd	357
3205	Singpur	সিংপুর	singpurup.kishoreganj.gov.bd	357
3206	Balla	বাল্লা	ballaup.manikganj.gov.bd	358
3207	Gala	গালা	galaup.manikganj.gov.bd	358
3208	Chala	চালা	chalaup.manikganj.gov.bd	358
3209	Blara	বলড়া	blaraup.manikganj.gov.bd	358
3210	Harukandi	হারুকান্দি	harukandiup.manikganj.gov.bd	358
3211	Baira	বয়রা	bairaup.manikganj.gov.bd	358
3212	Ramkrishnapur	রামকৃঞ্চপুর	ramkrishnapurup.manikganj.gov.bd	358
3213	Gopinathpur	গোপীনাথপুর	gopinathpurup.manikganj.gov.bd	358
3214	Kanchanpur	কাঞ্চনপুর	kanchanpurup.manikganj.gov.bd	358
3216	Sutalorie	সুতালড়ী	sutalorieup.manikganj.gov.bd	358
3217	Dhulsura	ধূলশুড়া	dhulsuraup.manikganj.gov.bd	358
3218	Azimnagar	আজিমনগর	azimnagarup.manikganj.gov.bd	358
3219	Baried	বরাইদ	bariedup.manikganj.gov.bd	359
3220	Dighulia	দিঘুলিয়া	dighuliaup.manikganj.gov.bd	359
3222	Dargram	দড়গ্রাম	dargramup.manikganj.gov.bd	359
3223	Tilli	তিল্লী	tilliup.manikganj.gov.bd	359
3224	Hargaj	হরগজ	hargajup.manikganj.gov.bd	359
3225	Saturia	সাটুরিয়া	saturiaup.manikganj.gov.bd	359
3226	Dhankora	ধানকোড়া	dhankoraup.manikganj.gov.bd	359
3227	Fukurhati	ফুকুরহাটি	fukurhatiup.manikganj.gov.bd	359
3228	Betila-Mitara	বেতিলা-মিতরা	betilamitaraup.manikganj.gov.bd	360
3229	Jagir	জাগীর	jagirup.manikganj.gov.bd	360
3230	Atigram	আটিগ্রাম	atigramup.manikganj.gov.bd	360
3231	Dighi	দিঘী	dighiup.manikganj.gov.bd	360
3232	Putile	পুটাইল	putileup.manikganj.gov.bd	360
3233	Hatipara	হাটিপাড়া	hatiparaup.manikganj.gov.bd	360
3234	Vararia	ভাড়ারিয়া	varariaup.manikganj.gov.bd	360
3235	Nbogram	নবগ্রাম	nbogramup.manikganj.gov.bd	360
3236	Garpara	গড়পাড়া	garparaup.manikganj.gov.bd	360
3237	Krishnapur	কৃঞ্চপুর	krishnapurup.manikganj.gov.bd	360
3238	Paila	পয়লা	pailaup.manikganj.gov.bd	361
3239	Shingzuri	সিংজুড়ী	shingzuriup.manikganj.gov.bd	361
3240	Baliyakhora	বালিয়াখোড়া	baliyakhoraup.manikganj.gov.bd	361
3241	Gior	ঘিওর	giorup.manikganj.gov.bd	361
3242	Bartia	বড়টিয়া	bartiaup.manikganj.gov.bd	361
3243	Baniazuri	বানিয়াজুড়ী	baniazuriup.manikganj.gov.bd	361
3244	Nalee	নালী	naleeup.manikganj.gov.bd	361
3245	Teota	তেওতা	teotaup.manikganj.gov.bd	362
3246	Utholi	উথলী	utholiup.manikganj.gov.bd	362
3247	Shibaloy	শিবালয়	shibaloyup.manikganj.gov.bd	362
3249	Aruoa	আরুয়া	aruoaup.manikganj.gov.bd	362
3250	Mohadebpur	মহাদেবপুর	mohadebpurup.manikganj.gov.bd	362
3251	Shimulia	শিমুলিয়া	shimuliaup.manikganj.gov.bd	362
3252	Charkataree	চরকাটারী	charkatareeup.manikganj.gov.bd	363
3253	Bachamara	বাচামারা	bachamaraup.manikganj.gov.bd	363
3254	Baghutia	বাঘুটিয়া	baghutiaup.manikganj.gov.bd	363
3255	Zionpur	জিয়নপুর	zionpurup.manikganj.gov.bd	363
3256	Khalshi	খলশী	khalshiup.manikganj.gov.bd	363
3257	Chakmirpur	চকমিরপুর	chakmirpurup.manikganj.gov.bd	363
3258	Klia	কলিয়া	kliaup.manikganj.gov.bd	363
3259	Dhamswar	ধামশ্বর	dhamswarup.manikganj.gov.bd	363
3260	Buyra	বায়রা	buyraup.manikganj.gov.bd	364
3261	Talebpur	তালেবপুর	talebpurup.manikganj.gov.bd	364
3262	Singiar	সিংগাইর	singiarup.manikganj.gov.bd	364
3263	Baldhara	বলধারা	baldharaup.manikganj.gov.bd	364
3264	Zamsha	জামশা	zamshaup.manikganj.gov.bd	364
3265	Charigram	চারিগ্রাম	charigramup.manikganj.gov.bd	364
3266	Shayesta	শায়েস্তা	shayestaup.manikganj.gov.bd	364
3267	Joymonto	জয়মন্টপ	joymontopup.manikganj.gov.bd	364
3268	Dhalla	ধল্লা	dhallaup.manikganj.gov.bd	364
3270	Chandhar	চান্দহর	chandharup.manikganj.gov.bd	364
3271	Savar	সাভার	savarup.dhaka.gov.bd	365
3272	Birulia	বিরুলিয়া	birulia.dhaka.gov.bd	365
3273	Dhamsona	ধামসোনা	dhamsonaup.dhaka.gov.bd	365
3274	Shimulia	শিমুলিয়া	shimuliaup.dhaka.gov.bd	365
3275	Ashulia	আশুলিয়া	ashuliaup.dhaka.gov.bd	365
3276	Yearpur	ইয়ারপুর	yearpurup.dhaka.gov.bd	365
3277	Vakurta	ভাকুর্তা	vakurtaup.dhaka.gov.bd	365
3278	Pathalia	পাথালিয়া	pathaliaup.dhaka.gov.bd	365
3279	Bongaon	বনগাঁও	bongaonup.dhaka.gov.bd	365
3280	Kaundia	কাউন্দিয়া	kaundiaup.dhaka.gov.bd	365
3281	Tetuljhora	তেঁতুলঝোড়া	tetuljhora.dhaka.gov.bd	365
3282	Aminbazar	আমিনবাজার	aminbazar.dhaka.gov.bd	365
3283	Chauhat	চৌহাট	chauhatup.dhaka.gov.bd	366
3284	Amta	আমতা	amtaup.dhaka.gov.bd	366
3285	Balia	বালিয়া	baliaup.dhaka.gov.bd	366
3286	Jadabpur	যাদবপুর	jadabpurup.dhaka.gov.bd	366
3287	Baisakanda	বাইশাকান্দা	baisakandaup.dhaka.gov.bd	366
3288	Kushura	কুশুরা	kushuraup.dhaka.gov.bd	366
3289	Gangutia	গাংগুটিয়া	gangutiaup.dhaka.gov.bd	366
3290	Sanora	সানোড়া	sanoraup.dhaka.gov.bd	366
3291	Sutipara	সূতিপাড়া	sutiparaup.dhaka.gov.bd	366
3292	Sombhag	সোমভাগ	sombhagup.dhaka.gov.bd	366
3293	Vararia	ভাড়ারিয়া	varariaup.dhaka.gov.bd	366
3294	Dhamrai	ধামরাই	dhamraiup.dhaka.gov.bd	366
3295	Kulla	কুল্লা	kullaup.dhaka.gov.bd	366
3297	Suapur	সুয়াপুর	suapurup.dhaka.gov.bd	366
3298	Nannar	নান্নার	nannarup.dhaka.gov.bd	366
3299	Hazratpur	হযরতপুর	hazratpurup.dhaka.gov.bd	367
3301	Taranagar	তারানগর	taranagarup.dhaka.gov.bd	367
3302	Sakta	শাক্তা	saktaup.dhaka.gov.bd	367
3303	Ruhitpur	রোহিতপুর	ruhitpurup.dhaka.gov.bd	367
3304	Basta	বাস্তা	bastaup.dhaka.gov.bd	367
3305	Kalindi	কালিন্দি	kalindiup.dhaka.gov.bd	367
3306	Zinzira	জিনজিরা	zinziraup.dhaka.gov.bd	367
3381	Baushia	বাউশিয়া	baushiaup.munshiganj.gov.bd	374
3382	Vaberchar	ভবেরচর	vabercharup.munshiganj.gov.bd	374
3383	Baluakandi	বালুয়াকান্দী	baluakandiup.munshiganj.gov.bd	374
3384	Tengarchar	টেংগারচর	tengarcharup.munshiganj.gov.bd	374
3385	Hosendee	হোসেন্দী	hosendeeup.munshiganj.gov.bd	374
3386	Guagachia	গুয়াগাছিয়া	guagachiaup.munshiganj.gov.bd	374
3387	Imampur	ইমামপুর	imampurup.munshiganj.gov.bd	374
3388	Betka	বেতকা	betkaup.munshiganj.gov.bd	375
3390	Sonarong Tongibari	সোনারং টংগীবাড়ী	sonarongtongibariup.munshiganj.gov.bd	375
3391	Autshahi	আউটশাহী	autshahiup.munshiganj.gov.bd	375
3392	Arial Baligaon	আড়িয়ল বালিগাঁও	arialbaligaonup.munshiganj.gov.bd	375
3393	Dhipur	ধীপুর	dhipurup.munshiganj.gov.bd	375
3394	Kathadia Shimolia	কাঠাদিয়া শিমুলিয়া	kathadiashimoliaup.munshiganj.gov.bd	375
3395	Joslong	যশলং	joslongup.munshiganj.gov.bd	375
3396	Panchgaon	পাঁচগাও	panchgaonup.munshiganj.gov.bd	375
3397	Kamarkhara	কামারখাড়া	kamarkharaup.munshiganj.gov.bd	375
3398	Hasailbanari	হাসাইল বানারী	hasailbanariup.munshiganj.gov.bd	375
3399	Dighirpar	দিঘীরপাড়	dighirparup.munshiganj.gov.bd	375
3400	Mijanpur	মিজানপুর	mijanpurup.rajbari.gov.bd	376
3401	Borat	বরাট	boratup.rajbari.gov.bd	376
3402	Chandoni	চন্দনী	chandoniup.rajbari.gov.bd	376
3403	Khangonj	খানগঞ্জ	khangonjup.rajbari.gov.bd	376
3404	Banibaha	বানীবহ	banibahaup.rajbari.gov.bd	376
3405	Dadshee	দাদশী	dadsheeup.rajbari.gov.bd	376
3406	Mulghar	মুলঘর	mulgharup.rajbari.gov.bd	376
3407	Basantapur	বসন্তপুর	basantapurup.rajbari.gov.bd	376
3408	Khankhanapur	খানখানাপুর	khankhanapurup.rajbari.gov.bd	376
3409	Alipur	আলীপুর	alipurup.rajbari.gov.bd	376
3410	Ramkantapur	রামকান্তপুর	ramkantapurup.rajbari.gov.bd	376
3411	Shahidwahabpur	শহীদওহাবপুর	shahidwahabpurup.rajbari.gov.bd	376
3412	Panchuria	পাঁচুরিয়া	panchuriaup.rajbari.gov.bd	376
3413	Sultanpur	সুলতানপুর	sultanpurup.rajbari.gov.bd	376
3414	Doulatdia	দৌলতদিয়া	doulatdiaup.rajbari.gov.bd	377
3415	Debugram	দেবগ্রাম	debugramup.rajbari.gov.bd	377
3416	Uzancar	উজানচর	uzancarup.rajbari.gov.bd	377
3417	Chotovakla	ছোটভাকলা	chotovaklaup.rajbari.gov.bd	377
3418	Bahadurpur	বাহাদুরপুর	bahadurpurup.rajbari.gov.bd	378
3419	Habashpur	হাবাসপুর	habashpurup.rajbari.gov.bd	378
3420	Jashai	যশাই	jashaiup.rajbari.gov.bd	378
3421	Babupara	বাবুপাড়া	babuparaup.rajbari.gov.bd	378
3422	Mourat	মৌরাট	mouratup.rajbari.gov.bd	378
3423	Patta	পাট্টা	pattaup.rajbari.gov.bd	378
3425	Kalimahar	কলিমহর	kalimaharup.rajbari.gov.bd	378
3426	Kasbamajhail	কসবামাজাইল	kasbamajhailup.rajbari.gov.bd	378
3427	Machhpara	মাছপাড়া	machhparaup.rajbari.gov.bd	378
3428	Islampur	ইসলামপুর	islampurup.rajbari.gov.bd	379
3429	Baharpur	বহরপুর	baharpurup.rajbari.gov.bd	379
3430	Nawabpur	নবাবপুর	nawabpurup.rajbari.gov.bd	379
3431	Narua	নারুয়া	naruaup.rajbari.gov.bd	379
3432	Baliakandi	বালিয়াকান্দি	baliakandiup.rajbari.gov.bd	379
3433	Janjal	জঙ্গল	janjalup.rajbari.gov.bd	379
3434	Jamalpur	জামালপুর	jamalpurup.rajbari.gov.bd	379
3435	Kalukhali	কালুখালী	kalukhaliup.rajbari.gov.bd	380
3436	Ratandia	রতনদিয়া	ratandiaup.rajbari.gov.bd	380
3437	Kalikapur	কালিকাপুর	kalikapurup.rajbari.gov.bd	380
3438	Boalia	বোয়ালিয়া	boaliaup.rajbari.gov.bd	380
3439	Majbari	মাজবাড়ী	majbariup.rajbari.gov.bd	380
3440	Madapur	মদাপুর	madapurup.rajbari.gov.bd	380
3441	Shawrail	সাওরাইল	shawrailup.rajbari.gov.bd	380
3442	Mrigi	মৃগী	mrigiup.rajbari.gov.bd	380
3443	Sirkhara	শিড়খাড়া	sirkharaup.madaripur.gov.bd	381
3445	Kunia	কুনিয়া	kuniaup.madaripur.gov.bd	381
3446	Peyarpur	পেয়ারপুর	peyarpurup.madaripur.gov.bd	381
3447	Kandua	কেন্দুয়া	kanduaup.madaripur.gov.bd	381
3448	Mastofapur	মস্তফাপুর	mastofapurup.madaripur.gov.bd	381
3449	Dudkhali	দুধখালী	dudkhaliup.madaripur.gov.bd	381
3450	Kalikapur	কালিকাপুর	kalikapurup.madaripur.gov.bd	381
3451	Chilarchar	ছিলারচর	chilarcharup.madaripur.gov.bd	381
3452	Panchkhola	পাঁচখোলা	panchkholaup.madaripur.gov.bd	381
3453	Ghatmajhi	ঘটমাঝি	ghatmajhiup.madaripur.gov.bd	381
3456	Rasti	রাস্তি	rastiup.madaripur.gov.bd	381
3457	Dhurail	ধুরাইল	dhurailup.madaripur.gov.bd	381
3458	Shibchar	শিবচর	shibcharup.madaripur.gov.bd	382
3459	Ditiyakhando	দ্বিতীয়খন্ড	ditiyakhandoup.madaripur.gov.bd	382
3460	Nilokhe	নিলখি	nilokheup.madaripur.gov.bd	382
3461	Bandarkhola	বন্দরখোলা	bandarkholaup.madaripur.gov.bd	382
3462	Charjanazat	চরজানাজাত	charjanazatup.madaripur.gov.bd	382
3463	Madbarerchar	মাদবরেরচর	madbarercharup.madaripur.gov.bd	382
3464	Panchar	পাঁচচর	pancharup.madaripur.gov.bd	382
3465	Sannasirchar	সন্যাসিরচর	sannasircharup.madaripur.gov.bd	382
3466	Kathalbari	কাঁঠালবাড়ী	kathalbariup.madaripur.gov.bd	382
3467	Kutubpur	কুতুবপুর	kutubpurup.madaripur.gov.bd	382
3468	Kadirpur	কাদিরপুর	kadirpurup.madaripur.gov.bd	382
4448	Danua	ধানুয়া	danuaup.jamalpur.gov.bd	481
3469	Vhandarikandi	ভান্ডারীকান্দি	vhandarikandiup.madaripur.gov.bd	382
3471	Baheratala North	বহেরাতলা উত্তর	baheratalanorthup.madaripur.gov.bd	382
3472	Baskandi	বাঁশকান্দি	baskandiup.madaripur.gov.bd	382
3473	Umedpur	উমেদপুর	umedpurup.madaripur.gov.bd	382
3474	Vhadrasion	ভদ্রাসন	vhadrasionup.madaripur.gov.bd	382
3475	Shiruail	শিরুয়াইল	shiruailup.madaripur.gov.bd	382
3476	Dattapara	দত্তপাড়া	dattaparaup.madaripur.gov.bd	382
3477	Alinagar	আলীনগর	alinagarup.madaripur.gov.bd	383
3478	Baligram	বালীগ্রাম	baligramup.madaripur.gov.bd	383
3479	Basgari	বাঁশগাড়ী	basgariup.madaripur.gov.bd	383
3480	Chardoulatkhan	চরদৌলতখান	chardoulatkhanup.madaripur.gov.bd	383
3481	Dashar	ডাসার	dasharup.madaripur.gov.bd	383
3482	Enayetnagor	এনায়েতনগর	enayetnagorup.madaripur.gov.bd	383
3483	Gopalpur	গোপালপুর	gopalpurup.madaripur.gov.bd	383
3484	Koyaria	কয়ারিয়া	koyariaup.madaripur.gov.bd	383
3485	Kazibakai	কাজীবাকাই	kazibakaiup.madaripur.gov.bd	383
3486	Laxmipur	লক্ষীপুর	laxmipurup.madaripur.gov.bd	383
3487	Nabogram	নবগ্রাম	nabogramup.madaripur.gov.bd	383
3488	Ramjanpur	রমজানপুর	ramjanpurup.madaripur.gov.bd	383
3489	Shahebrampur	সাহেবরামপুর	shahebrampurup.madaripur.gov.bd	383
3490	Shikarmongol	শিকারমঙ্গল	shikarmongolup.madaripur.gov.bd	383
3491	Haridasdi-Mahendrodi	হরিদাসদী-মহেন্দ্রদী	haridasdi-mahendrodiup.madaripur.gov.bd	384
3492	Kadambari	কদমবাড়ী	kadambariup.madaripur.gov.bd	384
3493	Bajitpur	বাজিতপুর	bajitpurup.madaripur.gov.bd	384
3494	Amgram	আমগ্রাম	amgramup.madaripur.gov.bd	384
3495	Rajoir	রাজৈর	rajoirup.madaripur.gov.bd	384
3496	Khaliya	খালিয়া	khaliyaup.madaripur.gov.bd	384
3497	Ishibpur	ইশিবপুর	ishibpurup.madaripur.gov.bd	384
3498	Badarpasa	বদরপাশা	badarpasaup.madaripur.gov.bd	384
3499	Kabirajpur	কবিরাজপুর	kabirajpurup.madaripur.gov.bd	384
3500	Hosenpur	হোসেনপুর	hosenpurup.madaripur.gov.bd	384
3501	Paikpara	পাইকপাড়া	paikparaup.madaripur.gov.bd	384
3502	Jalalabad	জালালাবাদ	jalalabadup.gopalganj.gov.bd	385
3503	Shuktail	শুকতাইল	shuktailup.gopalganj.gov.bd	385
3505	Gopinathpur	গোপীনাথপুর	gopinathpurup.gopalganj.gov.bd	385
3506	Paikkandi	পাইককান্দি	paikkandiup.gopalganj.gov.bd	385
3507	Urfi	উরফি	urfiup.gopalganj.gov.bd	385
3508	Lotifpur	লতিফপুর	lotifpurup.gopalganj.gov.bd	385
3509	Satpar	সাতপাড়	satparup.gopalganj.gov.bd	385
3510	Sahapur	সাহাপুর	sahapurup.gopalganj.gov.bd	385
3511	Horidaspur	হরিদাসপুর	horidaspurup.gopalganj.gov.bd	385
3512	Ulpur	উলপুর	ulpurup.gopalganj.gov.bd	385
3513	Nizra	নিজড়া	nizraup.gopalganj.gov.bd	385
3514	Karpara	করপাড়া	karparaup.gopalganj.gov.bd	385
3515	Durgapur	দুর্গাপুর	durgapurup.gopalganj.gov.bd	385
3516	Kajulia	কাজুলিয়া	kajuliaup.gopalganj.gov.bd	385
3517	Majhigati	মাঝিগাতী	majhigatiup.gopalganj.gov.bd	385
3518	Roghunathpur	রঘুনাথপুর	roghunathpurup.gopalganj.gov.bd	385
3519	Gobra	গোবরা	gobraup.gopalganj.gov.bd	385
3520	Borashi	বোড়াশী	borashiup.gopalganj.gov.bd	385
3521	Kati	কাঠি	katiup.gopalganj.gov.bd	385
3522	Boultali	বৌলতলী	boultaliup.gopalganj.gov.bd	385
3523	Kashiani	কাশিয়ানী	kashianiup.gopalganj.gov.bd	386
3524	Hatiara	হাতিয়াড়া	hatiaraup.gopalganj.gov.bd	386
3525	Fukura	ফুকরা	fukuraup.gopalganj.gov.bd	386
3526	Rajpat	রাজপাট	rajpatup.gopalganj.gov.bd	386
3527	Bethuri	বেথুড়ী	bethuriup.gopalganj.gov.bd	386
3528	Nijamkandi	নিজামকান্দি	nijamkandiup.gopalganj.gov.bd	386
3529	Sajail	সাজাইল	sajailup.gopalganj.gov.bd	386
3530	Mamudpur	মাহমুদপুর	mamudpurup.gopalganj.gov.bd	386
3531	Maheshpur	মহেশপুর	maheshpurup.gopalganj.gov.bd	386
3532	Orakandia	ওড়াকান্দি	orakandiaup.gopalganj.gov.bd	386
3534	Ratail	রাতইল	ratailup.gopalganj.gov.bd	386
3535	Puisur	পুইশুর	puisurup.gopalganj.gov.bd	386
3536	Singa	সিংগা	singaup.gopalganj.gov.bd	386
3537	Kushli	কুশলী	kushliup.gopalganj.gov.bd	387
3538	Gopalpur	গোপালপুর	gopalpurup.gopalganj.gov.bd	387
3539	Patgati	পাটগাতী	patgatiup.gopalganj.gov.bd	387
3540	Borni	বর্ণি	borniup.gopalganj.gov.bd	387
3541	Dumaria	ডুমরিয়া	dumariaup.gopalganj.gov.bd	387
3543	Ramshil	রামশীল	ramshilup.gopalganj.gov.bd	388
3544	Bandhabari	বান্ধাবাড়ী	bandhabariup.gopalganj.gov.bd	388
3545	Kolabari	কলাবাড়ী	kolabariup.gopalganj.gov.bd	388
3546	Kushla	কুশলা	kushlaup.gopalganj.gov.bd	388
3547	Amtoli	আমতলী	amtoliup.gopalganj.gov.bd	388
3548	Pinjuri	পিঞ্জুরী	pinjuriup.gopalganj.gov.bd	388
3549	Ghaghor	ঘাঘর	ghaghorup.gopalganj.gov.bd	388
3550	Radhaganj	রাধাগঞ্জ	radhaganjup.gopalganj.gov.bd	388
3551	Hiron	হিরণ	hironup.gopalganj.gov.bd	388
3552	Kandi	কান্দি	kandiup.gopalganj.gov.bd	388
3553	Ujani	উজানী	ujaniup.gopalganj.gov.bd	389
3554	Nanikhir	ননীক্ষীর	nanikhirup.gopalganj.gov.bd	389
3555	Dignagar	দিগনগর	dignagarup.gopalganj.gov.bd	389
3556	Poshargati	পশারগাতি	poshargatiup.gopalganj.gov.bd	389
3557	Gobindopur	গোবিন্দপুর	gobindopurup.gopalganj.gov.bd	389
3558	Khandarpara	খান্দারপাড়া	khandarparaup.gopalganj.gov.bd	389
3559	Bohugram	বহুগ্রাম	bohugramup.gopalganj.gov.bd	389
3560	Banshbaria	বাশঁবাড়িয়া	banshbariaup.gopalganj.gov.bd	389
3561	Vabrashur	ভাবড়াশুর	vabrashurup.gopalganj.gov.bd	389
3562	Moharajpur	মহারাজপুর	moharajpurup.gopalganj.gov.bd	389
3563	Batikamari	বাটিকামারী	batikamariup.gopalganj.gov.bd	389
3564	Jalirpar	জলিরপাড়	jalirparup.gopalganj.gov.bd	389
3565	Raghdi	রাঘদী	raghdiup.gopalganj.gov.bd	389
3566	Gohala	গোহালা	gohalaup.gopalganj.gov.bd	389
3567	Mochna	মোচনা	mochnaup.gopalganj.gov.bd	389
3568	Kashalia	কাশালিয়া	kashaliaup.gopalganj.gov.bd	389
3570	Charmadbdia	চরমাধবদিয়া	charmadbdiaup.faridpur.gov.bd	390
3571	Aliabad	আলিয়াবাদ	aliabadup.faridpur.gov.bd	390
3572	Uttarchannel	নর্থচ্যানেল	uttarchannelup.faridpur.gov.bd	390
3573	Decreerchar	ডিক্রিরচর	decreercharup.faridpur.gov.bd	390
3574	Majchar	মাচ্চর	majcharup.faridpur.gov.bd	390
3575	Krishnanagar	কৃষ্ণনগর	krishnanagarup.faridpur.gov.bd	390
3576	Ambikapur	অম্বিকাপুর	ambikapurup.faridpur.gov.bd	390
3577	Kanaipur	কানাইপুর	kanaipurup.faridpur.gov.bd	390
3578	Kaijuri	কৈজুরী	kaijuriup.faridpur.gov.bd	390
3579	Greda	গেরদা	gredaup.faridpur.gov.bd	390
3580	Buraich	বুড়াইচ	buraichup.faridpur.gov.bd	391
3581	Alfadanga	আলফাডাঙ্গা	alfadangaup.faridpur.gov.bd	391
3582	Tagarbanda	টগরবন্দ	tagarbandaup.faridpur.gov.bd	391
3583	Bana	বানা	banaup.faridpur.gov.bd	391
3584	Panchuria	পাঁচুড়িয়া	panchuriaup.faridpur.gov.bd	391
3585	Gopalpur	গোপালপুর	gopalpurup.faridpur.gov.bd	391
3586	Boalmari	বোয়ালমারী	boalmariup.faridpur.gov.bd	392
3587	Dadpur	দাদপুর	dadpurup.faridpur.gov.bd	392
3588	Chatul	চতুল	chatulup.faridpur.gov.bd	392
3589	Ghoshpur	ঘোষপুর	ghoshpurup.faridpur.gov.bd	392
3590	Gunbaha	গুনবহা	gunbahaup.faridpur.gov.bd	392
3591	Chandpur	চাঁদপুর	chandpurup.faridpur.gov.bd	392
3592	Parameshwardi	পরমেশ্বরদী	parameshwardiup.faridpur.gov.bd	392
3593	Satair	সাতৈর	satairup.faridpur.gov.bd	392
3594	Rupapat	রূপাপাত	rupapatup.faridpur.gov.bd	392
3595	Shekhar	শেখর	shekharup.faridpur.gov.bd	392
3596	Moyna	ময়না	moynaup.faridpur.gov.bd	392
3597	Char Bisnopur	চর বিষ্ণুপুর	charbisnopurup.faridpur.gov.bd	393
3598	Akoter Char	আকোটের চর	akotercharup.faridpur.gov.bd	393
3600	Narikel Bariya	নারিকেল বাড়িয়া	narikelbariyaup.faridpur.gov.bd	393
3601	Bhashanchar	ভাষানচর	bhashancharup.faridpur.gov.bd	393
3602	Krishnapur	কৃষ্ণপুর	krishnapurup.faridpur.gov.bd	393
3603	Sadarpur	সদরপুর	sadarpurup.faridpur.gov.bd	393
3604	Char Manair	চর মানাইর	charmanairup.faridpur.gov.bd	393
3605	Dhaukhali	ঢেউখালী	dhaukhaliup.faridpur.gov.bd	393
3606	Charjashordi	চরযশোরদী	charjashordiup.faridpur.gov.bd	394
3607	Purapara	পুরাপাড়া	puraparaup.faridpur.gov.bd	394
3608	Laskardia	লস্করদিয়া	laskardiaup.faridpur.gov.bd	394
3609	Ramnagar	রামনগর	ramnagarup.faridpur.gov.bd	394
3610	Kaichail	কাইচাইল	kaichailup.faridpur.gov.bd	394
3611	Talma	তালমা	talmaup.faridpur.gov.bd	394
3612	Fulsuti	ফুলসুতি	fulsutiup.faridpur.gov.bd	394
3613	Dangi	ডাঙ্গী	dangiup.faridpur.gov.bd	394
3691	Timaihat	তিমাইহাট	timaihat.panchagarh.gov.bd	403
3615	Gharua	ঘারুয়া	gharuaup.faridpur.gov.bd	395
3616	Nurullagonj	নুরুল্যাগঞ্জ	nurullagonjup.faridpur.gov.bd	395
3617	Manikdha	মানিকদহ	manikdhaup.faridpur.gov.bd	395
3618	Kawlibera	কাউলিবেড়া	kawliberaup.faridpur.gov.bd	395
3619	Nasirabad	নাছিরাবাদ	nasirabadup.faridpur.gov.bd	395
3620	Tujerpur	তুজারপুর	tujerpurup.faridpur.gov.bd	395
3621	Algi	আলগী	algiup.faridpur.gov.bd	395
3622	Chumurdi	চুমুরদী	chumurdiup.faridpur.gov.bd	395
3623	Kalamridha	কালামৃধা	kalamridhaup.faridpur.gov.bd	395
3624	Azimnagor	আজিমনগর	azimnagorup.faridpur.gov.bd	395
3625	Chandra	চান্দ্রা	chandraup.faridpur.gov.bd	395
3626	Hamirdi	হামিরদী	hamirdiup.faridpur.gov.bd	395
3627	Gazirtek	গাজীরটেক	gazirtekup.faridpur.gov.bd	396
3628	Char Bhadrasan	চর ভদ্রাসন	charbhadrasanup.faridpur.gov.bd	396
3630	Char Jahukanda	চর ঝাউকান্দা	charjahukandaup.faridpur.gov.bd	396
3631	Madhukhali	মধুখালী	madhukhaliup.faridpur.gov.bd	397
3632	Jahapur	জাহাপুর	jahapurup.faridpur.gov.bd	397
3633	Gazna	গাজনা	gaznaup.faridpur.gov.bd	397
3634	Megchami	মেগচামী	megchamiup.faridpur.gov.bd	397
3635	Raipur	রায়পুর	raipurup.faridpur.gov.bd	397
3636	Bagat	বাগাট	bagatup.faridpur.gov.bd	397
3637	Dumain	ডুমাইন	dumainup.faridpur.gov.bd	397
3638	Nowpara	নওপাড়া	nowparaup.faridpur.gov.bd	397
3639	Kamarkhali	কামারখালী	kamarkhaliup.faridpur.gov.bd	397
3640	Bhawal	ভাওয়াল	bhawalup.faridpur.gov.bd	398
3641	Atghar	আটঘর	atgharup.faridpur.gov.bd	398
3642	Mazadia	মাঝারদিয়া	mazadiaup.faridpur.gov.bd	398
3643	Ballabhdi	বল্লভদী	ballabhdiup.faridpur.gov.bd	398
3644	Gatti	গট্টি	gattiup.faridpur.gov.bd	398
3645	Jadunandi	যদুনন্দী	jadunandiup.faridpur.gov.bd	398
3646	Ramkantapur	রামকান্তপুর	ramkantapurup.faridpur.gov.bd	398
3647	Sonapur	সোনাপুর	sonapurup.faridpur.gov.bd	398
3648	Panchagarh Sadar	পঞ্চগড় সদর	panchagarhsadarup.panchagarh.gov.bd	399
3649	Satmara	সাতমেরা	satmaraup.panchagarh.gov.bd	399
3651	Haribhasa	হাড়িভাসা	haribhasaup.panchagarh.gov.bd	399
3652	Chaklahat	চাকলাহাট	chaklahatup.panchagarh.gov.bd	399
3653	Hafizabad	হাফিজাবাদ	hafizabadup.panchagarh.gov.bd	399
3654	Kamat Kajol Dighi	কামাত কাজল দীঘি	kamatkajoldighiup.panchagarh.gov.bd	399
3655	Dhakkamara	ধাক্কামারা	dhakkamaraup.panchagarh.gov.bd	399
3656	Magura	মাগুরা	maguraup.panchagarh.gov.bd	399
3657	Garinabari	গরিনাবাড়ী	garinabariup.panchagarh.gov.bd	399
3658	Chilahati	চিলাহাটি	chilahatiup.panchagarh.gov.bd	400
3659	Shaldanga	শালডাঙ্গা	shaldangaup.panchagarh.gov.bd	400
3660	Debiganj Sadar	দেবীগঞ্জ সদর	debiganjsadarup.panchagarh.gov.bd	400
3661	Pamuli	পামুলী	pamuliup.panchagarh.gov.bd	400
3662	Sundardighi	সুন্দরদিঘী	sundardighiup.panchagarh.gov.bd	400
3663	Sonahar Mollikadaha	সোনাহার মল্লিকাদহ	sonaharmollikadahaup.panchagarh.gov.bd	400
3664	Tepriganj	টেপ্রীগঞ্জ	tepriganjup.panchagarh.gov.bd	400
3665	Dandopal	দন্ডপাল	dandopalup.panchagarh.gov.bd	400
3666	Debiduba	দেবীডুবা	debidubaup.panchagarh.gov.bd	400
3667	Chengthi Hazra Danga	চেংঠী হাজরা ডাঙ্গা	chengthihazradangaup.panchagarh.gov.bd	400
3668	Jholaishal Shiri	ঝলইশাল শিরি	jholaishalshiriup.panchagarh.gov.bd	401
3669	Moidandighi	ময়দান দীঘি	moidandighiup.panchagarh.gov.bd	401
3670	Banghari	বেংহারী	banghariup.panchagarh.gov.bd	401
3671	Kajoldighi Kaligonj	কাজলদীঘি কালিগঞ্জ	kajoldighikaligonjup.panchagarh.gov.bd	401
3672	Boroshoshi	বড়শশী	boroshoshiup.panchagarh.gov.bd	401
3673	Chandanbari	চন্দনবাড়ী	chandanbariup.panchagarh.gov.bd	401
3674	Marea Bamonhat	মাড়েয়া বামনহাট	mareabamonhatup.panchagarh.gov.bd	401
3675	Boda	বোদা	bodaup.panchagarh.gov.bd	401
3676	Sakoa	সাকোয়া	sakoaup.panchagarh.gov.bd	401
3677	Pachpir	পাচপীর	pachpirup.panchagarh.gov.bd	401
3678	Mirgapur	মির্জাপুর	mirgapurup.panchagarh.gov.bd	402
3679	Radhanagar	রাধানগর	radhanagarup.panchagarh.gov.bd	402
3680	Toria	তোড়িয়া	toriaup.panchagarh.gov.bd	402
3681	Balarampur	বলরামপুর	balarampurup.panchagarh.gov.bd	402
3682	Alowakhowa	আলোয়াখোয়া	alowakhowaup.panchagarh.gov.bd	402
3683	Dhamor	ধামোর	dhamorup.panchagarh.gov.bd	402
3684	Banglabandha	বাংলাবান্ধা	banglabandhaup.panchagarh.gov.bd	403
3685	Bhojoanpur	ভজনপুর	bhojoanpurup.panchagarh.gov.bd	403
3686	Bhojoanpur	ভজনপুর	bhojoanpur.gazipur.gov.bd	403
3687	Buraburi	বুড়াবুড়ী	buraburi.panchagarh.gov.bd	403
3688	Debnagar	দেবনগর	debnagarup.panchagarh.gov.bd	403
3689	Salbahan	শালবাহান	salbahanup.panchagarh.gov.bd	403
3694	Golapgonj	গোলাপগঞ্জ	golapgonjup.dinajpur.gov.bd	404
3695	Shalkhuria	শালখুরিয়া	shalkhuriaup.dinajpur.gov.bd	404
3696	Putimara	পুটিমারা	putimaraup.dinajpur.gov.bd	404
3697	Bhaduria	ভাদুরিয়া	bhaduriaup.dinajpur.gov.bd	404
3698	Daudpur	দাউদপুর	daudpurup.dinajpur.gov.bd	404
3699	Mahmudpur	মাহামুদপুর	mahmudpurup.dinajpur.gov.bd	404
3700	Kushdaha	কুশদহ	kushdahaup.dinajpur.gov.bd	404
3701	Shibrampur	শিবরামপুর	shibrampurup.dinajpur.gov.bd	405
3702	Polashbari	পলাশবাড়ী	polashbariup2.dinajpur.gov.bd	405
3703	Shatagram	শতগ্রাম	shatagramup.dinajpur.gov.bd	405
3704	Paltapur	পাল্টাপুর	paltapurup.dinajpur.gov.bd	405
3705	Sujalpur	সুজালপুর	sujalpurup.dinajpur.gov.bd	405
3706	Nijpara	নিজপাড়া	nijparaup.dinajpur.gov.bd	405
3707	Mohammadpur	মোহাম্মদপুর	mohammadpurup.dinajpur.gov.bd	405
3708	Bhognagar	ভোগনগর	bhognagarup.dinajpur.gov.bd	405
3709	Sator	সাতোর	satorup.dinajpur.gov.bd	405
3710	Mohonpur	মোহনপুর	mohonpurup.dinajpur.gov.bd	405
3711	Moricha	মরিচা	morichaup.dinajpur.gov.bd	405
3712	Bulakipur	বুলাকীপুর	bulakipurup.dinajpur.gov.bd	406
3713	Palsha	পালশা	palshaup.dinajpur.gov.bd	406
3714	Singra	সিংড়া	singraup.dinajpur.gov.bd	406
3715	Ghoraghat	ঘোড়াঘাট	ghoraghatup.dinajpur.gov.bd	406
3716	Mukundopur	মুকুন্দপুর	mukundopurup.dinajpur.gov.bd	407
3717	Katla	কাটলা	katlaup.dinajpur.gov.bd	407
3718	Khanpur	খানপুর	khanpurup.dinajpur.gov.bd	407
3719	Dior	দিওড়	diorup.dinajpur.gov.bd	407
3720	Binail	বিনাইল	binailup.dinajpur.gov.bd	407
3721	Jatbani	জোতবানী	jatbaniup.dinajpur.gov.bd	407
3723	Belaichandi	বেলাইচন্ডি	belaichandiup.dinajpur.gov.bd	408
3724	Monmothopur	মন্মথপুর	monmothopurup.dinajpur.gov.bd	408
3725	Rampur	রামপুর	rampurup.dinajpur.gov.bd	408
3726	Polashbari	পলাশবাড়ী	polashbariup4.dinajpur.gov.bd	408
3727	Chandipur	চন্ডীপুর	chandipurup.dinajpur.gov.bd	408
3728	Mominpur	মোমিনপুর	mominpurup.dinajpur.gov.bd	408
3729	Mostofapur	মোস্তফাপুর	mostofapurup.dinajpur.gov.bd	408
3730	Habra	হাবড়া	habraup.dinajpur.gov.bd	408
3731	Hamidpur	হামিদপুর	hamidpurup.dinajpur.gov.bd	408
3732	Harirampur	হরিরামপুর	harirampurup.dinajpur.gov.bd	408
3733	Nafanagar	নাফানগর	nafanagarup.dinajpur.gov.bd	409
3734	Eshania	ঈশানিয়া	eshaniaup.dinajpur.gov.bd	409
3735	Atgaon	আটগাঁও	atgaonup.dinajpur.gov.bd	409
3736	Shatail	ছাতইল	shatailup.dinajpur.gov.bd	409
3737	Rongaon	রনগাঁও	rongaonup.dinajpur.gov.bd	409
3738	Murshidhat	মুর্শিদহাট	murshidhatup.dinajpur.gov.bd	409
3739	Dabor	ডাবোর	daborup.dinajpur.gov.bd	410
3740	Rasulpur	রসুলপুর	rasulpurup.dinajpur.gov.bd	410
3741	Mukundapur	মুকুন্দপুর	mukundapurup.dinajpur.gov.bd	410
3742	Targao	তারগাঁও	targaoup.dinajpur.gov.bd	410
3743	Ramchandrapur	রামচন্দ্রপুর	ramchandrapurup.dinajpur.gov.bd	410
3744	Sundarpur	সুন্দরপুর	sundarpurup.dinajpur.gov.bd	410
3745	Aloary	এলুয়াড়ী	aloaryup.dinajpur.gov.bd	411
3746	Aladipur	আলাদিপুর	aladipurup.dinajpur.gov.bd	411
3747	Kagihal	কাজীহাল	kagihalup.dinajpur.gov.bd	411
3748	Bethdighi	বেতদিঘী	bethdighiup.dinajpur.gov.bd	411
3749	Khairbari	খয়েরবাড়ী	khairbariup.dinajpur.gov.bd	411
3750	Daulatpur	দৌলতপুর	daulatpurup.dinajpur.gov.bd	411
3752	Chealgazi	চেহেলগাজী	chealgaziup.dinajpur.gov.bd	412
3753	Sundorbon	সুন্দরবন	sundorbonup.dinajpur.gov.bd	412
3754	Fazilpur	ফাজিলপুর	fazilpurup.dinajpur.gov.bd	412
3755	Shekpura	শেখপুরা	shekpuraup.dinajpur.gov.bd	412
3756	Shashora	শশরা	shashoraup.dinajpur.gov.bd	412
3757	Auliapur	আউলিয়াপুর	auliapurup.dinajpur.gov.bd	412
3758	Uthrail	উথরাইল	uthrailup.dinajpur.gov.bd	412
3759	Sankarpur	শংকরপুর	sankarpurup.dinajpur.gov.bd	412
3760	Askorpur	আস্করপুর	askorpurup.dinajpur.gov.bd	412
3761	Kamalpur	কমলপুর	kamalpurup.dinajpur.gov.bd	412
3762	Alihat	আলীহাট	alihatup.dinajpur.gov.bd	413
3763	Khattamadobpara	খট্টামাধবপাড়া	khattamadobparaup.dinajpur.gov.bd	413
3764	Boalder	বোয়ালদার	boalderup.dinajpur.gov.bd	413
3765	Alokjhari	আলোকঝাড়ী	alokjhariup.dinajpur.gov.bd	414
3766	Bherbheri	ভেড়ভেড়ী	bherbheriup.dinajpur.gov.bd	414
3767	Angarpara	আঙ্গারপাড়া	angarparaup.dinajpur.gov.bd	414
3768	Goaldihi	গোয়ালডিহি	goaldihiup.dinajpur.gov.bd	414
3769	Bhabki	ভাবকী	bhabkiup.dinajpur.gov.bd	414
3770	Khamarpara	খামারপাড়া	khamarparaup.dinajpur.gov.bd	414
3771	Azimpur	আজিমপুর	azimpurup.dinajpur.gov.bd	415
3772	Farakkabad	ফরাক্কাবাদ	farakkabadup.dinajpur.gov.bd	415
3773	Dhamoir	ধামইর	dhamoirup.dinajpur.gov.bd	415
3775	Birol	বিরল	birolup.dinajpur.gov.bd	415
3776	Bhandra	ভান্ডারা	bhandraup.dinajpur.gov.bd	415
3777	Bijora	বিজোড়া	bijoraup.dinajpur.gov.bd	415
3778	Dharmapur	ধর্মপুর	dharmapurup.dinajpur.gov.bd	415
3779	Mongalpur	মঙ্গলপুর	mongalpurup.dinajpur.gov.bd	415
3781	Rajarampur	রাজারামপুর	rajarampurup.dinajpur.gov.bd	415
3782	Nashratpur	নশরতপুর	nashratpurup.dinajpur.gov.bd	416
3783	Satnala	সাতনালা	satnalaup.dinajpur.gov.bd	416
3784	Fatejangpur	ফতেজংপুর	fatejangpurup.dinajpur.gov.bd	416
3785	Isobpur	ইসবপুর	isobpurup.dinajpur.gov.bd	416
3786	Abdulpur	আব্দুলপুর	abdulpurup.dinajpur.gov.bd	416
3787	Amarpur	অমরপুর	amarpurup.dinajpur.gov.bd	416
3788	Auliapukur	আউলিয়াপুকুর	auliapukurup.dinajpur.gov.bd	416
3789	Saitara	সাইতারা	saitaraup.dinajpur.gov.bd	416
3790	Viail	ভিয়াইল	viailup.dinajpur.gov.bd	416
3791	Punotti	পুনট্টি	punottiup.dinajpur.gov.bd	416
3792	Tetulia	তেতুলিয়া	tetuliaup.dinajpur.gov.bd	416
3793	Alokdihi	আলোকডিহি	alokdihiup.dinajpur.gov.bd	416
3794	Rajpur	রাজপুর	rajpurup.lalmonirhat.gov.bd	417
3795	Harati	হারাটি	haratiup.lalmonirhat.gov.bd	417
3796	Mogolhat	মোগলহাট	mogolhatup.lalmonirhat.gov.bd	417
3797	Gokunda	গোকুন্ডা	gokundaup.lalmonirhat.gov.bd	417
3798	Barobari	বড়বাড়ী	barobariup.lalmonirhat.gov.bd	417
3799	Kulaghat	কুলাঘাট	kulaghatup.lalmonirhat.gov.bd	417
3800	Mohendranagar	মহেন্দ্রনগর	mohendranagarup.lalmonirhat.gov.bd	417
3801	Khuniagachh	খুনিয়াগাছ	khuniagachhup.lalmonirhat.gov.bd	417
3802	Panchagram	পঞ্চগ্রাম	panchagramup.lalmonirhat.gov.bd	417
3803	Bhotmari	ভোটমারী	bhotmariup.lalmonirhat.gov.bd	418
3804	Modati	মদাতী	modatiup.lalmonirhat.gov.bd	418
3805	Dologram	দলগ্রাম	dologramup.lalmonirhat.gov.bd	418
3807	Goral	গোড়ল	goralup.lalmonirhat.gov.bd	418
3808	Chondropur	চন্দ্রপুর	chondropurup.lalmonirhat.gov.bd	418
3809	Cholbola	চলবলা	cholbolaup.lalmonirhat.gov.bd	418
3810	Kakina	কাকিনা	kakinaup.lalmonirhat.gov.bd	418
3811	Barokhata	বড়খাতা	barokhataup.lalmonirhat.gov.bd	419
3812	Goddimari	গড্ডিমারী	goddimariup.lalmonirhat.gov.bd	419
3813	Singimari	সিংগীমারী	singimariup.lalmonirhat.gov.bd	419
3814	Tongvhanga	টংভাঙ্গা	tongvhangaup.lalmonirhat.gov.bd	419
3815	Sindurna	সিন্দুর্ণা	sindurnaup.lalmonirhat.gov.bd	419
3816	Paticapara	পাটিকাপাড়া	paticaparaup.lalmonirhat.gov.bd	419
3817	Nowdabas	নওদাবাস	nowdabasup.lalmonirhat.gov.bd	419
3818	Gotamari	গোতামারী	gotamariup.lalmonirhat.gov.bd	419
3819	Vhelaguri	ভেলাগুড়ি	vhelaguriup.lalmonirhat.gov.bd	419
3820	Shaniajan	সানিয়াজান	shaniajanup.lalmonirhat.gov.bd	419
3821	Fakirpara	ফকিরপাড়া	fakirparaup.lalmonirhat.gov.bd	419
3822	Dawabari	ডাউয়াবাড়ী	dawabariup.lalmonirhat.gov.bd	419
3823	Sreerampur	শ্রীরামপুর	sreerampurup.lalmonirhat.gov.bd	420
3824	Patgram	পাটগ্রাম	patgramup.lalmonirhat.gov.bd	420
3825	Jagatber	জগতবেড়	jagatberup.lalmonirhat.gov.bd	420
3826	Kuchlibari	কুচলিবাড়ী	kuchlibariup.lalmonirhat.gov.bd	420
3827	Jongra	জোংড়া	jongraup.lalmonirhat.gov.bd	420
3828	Baura	বাউড়া	bauraup.lalmonirhat.gov.bd	420
3829	Dahagram	দহগ্রাম	dahagramup.lalmonirhat.gov.bd	420
3830	Burimari	বুড়িমারী	burimariup.lalmonirhat.gov.bd	420
3831	Bhelabari	ভেলাবাড়ী	bhelabariup.lalmonirhat.gov.bd	421
3832	Bhadai	ভাদাই	bhadaiup.lalmonirhat.gov.bd	421
3833	Kamlabari	কমলাবাড়ী	kamlabariup.lalmonirhat.gov.bd	421
3834	Durgapur	দূর্গাপুর	durgapurup.lalmonirhat.gov.bd	421
3835	Sarpukur	সারপুকুর	sarpukurup.lalmonirhat.gov.bd	421
3837	Palashi	পলাশী	palashiup.lalmonirhat.gov.bd	421
3838	Mohishkhocha	মহিষখোচা	mohishkhochaup.lalmonirhat.gov.bd	421
3839	Kamarpukur	কামারপুকুর	kamarpukurup.nilphamari.gov.bd	422
3840	Kasiram Belpukur	কাশিরাম বেলপুকুর	kasirambelpukurup.nilphamari.gov.bd	422
3841	Bangalipur	বাঙ্গালীপুর	bangalipur.nilphamari.gov.bd	422
3842	Botlagari	বোতলাগাড়ী	botlagariup.nilphamari.gov.bd	422
3843	Khata Madhupur	খাতা মধুপুর	khatamadhupurup.nilphamari.gov.bd	422
3844	Gomnati	গোমনাতি	gomnati.nilphamari.gov.bd	423
3845	Bhogdaburi	ভোগডাবুড়ী	bhogdaburiup.nilphamari.gov.bd	423
3846	Ketkibari	কেতকীবাড়ী	ketkibariup.nilphamari.gov.bd	423
3847	Jorabari	জোড়াবাড়ী	jorabariup.nilphamari.gov.bd	423
3848	Bamunia	বামুনীয়া	bamuniaup.nilphamari.gov.bd	423
3849	Panga Motukpur	পাংগা মটকপুর	pangamotukpurup.nilphamari.gov.bd	423
3850	Boragari	বোড়াগাড়ী	boragariup.nilphamari.gov.bd	423
3851	Domar	ডোমার	domarup.nilphamari.gov.bd	423
3852	Sonaray	সোনারায়	sonarayup2.nilphamari.gov.bd	423
3854	Paschim Chhatnay	পশ্চিম ছাতনাই	paschimchhatnayup.nilphamari.gov.bd	424
3855	Balapara	বালাপাড়া	balaparaup.nilphamari.gov.bd	424
3856	Dimla Sadar	ডিমলা সদর	dimlasadarup.nilphamari.gov.bd	424
3857	Khogakharibari	খগা খড়িবাড়ী	khogakharibariup.nilphamari.gov.bd	424
3858	Gayabari	গয়াবাড়ী	gayabariup.nilphamari.gov.bd	424
3859	Noutara	নাউতারা	noutaraup.nilphamari.gov.bd	424
3860	Khalisha Chapani	খালিশা চাপানী	khalishachapaniup.nilphamari.gov.bd	424
3861	Jhunagach Chapani	ঝুনাগাছ চাপানী	jhunagachhchapaniup.nilphamari.gov.bd	424
3862	Tepa Khribari	টেপা খরীবাড়ী	tepakhribariup.nilphamari.gov.bd	424
3863	Purba Chhatnay	পুর্ব ছাতনাই	purbachhatnayup.nilphamari.gov.bd	424
3864	Douabari	ডাউয়াবাড়ী	douabariup.nilphamari.gov.bd	425
3865	Golmunda	গোলমুন্ডা	golmunda.nilphamari.gov.bd	425
3866	Balagram	বালাগ্রাম	balagram.nilphamari.gov.bd	425
3867	Golna	গোলনা	golna.nilphamari.gov.bd	425
3868	Dharmapal	ধর্মপাল	dharmapal.nilphamari.gov.bd	425
3869	Simulbari	শিমুলবাড়ী	simulbari.nilphamari.gov.bd	425
3870	Mirganj	মীরগঞ্জ	mirganj.nilphamari.gov.bd	425
3871	Kathali	কাঠালী	kathaliup.nilphamari.gov.bd	425
3873	Shaulmari	শৌলমারী	shaulmariup.nilphamari.gov.bd	425
3874	Kaimari	কৈমারী	kaimariup.nilphamari.gov.bd	425
3875	Barabhita	বড়ভিটা	barabhitaup.nilphamari.gov.bd	426
3876	Putimari	পুটিমারী	putimariup.nilphamari.gov.bd	426
3877	Nitai	নিতাই	nitaiup.nilphamari.gov.bd	426
3878	Bahagili	বাহাগিলি	bahagiliup.nilphamari.gov.bd	426
3879	Chandkhana	চাঁদখানা	chandkhanaup.nilphamari.gov.bd	426
3880	Kishoreganj	কিশোরগঞ্জ	kishoreganjup.nilphamari.gov.bd	426
3881	Ranachandi	রনচন্ডি	ranachandiup.nilphamari.gov.bd	426
3882	Garagram	গাড়াগ্রাম	garagramup.nilphamari.gov.bd	426
3883	Magura	মাগুরা	maguraup.nilphamari.gov.bd	426
3884	Chaora Bargacha	চওড়া বড়গাছা	chaorabargachaup.nilphamari.gov.bd	427
3885	Gorgram	গোড়গ্রাম	gorgramup.nilphamari.gov.bd	427
3886	Khoksabari	খোকসাবাড়ী	khoksabariup.nilphamari.gov.bd	427
4449	Bagarchar	বগারচর	bagarcharup.jamalpur.gov.bd	481
3887	Palasbari	পলাশবাড়ী	palasbariup.nilphamari.gov.bd	427
3888	Ramnagar	রামনগর	ramnagarup.nilphamari.gov.bd	427
3889	Kachukata	কচুকাটা	kachukataup.nilphamari.gov.bd	427
3890	Panchapukur	পঞ্চপুকুর	panchapukurup.nilphamari.gov.bd	427
3891	Itakhola	ইটাখোলা	itakholaup.nilphamari.gov.bd	427
3892	Kundapukur	কুন্দপুকুর	kundapukur.nilphamari.gov.bd	427
3893	Sonaray	সোনারায়	sonaray.nilphamari.gov.bd	427
3894	Songalsi	সংগলশী	songalsiup.nilphamari.gov.bd	427
3895	Charaikhola	চড়াইখোলা	charaikhola.nilphamari.gov.bd	427
3897	Lakshmicha	লক্ষ্মীচাপ	lakshmichapup.nilphamari.gov.bd	427
3898	Tupamari	টুপামারী	tupamariup.nilphamari.gov.bd	427
3899	Rasulpur	রসুলপুর	rasulpurup.gaibandha.gov.bd	428
3900	Noldanga	নলডাঙ্গা	noldangaup.gaibandha.gov.bd	428
3901	Damodorpur	দামোদরপুর	damodorpurup.gaibandha.gov.bd	428
3902	Jamalpur	জামালপুর	jamalpurup.gaibandha.gov.bd	428
3903	Faridpur	ফরিদপুর	faridpurup.gaibandha.gov.bd	428
3904	Dhaperhat	ধাপেরহাট	dhaperhatup.gaibandha.gov.bd	428
3905	Idilpur	ইদিলপুর	idilpurup.gaibandha.gov.bd	428
3906	Vatgram	ভাতগ্রাম	vatgramup.gaibandha.gov.bd	428
3907	Bongram	বনগ্রাম	bongramup.gaibandha.gov.bd	428
3908	Kamarpara	কামারপাড়া	kamarparaup.gaibandha.gov.bd	428
3909	Khodkomor	খোদকোমরপুর	khodkomorup.gaibandha.gov.bd	428
3910	Laxmipur	লক্ষ্মীপুর	laxmipurup.gaibandha.gov.bd	429
3911	Malibari	মালীবাড়ী	malibariup.gaibandha.gov.bd	429
3912	Kuptola	কুপতলা	kuptolaup.gaibandha.gov.bd	429
3913	Shahapara	সাহাপাড়া	shahaparaup.gaibandha.gov.bd	429
3914	Ballamjhar	বল্লমঝাড়	ballamjharup.gaibandha.gov.bd	429
3915	Ramchandrapur	রামচন্দ্রপুর	ramchandrapurup.gaibandha.gov.bd	429
3916	Badiakhali	বাদিয়াখালী	badiakhaliup.gaibandha.gov.bd	429
3917	Boali	বোয়ালী	boaliup.gaibandha.gov.bd	429
3918	Ghagoa	ঘাগোয়া	ghagoaup.gaibandha.gov.bd	429
3919	Gidari	গিদারী	gidariup.gaibandha.gov.bd	429
3920	Kholahati	খোলাহাটী	kholahatiup.gaibandha.gov.bd	429
3921	Mollarchar	মোল্লারচর	mollarcharup.gaibandha.gov.bd	429
3922	Kamarjani	কামারজানি	kamarjaniup.gaibandha.gov.bd	429
3923	Kishoregari	কিশোরগাড়ী	kishoregariup.gaibandha.gov.bd	430
3924	Hosenpur	হোসেনপুর	hosenpurup.gaibandha.gov.bd	430
3925	Palashbari	পলাশবাড়ী	palashbariup.gaibandha.gov.bd	430
3926	Barisal	বরিশাল	barisalup.gaibandha.gov.bd	430
3927	Mohdipur	মহদীপুর	mohdipurup.gaibandha.gov.bd	430
3928	Betkapa	বেতকাপা	betkapaup.gaibandha.gov.bd	430
3929	Pobnapur	পবনাপুর	pobnapurup.gaibandha.gov.bd	430
3931	Harinathpur	হরিণাথপুর	harinathpurup.gaibandha.gov.bd	430
3932	Padumsahar	পদুমশহর	padumsaharup.gaibandha.gov.bd	431
3933	Varotkhali	ভরতখালী	varotkhaliup.gaibandha.gov.bd	431
3934	Saghata	সাঘাটা	saghataup.gaibandha.gov.bd	431
3935	Muktinagar	মুক্তিনগর	muktinagarup.gaibandha.gov.bd	431
3936	Kachua	কচুয়া	kachuaup.gaibandha.gov.bd	431
3937	Ghuridah	ঘুরিদহ	ghuridahup.gaibandha.gov.bd	431
3938	Holdia	হলদিয়া	holdiaup.gaibandha.gov.bd	431
3939	Jumarbari	জুমারবাড়ী	jumarbariup.gaibandha.gov.bd	431
3940	Kamalerpara	কামালেরপাড়া	kamalerparaup.gaibandha.gov.bd	431
3941	Bonarpara	বোনারপাড়া	bonarparaup.gaibandha.gov.bd	431
3942	Kamdia	কামদিয়া	kamdiaup.gaibandha.gov.bd	432
3943	Katabari	কাটাবাড়ী	katabariup.gaibandha.gov.bd	432
3944	Shakhahar	শাখাহার	shakhaharup.gaibandha.gov.bd	432
3945	Rajahar	রাজাহার	rajaharup.gaibandha.gov.bd	432
3946	Sapmara	সাপমারা	sapmaraup.gaibandha.gov.bd	432
3947	Dorbosto	দরবস্ত ইয়নিয়ন	dorbostoup.gaibandha.gov.bd	432
3949	Nakai	নাকাই	nakaiup.gaibandha.gov.bd	432
3950	Harirampur	হরিরামপুর	harirampurup.gaibandha.gov.bd	432
3951	Rakhalburuj	রাখালবুরুজ	rakhalburujup.gaibandha.gov.bd	432
3952	Phulbari	ফুলবাড়ী	phulbariup.gaibandha.gov.bd	432
3953	Gumaniganj	গুমানীগঞ্জ	gumaniganjup.gaibandha.gov.bd	432
3954	Kamardoho	কামারদহ	kamardohoup.gaibandha.gov.bd	432
3955	Kochasahar	কোচাশহর	kochasaharup.gaibandha.gov.bd	432
3956	Shibpur	শিবপুর	shibpurup.gaibandha.gov.bd	432
3957	Mahimaganj	মহিমাগঞ্জ	mahimaganjup.gaibandha.gov.bd	432
3958	Shalmara	শালমারা	shalmaraup.gaibandha.gov.bd	432
3959	Bamondanga	বামনডাঙ্গা	bamondangaup.gaibandha.gov.bd	433
3960	Sonaroy	সোনারায়	sonaroyup.gaibandha.gov.bd	433
3961	Tarapur	তারাপুর	tarapurup.gaibandha.gov.bd	433
3962	Belka	বেলকা	belkaup.gaibandha.gov.bd	433
3963	Dohbond	দহবন্দ	dohbondup.gaibandha.gov.bd	433
3964	Sorbanondo	সর্বানন্দ	sorbanondoup.gaibandha.gov.bd	433
3965	Ramjibon	রামজীবন	ramjibonup.gaibandha.gov.bd	433
3966	Dhopadanga	ধোপাডাঙ্গা	dhopadangaup.gaibandha.gov.bd	433
3967	Chaporhati	ছাপরহাটী	chaporhatiup.gaibandha.gov.bd	433
3968	Shantiram	শান্তিরাম	shantiramup.gaibandha.gov.bd	433
3970	Sreepur	শ্রীপুর	sreepurup.gaibandha.gov.bd	433
3971	Chandipur	চন্ডিপুর	chandipurup.gaibandha.gov.bd	433
3972	Kapasia	কাপাসিয়া	kapasiaup.gaibandha.gov.bd	433
3973	Haripur	হরিপুর	haripurup.gaibandha.gov.bd	433
3974	Kanchipara	কঞ্চিপাড়া	kanchiparaup.gaibandha.gov.bd	434
3975	Uria	উড়িয়া	uriaup.gaibandha.gov.bd	434
3976	Udakhali	উদাখালী	udakhaliup.gaibandha.gov.bd	434
3977	Gazaria	গজারিয়া	gazariaup.gaibandha.gov.bd	434
3978	Phulchari	ফুলছড়ি	phulchariup.gaibandha.gov.bd	434
3979	Erendabari	এরেন্ডাবাড়ী	erendabariup.gaibandha.gov.bd	434
3980	Fazlupur	ফজলুপুর	fazlupurup.gaibandha.gov.bd	434
3981	Ruhea	রুহিয়া	ruheaup.thakurgaon.gov.bd	435
3982	Akhanagar	আখানগর	akhanagarup.thakurgaon.gov.bd	435
3983	Ahcha	আকচা	ahchaup.thakurgaon.gov.bd	435
3984	Baragaon	বড়গাঁও	baragaonup.thakurgaon.gov.bd	435
3985	Balia	বালিয়া	baliaup.thakurgaon.gov.bd	435
3986	Auliapur	আউলিয়াপুর	auliapurup.thakurgaon.gov.bd	435
3987	Chilarang	চিলারং	chilarangup.thakurgaon.gov.bd	435
3988	Rahimanpur	রহিমানপুর	rahimanpurup.thakurgaon.gov.bd	435
3989	Roypur	রায়পুর	roypurup.thakurgaon.gov.bd	435
3990	Jamalpur	জামালপুর	jamalpurup.thakurgaon.gov.bd	435
3991	Mohammadpur	মোহাম্মদপুর	mohammadpurup.thakurgaon.gov.bd	435
3992	Salandar	সালন্দর	salandarup.thakurgaon.gov.bd	435
3993	Gareya	গড়েয়া	gareyaup.thakurgaon.gov.bd	435
3994	Rajagaon	রাজাগাঁও	rajagaonup.thakurgaon.gov.bd	435
3995	Debipur	দেবীপুর	debipurup.thakurgaon.gov.bd	435
3996	Nargun	নারগুন	nargunup.thakurgaon.gov.bd	435
3997	Jagannathpur	জগন্নাথপুর	jagannathpurup.thakurgaon.gov.bd	435
3998	Sukhanpukhari	শুখানপুকুরী	sukhanpukhariup.thakurgaon.gov.bd	435
3999	Begunbari	বেগুনবাড়ী	begunbariup.thakurgaon.gov.bd	435
4000	Ruhia Pashchim	রুহিয়া পশ্চিম	ruhiapashchimup.thakurgaon.gov.bd	435
4001	Dholarhat	ঢোলারহাট	dholarhatup.thakurgaon.gov.bd	435
4002	Bhomradaha	ভোমরাদহ	bhomradahaup.thakurgaon.gov.bd	436
4003	Kosharaniganj	কোষারাণীগঞ্জ	kosharaniganjup.thakurgaon.gov.bd	436
4004	Khangaon	খনগাঁও	khangaonup.thakurgaon.gov.bd	436
4005	Saidpur	সৈয়দপুর	saidpurup.thakurgaon.gov.bd	436
4006	Pirganj	পীরগঞ্জ	pirganjup.thakurgaon.gov.bd	436
4007	Hajipur	হাজীপুর	hajipurup.thakurgaon.gov.bd	436
4008	Daulatpur	দৌলতপুর	daulatpurup.thakurgaon.gov.bd	436
4010	Jabarhat	জাবরহাট	jabarhatup.thakurgaon.gov.bd	436
4011	Bairchuna	বৈরচুনা	bairchunaup.thakurgaon.gov.bd	436
4012	Dhormogarh	ধর্মগড়	dhormogarhup.thakurgaon.gov.bd	437
4013	Nekmorod	নেকমরদ	nekmorodup.thakurgaon.gov.bd	437
4014	Hosengaon	হোসেনগাঁও	hosengaonup.thakurgaon.gov.bd	437
4015	Lehemba	লেহেম্বা	lehembaup.thakurgaon.gov.bd	437
4016	Bachor	বাচোর	bachorup.thakurgaon.gov.bd	437
4017	Kashipur	কাশিপুর	kashipurup.thakurgaon.gov.bd	437
4019	Nonduar	নন্দুয়ার	nonduarup.thakurgaon.gov.bd	437
4020	Gedura	গেদুড়া	geduraup.thakurgaon.gov.bd	438
4021	Amgaon	আমগাঁও	amgaonup.thakurgaon.gov.bd	438
4022	Bakua	বকুয়া	bakuaup.thakurgaon.gov.bd	438
4023	Dangipara	ডাঙ্গীপাড়া	dangiparaup.thakurgaon.gov.bd	438
4024	Haripur	হরিপুর	haripurup.thakurgaon.gov.bd	438
4025	Bhaturia	ভাতুরিয়া	bhaturiaup.thakurgaon.gov.bd	438
4026	Paria	পাড়িয়া	pariaup.thakurgaon.gov.bd	439
4027	Charol	চারোল	charolup.thakurgaon.gov.bd	439
4028	Dhontola	ধনতলা	dhontolaup.thakurgaon.gov.bd	439
4029	Boropalashbari	বড়পলাশবাড়ী	boropalashbariup.thakurgaon.gov.bd	439
4030	Duosuo	দুওসুও	duosuoup.thakurgaon.gov.bd	439
4031	Vanor	ভানোর	vanorup.thakurgaon.gov.bd	439
4032	Amjankhore	আমজানখোর	amjankhoreup.thakurgaon.gov.bd	439
4033	Borobari	বড়বাড়ী	borobariup.thakurgaon.gov.bd	439
4034	Mominpur	মমিনপুর	mominpurup.rangpur.gov.bd	440
4035	Horidebpur	হরিদেবপুর	horidebpurup.rangpur.gov.bd	440
4036	Uttam	উত্তম	uttamup.rangpur.gov.bd	440
4037	Porshuram	পরশুরাম	porshuramup.rangpur.gov.bd	440
4038	Topodhan	তপোধন	topodhanup.rangpur.gov.bd	440
4039	Satgara	সাতগারা	satgaraup.rangpur.gov.bd	440
4040	Rajendrapur	রাজেন্দ্রপুর	rajendrapurup.rangpur.gov.bd	440
4041	Sadwapuskoroni	সদ্যপুস্করনী	sadwapuskoroniup.rangpur.gov.bd	440
4042	Chandanpat	চন্দনপাট	chandanpatup.rangpur.gov.bd	440
4043	Dorshona	দর্শানা	dorshonaup.rangpur.gov.bd	440
4044	Tampat	তামপাট	tampatup.rangpur.gov.bd	440
4045	Betgari	বেতগাড়ী	betgariup.rangpur.gov.bd	441
4046	Kholeya	খলেয়া	kholeyaup.rangpur.gov.bd	441
4047	Borobil	বড়বিল	borobilup.rangpur.gov.bd	441
4048	Kolcondo	কোলকোন্দ	kolcondoup.rangpur.gov.bd	441
4049	Gongachora	গংগাচড়া	gongachoraup.rangpur.gov.bd	441
4050	Gojoghonta	গজঘন্টা	gojoghontaup.rangpur.gov.bd	441
4051	Morneya	মর্ণেয়া	morneyaup.rangpur.gov.bd	441
4052	Alambiditor	আলমবিদিতর	alambiditorup.rangpur.gov.bd	441
4053	Lakkhitari	লক্ষীটারী	lakkhitariup.rangpur.gov.bd	441
4054	Nohali	নোহালী	nohaliup.rangpur.gov.bd	441
4055	Kurshatara	কুর্শা	kurshataraup.rangpur.gov.bd	442
4056	Alampur	আলমপুর	alampurup.rangpur.gov.bd	442
4057	Soyar	সয়ার	soyarup.rangpur.gov.bd	442
4058	Ikorchali	ইকরচালী	ikorchaliup.rangpur.gov.bd	442
4059	Hariarkuthi	হাড়িয়ারকুঠি	hariarkuthiup.rangpur.gov.bd	442
4060	Radhanagar	রাধানগর	radhanagarup.rangpur.gov.bd	443
4061	Gopinathpur	গোপীনাথপুর	gopinathpurup.rangpur.gov.bd	443
4062	Modhupur	মধুপুর	modhupurup.rangpur.gov.bd	443
4063	Kutubpur	কুতুবপুর	kutubpurup.ranpur.gov.bd	443
4064	Bishnapur	বিষ্ণপুর	bishnapurup.rangpur.gov.bd	443
4065	Kalupara	কালুপাড়া	kaluparaup.rangpur.gov.bd	443
4066	Lohanipara	লোহানীপাড়া	lohaniparaup.rangpur.gov.bd	443
4067	Gopalpur	গোপালপুর	gopalpurup.rangpur.gov.bd	443
4068	Damodorpur	দামোদরপুর	damodorpurup.rangpur.gov.bd	443
4069	Ramnathpurupb	রামনাথপুর	ramnathpurupb.rangpur.gov.bd	443
4070	Khoragach	খোরাগাছ	khoragachup.rangpur.gov.bd	444
4071	Ranipukur	রাণীপুকুর	ranipukurup.rangpur.gov.bd	444
4072	Payrabond	পায়রাবন্দ	payrabondup.rangpur.gov.bd	444
4073	Vangni	ভাংনী	vangniup.rangpur.gov.bd	444
4074	Balarhat	বালারহাট	balarhatup.rangpur.gov.bd	444
4075	Kafrikhal	কাফ্রিখাল	kafrikhalup.rangpur.gov.bd	444
4076	Latibpur	লতিবপুর	latibpurup.rangpur.gov.bd	444
4077	Chengmari	চেংমারী	chengmariup.rangpur.gov.bd	444
4078	Moyenpur	ময়েনপুর	moyenpurup.rangpur.gov.bd	444
4079	Baluya Masimpur	বালুয়া মাসিমপুর	baluyamasimpurup.rangpur.gov.bd	444
4080	Borobala	বড়বালা	borobalaup.rangpur.gov.bd	444
4081	Mirzapur	মির্জাপুর	mirzapurup.rangpur.gov.bd	444
4082	Imadpur	ইমাদপুর	imadpurup.rangpur.gov.bd	444
4083	Milonpur	মিলনপুর	milonpurup.rangpur.gov.bd	444
4084	Mgopalpur	গোপালপুর	mgopalpurup.rangpur.gov.bd	444
4086	Boro Hazratpur	বড় হযরতপুর	borohazratpurup.rangpur.gov.bd	444
4087	Chattracol	চৈত্রকোল	chattracolup.rangpur.gov.bd	445
4088	Vendabari	ভেন্ডাবাড়ী	vendabariup.rangpur.gov.bd	445
4089	Borodargah	বড়দরগাহ	borodargahup.rangpur.gov.bd	445
4090	Kumedpur	কুমেদপুর	kumedpurup.rangpur.gov.bd	445
4091	Modankhali	মদনখালী	modankhaliup.rangpur.gov.bd	445
4092	Tukuria	টুকুরিয়া	tukuriaup.rangpur.gov.bd	445
4093	Boro Alampur	বড় আলমপুর	boroalampurup.rangpur.gov.bd	445
4094	Raypur	রায়পুর	raypurup.rangpur.gov.bd	445
4095	Pirgonj	পীরগঞ্জ	pirgonjup.rangpur.gov.bd	445
4096	Shanerhat	শানেরহাট	shanerhatup.rangpur.gov.bd	445
4097	Mithipur	মিঠিপুর	mithipurup.rangpur.gov.bd	445
4098	Ramnathpur	রামনাথপুর	ramnathpurup1.rangpur.gov.bd	445
4099	Chattra	চতরা	chattraup.rangpur.gov.bd	445
4100	Kabilpur	কাবিলপুর	kabilpurup.rangpur.gov.bd	445
4101	Pachgachi	পাঁচগাছী	pachgachiup.rangpur.gov.bd	445
4102	Sarai	সারাই	saraiup.rangpur.gov.bd	446
4103	Balapara	বালাপাড়া	balaparaup.rangpur.gov.bd	446
4104	Shahidbag	শহীদবাগ	shahidbagup.rangpur.gov.bd	446
4105	Haragach	হারাগাছ	haragachup.rangpur.gov.bd	446
4106	Tepamodhupur	টেপামধুপুর	tepamodhupurup.rangpur.gov.bd	446
4107	Kurshaupk	কুর্শা	kurshaupk.rangpur.gov.bd	446
4108	Kollyani	কল্যাণী	kollyaniup.rangpur.gov.bd	447
4109	Parul	পারুল	parulup.rangpur.gov.bd	447
4110	Itakumari	ইটাকুমারী	itakumariup.rangpur.gov.bd	447
4111	Saula	ছাওলা	saulaup.rangpur.gov.bd	447
4112	Kandi	কান্দি	kandiup.rangpur.gov.bd	447
4113	Pirgacha	পীরগাছা	pirgachaup.rangpur.gov.bd	447
4114	Annodanagar	অন্নদানগর	annodanagarup.rangpur.gov.bd	447
4115	Tambulpur	তাম্বুলপুর	tambulpurup.rangpur.gov.bd	447
4116	Koikuri	কৈকুড়ী	koikuriup.rangpur.gov.bd	447
4117	Holokhana	হলোখানা	holokhanaup.kurigram.gov.bd	448
4118	Ghogadhoh	ঘোগাদহ	ghogadhohup.kurigram.gov.bd	448
4119	Belgacha	বেলগাছা	belgachaup.kurigram.gov.bd	448
4120	Mogolbasa	মোগলবাসা	mogolbasaup.kurigram.gov.bd	448
4121	Panchgachi	পাঁচগাছি	panchgachiup.kurigram.gov.bd	448
4122	Jatrapur	যাত্রাপুর	jatrapurup.kurigram.gov.bd	448
4123	Kanthalbari	কাঁঠালবাড়ী	kanthalbariup.kurigram.gov.bd	448
4124	Bhogdanga	ভোগডাঙ্গা	bhogdangaup.kurigram.gov.bd	448
4125	Ramkhana	রামখানা	ramkhanaup.kurigram.gov.bd	449
4126	Raigonj	রায়গঞ্জ	raigonjup.kurigram.gov.bd	449
4127	Bamondanga	বামনডাঙ্গা	bamondangaup.kurigram.gov.bd	449
4128	Berubari	বেরুবাড়ী	berubariup.kurigram.gov.bd	449
4129	Sontaspur	সন্তোষপুর	sontaspurup.kurigram.gov.bd	449
4130	Hasnabad	হাসনাবাদ	hasnabadup.kurigram.gov.bd	449
4131	Newyashi	নেওয়াশী	newyashiup.kurigram.gov.bd	449
4132	Bhitorbond	ভিতরবন্দ	bhitorbondup.kurigram.gov.bd	449
4133	Kaligonj	কালীগঞ্জ	kaligonjup.kurigram.gov.bd	449
4134	Noonkhawa	নুনখাওয়া	noonkhawaup.kurigram.gov.bd	449
4136	Kedar	কেদার	kedarup.kurigram.gov.bd	449
4137	Kachakata	কঁচাকাঁটা	kachakataup.kurigram.gov.bd	449
4138	Bollobherkhas	বল্লভেরখাস	bollobherkhasup.kurigram.gov.bd	449
4139	Pathordubi	পাথরডুবি	pathordubiup.kurigram.gov.bd	450
4140	Shilkhuri	শিলখুড়ি	shilkhuriup.kurigram.gov.bd	450
4141	Tilai	তিলাই	tilaiup.kurigram.gov.bd	450
4142	Paikarchara	পাইকেরছড়া	paikarcharaup.kurigram.gov.bd	450
4143	Bhurungamari	ভূরুঙ্গামারী	bhurungamariup.kurigram.gov.bd	450
4144	Joymonirhat	জয়মনিরহাট	joymonirhatup.kurigram.gov.bd	450
4145	Andharirjhar	আন্ধারীরঝাড়	andharirjharup.kurigram.gov.bd	450
4147	Bangasonahat	বঙ্গসোনাহাট	bangasonahatup.kurigram.gov.bd	450
4148	Boldia	বলদিয়া	boldiaup.kurigram.gov.bd	450
4149	Nawdanga	নাওডাঙ্গা	nawdangaup.kurigram.gov.bd	451
4150	Shimulbari	শিমুলবাড়ী	shimulbariup.kurigram.gov.bd	451
4151	Phulbari	ফুলবাড়ী	phulbariup.kurigram.gov.bd	451
4152	Baravita	বড়ভিটা	baravitaup.kurigram.gov.bd	451
4153	Bhangamor	ভাঙ্গামোড়	bhangamorup.kurigram.gov.bd	451
4154	Kashipur	কাশিপুর	kashipurup.kurigram.gov.bd	451
4155	Chinai	ছিনাই	chinaiup.kurigram.gov.bd	452
4156	Rajarhat	রাজারহাট	rajarhatup.kurigram.gov.bd	452
4157	Nazimkhan	নাজিমখাঁন	nazimkhanup.kurigram.gov.bd	452
4158	Gharialdanga	ঘড়িয়ালডাঙ্গা	gharialdangaup.kurigram.gov.bd	452
4159	Chakirpashar	চাকিরপশার	chakirpasharup.kurigram.gov.bd	452
4160	Biddanondo	বিদ্যানন্দ	biddanondoup.kurigram.gov.bd	452
4161	Umarmajid	উমর মজিদ	umarmajidup.kurigram.gov.bd	452
4162	Daldalia	দলদলিয়া	daldaliaup.kurigram.gov.bd	453
4163	Durgapur	দুর্গাপুর	durgapurup.kurigram.gov.bd	453
4165	Buraburi	বুড়াবুড়ী	buraburiup.kurigram.gov.bd	453
4166	Dharanibari	ধরণীবাড়ী	dharanibariup.kurigram.gov.bd	453
4167	Dhamsreni	ধামশ্রেণী	dhamsreniup.kurigram.gov.bd	453
4168	Gunaigas	গুনাইগাছ	gunaigasup.kurigram.gov.bd	453
4169	Bazra	বজরা	bazraup.kurigram.gov.bd	453
4170	Tobockpur	তবকপুর	tobockpurup.kurigram.gov.bd	453
4171	Hatia	হাতিয়া	hatiaup.kurigram.gov.bd	453
4172	Begumgonj	বেগমগঞ্জ	begumgonjup.kurigram.gov.bd	453
4173	Shahabiar Alga	সাহেবের আলগা	shahabiaralgaup.kurigram.gov.bd	453
4174	Thetrai	থেতরাই	thetraiup.kurigram.gov.bd	453
4175	Ranigonj	রাণীগঞ্জ	ranigonjup.kurigram.gov.bd	454
4177	Thanahat	থানাহাট	thanahatup.kurigram.gov.bd	454
4178	Ramna	রমনা	ramnaup.kurigram.gov.bd	454
4179	Chilmari	চিলমারী	chilmariup.kurigram.gov.bd	454
4180	Austomirchar	অষ্টমীর চর	austomircharup.kurigram.gov.bd	454
4181	Dadevanga	দাঁতভাঙ্গা	dadevangaup.kurigram.gov.bd	455
4182	Shoulemari	শৌলমারী	shoulemariup.kurigram.gov.bd	455
4183	Bondober	বন্দবেড়	bondoberup.kurigram.gov.bd	455
4184	Rowmari	রৌমারী	rowmariup.kurigram.gov.bd	455
4185	Jadurchar	যাদুরচর	jadurcharup.kurigram.gov.bd	455
4186	Rajibpur	রাজিবপুর	rajibpurup.kurigram.gov.bd	456
4187	Kodalkati	কোদালকাটি	kodalkatiup.kurigram.gov.bd	456
4188	Mohongonj	মোহনগঞ্জ	mohongonjup.kurigram.gov.bd	456
4189	Kamararchor	কামারের চর	kamararchorup.sherpur.gov.bd	457
4190	Chorsherpur	চরশেরপুর	chorsherpurup.sherpur.gov.bd	457
4191	Bajitkhila	বাজিতখিলা	bajitkhilaup.sherpur.gov.bd	457
4192	Gajir Khamar	গাজির খামার	gajirkhamarup.sherpur.gov.bd	457
4193	Dhola	ধলা	dholaup.sherpur.gov.bd	457
4194	Pakuriya	পাকুরিয়া	pakuriyaup.sherpur.gov.bd	457
4195	Vatshala	ভাতশালা	vatshalaup.sherpur.gov.bd	457
4196	Losmonpur	লছমনপুর	losmonpurup.sherpur.gov.bd	457
4197	Rouha	রৌহা	rouhaup.sherpur.gov.bd	457
4198	Kamariya	কামারিয়া	kamariyaup.sherpur.gov.bd	457
4199	Chor Mochoriya	চর মোচারিয়া	chormochoriyaup.sherpur.gov.bd	457
4200	Chorpokhimari	চর পক্ষীমারি	chorpokhimariup.sherpur.gov.bd	457
4202	Balairchar	বলাইরচর	balaircharup.sherpur.gov.bd	457
4203	Puraga	পোড়াগাও	puragauup.sherpur.gov.bd	458
4204	Nonni	নন্নী	nonniup.sherpur.gov.bd	458
4205	Morichpuran	মরিচপুরাণ	morichpuranup.sherpur.gov.bd	458
4206	Rajnogor	রাজনগর	rajnogorup.sherpur.gov.bd	458
4207	Nayabil	নয়াবীল	nayabilup.sherpur.gov.bd	458
4208	Ramchondrokura	রামচন্দ্রকুড়া	ramchondrokuraup.sherpur.gov.bd	458
4209	Kakorkandhi	কাকরকান্দি	kakorkandhiup.sherpur.gov.bd	458
4210	Nalitabari	নালিতাবাড়ী	nalitabariup.sherpur.gov.bd	458
4211	Juganiya	যোগনীয়া	juganiyaup.sherpur.gov.bd	458
4212	Bagber	বাঘবেড়	bagberup.sherpur.gov.bd	458
4213	Koloshpar	কলসপাড়	koloshparup.sherpur.gov.bd	458
4214	Rupnarayankura	রূপনারায়নকুড়া	rupnarayankuraup.sherpur.gov.bd	458
4215	Ranishimul	রানীশিমুল	ranishimulup.sherpur.gov.bd	459
4216	Singabaruna	সিংগাবরুনা	singabarunaup.sherpur.gov.bd	459
4217	Kakilakura	কাকিলাকুড়া	kakilakuraup.sherpur.gov.bd	459
4218	Tatihati	তাতীহাটি	tatihatiup.sherpur.gov.bd	459
4219	Gosaipur	গোশাইপুর	gosaipurup.sherpur.gov.bd	459
4220	Sreebordi	শ্রীবরদী	sreebordiup.sherpur.gov.bd	459
4221	Bhelua	ভেলুয়া	bheluaup.sherpur.gov.bd	459
4222	Kharia Kazirchar	খড়িয়া কাজিরচর	khariakazircharup.sherpur.gov.bd	459
4223	Kurikahonia	কুড়িকাহনিয়া	kurikahoniaup.sherpur.gov.bd	459
4224	Garjaripa	গড়জরিপা	garjaripaup.sherpur.gov.bd	459
4225	Gonopoddi	গণপদ্দী	gonopoddiup.sherpur.gov.bd	460
4226	Nokla	নকলা	noklaup.sherpur.gov.bd	460
4227	Urpha	উরফা	urphaup.sherpur.gov.bd	460
4228	Gourdwar	গৌড়দ্বার	gourdwarup.sherpur.gov.bd	460
4229	Baneshwardi	বানেশ্বর্দী	baneshwardiup.sherpur.gov.bd	460
4230	Pathakata	পাঠাকাটা	pathakataup.sherpur.gov.bd	460
4231	Talki	টালকী	talkiup.sherpur.gov.bd	460
4232	Choraustadhar	চরঅষ্টধর	choraustadharup.sherpur.gov.bd	460
4233	Chandrakona	চন্দ্রকোনা	chandrakonaup.sherpur.gov.bd	460
4234	Kansa	কাংশা	kansaup.sherpur.gov.bd	461
4235	Dansail	ধানশাইল	dansailup.sherpur.gov.bd	461
4236	Nolkura	নলকুড়া	nolkuraup.sherpur.gov.bd	461
4237	Gouripur	গৌরিপুর	gouripurup.sherpur.gov.bd	461
4238	Jhenaigati	ঝিনাইগাতী	jhenaigatiup.sherpur.gov.bd	461
4239	Hatibandha	হাতিবান্দা	hatibandhaup.sherpur.gov.bd	461
4240	Malijhikanda	মালিঝিকান্দা	malijhikandaup.sherpur.gov.bd	461
4242	Naogaon	নাওগাঁও	naogaonup.mymensingh.gov.bd	462
4243	Putijana	পুটিজানা	putijanaup.mymensingh.gov.bd	462
4244	Kushmail	কুশমাইল	kushmailup.mymensingh.gov.bd	462
4245	Fulbaria	ফুলবাড়ীয়া	fulbariaup.mymensingh.gov.bd	462
4246	Bakta	বাক্তা	baktaup.mymensingh.gov.bd	462
4247	Rangamatia	রাঙ্গামাটিয়া	rangamatiaup.mymensingh.gov.bd	462
4248	Enayetpur	এনায়েতপুর	enayetpurup.mymensingh.gov.bd	462
4249	Kaladaha	কালাদহ	kaladahaup.mymensingh.gov.bd	462
4250	Radhakanai	রাধাকানাই	radhakanaiup.mymensingh.gov.bd	462
4251	Asimpatuli	আছিমপাটুলী	asimpatuliup.mymensingh.gov.bd	462
4252	Vobanipur	ভবানীপুর	vobanipurup.mymensingh.gov.bd	462
4254	Dhanikhola	ধানীখোলা	dhanikholaup.mymensingh.gov.bd	463
4255	Bailor	বৈলর	bailorup.mymensingh.gov.bd	463
4256	Kanthal	কাঁঠাল	kanthalup.mymensingh.gov.bd	463
4257	Kanihari	কানিহারী	kanihariup.mymensingh.gov.bd	463
4258	Trishal	ত্রিশাল	trishalup.mymensingh.gov.bd	463
4259	Harirampur	হরিরামপুর	harirampurup.mymensingh.gov.bd	463
4260	Sakhua	সাখুয়া	www.sakhuaup.mymensingh.gov.bd	463
4261	Balipara	বালিপাড়া	baliparaup.mymensingh.gov.bd	463
4262	Mokshapur	মোক্ষপুর	mokshapurup.mymensingh.gov.bd	463
4263	Mathbari	মঠবাড়ী	mathbariup.mymensingh.gov.bd	463
4264	Amirabari	আমিরাবাড়ী	amirabariup.mymensingh.gov.bd	463
4265	Rampur	রামপুর	rampurup.mymensingh.gov.bd	463
4266	Uthura	উথুরা	uthuraup.mymensingh.gov.bd	464
4267	Meduari	মেদুয়ারী	meduariup.mymensingh.gov.bd	464
4268	Varadoba	ভরাডোবা	varadobaup.mymensingh.gov.bd	464
4269	Dhitpur	ধীতপুর	dhitpurup.mymensingh.gov.bd	464
4270	Dakatia	ডাকাতিয়া	dakatiaup.mymensingh.gov.bd	464
4271	Birunia	বিরুনিয়া	biruniaup.mymensingh.gov.bd	464
4272	Bhaluka	ভালুকা	bhalukaup.mymensingh.gov.bd	464
4273	Mallikbari	মল্লিকবাড়ী	mallikbariup.mymensingh.gov.bd	464
4274	Kachina	কাচিনা	kachinaup.mymensingh.gov.bd	464
4275	Habirbari	হবিরবাড়ী	habirbariup.mymensingh.gov.bd	464
4276	Rajoi	রাজৈ	rajoiup.mymensingh.gov.bd	464
4277	Dulla	দুল্লা	dullaup.mymensingh.gov.bd	465
4278	Borogram	বড়গ্রাম	borogramup.mymensingh.gov.bd	465
4279	Tarati	তারাটি	taratiup.mymensingh.gov.bd	465
4280	Kumargata	কুমারগাতা	kumargataup.mymensingh.gov.bd	465
4281	Basati	বাশাটি	basatiup.mymensingh.gov.bd	465
4282	Mankon	মানকোন	mankonup.mymensingh.gov.bd	465
4283	Ghoga	ঘোগা	ghogaup.mymensingh.gov.bd	465
4284	Daogaon	দাওগাঁও	daogaonup.mymensingh.gov.bd	465
4285	Kashimpur	কাশিমপুর	kashimpurup.mymensingh.gov.bd	465
4286	Kheruajani	খেরুয়াজানী	kheruajaniup.mymensingh.gov.bd	465
4287	Austadhar	অষ্টধার	austadharup.mymensingh.gov.bd	466
4288	Bororchar	বোররচর	bororcharup.mymensingh.gov.bd	466
4289	Dapunia	দাপুনিয়া	dapuniaup.mymensingh.gov.bd	466
4290	Aqua	আকুয়া	aquaup.mymensingh.gov.bd	466
4291	Khagdohor	খাগডহর	khagdohorup.mymensingh.gov.bd	466
4292	Charnilaxmia	চরনিলক্ষিয়া	charnilaxmiaup.mymensingh.gov.bd	466
4293	Kushtia	কুষ্টিয়া	kushtiaup.mymensingh.gov.bd	466
4294	Paranganj	পরানগঞ্জ	paranganjup.mymensingh.gov.bd	466
4295	Sirta	সিরতা	sirtaup.mymensingh.gov.bd	466
4296	Char Ishwardia	চর ঈশ্বরদিয়া	charishwardiaup.mymensingh.gov.bd	466
4297	Ghagra	ঘাগড়া	ghagraup.mymensingh.gov.bd	466
4298	Vabokhali	ভাবখালী	vabokhaliup.mymensingh.gov.bd	466
4299	Boyra	বয়ড়া	boyraup.mymensingh.gov.bd	466
4300	Dakshin Maijpara	দক্ষিণ মাইজপাড়া	dakshinmaijparaup.mymensingh.gov.bd	467
4301	Gamaritola	গামারীতলা	gamaritolaup.mymensingh.gov.bd	467
4302	Dhobaura	ধোবাউড়া	dhobauraup.mymensingh.gov.bd	467
4304	Goatala	গোয়াতলা	goatalaup.mymensingh.gov.bd	467
4305	Ghoshgaon	ঘোষগাঁও	ghoshgaonup.mymensingh.gov.bd	467
4306	Baghber	বাঘবেড়	baghberup.mymensingh.gov.bd	467
4307	Rambhadrapur	রামভদ্রপুর	rambhadrapurup.mymensingh.gov.bd	468
4308	Sondhara	ছনধরা	sondharaup.mymensingh.gov.bd	468
4309	Vaitkandi	ভাইটকান্দি	vaitkandiup.mymensingh.gov.bd	468
4310	Singheshwar	সিংহেশ্বর	singheshwarup.mymensingh.gov.bd	468
4311	Phulpur	ফুলপুর	phulpurup.mymensingh.gov.bd	468
4312	Banihala	বানিহালা	banihalaup.mymensingh.gov.bd	474
4313	Biska	বিস্কা	biskaup.mymensingh.gov.bd	474
4314	Baola	বওলা	baolaup.mymensingh.gov.bd	468
4315	Payari	পয়ারী	payariup.mymensingh.gov.bd	468
4316	Balia	বালিয়া	baliaup.mymensingh.gov.bd	468
4317	Rahimganj	রহিমগঞ্জ	rahimganjup.mymensingh.gov.bd	468
4318	Balikha	বালিখা	balikhaup.mymensingh.gov.bd	474
4319	Kakni	কাকনী	kakniup.mymensingh.gov.bd	474
4321	Rupasi	রূপসী	rupasiup.mymensingh.gov.bd	468
4322	Tarakanda	তারাকান্দা	tarakandaup.mymensingh.gov.bd	474
4323	Galagaon	গালাগাঁও	galagaonup.mymensingh.gov.bd	474
4324	Kamargaon	কামারগাঁও	kamargaonup.mymensingh.gov.bd	474
4325	Kamaria	কামারিয়া	kamariaup.mymensingh.gov.bd	474
4326	Rampur	রামপুর	rampurup2.mymensingh.gov.bd	474
4327	Bhubankura	ভূবনকুড়া	bhubankuraup.mymensingh.gov.bd	469
4328	Jugli	জুগলী	jugliup.mymensingh.gov.bd	469
4329	Kaichapur	কৈচাপুর	kaichapurup.mymensingh.gov.bd	469
4330	Haluaghat	হালুয়াঘাট	haluaghatup.mymensingh.gov.bd	469
4331	Gazirbhita	গাজিরভিটা	gazirbhitaup.mymensingh.gov.bd	469
4332	Bildora	বিলডোরা	bildoraup.mymensingh.gov.bd	469
4333	Sakuai	শাকুয়াই	sakuaiup.mymensingh.gov.bd	469
4334	Narail	নড়াইল	narailup.mymensingh.gov.bd	469
4335	Dhara	ধারা	dharaup.mymensingh.gov.bd	469
4336	Dhurail	ধুরাইল	dhurailup.mymensingh.gov.bd	469
4337	Amtoil	আমতৈল	amtoilup.mymensingh.gov.bd	469
4338	Swadeshi	স্বদেশী	swadeshiup.mymensingh.gov.bd	469
4339	Sahanati	সহনাটি	sahanatiup.mymensingh.gov.bd	470
4340	Achintapur	অচিন্তপুর	achintapurup.mymensingh.gov.bd	470
4341	Mailakanda	মইলাকান্দা	mailakandaup.mymensingh.gov.bd	470
4342	Bokainagar	বোকাইনগর	bokainagarup.mymensingh.gov.bd	470
4343	Gouripur	গৌরীপুর	gouripurup.mymensingh.gov.bd	470
4344	Maoha	মাওহা	maohaup.mymensingh.gov.bd	470
4346	Douhakhola	ডৌহাখলা	douhakholaup.mymensingh.gov.bd	470
4347	Bhangnamari	ভাংনামারী	bhangnamariup.mymensingh.gov.bd	470
4348	Sidhla	সিধলা	sidhlaup.mymensingh.gov.bd	470
4349	Rasulpur	রসুলপুর	rasulpurup.mymensingh.gov.bd	471
4350	Barobaria	বারবারিয়া	barobariaup.mymensingh.gov.bd	471
4351	Charalgi	চরআলগী	charalgiup.mymensingh.gov.bd	471
4352	Saltia	সালটিয়া	saltiaup.mymensingh.gov.bd	471
4353	Raona	রাওনা	raonaup.mymensingh.gov.bd	471
4354	Longair	লংগাইর	longairup.mymensingh.gov.bd	471
4355	Paithol	পাইথল	paitholup.mymensingh.gov.bd	471
4356	Gafargaon	গফরগাঁও	gafargaonup.mymensingh.gov.bd	471
4357	Josora	যশরা	josoraup.mymensingh.gov.bd	471
4358	Moshakhali	মশাখালী	moshakhaliup.mymensingh.gov.bd	471
4359	Panchbagh	পাঁচবাগ	panchbaghup.mymensingh.gov.bd	471
4360	Usthi	উস্থি	usthiup.mymensingh.gov.bd	471
4361	Dotterbazar	দত্তেরবাজার	dotterbazarup.mymensingh.gov.bd	471
4362	Niguari	নিগুয়ারী	niguariup.mymensingh.gov.bd	471
4363	Tangabo	টাংগাব	tangaboup.mymensingh.gov.bd	471
4364	Iswarganj	ঈশ্বরগঞ্জ	iswarganjup.mymensingh.gov.bd	472
4365	Sarisha	সরিষা	sarishaup.mymensingh.gov.bd	472
4366	Sohagi	সোহাগী	sohagiup.mymensingh.gov.bd	472
4367	Atharabari	আঠারবাড়ী	atharabariup.mymensingh.gov.bd	472
4368	Rajibpur	রাজিবপুর	rajibpurup.mymensingh.gov.bd	472
4369	Maijbagh	মাইজবাগ	maijbaghup.mymensingh.gov.bd	472
4370	Magtula	মগটুলা	magtulaup.mymensingh.gov.bd	472
4371	Jatia	জাটিয়া	jatiaup.mymensingh.gov.bd	472
4372	Uchakhila	উচাখিলা	uchakhilaup.mymensingh.gov.bd	472
4373	Tarundia	তারুন্দিয়া	tarundiaup.mymensingh.gov.bd	472
4374	Barahit	বড়হিত	barahitup.mymensingh.gov.bd	472
4375	Batagoir	বেতাগৈর	batagoirup.mymensingh.gov.bd	473
4376	Nandail	নান্দাইল	nandailup.mymensingh.gov.bd	473
4377	Chandipasha	চন্ডীপাশা	chandipashaup.mymensingh.gov.bd	473
4378	Gangail	গাংগাইল	gangailup.mymensingh.gov.bd	473
4379	Rajgati	রাজগাতী	rajgatiup.mymensingh.gov.bd	473
4380	Muajjempur	মোয়াজ্জেমপুর	muajjempurup.mymensingh.gov.bd	473
4381	Sherpur	শেরপুর	sherpurup.mymensingh.gov.bd	473
4382	Singroil	সিংরইল	singroilup.mymensingh.gov.bd	473
4383	Achargaon	আচারগাঁও	achargaonup.mymensingh.gov.bd	473
4384	Mushulli	মুশুল্লী	mushulliup.mymensingh.gov.bd	473
4385	Kharua	খারুয়া	kharuaup.mymensingh.gov.bd	473
4386	Jahangirpur	জাহাঙ্গীরপুর	jahangirpurup.mymensingh.gov.bd	473
4387	Kendua	কেন্দুয়া	kenduaup.jamalpur.gov.bd	475
4388	Sharifpur	শরিফপুর	sharifpurup.jamalpur.gov.bd	475
4389	Laxirchar	লক্ষীরচর	laxircharup.jamalpur.gov.bd	475
4390	Tolshirchar	তুলশীরচর	tolshircharup.jamalpur.gov.bd	475
4391	Itail	ইটাইল	itailup.jamalpur.gov.bd	475
4392	Narundi	নরুন্দী	narundiup.jamalpur.gov.bd	475
4393	Ghorada	ঘোড়াধাপ	ghoradapup.jamalpur.gov.bd	475
4394	Bashchara	বাশঁচড়া	bashcharaup.jamalpur.gov.bd	475
4395	Ranagacha	রানাগাছা	ranagachaup.jamalpur.gov.bd	475
4396	Sheepur	শ্রীপুর	sheepurup.jamalpur.gov.bd	475
4397	Shahbajpur	শাহবাজপুর	shahbajpurup.jamalpur.gov.bd	475
530	Hatila (West)	হাটিলা (পশ্চিম)	hatilawestup.chandpur.gov.bd	57
532	Gandharbapur (South)	গন্ধর্ব্যপুর (দক্ষিণ)	gandharbapursouthup.chandpur.gov.bd	57
533	Satnal	ষাটনল	satnalup.chandpur.gov.bd	58
535	Sadullapur	সাদুল্ল্যাপুর	sadullapurup.chandpur.gov.bd	58
540	Jahirabad	জহিরাবাদ	jahirabadup.chandpur.gov.bd	58
543	Farajikandi	ফরাজীকান্দি	farajikandiup.chandpur.gov.bd	58
590	Charlorench	চর লরেঞ্চ	charlorenchup.lakshmipur.gov.bd	61
591	North Char Ababil	উত্তর চর আবাবিল	northcharababilup.lakshmipur.gov.bd	62
665	Char Patharghata	চর পাথরঘাটা	charpatharghataup.chittagong.gov.bd	68
668	Janglukhain	জঙ্গলখাইন	janglukhainup.chittagong.gov.bd	68
681	Harispur	হরিশপুর	harispurup.chittagong.gov.bd	69
741	Kanchana	কাঞ্চনা	kanchanaup.chittagong.gov.bd	74
742	Amilaisi	আমিলাইশ	amilaisiup.chittagong.gov.bd	74
743	Eochiai	এওচিয়া	eochiaiup.chittagong.gov.bd	74
773	Uttar Madrasha	উত্তর মাদার্শা	uttarmadrashaup.chittagong.gov.bd	76
816	Islampur	ইসলামপুর	islampurup.coxsbazar.gov.bd	80
834	Bamobil Chari	বামু বিলছড়ি	bamobilchariup.coxsbazar.gov.bd	81
1078	Laxshmipur	লক্ষীপুর	laxshmipurup.pabna.gov.bd	118
4399	Mesta	মেষ্টা	mestaup.jamalpur.gov.bd	475
4400	Digpait	দিগপাইত	digpaitup.jamalpur.gov.bd	475
4401	Rashidpur	রশিদপুর	rashidpurup.jamalpur.gov.bd	475
4402	Durmot	দুরমুট	durmotup.jamalpur.gov.bd	476
4403	Kulia	কুলিয়া	kuliaup.jamalpur.gov.bd	476
4404	Mahmudpur	মাহমুদপুর	mahmudpurup.jamalpur.gov.bd	476
4405	Nangla	নাংলা	nanglaup.jamalpur.gov.bd	476
4406	Nayanagar	নয়ানগর	nayanagarup.jamalpur.gov.bd	476
4407	Adra	আদ্রা	adraup.jamalpur.gov.bd	476
4408	Charbani Pakuria	চরবানী পাকুরিয়া	charbanipakuriaup.jamalpur.gov.bd	476
4409	Fulkucha	ফুলকোচা	fulkuchaup.jamalpur.gov.bd	476
4410	Ghuserpara	ঘোষেরপাড়া	ghuserparaup.jamalpur.gov.bd	476
4411	Jhaugara	ঝাউগড়া	jhaugaraup.jamalpur.gov.bd	476
4412	Shuampur	শ্যামপুর	shuampurup.jamalpur.gov.bd	476
4413	Kulkandi	কুলকান্দি	kulkandiup.jamalpur.gov.bd	477
4414	Belghacha	বেলগাছা	belghachaup.jamalpur.gov.bd	477
4415	Chinaduli	চিনাডুলী	chinaduliup.jamalpur.gov.bd	477
4416	Shapdari	সাপধরী	shapdariup.jamalpur.gov.bd	477
4417	Noarpara	নোয়ারপাড়া	noarparaup.jamalpur.gov.bd	477
4418	Islampur	ইসলামপুর	islampurup.jamalpur.gov.bd	477
4419	Partharshi	পাথশী	partharshiup.jamalpur.gov.bd	477
4420	Palabandha	পলবান্ধা	palabandhaup.jamalpur.gov.bd	477
4421	Gualerchar	গোয়ালেরচর	gualercharup.jamalpur.gov.bd	477
4422	Gaibandha	গাইবান্ধা	gaibandhaup.jamalpur.gov.bd	477
4423	Charputimari	চরপুটিমারী	charputimariup.jamalpur.gov.bd	477
4424	Chargualini	চরগোয়ালীনি	chargualiniup.jamalpur.gov.bd	477
4425	Dungdhara	ডাংধরা	dungdharaup.jamalpur.gov.bd	478
4426	Char Amkhawa	চর আমখাওয়া	charamkhawaup.jamalpur.gov.bd	478
4427	Parram Rampur	পাররাম রামপুর	parramrampurup.jamalpur.gov.bd	478
4428	Hatibanga	হাতীভাঙ্গা	hatibangaup.jamalpur.gov.bd	478
4429	Bahadurabad	বাহাদুরাবাদ	bahadurabadup.jamalpur.gov.bd	478
4430	Chikajani	চিকাজানী	chikajaniup.jamalpur.gov.bd	478
4431	Chukaibari	চুকাইবাড়ী	chukaibariup.jamalpur.gov.bd	478
4432	Dewangonj	দেওয়ানগঞ্জ	dewangonjup.jamalpur.gov.bd	478
4433	Satpoa	সাতপোয়া	satpoaup.jamalpur.gov.bd	479
4434	Pogaldigha	পোগলদিঘা	pogaldighaup.jamalpur.gov.bd	479
4435	Doail	ডোয়াইল	doailup.jamalpur.gov.bd	479
4436	Aona	আওনা	aonaup.jamalpur.gov.bd	479
4437	Pingna	পিংনা	pingnaup.jamalpur.gov.bd	479
4438	Bhatara	ভাটারা	bhataraup.jamalpur.gov.bd	479
4439	Kamrabad	কামরাবাদ	kamrabadup.jamalpur.gov.bd	479
4440	Mahadan	মহাদান	mahadanup.jamalpur.gov.bd	479
4441	Char Pakerdah	চর পাকেরদহ	charpakerdahup.jamalpur.gov.bd	480
4442	Karaichara	কড়ইচড়া	karaicharaup.jamalpur.gov.bd	480
4443	Gunaritala	গুনারীতলা	gunaritalaup.jamalpur.gov.bd	480
4444	Balijuri	বালিজুড়ী	balijuriup.jamalpur.gov.bd	480
4445	Jorekhali	জোড়খালী	jorekhaliup.jamalpur.gov.bd	480
4446	Adarvita	আদারভিটা	adarvitaup.jamalpur.gov.bd	480
4447	Sidhuli	সিধুলী	sidhuliup.jamalpur.gov.bd	480
4450	Battajore	বাট্রাজোড়	battajoreup.jamalpur.gov.bd	481
4451	Shadurpara	সাধুরপাড়া	shadurparaup.jamalpur.gov.bd	481
1273	Auchpara	আউচপাড়া	auchparaup.rajshahi.gov.bd	142
1340	Raikali	রায়কালী	raikaliup.joypurhat.gov.bd	150
1360	Amdai	আমদই	amdaiup.joypurhat.gov.bd	154
1438	Patichrara	পাটিচড়া	7nopatichraraup.naogaon.gov.bd	162
1519	Manoharpur	মনোহরপুর	manoharpurup.jessore.gov.bd	171
1534	Sreedharpur	শ্রীধরপুর	sreedharpurup.jessore.gov.bd	172
1599	Putkhali	পুটখালী	putkhaliup5.jessore.gov.bd	178
1682	Dariapur	দারিয়াপুর	dariapurup.meherpur.gov.bd	186
1763	Natipota	নতিপোতা	natipota.chuadanga.gov.bd	194
1766	Perkrishnopur Madna	পারকৃষ্ণপুর মদনা	perkrishnopurmadna.chuadanga.gov.bd	194
1851	Kadirpara	কাদিরপাড়া	kadirparaup.magura.gov.bd	203
1929	Dakop	দাকোপ	www.dakopup.khulna.gov.bd	213
1931	Kamarkhola	কামারখোলা	www.kamarkholaup.khulna.gov.bd	213
2007	Burrirdangga	বুড়িরডাঙ্গা	burrirdanggaup.bagerhat.gov.bd	222
2085	Manderbaria	মান্দারবাড়ীয়া	manderbariaup.jhenaidah.gov.bd	229
2089	Gabharamchandrapur	গাভারামচন্দ্রপুর	gabharamchandrapurup.jhalakathi.gov.bd	230
2270	Chandpasha	চাঁদপাশা	chandpashaup.barisal.gov.bd	251
2347	Aslampur	আছলামপুর	aslampurup.bhola.gov.bd	261
2370	South Joy Nagar	দক্ষিন জয়নগর	southjoynagarup.bhola.gov.bd	262
2425	Patharghata	পাথরঘাটা	patharghataup.barguna.gov.bd	270
2469	Islampur Paschim	ইসলামপুর পশ্চিম	islampurpaschimup.sylhet.gov.bd	275
2500	Charikatha	চারিকাটা	charikathaup.sylhet.gov.bd	279
2501	Darbast	দরবস্ত	darbastup.sylhet.gov.bd	279
2506	Lakshiprashad Pashim	লক্ষীপ্রাসাদ পশ্চিম	lakshiprashadpashimup.sylhet.gov.bd	280
2579	Ekatuna	একাটুনা	ekatunaup.moulvibazar.gov.bd	288
2633	Baniachong North East	বানিয়াচং উত্তর পূর্ব	baniachongnortheastup.habiganj.gov.bd	295
2636	Baniachong South West	বানিয়াচং দক্ষিণ পশ্চিম	baniachongsouthwestup.habiganj.gov.bd	295
2657	Paikpara	পাইকপাড়া	paikparaup.habiganj.gov.bd	297
2711	Gobindganj-Syedergaon	গোবিন্দগঞ্জ-সৈদেরগাঁও	gobindganjsyedergaonup.sunamganj.gov.bd	303
2733	Dohalia	দোহালিয়া	dohaliaup.sunamganj.gov.bd	305
2735	Boglabazar	বোগলাবাজার	boglabazarup.sunamganj.gov.bd	305
2813	Amirganj	আমিরগঞ্জ	amirganjup.narsingdi.gov.bd	315
2889	Rudrakar	রুদ্রকর	rudrakarup.shariatpur.gov.bd	322
2968	Baktaboli	বক্তাবলী	baktaboliup.narayanganj.gov.bd	330
2972	Golakandail	গোলাকান্দাইল	golakandailup.narayanganj.gov.bd	331
3119	Kalika Prashad	কালিকা প্রসাদ	kalikaprashadup.kishoreganj.gov.bd	347
3136	Hosendi	হোসেনদি	hosendiup.kishoreganj.gov.bd	350
3143	Egarasindur	ইজারাসিন্দুর	egarasindurup.kishoreganj.gov.bd	350
3177	Maijchar9	মাইজচর	maijchar9up.kishoreganj.gov.bd	354
3190	Khyerpur-Abdullahpur	খয়েরপুর-আব্দুল্লাপুর	khyerpurabdullahpurup.kishoreganj.gov.bd	355
3215	Lacharagonj	লেছড়াগঞ্জ	lacharagonjup.manikganj.gov.bd	358
3221	Baliyati	বালিয়াটি	baliyatiup.manikganj.gov.bd	359
3248	Ulayel	উলাইল	ulayelup.manikganj.gov.bd	362
3269	Jamirta	জার্মিতা	jamirtaup.manikganj.gov.bd	364
3296	Rowail	রোয়াইল	rowailup.dhaka.gov.bd	366
3300	Kalatia	কলাতিয়া	kalatiaup.dhaka.gov.bd	367
3389	Abdullapur	আব্দুল্লাপুর	abdullapurup.munshiganj.gov.bd	375
3424	Sarisha	সরিষা	sarishaup.rajbari.gov.bd	378
3444	Bahadurpur	বাহাদুরপুর	bahadurpurup.madaripur.gov.bd	381
3455	Khoajpur	খোয়াজপুর	khoajpurup.madaripur.gov.bd	381
3470	Bahertala South	বহেরাতলা দক্ষিণ	bahertalasouthup.madaripur.gov.bd	382
3504	Chandradighalia	চন্দ্রদিঘলিয়া	chandradighaliaup.gopalganj.gov.bd	385
3533	Parulia	পারুলিয়া	paruliaup.gopalganj.gov.bd	386
3542	Sadullapur	সাদুল্লাপুর	sadullapurup.gopalganj.gov.bd	388
3569	Ishangopalpur	ঈশানগোপালপুর	ishangopalpurup.faridpur.gov.bd	390
3599	Char Nasirpur	চর নাসিরপুর	charnasirpurup.faridpur.gov.bd	393
3614	Kodalia Shohidnagar	কোদালিয়া শহিদনগর	kodaliashohidnagarup.faridpur.gov.bd	394
3629	Char Harirampur	চর হরিরামপুর	charharirampurup.faridpur.gov.bd	396
3650	Amarkhana	অমরখানা	amarkhanaup.panchagarh.gov.bd	399
3690	Tentulia	তেতুলিয়া	tentuliaup.panchagarh.gov.bd	403
3692	Joypur	জয়পুর	joypurup.dinajpur.gov.bd	404
3693	Binodnagar	বিনোদনগর	binodnagarup.dinajpur.gov.bd	404
3722	Poliproyagpur	পলিপ্রয়াগপুর	poliproyagpurup.dinajpur.gov.bd	407
3751	Shibnagor	শিবনগর	shibnagorup.dinajpur.gov.bd	411
3774	Shohorgram	শহরগ্রাম	shohorgramup.dinajpur.gov.bd	415
3780	Ranipukur	রাণীপুকুর	ranipukurup.dinajpur.gov.bd	415
3806	Tushbhandar	তুষভান্ডার	tushbhandarup.lalmonirhat.gov.bd	418
3836	Saptibari	সাপ্টিবাড়ী	saptibariup.lalmonirhat.gov.bd	421
3853	Harinchara	হরিণচরা	harincharaup.nilphamari.gov.bd	423
3872	Khutamara	খুটামারা	khutamaraup.nilphamari.gov.bd	425
3896	Chapra Sarnjami	চাপড়া সরঞ্জানী	chaprasarnjami.nilphamari.gov.bd	427
3930	Monohorpur	মনোহরপুর	monohorpurup.gaibandha.gov.bd	430
3948	Talukkanupur	তালুককানুপুর	talukkanupurup.gaibandha.gov.bd	432
3969	Konchibari	কঞ্চিবাড়ী	konchibariup.gaibandha.gov.bd	433
4009	Sengaon	সেনগাঁও	sengaonup.thakurgaon.gov.bd	436
4018	Ratore	রাতোর	ratoreup.thakurgaon.gov.bd	437
4085	Durgapur	দূর্গাপুর	durgapurup.rangpur.gov.bd	444
4135	Narayanpur	নারায়নপুর	narayanpurup.kurigram.gov.bd	449
4146	Char-Bhurungamari	চর-ভূরুঙ্গামারী	charbhurungamariup.kurigram.gov.bd	450
4164	Pandul	পান্ডুল	pandulup.kurigram.gov.bd	453
4176	Nayarhat	নয়ারহাট	nayarhatup.kurigram.gov.bd	454
4201	Betmari Ghughurakandi	বেতমারি ঘুঘুরাকান্দি	betmarighughurakandiup.sherpur.gov.bd	457
4241	Deukhola	দেওখোলা	deukholaup.mymensingh.gov.bd	462
4253	Balian	বালিয়ান	balianup.mymensingh.gov.bd	462
4303	Porakandulia	পোড়াকান্দুলিয়া	porakanduliaup.mymensingh.gov.bd	467
4320	Dhakua	ঢাকুয়া	dhakuaup.mymensingh.gov.bd	474
4345	Ramgopalpur	রামগোপালপুর	ramgopalpurup.mymensingh.gov.bd	470
4398	Titpalla	তিতপল্লা	titpallaup.jamalpur.gov.bd	475
4452	Bakshigonj	বকসীগঞ্জ	bakshigonjup.jamalpur.gov.bd	481
4453	Nilakhia	নিলক্ষিয়া	nilakhiaup.jamalpur.gov.bd	481
4454	Merurchar	মেরুরচর	merurcharup.jamalpur.gov.bd	481
4455	Asma	আসমা	asma.netrokona.gov.bd	482
4456	Chhiram	চিরাম	chhiram.netrokona.gov.bd	482
4457	Baushi	বাউশী	baushiup.netrokona.gov.bd	482
4458	Barhatta	বারহাট্টা	barhattaup.netrokona.gov.bd	482
4459	Raypur	রায়পুর	raypurup.netrokona.gov.bd	482
4460	Sahata	সাহতা	sahataup.netrokona.gov.bd	482
4461	Singdha	সিংধা	singdhaup.netrokona.gov.bd	482
4462	Durgapur	দূর্গাপুর	durgapurup.netrokona.gov.bd	483
4463	Kakoirgora	কাকৈরগড়া	kakoirgoraup.netrokona.gov.bd	483
4464	Kullagora	কুল্লাগড়া	kullagoraup.netrokona.gov.bd	483
4465	Chandigarh	চণ্ডিগড়	chandigarhup.netrokona.gov.bd	483
4466	Birisiri	বিরিশিরি	birisiriup.netrokona.gov.bd	483
4467	Bakaljora	বাকলজোড়া	bakaljoraup.netrokona.gov.bd	483
4468	Gawkandia	গাঁওকান্দিয়া	gawkandiaup.netrokona.gov.bd	483
4469	Asujia	আশুজিয়া	asujiaup.netrokona.gov.bd	484
4470	Dalpa	দলপা	dalpaup.netrokona.gov.bd	484
4471	Goraduba	গড়াডোবা	goradubaup.netrokona.gov.bd	484
4472	Gonda	গণ্ডা	gondaup.netrokona.gov.bd	484
4473	Sandikona	সান্দিকোনা	sandikonaup.netrokona.gov.bd	484
4474	Maska	মাসকা	maskaup.netrokona.gov.bd	484
4475	Bolaishimul	বলাইশিমুল	bolaishimulup.netrokona.gov.bd	484
4476	Noapara	নওপাড়া	noaparaup.netrokona.gov.bd	484
4477	Kandiura	কান্দিউড়া	kandiuraup.netrokona.gov.bd	484
4478	Chirang	চিরাং	chirangup.netrokona.gov.bd	484
4479	Roailbari Amtala	রোয়াইলবাড়ী আমতলা	roailbariamtalaup.netrokona.gov.bd	484
4480	Paikura	পাইকুড়া	paikuraup.netrokona.gov.bd	484
4481	Muzafarpur	মোজাফরপুর	muzafarpurup.netrokona.gov.bd	484
4482	Shormushia	স্বরমুশিয়া	shormushiaup.netrokona.gov.bd	485
4483	Shunoi	শুনই	shunoiup.netrokona.gov.bd	485
4484	Lunesshor	লুনেশ্বর	lunesshorup.netrokona.gov.bd	485
4485	Baniyajan	বানিয়াজান	baniyajanup.netrokona.gov.bd	485
4486	Teligati	তেলিগাতী	teligatiup.netrokona.gov.bd	485
4487	Duoj	দুওজ	duojup.netrokona.gov.bd	485
4488	Sukhari	সুখারী	sukhariup.netrokona.gov.bd	485
4489	Fathepur	ফতেপুর	fathepurup.netrokona.gov.bd	486
4490	Nayekpur	নায়েকপুর	nayekpurup.netrokona.gov.bd	486
4491	Teosree	তিয়শ্রী	teosreeup.netrokona.gov.bd	486
4492	Magan	মাঘান	maganup.netrokona.gov.bd	486
4493	Gobindasree	গেবিন্দশ্রী	gobindasreeup.netrokona.gov.bd	486
4494	Madan	মদন	madanup.netrokona.gov.bd	486
4495	Chandgaw	চানগাঁও	chandgawup.netrokona.gov.bd	486
4496	Kytail	কাইটাল	kytailup.netrokona.gov.bd	486
4497	Krishnapur	কৃষ্ণপুর	krishnapurup.netrokona.gov.bd	487
4498	Nogor	নগর	nogorup.netrokona.gov.bd	487
4499	Chakua	চাকুয়া	chakuaup.netrokona.gov.bd	487
4500	Khaliajuri	খালিয়াজুরী	khaliajuriup.netrokona.gov.bd	487
4501	Mendipur	মেন্দিপুর	mendipurup.netrokona.gov.bd	487
4502	Gazipur	গাজীপুর	gazipurup.netrokona.gov.bd	487
4503	Koilati	কৈলাটী	koilatiup.netrokona.gov.bd	488
4504	Najirpur	নাজিরপুর	najirpurup.netrokona.gov.bd	488
4505	Pogla	পোগলা	poglaup.netrokona.gov.bd	488
4506	Kolmakanda	কলমাকান্দা	kolmakandaup.netrokona.gov.bd	488
4507	Rongchati	রংছাতি	rongchatiup.netrokona.gov.bd	488
4508	Lengura	লেংগুরা	lenguraup.netrokona.gov.bd	488
4509	Borokhapon	বড়খাপন	borokhaponup.netrokona.gov.bd	488
4510	Kharnoi	খারনৈ	kharnoiup.netrokona.gov.bd	488
4511	Borokashia Birampur	বড়কাশিয়া বিরামপুর	borokashiabirampurup.netrokona.gov.bd	489
4512	Borotoli Banihari	বড়তলী বানিহারী	borotolibanihariup.netrokona.gov.bd	489
4513	Tetulia	তেতুলিয়া	tetuliaup.netrokona.gov.bd	489
4514	Maghan Siadar	মাঘান সিয়াদার	maghansiadarup.netrokona.gov.bd	489
4515	Somaj Sohildeo	সমাজ সহিলদেও	somajsohildeoup.netrokona.gov.bd	489
4516	Suair	সুয়াইর	suairup.netrokona.gov.bd	489
4517	Gaglajur	গাগলাজুর	gaglajurup.netrokona.gov.bd	489
4518	Khalishaur	খলিশাউড়	khalishaurup.netrokona.gov.bd	490
4519	Ghagra	ঘাগড়া	ghagraup.netrokona.gov.bd	490
4520	Jaria	জারিয়া	jariaup.netrokona.gov.bd	490
4521	Narandia	নারান্দিয়া	narandiaup.netrokona.gov.bd	490
4522	Bishkakuni	বিশকাকুনী	bishkakuniup.netrokona.gov.bd	490
4523	Bairaty	বৈরাটী	bairaty.netrokona.gov.bd	490
4524	Hogla	হোগলা	hoglaup.netrokona.gov.bd	490
4525	Gohalakanda	গোহালাকান্দা	gohalakandaup.netrokona.gov.bd	490
4526	Dhalamulgaon	ধলামুলগাঁও	dhalamulgaonup.netrokona.gov.bd	490
4527	Agia	আগিয়া	agia.netrokona.gov.bd	490
4528	Purbadhala	পূর্বধলা	purbadhalaup.netrokona.gov.bd	490
4529	Chollisha	চল্লিশা	chollishaup.netrokona.gov.bd	491
4530	Kailati	কাইলাটি	kailatiup.netrokona.gov.bd	491
4531	Dokkhin Bishiura	দক্ষিণ বিশিউড়া	dokkhinbishiuraup.netrokona.gov.bd	491
4532	Modonpur	মদনপুর	modonpurup.netrokona.gov.bd	491
4533	Amtola	আমতলা	amtolaup.netrokona.gov.bd	491
4534	Lokkhiganj	লক্ষীগঞ্জ	lokkhiganj.netrokona.gov.bd	491
4535	Singher Bangla	সিংহের বাংলা	singherbanglaup.netrokona.gov.bd	491
4536	Thakurakona	ঠাকুরাকোণা	thakurakonaup.netrokona.gov.bd	491
4537	Mougati	মৌগাতি	mougatiup.netrokona.gov.bd	491
4538	Rouha	রৌহা	rouhaup.netrokona.gov.bd	491
4539	Medni	মেদনী	medniup.netrokona.gov.bd	491
4540	Kaliara Babragati	কালিয়ারা গাবরাগাতি	kaliaragabragatiup.netrokona.gov.bd	491
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public."user" (id, email, mobile, username, password, "createdAt", "updatedAt", "vendorId") FROM stdin;
cm2uswab2000212okdwag9ulu	admin@admin.com	1234567890	admin	$2b$10$oISvmIN.yoaK8U2sFG/6ROBeNb1bvmg4tlw/xGxFrCQlzPqT/KqW2	2024-10-29 18:48:15.661	2024-10-29 18:48:15.661	cm2uswab2000112ok44tt2s4f
cm2uu1jpk0003t4nw87sw2k6f	newVendorAdmin@admin.com	01232414214	newVendorAdmin	$2b$10$QqpqAoUWz8XNNemHLXQov.zwJsdsJeVXtftcrCZr0C5w5tq6W5ZMS	2024-10-29 19:20:20.744	2024-10-29 19:20:20.744	cm2uu1jb50001t4nwmb7rordo
cm2uv451r00023ni5myu2c4ul	wemon30@gmail.com	01716954101	avro	$2b$10$jqp7842//aK0bMXxDW15y.IBQ8C71vJH3LhhymsVf7KVVKxpTWtKO	2024-10-29 19:50:21.326	2024-10-29 19:50:21.326	cm2uswab2000112ok44tt2s4f
cm2vwaxyb0002qm5jyy4tcdrv	zopazo@mailinator.com	Aut laborum nulla so	cekezuku	$2b$10$T7kSnzP3JvOkwfaB.PZ3AuI3yU7f9vhbEZ3jzr62f85zNH5ThINE.	2024-10-30 13:11:24.515	2024-10-30 13:11:24.515	cm2uswab2000112ok44tt2s4f
cm2ybozkt00045xr3x3hapetd	wemon430@gmail.com	01716354101	emon	$2b$10$vg41d5/gR0HM1/dGwuWdPuwV2YA2qFL0.N/ygxG4I4LM5Ck9qaJsq	2024-11-01 05:57:46.398	2024-11-01 05:57:46.398	cm2uswab2000112ok44tt2s4f
cm308d59s0001bgas2wveuehp	fiwyvacofe@mailinator.com	Sunt similique aut a	meheziwol	$2b$10$wudSo4bdxMkpzQUXPquEPeySRNU7MKnMv4Ba.bFfnrr3UAOV4Kb9m	2024-11-02 14:00:07.407	2024-11-02 14:00:07.407	cm2uswab2000112ok44tt2s4f
cm308jn2g0005bgasjwu8z5z7	qamibas@mailinator.com	Necessitatibus ut fu	fogoduzu	$2b$10$a2PbBxmSjpZg8Ro.5U7jJ.7h1HYd.vtAkJMldiDG02xW4yiIkkL6m	2024-11-02 14:05:10.408	2024-11-02 14:05:10.408	cm2uswab2000112ok44tt2s4f
cm308kwqx0008bgas201jrdgf	rodepavu@mailinator.com	Qui maxime dolorem m	vuruwozyb	$2b$10$ArH1Mzm58RUL5sGoEN5lUec2AVRZZ8buQBwS7QCuehgfzTo2qm/7C	2024-11-02 14:06:09.609	2024-11-02 14:06:09.609	cm2uswab2000112ok44tt2s4f
cm308lode000bbgasu8nrfulb	bepihoc@mailinator.com	Sapiente aliqua Fug	keciraqy	$2b$10$PQkjhRFUuNO.2VMGwJXcx.p.quPNETvwpgMJi3U.Wi2Ce6hqJsF22	2024-11-02 14:06:45.41	2024-11-02 14:06:45.41	cm2uswab2000112ok44tt2s4f
cm308mcg0000ebgas4szfpqjr	riry@mailinator.com	Ipsum quae nostrum 	jiketabur	$2b$10$WyPDLw5bbJk1ZdZXFVKd6.f3qXQGC0Sg2n9gYmhX6A2q7q4NCrFem	2024-11-02 14:07:16.608	2024-11-02 14:07:16.608	cm2uswab2000112ok44tt2s4f
cm308pduq000hbgasyhv5t0oz	tizycesi@mailinator.com	Voluptas aut exercit	vulavozilu	$2b$10$Hw7/fwEYUQXu7P.EKbHqVe4yGXpS52V5CFLXsxiwcomsUnQWMs0I.	2024-11-02 14:09:38.403	2024-11-02 14:09:38.403	cm2uswab2000112ok44tt2s4f
cm308q6ep000kbgas0myv6orh	zinufel@mailinator.com	Nihil repudiandae po	mohusabyle	$2b$10$V1JEq4va1ehpP71s7rdDjurhoC/RVFVD3p8sooCSWRHzI4490geES	2024-11-02 14:10:15.409	2024-11-02 14:10:15.409	cm2uswab2000112ok44tt2s4f
\.


--
-- Data for Name: workers; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public.workers (id, "fullName", role, "fatherName", "employeeID", whatsapp, "NID", "NIDImage", education, "bankName", "branchName", "accountNumber", "mobileBanking", "mobileBankingNumber", profile_picture, address, "zipCode", "userJoinDate", "createdAt", "updatedAt", "isActive", "order", "userId") FROM stdin;
cm2uv451r00033ni5flrgz5ty	Md Wahiduzzaman	REPRESENTATIVE	Wahed Morad	EM-20249416-0	01703459656	32352525	{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1730231417/uploads/wyjcph1se8nuhdfm3sys.png", "size": 34066, "filename": "1__6ooq0R60ba3UT5c-QVemA.png", "extension": "png"}	BSC in CST						{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1730231418/uploads/mz0uynt7maovzfogtxcn.png", "size": 944594, "filename": "1685788329729.png", "extension": "png"}		7420	2024-10-29 19:50:21.326	2024-10-29 19:50:21.326	2024-10-29 19:50:23.959	ACTIVE	1	cm2uv451r00023ni5myu2c4ul
cm2vwaxyb0003qm5jx1r1eq69	Blair Butler	OPERATOR	Lewis England	EM-20249694-0	Provident doloribus	Voluptatem debitis 	{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1730293882/uploads/k4z7i7nj6az81oqfifp9.png", "size": 143177, "filename": "6.png", "extension": "png"}	Rerum aperiam qui et	Leilani Harding	Ciaran Hunt	171	Ex ex ipsa fugiat i	307	{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1730293882/uploads/we4yew15tjqrucih21zv.jpg", "size": 160044, "filename": "john.jpg", "extension": "jpeg"}	Nihil et quibusdam c	42051	2024-10-30 13:11:24.515	2024-10-30 13:11:24.515	2024-10-30 13:11:24.954	ACTIVE	1	cm2vwaxyb0002qm5jyy4tcdrv
cm2ybozku00055xr3v1gsn7zl	Md Wahiduzzaman	OPERATOR	Wahed Morad	EM-KYDJPUNV	01703452356	32352525534	{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1730440665/uploads/a86na2zc5okhzyurimli.png", "size": 34066, "filename": "1__6ooq0R60ba3UT5c-QVemA.png", "extension": "png"}	BSC in CST						{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1730440665/uploads/idw6kukcbhv3jmgswwum.jpg", "size": 170631, "filename": "IMG_20230810_004658.jpg", "extension": "jpeg"}		7420	2024-11-01 05:57:46.398	2024-11-01 05:57:46.398	2024-11-01 05:57:46.398	ACTIVE	0	cm2ybozkt00045xr3x3hapetd
cm308d59s0002bgashurqihzs	Calvin Lamb	RAIDER	Olga Mason	EM-WK9E1ERJ	Tempora quo repudian	Nostrum voluptatem f	{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1730556005/uploads/fpb5ulc4kgxylvwrvnmj.png", "size": 139576, "filename": "7.png", "extension": "png"}	Dolores deleniti aut	Laith Watts	Ulric Yates	43	bKash	314	{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1730556005/uploads/hzbgtfxztfmskdabqhb2.jpg", "size": 160044, "filename": "john.jpg", "extension": "jpeg"}	Illo ratione dolor p	85726	2024-11-02 14:00:07.407	2024-11-02 14:00:07.407	2024-11-02 14:00:07.407	ACTIVE	0	cm308d59s0001bgas2wveuehp
cm308jn2g0006bgasq2wjeuyq	Clare Nicholson	RAIDER	Ocean Vasquez	EM-81OCNN20	Est anim exercitati	Est quas voluptatibu	{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1730556308/uploads/pzinyqkqlnmyfr3bqncu.png", "size": 118701, "filename": "1.png", "extension": "png"}	Voluptate laborum R	George Spencer	Dillon Moran	119	Rocket	139	{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1730556308/uploads/qfmidz1pn84a0qrkwhpc.jpg", "size": 27947, "filename": "Ali.jpg", "extension": "jpeg"}	Expedita in culpa ad	70095	2024-11-02 14:05:10.408	2024-11-02 14:05:10.408	2024-11-02 14:05:10.408	ACTIVE	0	cm308jn2g0005bgasjwu8z5z7
cm308kwqx0009bgase2h7vgyz	Madaline Hunter	REPRESENTATIVE	Roary Case	EM-QGHONKRP	Sint dignissimos re	Qui veritatis accusa	{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1730556368/uploads/awlbgggfehatgphdqkud.png", "size": 103614, "filename": "2.png", "extension": "png"}	Nemo sunt laboriosa	Martha Oneal	Latifah Sellers	553	bKash	449	{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1730556367/uploads/oeqakwsmvkysup1lrlb0.jpg", "size": 160044, "filename": "john.jpg", "extension": "jpeg"}	Et quo perspiciatis	45222	2024-11-02 14:06:09.609	2024-11-02 14:06:09.609	2024-11-02 14:06:09.609	ACTIVE	0	cm308kwqx0008bgas201jrdgf
cm308lode000cbgasbd6nasrf	Wylie Galloway	REPRESENTATIVE	Kennedy Cherry	EM-25F5SBVL	Quia eius architecto	Laborum Ut et nihil	{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1730556404/uploads/adc3r60zkuvyfwk3npu6.png", "size": 137552, "filename": "3.png", "extension": "png"}	Pariatur Incidunt 	Quemby Moreno	Haviva Burgess	254	bKash	641	{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1730556404/uploads/knzm0u8q0ohmexliu4xv.jpg", "size": 27947, "filename": "Ali.jpg", "extension": "jpeg"}	Veritatis accusantiu	80123	2024-11-02 14:06:45.41	2024-11-02 14:06:45.41	2024-11-02 14:06:45.41	ACTIVE	0	cm308lode000bbgasu8nrfulb
cm308mcg0000fbgas71arqemm	Anthony Gillespie	REPRESENTATIVE	Christen Norris	EM-R6PVK7RI	Consequatur quod ex	Est velit unde omni	{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1730556435/uploads/g6zqd5qxikbr2ecjhgur.png", "size": 67162, "filename": "4.png", "extension": "png"}	Esse consectetur in	Xavier Hanson	Damian Spencer	49	bKash	494	{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1730556435/uploads/bb49wt1medxuydc4yvpn.jpg", "size": 27947, "filename": "Ali.jpg", "extension": "jpeg"}	Dignissimos aliquid 	16023	2024-11-02 14:07:16.608	2024-11-02 14:07:16.608	2024-11-02 14:07:16.608	ACTIVE	0	cm308mcg0000ebgas4szfpqjr
cm308pduq000ibgasv21ka107	Edan Valencia	RAIDER	Rachel Rutledge	EM-K4V5H8EB	Deserunt magnam labo	Aliquam dolor veniam	{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1730556576/uploads/ipve8xamylnad0c7l0su.png", "size": 143177, "filename": "6.png", "extension": "png"}	Maiores rerum dolori	Amery Jarvis	Emery Reyes	911	bKash	607	{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1730556576/uploads/yfshcxbmwgcp0qdjdfdl.jpg", "size": 160044, "filename": "john.jpg", "extension": "jpeg"}	Esse aperiam ut cons	84990	2024-11-02 14:09:38.403	2024-11-02 14:09:38.403	2024-11-02 14:09:38.403	ACTIVE	0	cm308pduq000hbgasyhv5t0oz
cm308q6ep000lbgasi207yc1g	Demetrius Frank	RAIDER	Macy Fitzpatrick	EM-P8QYOLYS	Optio sed error exp	Ea eius corrupti qu	{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1730556614/uploads/ra8cemvnu4ottwvvmfks.png", "size": 139576, "filename": "7.png", "extension": "png"}	Alias exercitationem	Chelsea Barnes	Rinah Santos	98	bKash	959	{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1730556613/uploads/ouznn0sw2cglmcglue0v.jpg", "size": 27947, "filename": "Ali.jpg", "extension": "jpeg"}	Deleniti cum ullamco	52395	2024-11-02 14:10:15.409	2024-11-02 14:10:15.409	2024-11-02 14:10:15.409	ACTIVE	0	cm308q6ep000kbgas0myv6orh
\.


--
-- Data for Name: zone; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public.zone (id, village_name, ward_no, zone_name, contact_no, whatsapp_no, "isActive", division_id, district_id, upazila_id, union_id, "operatorId", "createdAt", "updatedAt", "createdById", "vendorId") FROM stdin;
cm2xn09y20003o813z01r7dp9	JHI	3	Jhikargachha	01703459656	01521724905	ACTIVE	3	20	175	1560	cm2vwaxyb0003qm5jx1r1eq69	2024-10-31 18:26:42.401	2024-10-31 19:09:40.732	cm2uswab2000212okdwag9ulu	cm2uswab2000112ok44tt2s4f
cm308xj83000nbgasy087itm9	Rajbari 	8	Rajbari Sadar	019923463	017237473	ACTIVE	6	49	376	3412	cm2ybozku00055xr3v1gsn7zl	2024-11-02 14:15:58.573	2024-11-02 14:16:52.202	cm2uswab2000212okdwag9ulu	cm2uswab2000112ok44tt2s4f
\.


--
-- Data for Name: _ZoneRepresentatives; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public."_ZoneRepresentatives" ("A", "B") FROM stdin;
cm2xn09y20003o813z01r7dp9	cm2uv451r00033ni5flrgz5ty
cm308xj83000nbgasy087itm9	cm308kwqx0009bgase2h7vgyz
cm308xj83000nbgasy087itm9	cm308mcg0000fbgas71arqemm
\.


--
-- Data for Name: _ZoneRiders; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public."_ZoneRiders" ("A", "B") FROM stdin;
cm308xj83000nbgasy087itm9	cm308pduq000ibgasv21ka107
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
89923808-8872-427f-8aff-70ed6e71aa48	a6d2c2aa47ef7fca371cba89fe6798b27df5eca39dc264d40b134aaa305191a9	2024-11-06 11:33:40.645342+00	20241102125126_new	\N	\N	2024-11-06 11:33:38.500686+00	1
6e50ddc9-530e-47ed-8c71-9342e3d3d4d6	d80209ccc458f17e1425872e25f9864380276137bd273f423af0be0845e1a059	2024-11-06 11:33:42.695869+00	20241102134505_up	\N	\N	2024-11-06 11:33:41.262252+00	1
6814e0a8-8435-48d7-8db0-e0555eb3fe9f	3bd40cfc6d10e0693812b52bbf9003c2ef4fb97f0472a0bb3d5e1321807ce127	2024-11-06 11:33:44.618573+00	20241104161257_product_purchase	\N	\N	2024-11-06 11:33:43.31012+00	1
a2f4a9e4-d895-41ad-bf9c-4785ee4440b1	8ff0e684eeb538a7e3310101257a924ae34f456ba82cdbd5663e0ca6b40dcb97	2024-11-06 11:33:46.686686+00	20241104175052_uuu	\N	\N	2024-11-06 11:33:45.254129+00	1
7599101e-4ca9-4c92-806c-6ec1e5da9f30	160ade9898d4c9c666f6cb6c8d73d6b0b347b96bf83f58d5532005670096007c	2024-11-06 11:33:48.734957+00	20241106085731_	\N	\N	2024-11-06 11:33:47.298043+00	1
20f4d237-dd1c-47c9-bb09-abb9f846aae9	e2c181fd5bdc4ed2a97c601a3654bd9f65ff9be010bb685b323ff54ff9c0d4ea	2024-11-06 11:33:50.783004+00	20241106092550_	\N	\N	2024-11-06 11:33:49.350469+00	1
11ca2f7e-3d7a-4377-9e94-afb77ba5ed3f	c098f76e120844f246ace7a11ef07fe5c9f3de32b67a9d2e27be8834d4b038f2	2024-11-06 11:33:52.933575+00	20241106102706_new	\N	\N	2024-11-06 11:33:51.398563+00	1
4d1bcf0f-3982-4b1e-8124-9638a66a4e17	08145a06cca8fdf19bcb470f2dd2a2e0785f651069122acee30b9cdec5795e75	2024-11-06 11:33:55.08342+00	20241106104552_	\N	\N	2024-11-06 11:33:53.551171+00	1
d5f618a4-4a1c-4885-882d-822a48ff1bed	6864b8ade9fb10972c75dcb71411d918ac6155c351cd05b9523900250c72f18e	2024-11-06 11:33:57.234238+00	20241106113136_	\N	\N	2024-11-06 11:33:55.698844+00	1
1c923b49-53fd-4581-96b9-3ba17e4ab5d2	a6d2c2aa47ef7fca371cba89fe6798b27df5eca39dc264d40b134aaa305191a9	2024-11-02 13:45:28.208163+00	20241102125126_new	\N	\N	2024-11-02 13:45:26.032382+00	1
11ac7905-e0ab-4686-917a-292c32ad559b	d80209ccc458f17e1425872e25f9864380276137bd273f423af0be0845e1a059	2024-11-02 13:45:29.960995+00	20241102134505_up	\N	\N	2024-11-02 13:45:28.712665+00	1
7bccd573-3dda-4f82-9d49-e942fc441bd7	3e2235d9f51932938ab1c68a6e95c4226e6364e52f37e54d51a3217234d0cad5	2024-10-29 18:42:43.466554+00	20241028050824_	\N	\N	2024-10-29 18:42:41.778287+00	1
ed691350-8943-4d59-b6a9-f812802e194b	6dd044ab5d4ef0fa961e734d59e95710e2e7056dfb437ecb77bd51a3a55e1019	2024-10-30 18:38:19.132275+00	20241030183816_	\N	\N	2024-10-30 18:38:17.793698+00	1
099017cf-6cfc-40bd-9f0a-9cdec96fe620	0110049a8f8a01794d119ba5a02725908b8c3ae7b3773e74b8814f9799ca7158	2024-10-29 18:42:45.631391+00	20241028185336_add_zones	\N	\N	2024-10-29 18:42:44.083181+00	1
224583ff-4a05-4608-8b3d-e6972ccce6b7	d96dd6e23673847da5605a9ebcf031c0f037872af83f78bc5d6635956dce0f17	2024-10-29 18:42:47.665827+00	20241028194814_zone_add	\N	\N	2024-10-29 18:42:46.136152+00	1
75891e8c-dcc4-410a-8bd7-1118825c87fb	4f1e3d8f709de4c27c848707f54072f7a68ee7e077daf110c6d35647c9ba482a	2024-10-29 18:42:49.74748+00	20241028210148_	\N	\N	2024-10-29 18:42:48.290287+00	1
2f7119de-c37f-4d4a-b62b-ebbbbffc5bcd	58a9a92087c6e7f78a2768cf1f79ccfe6bb4bdd9802586e986de045ab7707dc1	2024-10-29 18:42:51.813285+00	20241028212153_	\N	\N	2024-10-29 18:42:50.329869+00	1
35cb0c29-aeb2-4027-bda4-ce1e37860e3d	8e23b262df10fec03f5288324274466e68a2c3b709a005709bc1979efbfaf938	2024-10-29 18:42:53.669936+00	20241028212535_yy	\N	\N	2024-10-29 18:42:52.322102+00	1
f860e89d-d2b3-4440-8d2a-5727917618aa	6cae45528443da73835faa726b913ad4c174c29bfad7df4b3881dec991de0dab	2024-10-29 18:42:55.857474+00	20241029144830_neww	\N	\N	2024-10-29 18:42:54.353454+00	1
0c276206-3a4a-4e7b-8d29-c0f841697085	8168773754a0b1a7f76ed16d3460805068f219b9e3e0e391b26f598c709c5434	2024-10-29 18:42:57.677339+00	20241029163207_	\N	\N	2024-10-29 18:42:56.371313+00	1
1884965e-4ea4-4729-95a8-e83c56b694a4	991b928617c8bc2aed4ab4e1e9ee498a6afaab0d5d9a5095c23e254c45f06883	2024-10-29 18:42:59.75096+00	20241029163814_new_one	\N	\N	2024-10-29 18:42:58.316458+00	1
5ea739e3-8dd6-4522-bb90-02cb1da953e6	8e4c760a4b3465463573c8bcf0c98e13ab1c50edf62a26b15e6d13131fe09b46	2024-10-29 18:43:01.901942+00	20241029164121_y	\N	\N	2024-10-29 18:43:00.377333+00	1
f4fd804b-ed53-46a0-825f-8976db6f8447	5777c59ab291d319ee1fda6ae3b5d7ab8178c2c45ddb3a16c9baef7c23bf4659	2024-10-29 18:43:04.05183+00	20241029174535_y	\N	\N	2024-10-29 18:43:02.516755+00	1
496751cd-cd24-4002-b465-7a239545ff22	92ab9b9104a76b54617767e8360b04544fced30e67a6b7f8cc8400bdca8449aa	2024-10-29 18:43:06.068471+00	20241029175126_o	\N	\N	2024-10-29 18:43:04.647011+00	1
fb3548bc-d239-47ff-aedf-2db69132ab24	b2e285dc263ef46e1497fe0c98432ecc6dce7998a11ca4960e709280638f06b3	2024-10-29 18:43:07.945718+00	20241029175812_vendor_image	\N	\N	2024-10-29 18:43:06.575844+00	1
cbe53eea-a13c-4bb8-b53d-250c35d540ac	6f0e82c011947e29a499c4d90df8eaca781930d9b1a45a377f3841de941589cb	2024-10-29 18:44:58.125511+00	20241029184454_ll	\N	\N	2024-10-29 18:44:56.493869+00	1
\.


--
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public.admin (id, role, "isActive", "createdAt", "updatedAt", "userId") FROM stdin;
cm2uswab2000312okzg5tgm21	ADMIN	ACTIVE	2024-10-29 18:48:15.661	2024-10-29 18:48:15.661	cm2uswab2000212okdwag9ulu
cm2uu1jpk0004t4nwmm15qhyl	ADMIN	ACTIVE	2024-10-29 19:20:20.744	2024-10-29 19:20:20.744	cm2uu1jpk0003t4nw87sw2k6f
\.


--
-- Data for Name: logginInfo; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public."logginInfo" (id, "userId", "ipAddress", device, browser, os, location, status, note, "loginAt", "createdAt", "updatedAt") FROM stdin;
cm2ut22n80000rxvwyupw6uoy	cm2uswab2000212okdwag9ulu	::1	PostmanRuntime/7.42.0	PostmanRuntime/7.42.0	Unknown OS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-29 18:52:45.668	2024-10-29 18:52:45.668	2024-10-29 18:52:45.668
cm2utejrg0000akotl9gjytl6	cm2uswab2000212okdwag9ulu	::1	PostmanRuntime/7.42.0	PostmanRuntime/7.42.0	Unknown OS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-29 19:02:27.725	2024-10-29 19:02:27.725	2024-10-29 19:02:27.725
cm2uv3ayv00003ni5c41l7s7n	cm2uswab2000212okdwag9ulu	::1	PostmanRuntime/7.42.0	PostmanRuntime/7.42.0	Unknown OS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-29 19:49:42.343	2024-10-29 19:49:42.343	2024-10-29 19:49:42.343
cm2uvpaie0000udkv833q4ysg	cm2uswab2000212okdwag9ulu	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-29 20:06:48.182	2024-10-29 20:06:48.182	2024-10-29 20:06:48.182
cm2uvqxlw0001udkv9homcafs	cm2uswab2000212okdwag9ulu	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-29 20:08:04.772	2024-10-29 20:08:04.772	2024-10-29 20:08:04.772
cm2uvsa2a0002udkvnmyt42gr	cm2uswab2000212okdwag9ulu	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-29 20:09:07.571	2024-10-29 20:09:07.571	2024-10-29 20:09:07.571
cm2uw85jz00005fm354m4yis7	cm2uu1jpk0003t4nw87sw2k6f	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	FAILED	Incorrect password	2024-10-29 20:21:27.901	2024-10-29 20:21:27.901	2024-10-29 20:21:27.901
cm2uwa5f600015fm3umlb67u0	cm2uu1jpk0003t4nw87sw2k6f	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	FAILED	Incorrect password	2024-10-29 20:23:01.11	2024-10-29 20:23:01.11	2024-10-29 20:23:01.11
cm2uwau6t00025fm3kzhrenpv	cm2uu1jpk0003t4nw87sw2k6f	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	FAILED	Incorrect password	2024-10-29 20:23:33.187	2024-10-29 20:23:33.187	2024-10-29 20:23:33.187
cm2uwc6oy00002726hx527new	cm2uu1jpk0003t4nw87sw2k6f	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	FAILED	Incorrect password	2024-10-29 20:24:36.323	2024-10-29 20:24:36.323	2024-10-29 20:24:36.323
cm2uwg0n10000xp4uat8tygdu	cm2uu1jpk0003t4nw87sw2k6f	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	FAILED	Incorrect password	2024-10-29 20:27:35.101	2024-10-29 20:27:35.101	2024-10-29 20:27:35.101
cm2uwg92p0001xp4uybp2eh4n	cm2uu1jpk0003t4nw87sw2k6f	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-29 20:27:45.753	2024-10-29 20:27:45.753	2024-10-29 20:27:45.753
cm2uwyrsp0002xp4uwfljdmwn	cm2uswab2000212okdwag9ulu	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-29 20:42:10.106	2024-10-29 20:42:10.106	2024-10-29 20:42:10.106
cm2ux0aok0003xp4uoliknksk	cm2uu1jpk0003t4nw87sw2k6f	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-29 20:43:21.236	2024-10-29 20:43:21.236	2024-10-29 20:43:21.236
cm2ux2xr40000eyxm72eb0qjv	cm2uswab2000212okdwag9ulu	::1	PostmanRuntime/7.42.0	PostmanRuntime/7.42.0	Unknown OS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-29 20:45:24.448	2024-10-29 20:45:24.448	2024-10-29 20:45:24.448
cm2uxsime0000mnor2rglp8g6	cm2uv451r00023ni5myu2c4ul	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-29 21:05:17.649	2024-10-29 21:05:17.649	2024-10-29 21:05:17.649
cm2uxu9yg0001mnorvct7r0iw	cm2uswab2000212okdwag9ulu	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-29 21:06:39.977	2024-10-29 21:06:39.977	2024-10-29 21:06:39.977
cm2uyc8pg0002mnormbthp4xp	cm2uswab2000212okdwag9ulu	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	FAILED	Incorrect password	2024-10-29 21:20:38.164	2024-10-29 21:20:38.164	2024-10-29 21:20:38.164
cm2uyccj40003mnor0uyf5axi	cm2uswab2000212okdwag9ulu	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-29 21:20:43.121	2024-10-29 21:20:43.121	2024-10-29 21:20:43.121
cm2uysp6s0000bt3diss338u9	cm2uu1jpk0003t4nw87sw2k6f	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-29 21:33:26.021	2024-10-29 21:33:26.021	2024-10-29 21:33:26.021
cm2uz1ylt00004hw7jjkveq56	cm2uu1jpk0003t4nw87sw2k6f	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-29 21:40:38.129	2024-10-29 21:40:38.129	2024-10-29 21:40:38.129
cm2uz3mpe00014hw722v845av	cm2uu1jpk0003t4nw87sw2k6f	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-29 21:41:56.018	2024-10-29 21:41:56.018	2024-10-29 21:41:56.018
cm2uz7nuf00006fgntwnh1pvp	cm2uu1jpk0003t4nw87sw2k6f	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-29 21:45:04.119	2024-10-29 21:45:04.119	2024-10-29 21:45:04.119
cm2uz9o0x00016fgn1hrsu1bb	cm2uswab2000212okdwag9ulu	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-29 21:46:37.666	2024-10-29 21:46:37.666	2024-10-29 21:46:37.666
cm2uza2sl00026fgnufvy55s3	cm2uswab2000212okdwag9ulu	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-29 21:46:56.555	2024-10-29 21:46:56.555	2024-10-29 21:46:56.555
cm2uzc4v900036fgncs17zbw2	cm2uswab2000212okdwag9ulu	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-29 21:48:32.548	2024-10-29 21:48:32.548	2024-10-29 21:48:32.548
cm2uzd7q400046fgn62epjyj3	cm2uu1jpk0003t4nw87sw2k6f	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-29 21:49:22.911	2024-10-29 21:49:22.911	2024-10-29 21:49:22.911
cm2v01jmw000013r1b6jbpao3	cm2uswab2000212okdwag9ulu	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-29 22:08:16.777	2024-10-29 22:08:16.777	2024-10-29 22:08:16.777
cm2v0r5uv0000u2q16x4qnfzc	cm2uv451r00023ni5myu2c4ul	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-29 22:28:13.543	2024-10-29 22:28:13.543	2024-10-29 22:28:13.543
cm2vkq5za0000r7kq0tzjn1vh	cm2uswab2000212okdwag9ulu	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	FAILED	Incorrect password	2024-10-30 07:47:19.367	2024-10-30 07:47:19.367	2024-10-30 07:47:19.367
cm2vkqcjt0001r7kq6zgkosu7	cm2uswab2000212okdwag9ulu	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-30 07:47:26.275	2024-10-30 07:47:26.275	2024-10-30 07:47:26.275
cm2vkthwx0002r7kqaq7yye2s	cm2uu1jpk0003t4nw87sw2k6f	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-30 07:49:54.544	2024-10-30 07:49:54.544	2024-10-30 07:49:54.544
cm2vptqts00002uf588tu2550	cm2uswab2000212okdwag9ulu	37.111.194.168	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Windows	Bangladesh,C,Dhaka	SUCCESS	Login successful	2024-10-30 10:10:04.433	2024-10-30 10:10:04.433	2024-10-30 10:10:04.433
cm2vpvr1t00012uf5277b2nfl	cm2uu1jpk0003t4nw87sw2k6f	37.111.194.168	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Windows	Bangladesh,C,Dhaka	SUCCESS	Login successful	2024-10-30 10:11:38.033	2024-10-30 10:11:38.033	2024-10-30 10:11:38.033
cm2vpyhhp00022uf5bvfwwusa	cm2uu1jpk0003t4nw87sw2k6f	37.111.194.168	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Windows	Bangladesh,C,Dhaka	SUCCESS	Login successful	2024-10-30 10:13:45.614	2024-10-30 10:13:45.614	2024-10-30 10:13:45.614
cm2vq2bry00032uf5x5bc9rp6	cm2uv451r00023ni5myu2c4ul	37.111.194.168	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Windows	Bangladesh,C,Dhaka	FAILED	Incorrect password	2024-10-30 10:16:44.831	2024-10-30 10:16:44.831	2024-10-30 10:16:44.831
cm2vq2w4n00042uf54xpw039d	cm2uswab2000212okdwag9ulu	37.111.194.168	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Windows	Bangladesh,C,Dhaka	SUCCESS	Login successful	2024-10-30 10:17:11.208	2024-10-30 10:17:11.208	2024-10-30 10:17:11.208
cm2vq4qa300052uf5yahwcpom	cm2uu1jpk0003t4nw87sw2k6f	37.111.194.168	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Windows	Bangladesh,C,Dhaka	SUCCESS	Login successful	2024-10-30 10:18:36.939	2024-10-30 10:18:36.939	2024-10-30 10:18:36.939
cm2vq72r600062uf53bxzcwmi	cm2uv451r00023ni5myu2c4ul	37.111.194.168	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Windows	Bangladesh,C,Dhaka	SUCCESS	Login successful	2024-10-30 10:20:26.418	2024-10-30 10:20:26.418	2024-10-30 10:20:26.418
cm2vrfo3i0000gbz36cjnzw6p	cm2uswab2000212okdwag9ulu	37.111.194.168	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Windows	Bangladesh,C,Dhaka	SUCCESS	Login successful	2024-10-30 10:55:06.943	2024-10-30 10:55:06.943	2024-10-30 10:55:06.943
cm2vrn3hq0001gbz3wu8cwcdr	cm2uswab2000212okdwag9ulu	37.111.194.168	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Windows	Bangladesh,C,Dhaka	SUCCESS	Login successful	2024-10-30 11:00:53.487	2024-10-30 11:00:53.487	2024-10-30 11:00:53.487
cm2vrx8ud0000hox3v66zhpdy	cm2uswab2000212okdwag9ulu	::1	PostmanRuntime/7.42.0	PostmanRuntime/7.42.0	Unknown OS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-30 11:08:46.981	2024-10-30 11:08:46.981	2024-10-30 11:08:46.981
cm2vses2z0000l2jm7nlbstc4	cm2uswab2000212okdwag9ulu	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-30 11:22:23.429	2024-10-30 11:22:23.429	2024-10-30 11:22:23.429
cm2vtk6170000uj71odeivs4a	cm2uswab2000212okdwag9ulu	37.111.194.168	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Windows	Bangladesh,C,Dhaka	SUCCESS	Login successful	2024-10-30 11:54:36.043	2024-10-30 11:54:36.043	2024-10-30 11:54:36.043
cm2vvqy2d0000qm5jaybz3yxs	cm2uswab2000212okdwag9ulu	37.111.194.168	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Windows	Bangladesh,C,Dhaka	SUCCESS	Login successful	2024-10-30 12:55:51.542	2024-10-30 12:55:51.542	2024-10-30 12:55:51.542
cm2vxll4y0000xf4hmkubljua	cm2uswab2000212okdwag9ulu	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-30 13:47:39.18	2024-10-30 13:47:39.18	2024-10-30 13:47:39.18
cm2vxnf5s0001xf4hyx2m02d3	cm2uswab2000212okdwag9ulu	::1	PostmanRuntime/7.42.0	PostmanRuntime/7.42.0	Unknown OS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-30 13:49:06.304	2024-10-30 13:49:06.304	2024-10-30 13:49:06.304
cm2vzy9m5000013v9k8yvxfq7	cm2uswab2000212okdwag9ulu	::1	PostmanRuntime/7.42.0	PostmanRuntime/7.42.0	Unknown OS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-30 14:53:31.565	2024-10-30 14:53:31.565	2024-10-30 14:53:31.565
cm2w0z0k60000129c5o765eea	cm2uswab2000212okdwag9ulu	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-30 15:22:04.471	2024-10-30 15:22:04.471	2024-10-30 15:22:04.471
cm2w1hcds00004h16z7ftugv2	cm2uswab2000212okdwag9ulu	37.111.194.168	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Windows	Bangladesh,C,Dhaka	SUCCESS	Login successful	2024-10-30 15:36:21.233	2024-10-30 15:36:21.233	2024-10-30 15:36:21.233
cm2w5eq5e00006zoar4ry4ggu	cm2uswab2000212okdwag9ulu	118.179.124.106	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	Bangladesh,D,Jhingergācha	SUCCESS	Login successful	2024-10-30 17:26:17.57	2024-10-30 17:26:17.57	2024-10-30 17:26:17.57
cm2w5ne6l00016zoaeefw5b8l	cm2uswab2000212okdwag9ulu	118.179.124.106	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	Bangladesh,D,Jhingergācha	SUCCESS	Login successful	2024-10-30 17:33:01.965	2024-10-30 17:33:01.965	2024-10-30 17:33:01.965
cm2w5ole200026zoa89enhcqo	cm2uswab2000212okdwag9ulu	118.179.124.106	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	Bangladesh,D,Jhingergācha	SUCCESS	Login successful	2024-10-30 17:33:57.962	2024-10-30 17:33:57.962	2024-10-30 17:33:57.962
cm2w5psda00036zoaebkssde8	cm2uswab2000212okdwag9ulu	118.179.124.106	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	Bangladesh,D,Jhingergācha	SUCCESS	Login successful	2024-10-30 17:34:53.662	2024-10-30 17:34:53.662	2024-10-30 17:34:53.662
cm2w5xbev00046zoa79ufae81	cm2uswab2000212okdwag9ulu	118.179.124.106	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	Bangladesh,D,Jhingergācha	SUCCESS	Login successful	2024-10-30 17:40:44.935	2024-10-30 17:40:44.935	2024-10-30 17:40:44.935
cm2w695aj00056zoaj7s15tcv	cm2uswab2000212okdwag9ulu	118.179.124.106	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	Bangladesh,D,Jhingergācha	SUCCESS	Login successful	2024-10-30 17:49:56.875	2024-10-30 17:49:56.875	2024-10-30 17:49:56.875
cm2w6ekit00066zoat0gswyt0	cm2uu1jpk0003t4nw87sw2k6f	118.179.124.106	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	Bangladesh,D,Jhingergācha	SUCCESS	Login successful	2024-10-30 17:54:09.894	2024-10-30 17:54:09.894	2024-10-30 17:54:09.894
cm2w6gn6o00076zoadb1ttket	cm2uu1jpk0003t4nw87sw2k6f	118.179.124.106	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	Bangladesh,D,Jhingergācha	SUCCESS	Login successful	2024-10-30 17:55:46.656	2024-10-30 17:55:46.656	2024-10-30 17:55:46.656
cm2w6hens00086zoagrcmzo9w	cm2uu1jpk0003t4nw87sw2k6f	118.179.124.106	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	Bangladesh,D,Jhingergācha	SUCCESS	Login successful	2024-10-30 17:56:22.264	2024-10-30 17:56:22.264	2024-10-30 17:56:22.264
cm2w6i8zj00096zoay310ejcl	cm2uu1jpk0003t4nw87sw2k6f	118.179.124.106	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	Bangladesh,D,Jhingergācha	SUCCESS	Login successful	2024-10-30 17:57:01.567	2024-10-30 17:57:01.567	2024-10-30 17:57:01.567
cm2w6iunz000a6zoabg8jp9a3	cm2uu1jpk0003t4nw87sw2k6f	118.179.124.106	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	Bangladesh,D,Jhingergācha	SUCCESS	Login successful	2024-10-30 17:57:29.663	2024-10-30 17:57:29.663	2024-10-30 17:57:29.663
cm2w6oayp000b6zoaqq783mhn	cm2uu1jpk0003t4nw87sw2k6f	118.179.124.106	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	Bangladesh,D,Jhingergācha	SUCCESS	Login successful	2024-10-30 18:01:44.066	2024-10-30 18:01:44.066	2024-10-30 18:01:44.066
cm2w6rvwh000c6zoa2i4m8hn2	cm2uu1jpk0003t4nw87sw2k6f	118.179.124.106	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	Bangladesh,D,Jhingergācha	SUCCESS	Login successful	2024-10-30 18:04:31.169	2024-10-30 18:04:31.169	2024-10-30 18:04:31.169
cm2w6soj5000d6zoaa8ylfwks	cm2uswab2000212okdwag9ulu	118.179.124.106	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	Bangladesh,D,Jhingergācha	SUCCESS	Login successful	2024-10-30 18:05:08.274	2024-10-30 18:05:08.274	2024-10-30 18:05:08.274
cm2w7etls0000jlmvn5gyze1s	cm2uswab2000212okdwag9ulu	118.179.124.106	PostmanRuntime/7.42.0	PostmanRuntime/7.42.0	Unknown OS	Bangladesh,D,Jhingergācha	SUCCESS	Login successful	2024-10-30 18:22:21.28	2024-10-30 18:22:21.28	2024-10-30 18:22:21.28
cm2w8a2ez00002e6dgbggqfu4	cm2uswab2000212okdwag9ulu	::1	PostmanRuntime/7.42.0	PostmanRuntime/7.42.0	Unknown OS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-30 18:46:39.036	2024-10-30 18:46:39.036	2024-10-30 18:46:39.036
cm2w8f7yk00008l39joctlf9c	cm2uswab2000212okdwag9ulu	118.179.124.106	PostmanRuntime/7.42.0	PostmanRuntime/7.42.0	Unknown OS	Bangladesh,D,Jhingergācha	SUCCESS	Login successful	2024-10-30 18:50:39.501	2024-10-30 18:50:39.501	2024-10-30 18:50:39.501
cm2w936av00038l393j4fh55r	cm2uswab2000212okdwag9ulu	118.179.124.106	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	Bangladesh,D,Jhingergācha	SUCCESS	Login successful	2024-10-30 19:09:17.092	2024-10-30 19:09:17.092	2024-10-30 19:09:17.092
cm2w9mjuo0000l1c7gpar29h6	cm2uswab2000212okdwag9ulu	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-30 19:24:19.521	2024-10-30 19:24:19.521	2024-10-30 19:24:19.521
cm2walz8j0000lwi967afd208	cm2uswab2000212okdwag9ulu	::1	PostmanRuntime/7.42.0	PostmanRuntime/7.42.0	Unknown OS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-30 19:51:54.019	2024-10-30 19:51:54.019	2024-10-30 19:51:54.019
cm2wbv89p0000g9wtmmue36gi	cm2uswab2000212okdwag9ulu	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-30 20:27:03.629	2024-10-30 20:27:03.629	2024-10-30 20:27:03.629
cm2x4drfm000012ukwzpvt5b5	cm2uswab2000212okdwag9ulu	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-31 09:45:17.595	2024-10-31 09:45:17.595	2024-10-31 09:45:17.595
cm2x4try20000ljc96g4m0izc	cm2uswab2000212okdwag9ulu	37.111.214.170	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Windows	Bangladesh,C,Dhaka	SUCCESS	Login successful	2024-10-31 09:57:46.299	2024-10-31 09:57:46.299	2024-10-31 09:57:46.299
cm2x58ai70001ljc96p1tzeah	cm2uswab2000212okdwag9ulu	37.111.214.170	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Windows	Bangladesh,C,Dhaka	SUCCESS	Login successful	2024-10-31 10:09:03.536	2024-10-31 10:09:03.536	2024-10-31 10:09:03.536
cm2x5kpps000112uk0emq2shv	cm2uswab2000212okdwag9ulu	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-31 10:18:41.507	2024-10-31 10:18:41.507	2024-10-31 10:18:41.507
cm2x5x01l000212uk1dvkqvk9	cm2uswab2000212okdwag9ulu	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-31 10:28:14.839	2024-10-31 10:28:14.839	2024-10-31 10:28:14.839
cm2x6gqjr0000r7vqtkatme24	cm2uswab2000212okdwag9ulu	37.111.214.170	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Windows	Bangladesh,C,Dhaka	SUCCESS	Login successful	2024-10-31 10:43:37.191	2024-10-31 10:43:37.191	2024-10-31 10:43:37.191
cm2x6sair0001r7vqd01i444g	cm2uswab2000212okdwag9ulu	37.111.214.170	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Windows	Bangladesh,C,Dhaka	SUCCESS	Login successful	2024-10-31 10:52:36.291	2024-10-31 10:52:36.291	2024-10-31 10:52:36.291
cm2x73qr90002r7vqrvugwrfm	cm2uswab2000212okdwag9ulu	54.86.50.139	PostmanRuntime/7.42.0	PostmanRuntime/7.42.0	Unknown OS	United States,VA,Ashburn	SUCCESS	Login successful	2024-10-31 11:01:30.55	2024-10-31 11:01:30.55	2024-10-31 11:01:30.55
cm2x8cesi0000e4cwfbvurid9	cm2uswab2000212okdwag9ulu	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-31 11:36:12.878	2024-10-31 11:36:12.878	2024-10-31 11:36:12.878
cm2x98q0t0001e4cwwt5u8hdu	cm2uswab2000212okdwag9ulu	::1	PostmanRuntime/7.42.0	PostmanRuntime/7.42.0	Unknown OS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-31 12:01:22.109	2024-10-31 12:01:22.109	2024-10-31 12:01:22.109
cm2xai84q0004747iwrzdgbzb	cm2uswab2000212okdwag9ulu	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-31 12:36:44.847	2024-10-31 12:36:44.847	2024-10-31 12:36:44.847
cm2xculrn0000gi5zgpyg0bwp	cm2uswab2000212okdwag9ulu	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-31 13:42:20.172	2024-10-31 13:42:20.172	2024-10-31 13:42:20.172
cm2xehd5r0000apwr4um5wd95	cm2uswab2000212okdwag9ulu	::1	PostmanRuntime/7.42.0	PostmanRuntime/7.42.0	Unknown OS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-31 14:28:03.423	2024-10-31 14:28:03.423	2024-10-31 14:28:03.423
cm2xllpz6000079xd0pv2v84z	cm2uswab2000212okdwag9ulu	::1	PostmanRuntime/7.42.0	PostmanRuntime/7.42.0	Unknown OS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-31 17:47:23.97	2024-10-31 17:47:23.97	2024-10-31 17:47:23.97
cm2xlpr2t000179xd74tcrlvs	cm2uswab2000212okdwag9ulu	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-31 17:50:30.442	2024-10-31 17:50:30.442	2024-10-31 17:50:30.442
cm2xnw8tm0000z5zqmo76pyx3	cm2uswab2000212okdwag9ulu	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-31 18:51:33.931	2024-10-31 18:51:33.931	2024-10-31 18:51:33.931
cm2xoewzz0000106lxby8w57l	cm2uswab2000212okdwag9ulu	::1	PostmanRuntime/7.42.0	PostmanRuntime/7.42.0	Unknown OS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-31 19:06:05.328	2024-10-31 19:06:05.328	2024-10-31 19:06:05.328
cm2xqa5c00000si8kdnfz0i40	cm2uswab2000212okdwag9ulu	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-31 19:58:20.479	2024-10-31 19:58:20.479	2024-10-31 19:58:20.479
cm2xs43cr0000pruyjh3e783l	cm2uswab2000212okdwag9ulu	::1	PostmanRuntime/7.42.0	PostmanRuntime/7.42.0	Unknown OS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-31 20:49:38.812	2024-10-31 20:49:38.812	2024-10-31 20:49:38.812
cm2y9u8ne0000xjun5fcjkoak	cm2uswab2000212okdwag9ulu	175.41.45.179	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Windows	Bangladesh,C,Dhaka	SUCCESS	Login successful	2024-11-01 05:05:52.202	2024-11-01 05:05:52.202	2024-11-01 05:05:52.202
cm2y9va790001xjunsfg5gmro	cm2uswab2000212okdwag9ulu	175.41.45.179	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Windows	Bangladesh,C,Dhaka	SUCCESS	Login successful	2024-11-01 05:06:40.869	2024-11-01 05:06:40.869	2024-11-01 05:06:40.869
cm2yaq8qz00005xr39s4u7s1i	cm2uswab2000212okdwag9ulu	175.41.45.179	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Windows	Bangladesh,C,Dhaka	SUCCESS	Login successful	2024-11-01 05:30:45.323	2024-11-01 05:30:45.323	2024-11-01 05:30:45.323
cm2ybjby90000fzcv8mv9qo7w	cm2uswab2000212okdwag9ulu	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-11-01 05:53:20.967	2024-11-01 05:53:20.967	2024-11-01 05:53:20.967
cm2ybkqqn00015xr36g4qc60a	cm2uswab2000212okdwag9ulu	118.179.124.106	PostmanRuntime/7.42.0	PostmanRuntime/7.42.0	Unknown OS	Bangladesh,D,Jhingergācha	SUCCESS	Login successful	2024-11-01 05:54:28.319	2024-11-01 05:54:28.319	2024-11-01 05:54:28.319
cm2ybo2fz00025xr3qxtonxqc	cm2uswab2000212okdwag9ulu	118.179.124.106	PostmanRuntime/7.42.0	PostmanRuntime/7.42.0	Unknown OS	Bangladesh,D,Jhingergācha	SUCCESS	Login successful	2024-11-01 05:57:03.423	2024-11-01 05:57:03.423	2024-11-01 05:57:03.423
cm2ybrexp00003i125o3dm6sk	cm2uswab2000212okdwag9ulu	::1	PostmanRuntime/7.42.0	PostmanRuntime/7.42.0	Unknown OS	undefined,undefined,undefined	SUCCESS	Login successful	2024-11-01 05:59:39.613	2024-11-01 05:59:39.613	2024-11-01 05:59:39.613
cm2ybsdju0000105swf34toqx	cm2ybozkt00045xr3x3hapetd	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-11-01 06:00:22.879	2024-11-01 06:00:22.879	2024-11-01 06:00:22.879
cm2ybt1po0001105s9z8igmy5	cm2ybozkt00045xr3x3hapetd	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-11-01 06:00:55.484	2024-11-01 06:00:55.484	2024-11-01 06:00:55.484
cm2ydwtju0000a9c2byuw4ney	cm2uswab2000212okdwag9ulu	175.41.45.179	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Windows	Bangladesh,C,Dhaka	SUCCESS	Login successful	2024-11-01 06:59:51.066	2024-11-01 06:59:51.066	2024-11-01 06:59:51.066
cm2ydwxv40001a9c2xzj8sx7y	cm2uswab2000212okdwag9ulu	175.41.45.179	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Windows	Bangladesh,C,Dhaka	SUCCESS	Login successful	2024-11-01 06:59:56.657	2024-11-01 06:59:56.657	2024-11-01 06:59:56.657
cm2ye5vxg00004ecnk5due7dd	cm2uswab2000212okdwag9ulu	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-11-01 07:06:52.219	2024-11-01 07:06:52.219	2024-11-01 07:06:52.219
cm2ye608c00014ecnrwh15lv3	cm2ybozkt00045xr3x3hapetd	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-11-01 07:06:59.628	2024-11-01 07:06:59.628	2024-11-01 07:06:59.628
cm2yf8iww0000h5bhr7rigqvh	cm2uswab2000212okdwag9ulu	175.41.45.179	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Windows	Bangladesh,C,Dhaka	SUCCESS	Login successful	2024-11-01 07:36:56.768	2024-11-01 07:36:56.768	2024-11-01 07:36:56.768
cm2yg5ug90000bul6d8zr9hqv	cm2uswab2000212okdwag9ulu	175.41.45.179	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Windows	Bangladesh,C,Dhaka	SUCCESS	Login successful	2024-11-01 08:02:51.369	2024-11-01 08:02:51.369	2024-11-01 08:02:51.369
cm2yg92cr0000xpdf4x0xdzil	cm2uswab2000212okdwag9ulu	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-11-01 08:05:21.331	2024-11-01 08:05:21.331	2024-11-01 08:05:21.331
cm2ygck7e0001bul6nz203k8k	cm2uswab2000212okdwag9ulu	175.41.45.179	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Windows	Bangladesh,C,Dhaka	SUCCESS	Login successful	2024-11-01 08:08:04.683	2024-11-01 08:08:04.683	2024-11-01 08:08:04.683
cm2ygdv3c0001xpdfds34dxoq	cm2uswab2000212okdwag9ulu	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-11-01 08:09:05.196	2024-11-01 08:09:05.196	2024-11-01 08:09:05.196
cm2ygf1wu0002xpdf9fm96h8r	cm2uswab2000212okdwag9ulu	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-11-01 08:10:00.942	2024-11-01 08:10:00.942	2024-11-01 08:10:00.942
cm2ygfmrw0003xpdf3ema0k07	cm2uswab2000212okdwag9ulu	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-11-01 08:10:27.693	2024-11-01 08:10:27.693	2024-11-01 08:10:27.693
cm2yggf1n0004xpdfdu9baabm	cm2uswab2000212okdwag9ulu	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-11-01 08:11:04.354	2024-11-01 08:11:04.354	2024-11-01 08:11:04.354
cm2yggw8a0005xpdf29mspdxf	cm2uswab2000212okdwag9ulu	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-11-01 08:11:26.891	2024-11-01 08:11:26.891	2024-11-01 08:11:26.891
cm2ygh9xv0006xpdf030loyll	cm2uswab2000212okdwag9ulu	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-11-01 08:11:44.373	2024-11-01 08:11:44.373	2024-11-01 08:11:44.373
cm2yghgfh0007xpdfpnbkso8r	cm2uswab2000212okdwag9ulu	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-11-01 08:11:53.069	2024-11-01 08:11:53.069	2024-11-01 08:11:53.069
cm2ygivfx0008xpdf8d68kunc	cm2ybozkt00045xr3x3hapetd	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	MacOS	undefined,undefined,undefined	SUCCESS	Login successful	2024-11-01 08:12:58.908	2024-11-01 08:12:58.908	2024-11-01 08:12:58.908
cm2ygnnud00001089nddjjkhb	cm2uswab2000212okdwag9ulu	175.41.45.179	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Windows	Bangladesh,C,Dhaka	SUCCESS	Login successful	2024-11-01 08:16:42.613	2024-11-01 08:16:42.613	2024-11-01 08:16:42.613
cm308ij9x0003bgas1tiz6az6	cm2uswab2000212okdwag9ulu	175.41.46.46	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Windows	Bangladesh,C,Dhaka	SUCCESS	Login successful	2024-11-02 14:04:18.837	2024-11-02 14:04:18.837	2024-11-02 14:04:18.837
cm35sxcs50000lssc4xvzyspr	cm2uswab2000212okdwag9ulu	::1	PostmanRuntime/7.42.0	PostmanRuntime/7.42.0	Unknown OS	undefined,undefined,undefined	SUCCESS	Login successful	2024-11-06 11:34:33.461	2024-11-06 11:34:33.461	2024-11-06 11:34:33.461
\.


--
-- Data for Name: otherUsers; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public."otherUsers" (id, "userId", "firstName", "lastName", profile_picture, role, "isActive", "userUniqueId", "createdAt", "updatedAt", "order", "userJoinDate") FROM stdin;
\.


--
-- Data for Name: product_category; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public.product_category (id, product_category_name, description, image, "isActive", "order", "createdAt", "updatedAt", "vendorId", "createdById") FROM stdin;
cm2vsm2o30000e71b4xxcfsjj	Glass		{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1730287683/uploads/pekojfl0sbzp4bgxn96j.jpg", "size": 95059, "filename": "logo.png", "publicId": "uploads/pekojfl0sbzp4bgxn96j", "extension": "png", "fieldName": "image"}	ACTIVE	1	2024-10-30 11:28:05.379	2024-10-30 11:28:05.379	cm2uswab2000112ok44tt2s4f	cm2uswab2000212okdwag9ulu
cm2vsm2o50001e71b3b2lr4kv	Bottle	des	{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1730287682/uploads/s6vlbmrn0wjuob0ui3ih.png", "size": 38203, "filename": "ByteBridgePNG3Color.png", "publicId": "uploads/s6vlbmrn0wjuob0ui3ih", "extension": "png", "fieldName": "image"}	ACTIVE	2	2024-10-30 11:28:05.379	2024-10-30 18:14:05.746	cm2uswab2000112ok44tt2s4f	cm2uswab2000212okdwag9ulu
cm2x9b7lj0002e4cwbegmkn5g	Microphone	Microphone des	{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1730376196/uploads/fbs0l2icssvuwcpdy05y.png", "size": 6020683, "filename": "vecteezy_3d-face-lock-illustration_12421761_968.png", "publicId": "uploads/fbs0l2icssvuwcpdy05y", "extension": "png", "fieldName": "image"}	ACTIVE	1	2024-10-31 12:03:17.935	2024-11-01 07:09:49.449	cm2uswab2000112ok44tt2s4f	cm2uswab2000212okdwag9ulu
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public.product (id, product_name, description, product_code, product_quantity_type, delivery_charge_type, "isActive", "createdAt", "updatedAt", "vendorId", "categoryId", "createdById", total_order_placed, "isProductPurchased") FROM stdin;
cm2ye95rw0001kkkns1hfryuj	test	\N	PD-HMVQFJG7	KG	REGULAR	ACTIVE	2024-11-01 07:09:26.779	2024-11-01 07:24:57.002	cm2uswab2000112ok44tt2s4f	cm2vsm2o30000e71b4xxcfsjj	cm2uswab2000212okdwag9ulu	0	f
cm2w8fdh700028l39gb5qracr	Head Phone	test des....	PD-367505	PER	CHARGEABLE	ACTIVE	2024-10-30 18:50:46.651	2024-11-01 07:25:12.734	cm2uswab2000112ok44tt2s4f	cm2vsm2o30000e71b4xxcfsjj	cm2uswab2000212okdwag9ulu	0	f
cm2x9zi920001qnfddwxtxi5o	Mobile	mm	PD-761990	GRAM	REGULAR	INACTIVE	2024-10-31 12:22:11.469	2024-11-01 07:25:19.562	cm2uswab2000112ok44tt2s4f	cm2vsm2o30000e71b4xxcfsjj	cm2uswab2000212okdwag9ulu	0	f
cm2x9fl040004e4cw9vec15rt	Macbook	Macbook m2	PD-555070	PIECE	REGULAR	INACTIVE	2024-10-31 12:06:41.946	2024-11-01 07:25:27.778	cm2uswab2000112ok44tt2s4f	cm2x9b7lj0002e4cwbegmkn5g	cm2uswab2000212okdwag9ulu	0	f
cm2w8a4rt00022e6d0f1q7wk1	Head Phone.	test des.	PD-870430	UNIT	REGULAR	ACTIVE	2024-10-30 18:46:40.395	2024-11-06 11:37:25.419	cm2uswab2000112ok44tt2s4f	cm2vsm2o50001e71b3b2lr4kv	cm2uswab2000212okdwag9ulu	0	t
\.


--
-- Data for Name: product_order; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public.product_order (id, "productId", "createdAt", "updatedAt", "vendorId", "orderDate", "otherUsersId", "totalAmount", discount, "deliveryCharge", "orderStatus", quantity, subtotal, tax, "unitPrice", "zoneId") FROM stdin;
\.


--
-- Data for Name: payment_info; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public.payment_info (id, "orderId", amount, discount, "paymentMethod", "paymentDate", "paymentStatus", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: product_image; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public.product_image (id, image, "isActive", "createdAt", "updatedAt", "productId") FROM stdin;
cm2w9qk9p0001vl72mum1iy0f	{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1730316445/uploads/efkppaqj1akeyyhzsfr8.jpg", "size": 454539, "filename": "EGg6tcTUwAAP_6K.jpeg", "publicId": "uploads/efkppaqj1akeyyhzsfr8", "extension": "jpeg", "fieldName": "product_images"}	ACTIVE	2024-10-30 19:27:27.996	2024-10-30 20:28:36.951	cm2w8fdh700028l39gb5qracr
cm2wckgb90001rv0mphn3e6df	{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1730321197/uploads/y4t7pqowillzegkonaba.jpg", "size": 1480396, "filename": "1685788329729.jpg", "publicId": "uploads/y4t7pqowillzegkonaba", "extension": "jpeg", "fieldName": "product_images"}	ACTIVE	2024-10-30 20:46:42.067	2024-10-30 20:46:42.067	cm2w8a4rt00022e6d0f1q7wk1
cm2wckgp90003rv0mea9brac0	{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1730321197/uploads/md6ogu7ztiycnir5vxgh.png", "size": 944594, "filename": "1685788329729.png", "publicId": "uploads/md6ogu7ztiycnir5vxgh", "extension": "png", "fieldName": "product_images"}	ACTIVE	2024-10-30 20:46:42.573	2024-10-30 20:46:42.573	cm2w8a4rt00022e6d0f1q7wk1
cm2wdag4d0001442t70hxjk27	{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1730322412/uploads/shu2b1uvn1i7ws6bs3om.png", "size": 38203, "filename": "ByteBridgePNG3Color.png", "publicId": "uploads/shu2b1uvn1i7ws6bs3om", "extension": "png", "fieldName": "product_images"}	ACTIVE	2024-10-30 21:06:54.875	2024-10-30 21:06:54.875	cm2w8fdh700028l39gb5qracr
cm2wdagod0003442txmq7f6pg	{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1730322411/uploads/sz49o7sjp4qde19o9739.png", "size": 5090, "filename": "download.png", "publicId": "uploads/sz49o7sjp4qde19o9739", "extension": "png", "fieldName": "product_images"}	ACTIVE	2024-10-30 21:06:55.597	2024-10-30 21:06:55.597	cm2w8fdh700028l39gb5qracr
cm2wdb4vv0005442tm9t0hvdz	{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1730322441/uploads/txa96nhhyit8zj4jtaex.png", "size": 33065, "filename": "Screenshot 2024-10-27 at 3.48.10â¯AM.png", "publicId": "uploads/txa96nhhyit8zj4jtaex", "extension": "png", "fieldName": "product_images"}	ACTIVE	2024-10-30 21:07:26.971	2024-10-30 21:07:26.971	cm2w8fdh700028l39gb5qracr
cm2wdb54a0007442to211e07r	{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1730322444/uploads/wrhgp6wi9zh9xylfh2n5.png", "size": 6020683, "filename": "vecteezy_3d-face-lock-illustration_12421761_968.png", "publicId": "uploads/wrhgp6wi9zh9xylfh2n5", "extension": "png", "fieldName": "product_images"}	ACTIVE	2024-10-30 21:07:27.274	2024-10-30 21:07:27.274	cm2w8fdh700028l39gb5qracr
cm2wdb5cc0009442twi2f819l	{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1730322442/uploads/cbzoyvabrjw9dcfg9a5q.jpg", "size": 115532, "filename": "WhatsApp Image 2023-07-18 at 11.47.19 PM.jpeg", "publicId": "uploads/cbzoyvabrjw9dcfg9a5q", "extension": "jpeg", "fieldName": "product_images"}	ACTIVE	2024-10-30 21:07:27.564	2024-10-30 21:07:27.564	cm2w8fdh700028l39gb5qracr
cm2wdb5jv000b442tav9rfi5t	{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1730322443/uploads/s9olzt4gu9xq4qcakxal.jpg", "size": 1282555, "filename": "Screenshot 2024-08-24 at 12.52.44â¯PM.png", "publicId": "uploads/s9olzt4gu9xq4qcakxal", "extension": "png", "fieldName": "product_images"}	ACTIVE	2024-10-30 21:07:27.835	2024-10-30 21:07:27.835	cm2w8fdh700028l39gb5qracr
cm2wdemzg000d442tv194b5sv	{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1730322605/uploads/f7db5xosewxew8wonlvs.jpg", "size": 95059, "filename": "logo.png", "publicId": "uploads/f7db5xosewxew8wonlvs", "extension": "png", "fieldName": "product_images"}	ACTIVE	2024-10-30 21:10:10.397	2024-10-30 21:10:10.397	cm2w8fdh700028l39gb5qracr
cm2wden72000f442t76oftxbv	{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1730322604/uploads/bpnrth91ezndsvo70o5a.png", "size": 33065, "filename": "Screenshot 2024-10-27 at 3.48.10â¯AM.png", "publicId": "uploads/bpnrth91ezndsvo70o5a", "extension": "png", "fieldName": "product_images"}	ACTIVE	2024-10-30 21:10:10.67	2024-10-30 21:10:10.67	cm2w8fdh700028l39gb5qracr
cm2wdenhh000h442t37ivjxez	{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1730322605/uploads/fpeuoj76agqmrbfa6bwh.jpg", "size": 175951, "filename": "nid -emon.jpg", "publicId": "uploads/fpeuoj76agqmrbfa6bwh", "extension": "jpeg", "fieldName": "product_images"}	ACTIVE	2024-10-30 21:10:11.045	2024-10-30 21:10:11.045	cm2w8fdh700028l39gb5qracr
cm2wdenos000j442tqvigjwrb	{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1730322605/uploads/qczwi0r3fheir8jxdr2e.png", "size": 210883, "filename": "nid-back-emon.jpg", "publicId": "uploads/qczwi0r3fheir8jxdr2e", "extension": "jpeg", "fieldName": "product_images"}	ACTIVE	2024-10-30 21:10:11.308	2024-10-30 21:10:11.308	cm2w8fdh700028l39gb5qracr
cm2wdenxo000l442t94dwieqx	{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1730322607/uploads/cn3bd8hf13xa2zpimakz.png", "size": 6020683, "filename": "vecteezy_3d-face-lock-illustration_12421761_968.png", "publicId": "uploads/cn3bd8hf13xa2zpimakz", "extension": "png", "fieldName": "product_images"}	ACTIVE	2024-10-30 21:10:11.628	2024-10-30 21:10:11.628	cm2w8fdh700028l39gb5qracr
cm2wdeo53000n442tmfxku3tt	{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1730322605/uploads/lmwu6w3pmlfauuhpj8cz.jpg", "size": 115532, "filename": "WhatsApp Image 2023-07-18 at 11.47.19 PM.jpeg", "publicId": "uploads/lmwu6w3pmlfauuhpj8cz", "extension": "jpeg", "fieldName": "product_images"}	ACTIVE	2024-10-30 21:10:11.896	2024-10-30 21:10:11.896	cm2w8fdh700028l39gb5qracr
cm2x9fl040005e4cwslcg266g	{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1730376400/uploads/bditkquxzxlfpxtjfwno.png", "size": 38203, "filename": "ByteBridgePNG3Color.png", "publicId": "uploads/bditkquxzxlfpxtjfwno", "extension": "png", "fieldName": "product_images"}	ACTIVE	2024-10-31 12:06:41.946	2024-10-31 12:06:41.946	cm2x9fl040004e4cw9vec15rt
cm2x9zi920002qnfdlg8ukrq6	{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1730377326/uploads/i7hnukefk6auk8czc4xu.png", "size": 38203, "filename": "ByteBridgePNG3Color.png", "publicId": "uploads/i7hnukefk6auk8czc4xu", "extension": "png", "fieldName": "product_images"}	ACTIVE	2024-10-31 12:22:11.469	2024-10-31 12:22:11.469	cm2x9zi920001qnfddwxtxi5o
cm2x9zi960003qnfdcy0b5u45	{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1730377325/uploads/mgslgjv5f03hnpqxmqy9.png", "size": 5090, "filename": "download.png", "publicId": "uploads/mgslgjv5f03hnpqxmqy9", "extension": "png", "fieldName": "product_images"}	ACTIVE	2024-10-31 12:22:11.469	2024-10-31 12:22:11.469	cm2x9zi920001qnfddwxtxi5o
cm2x9zi960004qnfdtkfiiy2x	{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1730377326/uploads/pg3vn3y3qkae2gf7x85g.jpg", "size": 95059, "filename": "logo.png", "publicId": "uploads/pg3vn3y3qkae2gf7x85g", "extension": "png", "fieldName": "product_images"}	ACTIVE	2024-10-31 12:22:11.469	2024-10-31 12:22:11.469	cm2x9zi920001qnfddwxtxi5o
cm2x9zi960005qnfd39eq3ok4	{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1730377329/uploads/wikgnucz0cleex1itssn.png", "size": 6020683, "filename": "vecteezy_3d-face-lock-illustration_12421761_968.png", "publicId": "uploads/wikgnucz0cleex1itssn", "extension": "png", "fieldName": "product_images"}	ACTIVE	2024-10-31 12:22:11.469	2024-10-31 12:22:11.469	cm2x9zi920001qnfddwxtxi5o
cm2x9zi960006qnfd116qazyq	{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1730377327/uploads/wdvhsztfd4futn8rkhqy.jpg", "size": 115532, "filename": "WhatsApp Image 2023-07-18 at 11.47.19 PM.jpeg", "publicId": "uploads/wdvhsztfd4futn8rkhqy", "extension": "jpeg", "fieldName": "product_images"}	ACTIVE	2024-10-31 12:22:11.469	2024-10-31 12:22:11.469	cm2x9zi920001qnfddwxtxi5o
\.


--
-- Data for Name: product_inventory; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public.product_inventory (id, "productId", "stockAvailable", "quantitySold", "productStockLimit", "productCustomerPrice", "productRetailPrice", "lastUpdated", "createdAt", "updatedAt", "zoneId") FROM stdin;
cm35t11gr000310wglu82666b	cm2w8a4rt00022e6d0f1q7wk1	10	0	5	65	60	2024-11-06 11:37:25.419	2024-11-06 11:37:25.419	2024-11-06 11:37:25.419	cm2xn09y20003o813z01r7dp9
\.


--
-- Data for Name: product_stock_purchase; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public.product_stock_purchase (id, purchase_date, "supplierId", "productId", "purchaseUniqueId", product_quantity, product_selling_price, product_purchase_price, product_retail_price, product_old_mrp, special_offer, "zoneId", "vendorId", "createdById", "isActive", "createdAt", "updatedAt") FROM stdin;
cm35t10zr000110wgk7f7c957	2024-11-06 11:37:24.556	cm308407q0001x6c8fdyn7obn	cm2w8a4rt00022e6d0f1q7wk1	PSP-9X703WH6	10	65	50	60	45	15% Extra	cm2xn09y20003o813z01r7dp9	cm2uswab2000112ok44tt2s4f	cm2uswab2000212okdwag9ulu	ACTIVE	2024-11-06 11:37:24.556	2024-11-06 11:37:24.556
\.


--
-- Data for Name: product_stock_report; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public.product_stock_report (id, "product_stock_purchaseId", "productId", product_stock, product_selling_price, product_purchase_price, product_sold_quantity, "createdAt", "updatedAt", "isActive", "vendorId", product_retail_price) FROM stdin;
cm35t13k3000410wguzufji2y	cm35t10zr000110wgk7f7c957	cm2w8a4rt00022e6d0f1q7wk1	10	65	50	0	2024-11-06 11:37:28.131	2024-11-06 11:37:28.131	ACTIVE	cm2uswab2000112ok44tt2s4f	60
\.


--
-- Data for Name: shipping_info; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public.shipping_info (id, "orderId", address, "shippingDate", "estimatedDeliveryDate", "trackingNumber", "shippingStatus", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Name: district_id_seq; Type: SEQUENCE SET; Schema: public; Owner: quick_shop_db_user
--

SELECT pg_catalog.setval('public.district_id_seq', 64, true);


--
-- Name: division_id_seq; Type: SEQUENCE SET; Schema: public; Owner: quick_shop_db_user
--

SELECT pg_catalog.setval('public.division_id_seq', 8, true);


--
-- Name: union_id_seq; Type: SEQUENCE SET; Schema: public; Owner: quick_shop_db_user
--

SELECT pg_catalog.setval('public.union_id_seq', 4540, true);


--
-- Name: upazila_id_seq; Type: SEQUENCE SET; Schema: public; Owner: quick_shop_db_user
--

SELECT pg_catalog.setval('public.upazila_id_seq', 494, true);


--
-- PostgreSQL database dump complete
--

