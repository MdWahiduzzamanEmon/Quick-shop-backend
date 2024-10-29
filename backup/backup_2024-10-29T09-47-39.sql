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
\.


--
-- Data for Name: vendor; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public.vendor (id, name, address, phone, "createdAt", "updatedAt", "isActive") FROM stdin;
cm2tifqsy00006xsy06gf5y17	Logic-Nexus It Solutions	Jhikargaccha, Jashore	01703459656	2024-10-28 21:07:41.553	2024-10-28 21:07:41.553	ACTIVE
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public."user" (id, email, mobile, username, password, "createdAt", "updatedAt", "vendorId") FROM stdin;
cm2tifqt000016xsytu6vqq0f	admin@admin.com	123456789	admin	$2b$10$W3iOF8fIrR61yMsQlU35xePmzTIzYdLYS1ueUBEGrXOcpDwB0Lwt2	2024-10-28 21:07:41.553	2024-10-28 21:07:41.553	cm2tifqsy00006xsy06gf5y17
cm2tkwfzm0001xy83jovk33f4	test@gmail.com	123321123	neon	$2b$10$04/PPqj8d9P9BIdctse7m.eDVo5CwZzxatB7AH2mD47UziJEjkBPa	2024-10-28 22:16:39.922	2024-10-28 22:16:39.922	cm2tifqsy00006xsy06gf5y17
cm2tkwvyq0005xy83pvvf6hjn	wahedemon09@gmail.com	01503459656	zaman	$2b$10$d.ztNle4POTjoS7HrJtLFe9LqiIxGVyKxH1109saiMsJ1qgRDJWYi	2024-10-28 22:17:00.626	2024-10-28 22:17:00.626	cm2tifqsy00006xsy06gf5y17
cm2tkz6jw000dxy83bhno24f3	wemon30@gmail.com	01716954101	avro	$2b$10$QhMco6vN2OK/I61CKpjKnuL1mRWZ6CwKqqNTqUal4arUWnbKq5Ha6	2024-10-28 22:18:47.661	2024-10-28 22:18:47.661	cm2tifqsy00006xsy06gf5y17
\.


--
-- Data for Name: workers; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public.workers (id, "fullName", role, "fatherName", "employeeID", whatsapp, "NID", "NIDImage", education, "bankName", "branchName", "accountNumber", "mobileBanking", "mobileBankingNumber", profile_picture, address, "zipCode", "userJoinDate", "createdAt", "updatedAt", "isActive", "order", "userId") FROM stdin;
cm2tkwvyq0006xy83oiy3o7fm	Md Wahiduzzaman	OPERATOR	Wahed Morad	EM-20249237-0	01721724905	12131241200	{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1730153816/uploads/a8ibcscmxaeuhlvgdnkj.png", "size": 34066, "filename": "1__6ooq0R60ba3UT5c-QVemA.png", "extension": "png"}	BSC in CST						{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1730153817/uploads/qqm4fdiygrtav3btes82.png", "size": 944594, "filename": "1685788329729.png", "extension": "png"}		7420	2024-10-28 22:17:00.626	2024-10-28 22:17:00.626	2024-10-28 22:17:02.674	ACTIVE	1	cm2tkwvyq0005xy83pvvf6hjn
cm2tkz6jw000exy83d5492pcg	Md Wahiduzzaman	REPRESENTATIVE	Wahed Morad	EM-20249272-0	01703459656	32352525	{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1730153923/uploads/o6kxcqdcjsy1ewziz87u.png", "size": 34066, "filename": "1__6ooq0R60ba3UT5c-QVemA.png", "extension": "png"}	BSC in CST						{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1730153924/uploads/ynaoppsf0aryqomhmida.png", "size": 944594, "filename": "1685788329729.png", "extension": "png"}		7420	2024-10-28 22:18:47.661	2024-10-28 22:18:47.661	2024-10-28 22:18:49.185	ACTIVE	1	cm2tkz6jw000dxy83bhno24f3
\.


--
-- Data for Name: zone; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public.zone (id, village_name, ward_no, zone_name, contact_no, whatsapp_no, division_id, district_id, upazila_id, union_id, "operatorId", "isActive", "createdAt", "createdById", "updatedAt", "vendorId") FROM stdin;
1	JHI	3	Jhikargachha	01703459656	01521724905	3	20	175	\N	cm2tkwvyq0006xy83oiy3o7fm	ACTIVE	2024-10-28 22:25:06.324	cm2tifqt000016xsytu6vqq0f	2024-10-28 22:25:06.324	cm2tifqsy00006xsy06gf5y17
\.


--
-- Data for Name: _ZoneRepresentatives; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public."_ZoneRepresentatives" ("A", "B") FROM stdin;
1	cm2tkz6jw000exy83d5492pcg
\.


--
-- Data for Name: _ZoneRiders; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public."_ZoneRiders" ("A", "B") FROM stdin;
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
ca39b7ae-517f-42b0-aee5-deb396d96c36	3e2235d9f51932938ab1c68a6e95c4226e6364e52f37e54d51a3217234d0cad5	2024-10-28 21:06:16.657432+00	20241028050824_	\N	\N	2024-10-28 21:06:14.90387+00	1
86afef5a-dc75-4a2e-8f75-6a53e26d2b5a	0110049a8f8a01794d119ba5a02725908b8c3ae7b3773e74b8814f9799ca7158	2024-10-28 21:06:18.61688+00	20241028185336_add_zones	\N	\N	2024-10-28 21:06:17.26881+00	1
6d452dc1-09fa-4422-82fe-72ee377355b0	d96dd6e23673847da5605a9ebcf031c0f037872af83f78bc5d6635956dce0f17	2024-10-28 21:06:20.712274+00	20241028194814_zone_add	\N	\N	2024-10-28 21:06:19.218907+00	1
9b9f260e-a4c8-41bc-a0d3-476b049c5972	4f1e3d8f709de4c27c848707f54072f7a68ee7e077daf110c6d35647c9ba482a	2024-10-28 21:06:22.648922+00	20241028210148_	\N	\N	2024-10-28 21:06:21.26706+00	1
aa94b246-76f1-4c0e-aff8-0b3fe4c31db3	58a9a92087c6e7f78a2768cf1f79ccfe6bb4bdd9802586e986de045ab7707dc1	2024-10-28 21:21:56.500329+00	20241028212153_	\N	\N	2024-10-28 21:21:55.011287+00	1
fcba806c-2586-449a-ae10-0f8b1857e006	8e23b262df10fec03f5288324274466e68a2c3b709a005709bc1979efbfaf938	2024-10-28 21:25:38.513872+00	20241028212535_yy	\N	\N	2024-10-28 21:25:37.012717+00	1
\.


--
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public.admin (id, "userId", "fullName", role, "isActive", "createdAt", "updatedAt") FROM stdin;
cm2tifqt000026xsyfepiuf75	cm2tifqt000016xsytu6vqq0f	admin	ADMIN	ACTIVE	2024-10-28 21:07:41.553	2024-10-28 21:07:41.553
\.


--
-- Data for Name: logginInfo; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public."logginInfo" (id, "userId", "ipAddress", device, browser, os, location, status, note, "loginAt", "createdAt", "updatedAt") FROM stdin;
cm2tikc33000014rglyonrs86	cm2tifqt000016xsytu6vqq0f	::1	PostmanRuntime/7.42.0	PostmanRuntime/7.42.0	Unknown OS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-28 21:11:15.759	2024-10-28 21:11:15.759	2024-10-28 21:11:15.759
cm2tksey70000r4ht3etsms59	cm2tifqt000016xsytu6vqq0f	::1	PostmanRuntime/7.42.0	PostmanRuntime/7.42.0	Unknown OS	undefined,undefined,undefined	SUCCESS	Login successful	2024-10-28 22:13:31.952	2024-10-28 22:13:31.952	2024-10-28 22:13:31.952
cm2tvakzc0000pwkhzbu083b4	cm2tifqt000016xsytu6vqq0f	175.41.45.179	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	Windows	Bangladesh,C,Dhaka	SUCCESS	Login successful	2024-10-29 03:07:35.737	2024-10-29 03:07:35.737	2024-10-29 03:07:35.737
\.


--
-- Data for Name: otherUsers; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public."otherUsers" (id, "userId", "firstName", "lastName", profile_picture, role, "isActive", "userUniqueId", "createdAt", "updatedAt", "order", "userJoinDate") FROM stdin;
cm2tkwfzm0002xy834znyzud4	cm2tkwfzm0001xy83jovk33f4	Md	Zaman	{"url": "https://res.cloudinary.com/dwkd71ets/image/upload/v1730153795/uploads/dl8csy0n7dlpewsem40i.png", "size": 944594, "filename": "1685788329729.png", "publicId": "uploads/dl8csy0n7dlpewsem40i", "extension": "png", "fieldName": "profile_picture"}	GENERAL_USER	ACTIVE	CS-20249550-0	2024-10-28 22:16:39.922	2024-10-28 22:16:42.485	1	2024-10-28 22:16:39.922
\.


--
-- Data for Name: product_category; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public.product_category (id, product_category_name, description, image, "isActive", "order", "createdAt", "updatedAt", "vendorId", "createdById") FROM stdin;
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public.product (id, product_name, description, product_quantity_type, delivery_charge_type, "isActive", "createdAt", "updatedAt", "vendorId", "categoryId", "createdById") FROM stdin;
\.


--
-- Data for Name: product_image; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public.product_image (id, image, "isActive", "createdAt", "updatedAt", "productId") FROM stdin;
\.


--
-- Data for Name: supplier; Type: TABLE DATA; Schema: public; Owner: quick_shop_db_user
--

COPY public.supplier (id, "fullName", address, whatsapp, profile_picture, "createdAt", "updatedAt", "isActive", "userId", role) FROM stdin;
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

SELECT pg_catalog.setval('public.union_id_seq', 2514, true);


--
-- Name: upazila_id_seq; Type: SEQUENCE SET; Schema: public; Owner: quick_shop_db_user
--

SELECT pg_catalog.setval('public.upazila_id_seq', 494, true);


--
-- Name: zone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: quick_shop_db_user
--

SELECT pg_catalog.setval('public.zone_id_seq', 1, true);


--
-- PostgreSQL database dump complete
--

