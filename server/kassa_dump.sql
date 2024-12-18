--
-- PostgreSQL database dump
--

-- Dumped from database version 16.6 (Ubuntu 16.6-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.6 (Ubuntu 16.6-0ubuntu0.24.04.1)

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
-- Name: card; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.card (
    id_card integer NOT NULL,
    telephone text,
    card_number text
);


ALTER TABLE public.card OWNER TO postgres;

--
-- Name: card_id_card_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.card_id_card_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.card_id_card_seq OWNER TO postgres;

--
-- Name: card_id_card_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.card_id_card_seq OWNED BY public.card.id_card;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    category_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_category_id_seq OWNER TO postgres;

--
-- Name: categories_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_category_id_seq OWNED BY public.categories.category_id;


--
-- Name: map; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.map (
    telephone integer NOT NULL,
    name character varying(255) NOT NULL,
    card_number text
);


ALTER TABLE public.map OWNER TO postgres;

--
-- Name: map_telephone_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.map_telephone_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.map_telephone_seq OWNER TO postgres;

--
-- Name: map_telephone_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.map_telephone_seq OWNED BY public.map.telephone;


--
-- Name: productcodes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productcodes (
    product_code_id integer NOT NULL,
    product_id integer NOT NULL,
    unique_code text NOT NULL
);


ALTER TABLE public.productcodes OWNER TO postgres;

--
-- Name: productcodes_product_code_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.productcodes_product_code_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.productcodes_product_code_id_seq OWNER TO postgres;

--
-- Name: productcodes_product_code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productcodes_product_code_id_seq OWNED BY public.productcodes.product_code_id;


--
-- Name: productdescriptions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productdescriptions (
    description_id integer NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.productdescriptions OWNER TO postgres;

--
-- Name: productdescriptions_description_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.productdescriptions_description_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.productdescriptions_description_id_seq OWNER TO postgres;

--
-- Name: productdescriptions_description_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productdescriptions_description_id_seq OWNED BY public.productdescriptions.description_id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    product_id integer NOT NULL,
    name character varying(255) NOT NULL,
    price numeric(10,2) NOT NULL,
    barcode character varying(255),
    category_id integer,
    description_id integer
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_product_id_seq OWNER TO postgres;

--
-- Name: products_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products.product_id;


--
-- Name: stockquantities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stockquantities (
    stock_quantity_id integer NOT NULL,
    product_id integer NOT NULL,
    stock_quantity integer NOT NULL
);


ALTER TABLE public.stockquantities OWNER TO postgres;

--
-- Name: stockquantities_stock_quantity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stockquantities_stock_quantity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.stockquantities_stock_quantity_id_seq OWNER TO postgres;

--
-- Name: stockquantities_stock_quantity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stockquantities_stock_quantity_id_seq OWNED BY public.stockquantities.stock_quantity_id;


--
-- Name: card id_card; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card ALTER COLUMN id_card SET DEFAULT nextval('public.card_id_card_seq'::regclass);


--
-- Name: categories category_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN category_id SET DEFAULT nextval('public.categories_category_id_seq'::regclass);


--
-- Name: map telephone; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map ALTER COLUMN telephone SET DEFAULT nextval('public.map_telephone_seq'::regclass);


--
-- Name: productcodes product_code_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productcodes ALTER COLUMN product_code_id SET DEFAULT nextval('public.productcodes_product_code_id_seq'::regclass);


--
-- Name: productdescriptions description_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productdescriptions ALTER COLUMN description_id SET DEFAULT nextval('public.productdescriptions_description_id_seq'::regclass);


--
-- Name: products product_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN product_id SET DEFAULT nextval('public.products_product_id_seq'::regclass);


--
-- Name: stockquantities stock_quantity_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stockquantities ALTER COLUMN stock_quantity_id SET DEFAULT nextval('public.stockquantities_stock_quantity_id_seq'::regclass);


--
-- Data for Name: card; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.card (id_card, telephone, card_number) FROM stdin;
1	89835354116	1234567890123
2	89835352222	0000944827756
3	89835354157	0000120807656
4	89835443516	0001003536614
5	89567436547	0001005117008
6	89876787887	0000889430796
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (category_id, name, description) FROM stdin;
1	Фрукты	Свежие фрукты
2	Овощи	Свежие овощи
3	Сухофрукты	Сушенные фрукты и ягоды
4	Мясо и птица	Свежее мясо
7	Крупы	Все поштучно
8	Хлеб и выпечка	Все поштучно
9	Напитки	Чай, кофе, соки и т.д.
10	Сладости	Шоколад, торты и тд
6	Сыр и колбаса	Все поштучно
5	Молочные продукты	Все поштучно
\.


--
-- Data for Name: map; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.map (telephone, name, card_number) FROM stdin;
\.


--
-- Data for Name: productcodes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productcodes (product_code_id, product_id, unique_code) FROM stdin;
100	1	001
101	2	002
102	3	003
103	4	004
104	5	005
105	6	006
106	7	007
107	8	008
108	9	009
109	10	010
110	11	011
111	12	012
112	13	013
113	14	014
114	15	015
115	16	016
116	17	017
117	18	018
118	19	019
119	20	020
120	21	021
121	22	022
122	23	023
123	24	024
124	25	025
125	26	026
126	27	027
127	28	028
128	29	029
129	30	030
130	31	031
131	32	032
132	33	033
133	34	034
134	35	035
135	36	036
136	37	037
137	38	038
138	39	039
139	40	040
140	41	041
141	42	042
142	43	043
143	44	044
144	45	045
145	75	075
146	46	046
147	47	047
148	48	048
149	49	049
150	50	050
151	51	051
152	52	052
153	53	053
154	54	054
155	55	055
156	56	056
157	57	057
158	58	058
159	59	059
160	60	060
161	61	061
162	62	062
163	63	063
164	64	064
165	65	065
166	66	066
167	67	067
168	68	068
169	69	069
170	70	070
171	71	071
172	72	072
173	73	073
174	74	074
175	76	076
176	77	077
177	78	078
178	79	079
179	80	080
180	81	081
181	82	082
182	83	083
183	84	084
184	85	085
185	86	086
186	87	087
187	88	088
188	89	089
189	90	090
190	91	091
191	92	092
192	93	093
193	94	094
194	95	095
195	96	096
196	97	097
197	98	098
198	99	099
\.


--
-- Data for Name: productdescriptions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productdescriptions (description_id, description) FROM stdin;
1	Весовое
2	Упакованный
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (product_id, name, price, barcode, category_id, description_id) FROM stdin;
1	Яблоко	150.00	123456789012	1	1
2	Апельсин	169.99	123456780000	1	1
3	Мандарины	179.99	123456780001	1	1
4	Бананы	144.99	123456780002	1	1
5	Гранаты	189.99	123456780003	1	1
6	Киви	199.99	123456780004	1	1
7	Груши	309.99	123456780005	1	1
8	Виноград белый	289.99	123456780006	1	1
9	Виноград Рэд	329.99	123456780007	1	1
10	Хурма	169.99	123456780008	1	1
11	Лимон	79.99	123456780009	1	1
12	Манго	459.99	123456780010	1	1
13	Ананас	199.99	123456780011	1	1
14	Чеснок	349.99	123456780012	2	1
15	Капуста	27.99	123456780013	2	1
16	Томаты	179.99	123456780014	2	1
17	Огурцы длинноплодные	89.99	123456780015	2	1
18	Огурцы короткоплодные	169.99	123456780016	2	1
19	Картофель	79.99	123456780017	2	1
20	Перец красный	469.99	123456780018	2	1
21	Лук белый	149.99	123456780019	2	1
22	Лук красный	89.99	123456780020	2	1
23	Морковь	69.99	123456780021	2	1
24	Шампиньоны	349.99	123456780022	2	1
25	Чернослив	79.99	123456780023	3	2
26	Манго	799.99	123456780024	3	1
27	Финики	79.99	123456780025	3	2
28	Вишня	199.99	123456780026	3	2
29	Кокос кубиками	199.99	123456780027	3	2
30	Бедро куриное НПФ	219.99	123456780028	4	1
31	Филе грудки индейки	589.99	123456780029	4	1
32	Филе грудки индейки ИНДИ	534.99	123456780030	4	1
33	Голень куриная АБ	259.99	123456780031	4	1
34	Тушка цыпленка АБ	239.99	123456780032	4	1
35	Стейк из грудки индейки ИНДИ	359.99	123456780033	4	2
36	Голень куриная с кожей	379.99	123456780034	4	1
37	Шея свининая НЕЛЕНТА	499.99	123456780035	4	1
38	Карбонад из свинины НЕЛЕНТА	399.99	123456780036	4	1
39	Окорок свиной НЕЛЕНТА	309.99	123456780037	4	1
40	Бекон ЧЕРКИЗОВО	279.99	123456780038	4	2
41	Говядина МИРАТОРГ	999.99	123456780039	4	2
42	Фарш из курицы	149.99	123456780040	4	2
43	Фарш из индейки	319.99	123456780041	4	2
44	Фарш говяжий	229.99	123456780042	4	2
45	Молоко 2,5%	79.99	123456780043	5	2
75	Хлеб белый	34.99	123456780073	8	2
46	Молоко 3,5%	109.99	123456780044	5	2
47	Сливки 20%	104.99	123456780045	5	2
48	Сливки 10%	69.99	123456780046	5	2
49	Сметана 15%	99.99	123456780047	5	2
50	Сметана 25%	119.99	123456780048	5	2
51	Творог 5%	199.99	123456780049	5	2
52	Творог 9%	114.99	123456780050	5	2
53	Йогурт с печеньем ЧУДО	54.99	123456780051	5	2
54	Йогурт с яблоком ЧУДО	54.99	123456780052	5	2
55	Йогурт с грушей ДАН	54.99	123456780053	5	2
56	Молоко сгущенное	189.99	123456780054	5	2
57	Яйцо куриное 10шт С1	109.99	123456780055	5	2
58	Яйцо куриное 10шт С2	106.99	123456780056	5	2
59	Сыр твороженый	166.99	123456780057	6	2
60	Сыр твердый	209.99	123456780058	6	2
61	Колбаса вареная	369.99	123456780059	6	2
62	Колбаса варено-копченая	369.99	123456780060	6	2
63	Колбаса сырокопченая	199.99	123456780061	6	2
64	Рис	100.99	123456780062	7	2
65	Макароны	60.99	123456780063	7	2
66	Горох	79.99	123456780064	7	2
67	Крупа гречневая	89.99	123456780065	7	2
68	Крупа манная	29.99	123456780066	7	2
69	Пшено	59.99	123456780067	7	2
70	Нут	84.99	123456780068	7	2
71	Крупа перловая	20.99	123456780069	7	2
72	Сахар	64.99	123456780070	7	2
73	Соль	79.99	123456780071	7	2
74	Батон высший сорт	54.99	123456780072	8	2
76	Лепешка пшеничная	124.99	123456780074	8	2
77	Хлеб ржаной	78.99	123456780075	8	2
78	Сушки	84.99	123456780076	8	2
79	Булочка с шоколадом	44.99	123456780077	8	2
80	Пирог с творогом	85.99	123456780078	8	2
81	Чай черный 100пк	419.99	123456780079	9	2
82	Чай зеленый 25пк	99.99	123456780080	9	2
83	Чай с ромашкой 25пк	99.99	123456780081	9	2
84	Кофе растворимый	289.99	123456780082	9	2
85	Кофе молотый	349.99	123456780083	9	2
86	Какао-порошок	134.99	123456780084	9	2
87	Вода минеральная	59.99	123456780085	9	2
88	Вода питьевая	34.99	123456780086	9	2
89	Сок Добрый яблоко	109.99	123456780087	9	2
90	Сок Добрый апельсин	109.99	123456780088	9	2
91	Сок Добрый томат	109.99	123456780089	9	2
92	Кола Добрый	149.99	123456780090	9	2
93	Шоколад молочный	100.99	123456780091	10	2
94	Шоколад темный	129.99	123456780092	10	2
95	Яйцо шоколадное	89.99	123456780093	10	2
96	Паста ореховая	419.99	123456780094	10	2
97	Торт красный бархат	519.99	123456780095	10	2
98	Торт медовик	289.99	123456780096	10	2
99	Торт Прага	459.99	123456780097	10	2
\.


--
-- Data for Name: stockquantities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stockquantities (stock_quantity_id, product_id, stock_quantity) FROM stdin;
1	1	100
2	2	100
3	3	100
4	4	100
5	5	100
6	6	100
7	7	100
8	8	100
9	9	100
10	10	100
11	11	100
12	12	100
13	13	100
14	14	100
15	15	100
16	16	100
17	17	100
18	18	100
19	19	100
20	20	100
21	21	100
22	22	100
23	23	100
24	24	100
25	25	50
26	26	50
27	27	50
28	28	50
29	29	50
30	30	50
31	31	50
32	32	50
33	33	50
34	34	50
35	35	50
36	36	50
37	37	50
38	38	50
39	39	50
40	40	50
41	41	50
42	42	50
43	43	50
44	44	50
45	45	50
46	75	50
47	46	50
48	47	50
49	48	50
50	49	50
51	50	50
52	51	50
53	52	50
54	53	50
55	54	50
56	55	50
57	56	50
58	57	50
59	58	50
60	59	50
61	60	50
62	61	50
63	62	50
64	63	50
65	64	50
66	65	50
67	66	50
68	67	50
69	68	50
70	69	50
71	70	50
72	71	50
73	72	50
74	73	50
75	74	50
76	76	50
77	77	50
78	78	50
79	79	50
80	80	50
81	81	50
82	82	50
83	83	50
84	84	50
85	85	50
86	86	50
87	87	50
88	88	50
89	89	50
90	90	50
91	91	50
92	92	50
93	93	50
94	94	50
95	95	50
96	96	50
97	97	50
98	98	50
99	99	50
\.


--
-- Name: card_id_card_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.card_id_card_seq', 6, true);


--
-- Name: categories_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_category_id_seq', 1, false);


--
-- Name: map_telephone_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.map_telephone_seq', 1, false);


--
-- Name: productcodes_product_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productcodes_product_code_id_seq', 198, true);


--
-- Name: productdescriptions_description_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productdescriptions_description_id_seq', 2, true);


--
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_product_id_seq', 2, true);


--
-- Name: stockquantities_stock_quantity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stockquantities_stock_quantity_id_seq', 99, true);


--
-- Name: card card_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card
    ADD CONSTRAINT card_pkey PRIMARY KEY (id_card);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);


--
-- Name: map map_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map
    ADD CONSTRAINT map_pkey PRIMARY KEY (telephone);


--
-- Name: productcodes productcodes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productcodes
    ADD CONSTRAINT productcodes_pkey PRIMARY KEY (product_code_id);


--
-- Name: productdescriptions productdescriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productdescriptions
    ADD CONSTRAINT productdescriptions_pkey PRIMARY KEY (description_id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- Name: stockquantities stockquantities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stockquantities
    ADD CONSTRAINT stockquantities_pkey PRIMARY KEY (stock_quantity_id);


--
-- Name: productcodes fk_product_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productcodes
    ADD CONSTRAINT fk_product_code FOREIGN KEY (product_id) REFERENCES public.products(product_id);


--
-- Name: products fk_product_description; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_product_description FOREIGN KEY (description_id) REFERENCES public.productdescriptions(description_id);


--
-- Name: stockquantities fk_stock_quantity; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stockquantities
    ADD CONSTRAINT fk_stock_quantity FOREIGN KEY (product_id) REFERENCES public.products(product_id);


--
-- Name: products products_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(category_id);


--
-- PostgreSQL database dump complete
--

