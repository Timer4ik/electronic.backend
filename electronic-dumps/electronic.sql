--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

-- Started on 2023-07-05 17:54:47

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
-- TOC entry 209 (class 1259 OID 54486)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    category_id integer NOT NULL,
    name character varying(255),
    file_id integer,
    parent_id integer,
    "desc" text,
    is_active boolean DEFAULT false,
    is_end boolean DEFAULT false,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 54493)
-- Name: categories_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_category_id_seq OWNER TO postgres;

--
-- TOC entry 3542 (class 0 OID 0)
-- Dependencies: 210
-- Name: categories_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_category_id_seq OWNED BY public.categories.category_id;


--
-- TOC entry 211 (class 1259 OID 54494)
-- Name: category_properties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category_properties (
    category_property_id integer NOT NULL,
    property_id integer NOT NULL,
    category_id integer NOT NULL,
    name character varying(255) NOT NULL,
    is_filter boolean DEFAULT false,
    is_active boolean DEFAULT false,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.category_properties OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 54499)
-- Name: category_properties_category_property_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_properties_category_property_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_properties_category_property_id_seq OWNER TO postgres;

--
-- TOC entry 3543 (class 0 OID 0)
-- Dependencies: 212
-- Name: category_properties_category_property_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_properties_category_property_id_seq OWNED BY public.category_properties.category_property_id;


--
-- TOC entry 213 (class 1259 OID 54500)
-- Name: developers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.developers (
    developer_id integer NOT NULL,
    name character varying(255),
    file_id integer,
    is_active boolean DEFAULT false,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.developers OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 54504)
-- Name: developers_developer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.developers_developer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.developers_developer_id_seq OWNER TO postgres;

--
-- TOC entry 3544 (class 0 OID 0)
-- Dependencies: 214
-- Name: developers_developer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.developers_developer_id_seq OWNED BY public.developers.developer_id;


--
-- TOC entry 215 (class 1259 OID 54505)
-- Name: files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files (
    file_id integer NOT NULL,
    size integer DEFAULT 0,
    name character varying(255),
    link character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.files OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 54511)
-- Name: files_file_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.files_file_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_file_id_seq OWNER TO postgres;

--
-- TOC entry 3545 (class 0 OID 0)
-- Dependencies: 216
-- Name: files_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.files_file_id_seq OWNED BY public.files.file_id;


--
-- TOC entry 242 (class 1259 OID 54764)
-- Name: get_methods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.get_methods (
    get_method_id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.get_methods OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 54763)
-- Name: get_methods_get_method_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.get_methods_get_method_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.get_methods_get_method_id_seq OWNER TO postgres;

--
-- TOC entry 3546 (class 0 OID 0)
-- Dependencies: 241
-- Name: get_methods_get_method_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.get_methods_get_method_id_seq OWNED BY public.get_methods.get_method_id;


--
-- TOC entry 246 (class 1259 OID 54797)
-- Name: order_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_products (
    order_product_id integer NOT NULL,
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    amount integer DEFAULT 1,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.order_products OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 54796)
-- Name: order_products_order_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_products_order_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_products_order_product_id_seq OWNER TO postgres;

--
-- TOC entry 3547 (class 0 OID 0)
-- Dependencies: 245
-- Name: order_products_order_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_products_order_product_id_seq OWNED BY public.order_products.order_product_id;


--
-- TOC entry 244 (class 1259 OID 54772)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    order_id integer NOT NULL,
    user_id integer,
    status_id integer DEFAULT 0,
    phone character varying(255) NOT NULL,
    address character varying(255),
    payment_method_id integer NOT NULL,
    get_method_id integer NOT NULL,
    email character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 54771)
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_order_id_seq OWNER TO postgres;

--
-- TOC entry 3548 (class 0 OID 0)
-- Dependencies: 243
-- Name: orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders.order_id;


--
-- TOC entry 240 (class 1259 OID 54757)
-- Name: payment_methods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_methods (
    payment_method_id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.payment_methods OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 54756)
-- Name: payment_methods_payment_method_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_methods_payment_method_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_methods_payment_method_id_seq OWNER TO postgres;

--
-- TOC entry 3549 (class 0 OID 0)
-- Dependencies: 239
-- Name: payment_methods_payment_method_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_methods_payment_method_id_seq OWNED BY public.payment_methods.payment_method_id;


--
-- TOC entry 217 (class 1259 OID 54521)
-- Name: product_photos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_photos (
    product_photo_id integer NOT NULL,
    name character varying(255) NOT NULL,
    file_id integer,
    product_id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.product_photos OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 54524)
-- Name: product_photos_product_photo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_photos_product_photo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_photos_product_photo_id_seq OWNER TO postgres;

--
-- TOC entry 3550 (class 0 OID 0)
-- Dependencies: 218
-- Name: product_photos_product_photo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_photos_product_photo_id_seq OWNED BY public.product_photos.product_photo_id;


--
-- TOC entry 219 (class 1259 OID 54525)
-- Name: product_property_values; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_property_values (
    product_property_value_id integer NOT NULL,
    product_id integer NOT NULL,
    property_value_id integer,
    category_property_id integer,
    is_active boolean DEFAULT false,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.product_property_values OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 54529)
-- Name: product_property_values_product_property_value_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_property_values_product_property_value_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_property_values_product_property_value_id_seq OWNER TO postgres;

--
-- TOC entry 3551 (class 0 OID 0)
-- Dependencies: 220
-- Name: product_property_values_product_property_value_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_property_values_product_property_value_id_seq OWNED BY public.product_property_values.product_property_value_id;


--
-- TOC entry 221 (class 1259 OID 54530)
-- Name: product_reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_reviews (
    user_id integer NOT NULL,
    product_id integer NOT NULL,
    comment text,
    stars double precision DEFAULT '0'::double precision,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.product_reviews OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 54536)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    product_id integer NOT NULL,
    name character varying(255),
    is_active boolean DEFAULT false,
    descr text,
    price double precision DEFAULT '0'::double precision,
    file_id integer,
    category_id integer NOT NULL,
    developer_id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 54543)
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_product_id_seq OWNER TO postgres;

--
-- TOC entry 3552 (class 0 OID 0)
-- Dependencies: 223
-- Name: products_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products.product_id;


--
-- TOC entry 224 (class 1259 OID 54544)
-- Name: promo_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.promo_products (
    promo_id integer NOT NULL,
    product_id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.promo_products OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 54547)
-- Name: promos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.promos (
    promo_id integer NOT NULL,
    title character varying(255),
    text text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.promos OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 54552)
-- Name: promos_promo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.promos_promo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.promos_promo_id_seq OWNER TO postgres;

--
-- TOC entry 3553 (class 0 OID 0)
-- Dependencies: 226
-- Name: promos_promo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.promos_promo_id_seq OWNED BY public.promos.promo_id;


--
-- TOC entry 227 (class 1259 OID 54553)
-- Name: properties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.properties (
    property_id integer NOT NULL,
    name character varying(255),
    is_active boolean DEFAULT false,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.properties OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 54557)
-- Name: properties_property_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.properties_property_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.properties_property_id_seq OWNER TO postgres;

--
-- TOC entry 3554 (class 0 OID 0)
-- Dependencies: 228
-- Name: properties_property_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.properties_property_id_seq OWNED BY public.properties.property_id;


--
-- TOC entry 229 (class 1259 OID 54558)
-- Name: property_values; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.property_values (
    property_value_id integer NOT NULL,
    name character varying(255),
    property_id integer NOT NULL,
    is_active boolean DEFAULT false,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.property_values OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 54562)
-- Name: property_values_property_value_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.property_values_property_value_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.property_values_property_value_id_seq OWNER TO postgres;

--
-- TOC entry 3555 (class 0 OID 0)
-- Dependencies: 230
-- Name: property_values_property_value_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.property_values_property_value_id_seq OWNED BY public.property_values.property_value_id;


--
-- TOC entry 231 (class 1259 OID 54563)
-- Name: shop_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop_products (
    shop_product integer NOT NULL,
    product_id integer NOT NULL,
    shop_id integer NOT NULL,
    is_active boolean DEFAULT false,
    is_sold boolean DEFAULT false,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.shop_products OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 54568)
-- Name: shop_products_shop_product_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shop_products_shop_product_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_products_shop_product_seq OWNER TO postgres;

--
-- TOC entry 3556 (class 0 OID 0)
-- Dependencies: 232
-- Name: shop_products_shop_product_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shop_products_shop_product_seq OWNED BY public.shop_products.shop_product;


--
-- TOC entry 233 (class 1259 OID 54569)
-- Name: shops; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shops (
    shop_id integer NOT NULL,
    file_id integer,
    address character varying(255) NOT NULL,
    cords character varying(255) NOT NULL,
    "openFrom" character varying(255) NOT NULL,
    "openTo" character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.shops OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 54574)
-- Name: shops_shop_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shops_shop_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shops_shop_id_seq OWNER TO postgres;

--
-- TOC entry 3557 (class 0 OID 0)
-- Dependencies: 234
-- Name: shops_shop_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shops_shop_id_seq OWNED BY public.shops.shop_id;


--
-- TOC entry 235 (class 1259 OID 54575)
-- Name: sliders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sliders (
    slider_id integer NOT NULL,
    title character varying(255),
    text character varying(255),
    file_id integer,
    product_id integer,
    is_active boolean DEFAULT false,
    start_active_dt timestamp with time zone,
    end_active_dt timestamp with time zone,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.sliders OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 54581)
-- Name: sliders_slider_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sliders_slider_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sliders_slider_id_seq OWNER TO postgres;

--
-- TOC entry 3558 (class 0 OID 0)
-- Dependencies: 236
-- Name: sliders_slider_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sliders_slider_id_seq OWNED BY public.sliders.slider_id;


--
-- TOC entry 237 (class 1259 OID 54582)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(100) NOT NULL,
    role character varying(20) DEFAULT 'user'::character varying,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 54586)
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO postgres;

--
-- TOC entry 3559 (class 0 OID 0)
-- Dependencies: 238
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- TOC entry 3259 (class 2604 OID 54587)
-- Name: categories category_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN category_id SET DEFAULT nextval('public.categories_category_id_seq'::regclass);


--
-- TOC entry 3262 (class 2604 OID 54588)
-- Name: category_properties category_property_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category_properties ALTER COLUMN category_property_id SET DEFAULT nextval('public.category_properties_category_property_id_seq'::regclass);


--
-- TOC entry 3264 (class 2604 OID 54589)
-- Name: developers developer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.developers ALTER COLUMN developer_id SET DEFAULT nextval('public.developers_developer_id_seq'::regclass);


--
-- TOC entry 3266 (class 2604 OID 54590)
-- Name: files file_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files ALTER COLUMN file_id SET DEFAULT nextval('public.files_file_id_seq'::regclass);


--
-- TOC entry 3288 (class 2604 OID 54767)
-- Name: get_methods get_method_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.get_methods ALTER COLUMN get_method_id SET DEFAULT nextval('public.get_methods_get_method_id_seq'::regclass);


--
-- TOC entry 3291 (class 2604 OID 54800)
-- Name: order_products order_product_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_products ALTER COLUMN order_product_id SET DEFAULT nextval('public.order_products_order_product_id_seq'::regclass);


--
-- TOC entry 3289 (class 2604 OID 54775)
-- Name: orders order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);


--
-- TOC entry 3287 (class 2604 OID 54760)
-- Name: payment_methods payment_method_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_methods ALTER COLUMN payment_method_id SET DEFAULT nextval('public.payment_methods_payment_method_id_seq'::regclass);


--
-- TOC entry 3267 (class 2604 OID 54593)
-- Name: product_photos product_photo_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_photos ALTER COLUMN product_photo_id SET DEFAULT nextval('public.product_photos_product_photo_id_seq'::regclass);


--
-- TOC entry 3269 (class 2604 OID 54594)
-- Name: product_property_values product_property_value_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_property_values ALTER COLUMN product_property_value_id SET DEFAULT nextval('public.product_property_values_product_property_value_id_seq'::regclass);


--
-- TOC entry 3273 (class 2604 OID 54595)
-- Name: products product_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN product_id SET DEFAULT nextval('public.products_product_id_seq'::regclass);


--
-- TOC entry 3274 (class 2604 OID 54596)
-- Name: promos promo_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promos ALTER COLUMN promo_id SET DEFAULT nextval('public.promos_promo_id_seq'::regclass);


--
-- TOC entry 3276 (class 2604 OID 54597)
-- Name: properties property_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.properties ALTER COLUMN property_id SET DEFAULT nextval('public.properties_property_id_seq'::regclass);


--
-- TOC entry 3278 (class 2604 OID 54598)
-- Name: property_values property_value_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.property_values ALTER COLUMN property_value_id SET DEFAULT nextval('public.property_values_property_value_id_seq'::regclass);


--
-- TOC entry 3281 (class 2604 OID 54599)
-- Name: shop_products shop_product; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_products ALTER COLUMN shop_product SET DEFAULT nextval('public.shop_products_shop_product_seq'::regclass);


--
-- TOC entry 3282 (class 2604 OID 54600)
-- Name: shops shop_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shops ALTER COLUMN shop_id SET DEFAULT nextval('public.shops_shop_id_seq'::regclass);


--
-- TOC entry 3284 (class 2604 OID 54601)
-- Name: sliders slider_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sliders ALTER COLUMN slider_id SET DEFAULT nextval('public.sliders_slider_id_seq'::regclass);


--
-- TOC entry 3286 (class 2604 OID 54602)
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- TOC entry 3499 (class 0 OID 54486)
-- Dependencies: 209
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categories (category_id, name, file_id, parent_id, "desc", is_active, is_end, "createdAt", "updatedAt") VALUES (2, 'Смартфоны и гаджеты', 4, 1, '', true, false, '2023-06-26 20:52:06.704+03', '2023-06-26 20:54:14.866+03');
INSERT INTO public.categories (category_id, name, file_id, parent_id, "desc", is_active, is_end, "createdAt", "updatedAt") VALUES (3, 'Планшеты, электронные книги', 5, 1, '', true, false, '2023-06-26 20:53:27.009+03', '2023-06-26 20:54:33.199+03');
INSERT INTO public.categories (category_id, name, file_id, parent_id, "desc", is_active, is_end, "createdAt", "updatedAt") VALUES (4, 'Фототехника', 7, 1, '', true, false, '2023-06-26 20:56:04.066+03', '2023-06-26 20:56:59.644+03');
INSERT INTO public.categories (category_id, name, file_id, parent_id, "desc", is_active, is_end, "createdAt", "updatedAt") VALUES (1, 'Смартфоны и фототехника', 1, 0, '', true, false, '2023-06-26 20:50:56.692+03', '2023-06-26 20:58:17.572+03');
INSERT INTO public.categories (category_id, name, file_id, parent_id, "desc", is_active, is_end, "createdAt", "updatedAt") VALUES (7, 'Фотоаппараты', 10, 4, '', true, false, '2023-06-26 21:02:23.811+03', '2023-06-26 21:02:30.748+03');
INSERT INTO public.categories (category_id, name, file_id, parent_id, "desc", is_active, is_end, "createdAt", "updatedAt") VALUES (8, 'Беззеркальные фотоаппараты', 16, 7, '', true, true, '2023-06-26 21:03:21.524+03', '2023-06-26 21:46:16.972+03');
INSERT INTO public.categories (category_id, name, file_id, parent_id, "desc", is_active, is_end, "createdAt", "updatedAt") VALUES (6, 'Планшеты', 6, 3, '', true, true, '2023-06-26 21:00:50.725+03', '2023-06-26 21:46:58.385+03');
INSERT INTO public.categories (category_id, name, file_id, parent_id, "desc", is_active, is_end, "createdAt", "updatedAt") VALUES (5, 'Смартфоны', 5, 2, '', true, true, '2023-06-26 20:59:56.186+03', '2023-06-26 21:58:58.076+03');
INSERT INTO public.categories (category_id, name, file_id, parent_id, "desc", is_active, is_end, "createdAt", "updatedAt") VALUES (9, 'ПК, ноутбуки, периферия', 31, 0, '', true, false, '2023-06-27 00:24:53.755+03', '2023-06-27 00:26:54.336+03');
INSERT INTO public.categories (category_id, name, file_id, parent_id, "desc", is_active, is_end, "createdAt", "updatedAt") VALUES (10, 'Ноутбуки и аксессуары', 32, 9, '', true, false, '2023-06-27 00:29:35.247+03', '2023-06-27 00:29:35.247+03');
INSERT INTO public.categories (category_id, name, file_id, parent_id, "desc", is_active, is_end, "createdAt", "updatedAt") VALUES (11, 'Компьютеры и ПО', 33, 9, '', true, false, '2023-06-27 00:30:14.653+03', '2023-06-27 00:30:14.653+03');
INSERT INTO public.categories (category_id, name, file_id, parent_id, "desc", is_active, is_end, "createdAt", "updatedAt") VALUES (12, 'Комплектующие для ПК', 34, 0, '', true, false, '2023-06-27 00:31:19.804+03', '2023-06-27 00:31:19.804+03');
INSERT INTO public.categories (category_id, name, file_id, parent_id, "desc", is_active, is_end, "createdAt", "updatedAt") VALUES (13, 'Инструменты и стройка', 35, 0, '', true, false, '2023-06-27 00:31:55.51+03', '2023-06-27 00:31:55.51+03');
INSERT INTO public.categories (category_id, name, file_id, parent_id, "desc", is_active, is_end, "createdAt", "updatedAt") VALUES (14, 'Основные комплектующие для ПК', 36, 12, '', false, false, '2023-06-27 01:29:22.429+03', '2023-06-29 19:33:26.585+03');


--
-- TOC entry 3501 (class 0 OID 54494)
-- Dependencies: 211
-- Data for Name: category_properties; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.category_properties (category_property_id, property_id, category_id, name, is_filter, is_active, "createdAt", "updatedAt") VALUES (1, 12, 8, '', false, false, '2023-06-26 21:45:35.554+03', '2023-06-26 21:45:35.554+03');
INSERT INTO public.category_properties (category_property_id, property_id, category_id, name, is_filter, is_active, "createdAt", "updatedAt") VALUES (2, 11, 8, '', false, false, '2023-06-26 21:45:38.382+03', '2023-06-26 21:45:38.382+03');
INSERT INTO public.category_properties (category_property_id, property_id, category_id, name, is_filter, is_active, "createdAt", "updatedAt") VALUES (3, 10, 8, '', false, false, '2023-06-26 21:45:41.182+03', '2023-06-26 21:45:41.182+03');
INSERT INTO public.category_properties (category_property_id, property_id, category_id, name, is_filter, is_active, "createdAt", "updatedAt") VALUES (4, 9, 8, '', false, false, '2023-06-26 21:45:45.704+03', '2023-06-26 21:45:45.704+03');
INSERT INTO public.category_properties (category_property_id, property_id, category_id, name, is_filter, is_active, "createdAt", "updatedAt") VALUES (5, 8, 8, '', false, false, '2023-06-26 21:45:48.922+03', '2023-06-26 21:45:48.922+03');
INSERT INTO public.category_properties (category_property_id, property_id, category_id, name, is_filter, is_active, "createdAt", "updatedAt") VALUES (6, 7, 8, '', false, false, '2023-06-26 21:45:53.521+03', '2023-06-26 21:45:53.521+03');
INSERT INTO public.category_properties (category_property_id, property_id, category_id, name, is_filter, is_active, "createdAt", "updatedAt") VALUES (7, 6, 6, '', false, false, '2023-06-26 21:46:33.799+03', '2023-06-26 21:46:33.799+03');
INSERT INTO public.category_properties (category_property_id, property_id, category_id, name, is_filter, is_active, "createdAt", "updatedAt") VALUES (8, 5, 6, '', false, false, '2023-06-26 21:46:39.426+03', '2023-06-26 21:46:39.426+03');
INSERT INTO public.category_properties (category_property_id, property_id, category_id, name, is_filter, is_active, "createdAt", "updatedAt") VALUES (9, 4, 6, '', false, false, '2023-06-26 21:46:44.514+03', '2023-06-26 21:46:44.514+03');
INSERT INTO public.category_properties (category_property_id, property_id, category_id, name, is_filter, is_active, "createdAt", "updatedAt") VALUES (10, 3, 6, '', false, false, '2023-06-26 21:46:47.588+03', '2023-06-26 21:46:47.588+03');
INSERT INTO public.category_properties (category_property_id, property_id, category_id, name, is_filter, is_active, "createdAt", "updatedAt") VALUES (11, 2, 6, '', false, false, '2023-06-26 21:46:50.62+03', '2023-06-26 21:46:50.62+03');
INSERT INTO public.category_properties (category_property_id, property_id, category_id, name, is_filter, is_active, "createdAt", "updatedAt") VALUES (12, 1, 6, '', false, false, '2023-06-26 21:46:56.986+03', '2023-06-26 21:46:56.986+03');
INSERT INTO public.category_properties (category_property_id, property_id, category_id, name, is_filter, is_active, "createdAt", "updatedAt") VALUES (15, 6, 5, '', false, false, '2023-06-26 21:58:31.641+03', '2023-06-26 21:58:31.641+03');
INSERT INTO public.category_properties (category_property_id, property_id, category_id, name, is_filter, is_active, "createdAt", "updatedAt") VALUES (16, 5, 5, '', false, false, '2023-06-26 21:58:39.324+03', '2023-06-26 21:58:39.324+03');
INSERT INTO public.category_properties (category_property_id, property_id, category_id, name, is_filter, is_active, "createdAt", "updatedAt") VALUES (17, 4, 5, '', false, false, '2023-06-26 21:58:43.263+03', '2023-06-26 21:58:43.263+03');
INSERT INTO public.category_properties (category_property_id, property_id, category_id, name, is_filter, is_active, "createdAt", "updatedAt") VALUES (18, 3, 5, '', false, false, '2023-06-26 21:58:48.643+03', '2023-06-26 21:58:48.643+03');
INSERT INTO public.category_properties (category_property_id, property_id, category_id, name, is_filter, is_active, "createdAt", "updatedAt") VALUES (19, 2, 5, '', false, false, '2023-06-26 21:58:52.664+03', '2023-06-26 21:58:52.664+03');
INSERT INTO public.category_properties (category_property_id, property_id, category_id, name, is_filter, is_active, "createdAt", "updatedAt") VALUES (20, 1, 5, '', false, false, '2023-06-26 21:58:55.981+03', '2023-06-26 21:58:55.981+03');


--
-- TOC entry 3503 (class 0 OID 54500)
-- Dependencies: 213
-- Data for Name: developers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.developers (developer_id, name, file_id, is_active, "createdAt", "updatedAt") VALUES (1, 'Canon', 12, true, '2023-06-26 21:37:39.226+03', '2023-06-26 21:37:39.226+03');
INSERT INTO public.developers (developer_id, name, file_id, is_active, "createdAt", "updatedAt") VALUES (2, 'Apple', 13, true, '2023-06-26 21:38:54.075+03', '2023-06-26 21:38:54.075+03');
INSERT INTO public.developers (developer_id, name, file_id, is_active, "createdAt", "updatedAt") VALUES (3, 'Samsung', 14, true, '2023-06-26 21:40:54.995+03', '2023-06-26 21:40:54.995+03');
INSERT INTO public.developers (developer_id, name, file_id, is_active, "createdAt", "updatedAt") VALUES (5, 'DEXP', 26, true, '2023-06-26 22:26:00.383+03', '2023-06-26 22:26:00.383+03');
INSERT INTO public.developers (developer_id, name, file_id, is_active, "createdAt", "updatedAt") VALUES (4, 'Fujifilm', 17, false, '2023-06-26 21:50:06.732+03', '2023-06-27 01:46:37.644+03');


--
-- TOC entry 3505 (class 0 OID 54505)
-- Dependencies: 215
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.files (file_id, size, name, link, "createdAt", "updatedAt") VALUES (1, 46434, '81e70051-4acd-4d99-90d6-e243232a783c.jpeg', 'http://26.13.70.202:5000/81e70051-4acd-4d99-90d6-e243232a783c.jpeg', '2023-06-26 20:50:56.542+03', '2023-06-26 20:50:56.542+03');
INSERT INTO public.files (file_id, size, name, link, "createdAt", "updatedAt") VALUES (2, 13060, '46ea2644-fc58-434d-aea0-946cfe68c4cb.jpg', 'http://26.13.70.202:5000/46ea2644-fc58-434d-aea0-946cfe68c4cb.jpg', '2023-06-26 20:52:06.554+03', '2023-06-26 20:52:06.554+03');
INSERT INTO public.files (file_id, size, name, link, "createdAt", "updatedAt") VALUES (3, 4175, '42b20ab4-968e-4ca9-879a-95c915b29b2d.jpg', 'http://26.13.70.202:5000/42b20ab4-968e-4ca9-879a-95c915b29b2d.jpg', '2023-06-26 20:53:26.858+03', '2023-06-26 20:53:26.858+03');
INSERT INTO public.files (file_id, size, name, link, "createdAt", "updatedAt") VALUES (4, 23298, '49ec9280-46a8-4bf7-bf3f-87baec9decf8.jpg', 'http://26.13.70.202:5000/49ec9280-46a8-4bf7-bf3f-87baec9decf8.jpg', '2023-06-26 20:54:14.825+03', '2023-06-26 20:54:14.825+03');
INSERT INTO public.files (file_id, size, name, link, "createdAt", "updatedAt") VALUES (5, 5063, '361fee58-c5c6-4aa9-b59f-8cb6c6ceeca2.jpg', 'http://26.13.70.202:5000/361fee58-c5c6-4aa9-b59f-8cb6c6ceeca2.jpg', '2023-06-26 20:54:33.147+03', '2023-06-26 20:54:33.147+03');
INSERT INTO public.files (file_id, size, name, link, "createdAt", "updatedAt") VALUES (6, 12699, 'e51190f0-4c6b-4aab-b48d-94a1f014acfe.png', 'http://26.13.70.202:5000/e51190f0-4c6b-4aab-b48d-94a1f014acfe.png', '2023-06-26 20:55:09.236+03', '2023-06-26 20:55:09.236+03');
INSERT INTO public.files (file_id, size, name, link, "createdAt", "updatedAt") VALUES (7, 20209, '0bf65e95-f035-413c-a21a-fe15c093e300.jpg', 'http://26.13.70.202:5000/0bf65e95-f035-413c-a21a-fe15c093e300.jpg', '2023-06-26 20:56:59.499+03', '2023-06-26 20:56:59.499+03');
INSERT INTO public.files (file_id, size, name, link, "createdAt", "updatedAt") VALUES (8, 10315, '8e924012-0fc4-466f-bd49-ba5c4b4296c5.jpg', 'http://26.13.70.202:5000/8e924012-0fc4-466f-bd49-ba5c4b4296c5.jpg', '2023-06-26 20:59:56.023+03', '2023-06-26 20:59:56.023+03');
INSERT INTO public.files (file_id, size, name, link, "createdAt", "updatedAt") VALUES (9, 4175, '6c5cba2d-cb3f-4ebf-9915-06d83ac2ef50.jpg', 'http://26.13.70.202:5000/6c5cba2d-cb3f-4ebf-9915-06d83ac2ef50.jpg', '2023-06-26 21:00:50.571+03', '2023-06-26 21:00:50.571+03');
INSERT INTO public.files (file_id, size, name, link, "createdAt", "updatedAt") VALUES (10, 23364, 'cb162bf0-7222-4e20-b9bf-0897591146c1.jpg', 'http://26.13.70.202:5000/cb162bf0-7222-4e20-b9bf-0897591146c1.jpg', '2023-06-26 21:02:23.654+03', '2023-06-26 21:02:23.654+03');
INSERT INTO public.files (file_id, size, name, link, "createdAt", "updatedAt") VALUES (11, 5428, '35a86992-dfb8-4f44-96d0-5c50aa12b6c5.jpg', 'http://26.13.70.202:5000/35a86992-dfb8-4f44-96d0-5c50aa12b6c5.jpg', '2023-06-26 21:03:21.362+03', '2023-06-26 21:03:21.362+03');
INSERT INTO public.files (file_id, size, name, link, "createdAt", "updatedAt") VALUES (12, 59003, 'b5dbe88a-9378-49ed-8546-5c6bc96b9030.jpg', 'http://26.13.70.202:5000/b5dbe88a-9378-49ed-8546-5c6bc96b9030.jpg', '2023-06-26 21:37:39.057+03', '2023-06-26 21:37:39.057+03');
INSERT INTO public.files (file_id, size, name, link, "createdAt", "updatedAt") VALUES (13, 812413, '60e44272-c1e3-460c-adfc-a12c4dd36426.jpg', 'http://26.13.70.202:5000/60e44272-c1e3-460c-adfc-a12c4dd36426.jpg', '2023-06-26 21:38:54.027+03', '2023-06-26 21:38:54.027+03');
INSERT INTO public.files (file_id, size, name, link, "createdAt", "updatedAt") VALUES (14, 186853, '2cb157c9-f5f5-42da-bd2d-e8beb9bdc42f.jpg', 'http://26.13.70.202:5000/2cb157c9-f5f5-42da-bd2d-e8beb9bdc42f.jpg', '2023-06-26 21:40:54.93+03', '2023-06-26 21:40:54.93+03');
INSERT INTO public.files (file_id, size, name, link, "createdAt", "updatedAt") VALUES (15, 383220, '07fa6bff-a9b6-4c90-a8dd-7bf0c5f50087.jpg', 'http://26.13.70.202:5000/07fa6bff-a9b6-4c90-a8dd-7bf0c5f50087.jpg', '2023-06-26 21:44:11.084+03', '2023-06-26 21:44:11.084+03');
INSERT INTO public.files (file_id, size, name, link, "createdAt", "updatedAt") VALUES (16, 5428, '6bbfdfca-6a20-4d64-9164-1e31a2699a2e.jpg', 'http://26.13.70.202:5000/6bbfdfca-6a20-4d64-9164-1e31a2699a2e.jpg', '2023-06-26 21:46:16.819+03', '2023-06-26 21:46:16.819+03');
INSERT INTO public.files (file_id, size, name, link, "createdAt", "updatedAt") VALUES (17, 94697, '5c19a6fa-c281-4c80-b51d-acf356fcd8f5.jpg', 'http://26.13.70.202:5000/5c19a6fa-c281-4c80-b51d-acf356fcd8f5.jpg', '2023-06-26 21:50:06.38+03', '2023-06-26 21:50:06.38+03');
INSERT INTO public.files (file_id, size, name, link, "createdAt", "updatedAt") VALUES (18, 17628, 'dbd6817c-f5b1-49ea-9807-cf0d53a72820.jpg', 'http://26.13.70.202:5000/dbd6817c-f5b1-49ea-9807-cf0d53a72820.jpg', '2023-06-26 21:52:40.895+03', '2023-06-26 21:52:40.895+03');
INSERT INTO public.files (file_id, size, name, link, "createdAt", "updatedAt") VALUES (19, 14488, '48d6aeec-c8ef-43e6-9e18-d55a07c8a808.jpg', 'http://26.13.70.202:5000/48d6aeec-c8ef-43e6-9e18-d55a07c8a808.jpg', '2023-06-26 21:54:36.259+03', '2023-06-26 21:54:36.259+03');
INSERT INTO public.files (file_id, size, name, link, "createdAt", "updatedAt") VALUES (20, 8196, '277dffd2-4ca4-491f-8c54-8558ef26c1c5.jpg', 'http://26.13.70.202:5000/277dffd2-4ca4-491f-8c54-8558ef26c1c5.jpg', '2023-06-26 21:57:47.174+03', '2023-06-26 21:57:47.174+03');
INSERT INTO public.files (file_id, size, name, link, "createdAt", "updatedAt") VALUES (21, 32460, '46db2a0c-a8ea-4a52-9405-89b85a5f6b25.jpg', 'http://26.13.70.202:5000/46db2a0c-a8ea-4a52-9405-89b85a5f6b25.jpg', '2023-06-26 22:01:28.913+03', '2023-06-26 22:01:28.913+03');
INSERT INTO public.files (file_id, size, name, link, "createdAt", "updatedAt") VALUES (22, 14442, '0e4627de-4aea-4e0b-8c23-df47b7e06911.jpg', 'http://26.13.70.202:5000/0e4627de-4aea-4e0b-8c23-df47b7e06911.jpg', '2023-06-26 22:05:12.02+03', '2023-06-26 22:05:12.02+03');
INSERT INTO public.files (file_id, size, name, link, "createdAt", "updatedAt") VALUES (23, 18744, '171a8bf6-863a-4573-8377-1fdd969b3230.jpg', 'http://26.13.70.202:5000/171a8bf6-863a-4573-8377-1fdd969b3230.jpg', '2023-06-26 22:08:15.406+03', '2023-06-26 22:08:15.406+03');
INSERT INTO public.files (file_id, size, name, link, "createdAt", "updatedAt") VALUES (24, 21062, '88153511-5d5f-4d0f-ae84-1641e76e05f8.jpg', 'http://26.13.70.202:5000/88153511-5d5f-4d0f-ae84-1641e76e05f8.jpg', '2023-06-26 22:17:44.466+03', '2023-06-26 22:17:44.466+03');
INSERT INTO public.files (file_id, size, name, link, "createdAt", "updatedAt") VALUES (25, 13562, '8c2fe93d-46cd-47c6-b09d-9e90e53cd362.jpg', 'http://26.13.70.202:5000/8c2fe93d-46cd-47c6-b09d-9e90e53cd362.jpg', '2023-06-26 22:22:12.734+03', '2023-06-26 22:22:12.734+03');
INSERT INTO public.files (file_id, size, name, link, "createdAt", "updatedAt") VALUES (26, 7819, 'ab2755c5-30a4-4441-aab8-3c2f5cbc4825.jpg', 'http://26.13.70.202:5000/ab2755c5-30a4-4441-aab8-3c2f5cbc4825.jpg', '2023-06-26 22:26:00.217+03', '2023-06-26 22:26:00.217+03');
INSERT INTO public.files (file_id, size, name, link, "createdAt", "updatedAt") VALUES (27, 143365, 'a15a5836-f8c4-40f6-8d78-eb01ee3f368c.png', 'http://26.13.70.202:5000/a15a5836-f8c4-40f6-8d78-eb01ee3f368c.png', '2023-06-27 00:10:21.259+03', '2023-06-27 00:10:21.259+03');
INSERT INTO public.files (file_id, size, name, link, "createdAt", "updatedAt") VALUES (28, 60138, 'c99e1f52-0552-4847-a20e-29b29a6864bc.png', 'http://26.13.70.202:5000/c99e1f52-0552-4847-a20e-29b29a6864bc.png', '2023-06-27 00:18:26.036+03', '2023-06-27 00:18:26.036+03');
INSERT INTO public.files (file_id, size, name, link, "createdAt", "updatedAt") VALUES (29, 61201, 'a3d32a3e-cc48-4643-8bf4-331a95005f9a.png', 'http://26.13.70.202:5000/a3d32a3e-cc48-4643-8bf4-331a95005f9a.png', '2023-06-27 00:18:58.823+03', '2023-06-27 00:18:58.823+03');
INSERT INTO public.files (file_id, size, name, link, "createdAt", "updatedAt") VALUES (30, 346832, 'a9bcae22-f502-4655-8107-8bbfc59a8c1c.jpg', 'http://26.13.70.202:5000/a9bcae22-f502-4655-8107-8bbfc59a8c1c.jpg', '2023-06-27 00:24:53.598+03', '2023-06-27 00:24:53.598+03');
INSERT INTO public.files (file_id, size, name, link, "createdAt", "updatedAt") VALUES (31, 10090, 'c41a2bf6-3aa3-40a0-86df-2c93d9d7fccc.png', 'http://26.13.70.202:5000/c41a2bf6-3aa3-40a0-86df-2c93d9d7fccc.png', '2023-06-27 00:26:54.236+03', '2023-06-27 00:26:54.236+03');
INSERT INTO public.files (file_id, size, name, link, "createdAt", "updatedAt") VALUES (32, 23464, 'ce76c5dc-7ede-402b-9a2d-45daf5be0669.png', 'http://26.13.70.202:5000/ce76c5dc-7ede-402b-9a2d-45daf5be0669.png', '2023-06-27 00:29:35.015+03', '2023-06-27 00:29:35.015+03');
INSERT INTO public.files (file_id, size, name, link, "createdAt", "updatedAt") VALUES (33, 20695, '5247cae8-8bde-41f7-9d07-e560b422abb8.jpg', 'http://26.13.70.202:5000/5247cae8-8bde-41f7-9d07-e560b422abb8.jpg', '2023-06-27 00:30:14.414+03', '2023-06-27 00:30:14.414+03');
INSERT INTO public.files (file_id, size, name, link, "createdAt", "updatedAt") VALUES (34, 12513, 'af874bf5-5b50-43b7-b116-490305ecee32.png', 'http://26.13.70.202:5000/af874bf5-5b50-43b7-b116-490305ecee32.png', '2023-06-27 00:31:19.647+03', '2023-06-27 00:31:19.647+03');
INSERT INTO public.files (file_id, size, name, link, "createdAt", "updatedAt") VALUES (35, 14346, 'e8e3e6a8-c75b-454e-ab8c-328b3ab97257.png', 'http://26.13.70.202:5000/e8e3e6a8-c75b-454e-ab8c-328b3ab97257.png', '2023-06-27 00:31:55.34+03', '2023-06-27 00:31:55.34+03');
INSERT INTO public.files (file_id, size, name, link, "createdAt", "updatedAt") VALUES (36, 34000, 'e6865ae2-1598-4fa1-a096-d2f1d38e306a.png', 'http://26.13.70.202:5000/e6865ae2-1598-4fa1-a096-d2f1d38e306a.png', '2023-06-27 01:29:22.213+03', '2023-06-27 01:29:22.213+03');
INSERT INTO public.files (file_id, size, name, link, "createdAt", "updatedAt") VALUES (37, 15212, '5d95f91e-8385-4950-a5e4-18b89f9d15f5.jpg', 'http://26.13.70.202:5000/5d95f91e-8385-4950-a5e4-18b89f9d15f5.jpg', '2023-06-27 03:00:49.165+03', '2023-06-27 03:00:49.165+03');
INSERT INTO public.files (file_id, size, name, link, "createdAt", "updatedAt") VALUES (38, 239384, '3149650f-deef-4f5b-a72f-2597a4574aa0.jpg', 'http://26.13.70.202:5000/3149650f-deef-4f5b-a72f-2597a4574aa0.jpg', '2023-06-27 03:00:52.719+03', '2023-06-27 03:00:52.719+03');
INSERT INTO public.files (file_id, size, name, link, "createdAt", "updatedAt") VALUES (39, 265864, 'd72c8437-74e5-4983-a67e-b754b14b89ca.jpg', 'http://26.13.70.202:5000/d72c8437-74e5-4983-a67e-b754b14b89ca.jpg', '2023-06-27 03:00:55.755+03', '2023-06-27 03:00:55.755+03');
INSERT INTO public.files (file_id, size, name, link, "createdAt", "updatedAt") VALUES (40, 222128, 'f94b7ffa-264e-420c-a9ce-afb02cdaea5a.jpg', 'http://26.13.70.202:5000/f94b7ffa-264e-420c-a9ce-afb02cdaea5a.jpg', '2023-06-27 03:01:04.057+03', '2023-06-27 03:01:04.057+03');
INSERT INTO public.files (file_id, size, name, link, "createdAt", "updatedAt") VALUES (41, 2803530, 'dfe1ec8e-c01c-4832-9e8e-6e23fbfe15ef.jpg', 'http://26.13.70.202:5000/dfe1ec8e-c01c-4832-9e8e-6e23fbfe15ef.jpg', '2023-06-27 18:32:03.91+03', '2023-06-27 18:32:03.91+03');
INSERT INTO public.files (file_id, size, name, link, "createdAt", "updatedAt") VALUES (42, 222128, '644244a6-3fc2-45c1-97d2-cec21674646c.jpg', 'http://26.13.70.202:5000/644244a6-3fc2-45c1-97d2-cec21674646c.jpg', '2023-06-29 18:52:44.554+03', '2023-06-29 18:52:44.554+03');
INSERT INTO public.files (file_id, size, name, link, "createdAt", "updatedAt") VALUES (43, 222128, 'bf45d6e0-178d-4042-b854-ea8cdd6d2bb5.jpg', 'http://26.13.70.202:5000/bf45d6e0-178d-4042-b854-ea8cdd6d2bb5.jpg', '2023-06-29 18:53:38.31+03', '2023-06-29 18:53:38.31+03');
INSERT INTO public.files (file_id, size, name, link, "createdAt", "updatedAt") VALUES (44, 222128, '36fd9e26-0544-4eec-8362-454e08c153a8.jpg', 'http://26.13.70.202:5000/36fd9e26-0544-4eec-8362-454e08c153a8.jpg', '2023-06-29 18:54:15.314+03', '2023-06-29 18:54:15.314+03');
INSERT INTO public.files (file_id, size, name, link, "createdAt", "updatedAt") VALUES (45, 222128, 'a5fb74ed-7d5a-45d7-8ff7-9cf58d6919af.jpg', 'http://26.13.70.202:5000/a5fb74ed-7d5a-45d7-8ff7-9cf58d6919af.jpg', '2023-06-29 19:22:54.115+03', '2023-06-29 19:22:54.115+03');
INSERT INTO public.files (file_id, size, name, link, "createdAt", "updatedAt") VALUES (46, 34000, '19f048ba-58bc-4b0a-bf14-6b3b29689d0d.png', 'http://26.13.70.202:5000/19f048ba-58bc-4b0a-bf14-6b3b29689d0d.png', '2023-06-29 23:25:48.782+03', '2023-06-29 23:25:48.782+03');
INSERT INTO public.files (file_id, size, name, link, "createdAt", "updatedAt") VALUES (47, 244148, 'd78e5252-0347-451a-819e-9a404113900a.png', 'http://26.13.70.202:5000/d78e5252-0347-451a-819e-9a404113900a.png', '2023-06-30 19:21:01.243+03', '2023-06-30 19:21:01.243+03');
INSERT INTO public.files (file_id, size, name, link, "createdAt", "updatedAt") VALUES (48, 61201, '9132d79a-7f33-4ee1-8074-20c56a2e947c.png', 'http://26.13.70.202:5000/9132d79a-7f33-4ee1-8074-20c56a2e947c.png', '2023-06-30 19:23:35.308+03', '2023-06-30 19:23:35.308+03');
INSERT INTO public.files (file_id, size, name, link, "createdAt", "updatedAt") VALUES (49, 55872, '5a4d2209-3fcd-42e3-b234-a389ed0eb484.webp', 'http://26.13.70.202:5000/5a4d2209-3fcd-42e3-b234-a389ed0eb484.webp', '2023-07-01 00:19:39.571+03', '2023-07-01 00:19:39.571+03');
INSERT INTO public.files (file_id, size, name, link, "createdAt", "updatedAt") VALUES (50, 61201, 'f2bcda1f-1290-4b21-beda-2f7fb5261340.png', 'http://26.13.70.202:5000/f2bcda1f-1290-4b21-beda-2f7fb5261340.png', '2023-07-02 00:40:59.491+03', '2023-07-02 00:40:59.491+03');
INSERT INTO public.files (file_id, size, name, link, "createdAt", "updatedAt") VALUES (52, 61201, 'cc50ddfd-a023-424a-9ec2-e9069773d705.png', 'http://26.13.70.202:5000/cc50ddfd-a023-424a-9ec2-e9069773d705.png', '2023-07-02 00:41:03.707+03', '2023-07-02 00:41:03.707+03');
INSERT INTO public.files (file_id, size, name, link, "createdAt", "updatedAt") VALUES (53, 8196, '8da057ee-cadb-4435-99c4-54247d51e5e3.jpg', 'http://26.13.70.202:5000/8da057ee-cadb-4435-99c4-54247d51e5e3.jpg', '2023-07-02 01:10:51.725+03', '2023-07-02 01:10:51.725+03');
INSERT INTO public.files (file_id, size, name, link, "createdAt", "updatedAt") VALUES (54, 59003, 'cca4e355-c687-4880-8254-e09296ba2e41.jpg', 'http://26.13.70.202:5000/cca4e355-c687-4880-8254-e09296ba2e41.jpg', '2023-07-02 01:11:12.293+03', '2023-07-02 01:11:12.293+03');
INSERT INTO public.files (file_id, size, name, link, "createdAt", "updatedAt") VALUES (51, 61201, '71649df3-654f-41c2-83ad-eeca689efd45.png', 'http://26.13.70.202:5000/71649df3-654f-41c2-83ad-eeca689efd45.png', '2023-07-02 00:40:56.857+03', '2023-07-02 00:40:56.857+03');


--
-- TOC entry 3532 (class 0 OID 54764)
-- Dependencies: 242
-- Data for Name: get_methods; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.get_methods (get_method_id, name, "createdAt", "updatedAt") VALUES (1, 'Самовывоз', '2023-07-03 16:19:28.253+03', '2023-07-03 16:19:28.253+03');
INSERT INTO public.get_methods (get_method_id, name, "createdAt", "updatedAt") VALUES (2, 'Доставка', '2023-07-03 16:19:28.253+03', '2023-07-03 16:19:28.253+03');


--
-- TOC entry 3536 (class 0 OID 54797)
-- Dependencies: 246
-- Data for Name: order_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.order_products (order_product_id, order_id, product_id, amount, "createdAt", "updatedAt") VALUES (1, 1, 1, 1, '2001-01-01 00:00:00+03', '2001-01-01 00:00:00+03');
INSERT INTO public.order_products (order_product_id, order_id, product_id, amount, "createdAt", "updatedAt") VALUES (2, 9, 8, 1, '2023-07-04 20:43:46.029+03', '2023-07-04 20:43:46.029+03');
INSERT INTO public.order_products (order_product_id, order_id, product_id, amount, "createdAt", "updatedAt") VALUES (3, 9, 6, 1, '2023-07-04 20:43:46.053+03', '2023-07-04 20:43:46.053+03');
INSERT INTO public.order_products (order_product_id, order_id, product_id, amount, "createdAt", "updatedAt") VALUES (4, 9, 5, 1, '2023-07-04 20:43:46.096+03', '2023-07-04 20:43:46.096+03');
INSERT INTO public.order_products (order_product_id, order_id, product_id, amount, "createdAt", "updatedAt") VALUES (5, 10, 9, 1, '2023-07-04 20:44:47.714+03', '2023-07-04 20:44:47.714+03');
INSERT INTO public.order_products (order_product_id, order_id, product_id, amount, "createdAt", "updatedAt") VALUES (6, 10, 8, 1, '2023-07-04 20:44:47.75+03', '2023-07-04 20:44:47.75+03');
INSERT INTO public.order_products (order_product_id, order_id, product_id, amount, "createdAt", "updatedAt") VALUES (7, 10, 7, 1, '2023-07-04 20:44:47.777+03', '2023-07-04 20:44:47.777+03');
INSERT INTO public.order_products (order_product_id, order_id, product_id, amount, "createdAt", "updatedAt") VALUES (8, 10, 6, 1, '2023-07-04 20:44:47.8+03', '2023-07-04 20:44:47.8+03');
INSERT INTO public.order_products (order_product_id, order_id, product_id, amount, "createdAt", "updatedAt") VALUES (9, 10, 5, 1, '2023-07-04 20:44:47.817+03', '2023-07-04 20:44:47.817+03');
INSERT INTO public.order_products (order_product_id, order_id, product_id, amount, "createdAt", "updatedAt") VALUES (10, 10, 4, 1, '2023-07-04 20:44:47.847+03', '2023-07-04 20:44:47.847+03');
INSERT INTO public.order_products (order_product_id, order_id, product_id, amount, "createdAt", "updatedAt") VALUES (11, 11, 9, 1, '2023-07-05 13:55:25.422+03', '2023-07-05 13:55:25.422+03');
INSERT INTO public.order_products (order_product_id, order_id, product_id, amount, "createdAt", "updatedAt") VALUES (12, 11, 8, 1, '2023-07-05 13:55:25.433+03', '2023-07-05 13:55:25.433+03');
INSERT INTO public.order_products (order_product_id, order_id, product_id, amount, "createdAt", "updatedAt") VALUES (13, 12, 8, 1, '2023-07-05 13:55:53.092+03', '2023-07-05 13:55:53.092+03');
INSERT INTO public.order_products (order_product_id, order_id, product_id, amount, "createdAt", "updatedAt") VALUES (14, 13, 9, 1, '2023-07-05 13:56:44.085+03', '2023-07-05 13:56:44.085+03');
INSERT INTO public.order_products (order_product_id, order_id, product_id, amount, "createdAt", "updatedAt") VALUES (15, 13, 8, 1, '2023-07-05 13:56:44.134+03', '2023-07-05 13:56:44.134+03');
INSERT INTO public.order_products (order_product_id, order_id, product_id, amount, "createdAt", "updatedAt") VALUES (16, 14, 8, 1, '2023-07-05 13:57:00.469+03', '2023-07-05 13:57:00.469+03');
INSERT INTO public.order_products (order_product_id, order_id, product_id, amount, "createdAt", "updatedAt") VALUES (17, 15, 8, 1, '2023-07-05 14:01:29.58+03', '2023-07-05 14:01:29.58+03');
INSERT INTO public.order_products (order_product_id, order_id, product_id, amount, "createdAt", "updatedAt") VALUES (18, 16, 8, 1, '2023-07-05 14:02:47.631+03', '2023-07-05 14:02:47.631+03');
INSERT INTO public.order_products (order_product_id, order_id, product_id, amount, "createdAt", "updatedAt") VALUES (19, 17, 7, 1, '2023-07-05 14:03:09.866+03', '2023-07-05 14:03:09.866+03');
INSERT INTO public.order_products (order_product_id, order_id, product_id, amount, "createdAt", "updatedAt") VALUES (20, 17, 5, 1, '2023-07-05 14:03:09.891+03', '2023-07-05 14:03:09.891+03');
INSERT INTO public.order_products (order_product_id, order_id, product_id, amount, "createdAt", "updatedAt") VALUES (21, 18, 9, 1, '2023-07-05 17:42:50.381+03', '2023-07-05 17:42:50.381+03');
INSERT INTO public.order_products (order_product_id, order_id, product_id, amount, "createdAt", "updatedAt") VALUES (22, 18, 8, 1, '2023-07-05 17:42:50.393+03', '2023-07-05 17:42:50.393+03');
INSERT INTO public.order_products (order_product_id, order_id, product_id, amount, "createdAt", "updatedAt") VALUES (23, 18, 6, 1, '2023-07-05 17:42:50.402+03', '2023-07-05 17:42:50.402+03');


--
-- TOC entry 3534 (class 0 OID 54772)
-- Dependencies: 244
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders (order_id, user_id, status_id, phone, address, payment_method_id, get_method_id, email, "createdAt", "updatedAt") VALUES (1, 1, 1, '+79520481728', '123', 1, 2, '123', '2023-07-03 16:20:38.59+03', '2023-07-03 16:20:38.59+03');
INSERT INTO public.orders (order_id, user_id, status_id, phone, address, payment_method_id, get_method_id, email, "createdAt", "updatedAt") VALUES (2, 1, 1, '+79520481728', '123', 1, 2, '123', '2023-07-03 16:22:00.556+03', '2023-07-03 16:22:00.556+03');
INSERT INTO public.orders (order_id, user_id, status_id, phone, address, payment_method_id, get_method_id, email, "createdAt", "updatedAt") VALUES (3, 1, 1, '+79520481728', '123', 1, 1, '123', '2023-07-03 16:25:07.885+03', '2023-07-03 16:25:07.885+03');
INSERT INTO public.orders (order_id, user_id, status_id, phone, address, payment_method_id, get_method_id, email, "createdAt", "updatedAt") VALUES (4, 1, 1, '+79520481728', '123', 1, 1, '123', '2023-07-03 16:26:11.391+03', '2023-07-03 16:26:11.391+03');
INSERT INTO public.orders (order_id, user_id, status_id, phone, address, payment_method_id, get_method_id, email, "createdAt", "updatedAt") VALUES (5, 1, 1, '+79520481728', '123', 1, 1, '123', '2023-07-04 20:37:07.603+03', '2023-07-04 20:37:07.603+03');
INSERT INTO public.orders (order_id, user_id, status_id, phone, address, payment_method_id, get_method_id, email, "createdAt", "updatedAt") VALUES (6, 1, 1, '+79520481728', '123', 1, 1, '123', '2023-07-04 20:37:25.268+03', '2023-07-04 20:37:25.268+03');
INSERT INTO public.orders (order_id, user_id, status_id, phone, address, payment_method_id, get_method_id, email, "createdAt", "updatedAt") VALUES (7, 1, 1, '+79520481728', '123', 1, 1, '123', '2023-07-04 20:38:28.22+03', '2023-07-04 20:38:28.22+03');
INSERT INTO public.orders (order_id, user_id, status_id, phone, address, payment_method_id, get_method_id, email, "createdAt", "updatedAt") VALUES (8, 1, 1, '+79520481728', '123', 1, 1, '123', '2023-07-04 20:43:39.376+03', '2023-07-04 20:43:39.376+03');
INSERT INTO public.orders (order_id, user_id, status_id, phone, address, payment_method_id, get_method_id, email, "createdAt", "updatedAt") VALUES (9, 1, 1, '+79520481728', '123', 1, 1, '123', '2023-07-04 20:43:46.008+03', '2023-07-04 20:43:46.008+03');
INSERT INTO public.orders (order_id, user_id, status_id, phone, address, payment_method_id, get_method_id, email, "createdAt", "updatedAt") VALUES (10, 1, 1, '+79520481728', '123', 2, 1, '123', '2023-07-04 20:44:46.682+03', '2023-07-04 20:44:46.682+03');
INSERT INTO public.orders (order_id, user_id, status_id, phone, address, payment_method_id, get_method_id, email, "createdAt", "updatedAt") VALUES (11, 1, 1, '+79520481728', '123', 2, 1, '123', '2023-07-05 13:55:25.088+03', '2023-07-05 13:55:25.088+03');
INSERT INTO public.orders (order_id, user_id, status_id, phone, address, payment_method_id, get_method_id, email, "createdAt", "updatedAt") VALUES (12, 1, 1, '+79520481728', '123', 1, 1, '123', '2023-07-05 13:55:53.068+03', '2023-07-05 13:55:53.068+03');
INSERT INTO public.orders (order_id, user_id, status_id, phone, address, payment_method_id, get_method_id, email, "createdAt", "updatedAt") VALUES (13, 1, 1, '+79520481728', '123', 1, 1, '123', '2023-07-05 13:56:44.063+03', '2023-07-05 13:56:44.063+03');
INSERT INTO public.orders (order_id, user_id, status_id, phone, address, payment_method_id, get_method_id, email, "createdAt", "updatedAt") VALUES (14, 1, 1, '+79520481728', '123', 1, 1, '123', '2023-07-05 13:57:00.289+03', '2023-07-05 13:57:00.289+03');
INSERT INTO public.orders (order_id, user_id, status_id, phone, address, payment_method_id, get_method_id, email, "createdAt", "updatedAt") VALUES (15, 1, 1, '+79520481728', '123', 1, 1, '123', '2023-07-05 14:01:29.557+03', '2023-07-05 14:01:29.557+03');
INSERT INTO public.orders (order_id, user_id, status_id, phone, address, payment_method_id, get_method_id, email, "createdAt", "updatedAt") VALUES (16, 1, 1, '+79520481728', '123', 1, 1, '123', '2023-07-05 14:02:47.597+03', '2023-07-05 14:02:47.597+03');
INSERT INTO public.orders (order_id, user_id, status_id, phone, address, payment_method_id, get_method_id, email, "createdAt", "updatedAt") VALUES (17, 1, 1, '+79520481728', '123', 1, 1, '123', '2023-07-05 14:03:09.85+03', '2023-07-05 14:03:09.85+03');
INSERT INTO public.orders (order_id, user_id, status_id, phone, address, payment_method_id, get_method_id, email, "createdAt", "updatedAt") VALUES (18, 1, 1, '+79520481728', '123', 1, 2, '123', '2023-07-05 17:42:49.982+03', '2023-07-05 17:42:49.982+03');


--
-- TOC entry 3530 (class 0 OID 54757)
-- Dependencies: 240
-- Data for Name: payment_methods; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.payment_methods (payment_method_id, name, "createdAt", "updatedAt") VALUES (1, 'Наличными', '2023-07-03 16:19:28.252+03', '2023-07-03 16:19:28.252+03');
INSERT INTO public.payment_methods (payment_method_id, name, "createdAt", "updatedAt") VALUES (2, 'Банковской картой', '2023-07-03 16:19:28.253+03', '2023-07-03 16:19:28.253+03');


--
-- TOC entry 3507 (class 0 OID 54521)
-- Dependencies: 217
-- Data for Name: product_photos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product_photos (product_photo_id, name, file_id, product_id, "createdAt", "updatedAt") VALUES (1, '0', 37, 2, '2023-06-27 03:00:49.537+03', '2023-06-27 03:00:49.537+03');
INSERT INTO public.product_photos (product_photo_id, name, file_id, product_id, "createdAt", "updatedAt") VALUES (2, '0', 38, 2, '2023-06-27 03:00:52.768+03', '2023-06-27 03:00:52.768+03');
INSERT INTO public.product_photos (product_photo_id, name, file_id, product_id, "createdAt", "updatedAt") VALUES (3, '0', 39, 2, '2023-06-27 03:00:55.812+03', '2023-06-27 03:00:55.812+03');
INSERT INTO public.product_photos (product_photo_id, name, file_id, product_id, "createdAt", "updatedAt") VALUES (4, '0', 40, 2, '2023-06-27 03:01:04.111+03', '2023-06-27 03:01:04.111+03');


--
-- TOC entry 3509 (class 0 OID 54525)
-- Dependencies: 219
-- Data for Name: product_property_values; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product_property_values (product_property_value_id, product_id, property_value_id, category_property_id, is_active, "createdAt", "updatedAt") VALUES (1, 1, 19, 6, true, '2023-06-26 21:47:33.472+03', '2023-06-26 21:47:33.472+03');
INSERT INTO public.product_property_values (product_property_value_id, product_id, property_value_id, category_property_id, is_active, "createdAt", "updatedAt") VALUES (2, 1, 22, 5, true, '2023-06-26 21:47:40.876+03', '2023-06-26 21:47:40.876+03');
INSERT INTO public.product_property_values (product_property_value_id, product_id, property_value_id, category_property_id, is_active, "createdAt", "updatedAt") VALUES (3, 1, 26, 4, true, '2023-06-26 21:47:46.848+03', '2023-06-26 21:47:46.848+03');
INSERT INTO public.product_property_values (product_property_value_id, product_id, property_value_id, category_property_id, is_active, "createdAt", "updatedAt") VALUES (4, 1, 27, 3, true, '2023-06-26 21:47:53.425+03', '2023-06-26 21:47:53.425+03');
INSERT INTO public.product_property_values (product_property_value_id, product_id, property_value_id, category_property_id, is_active, "createdAt", "updatedAt") VALUES (5, 1, 31, 2, true, '2023-06-26 21:47:58.119+03', '2023-06-26 21:47:58.119+03');
INSERT INTO public.product_property_values (product_property_value_id, product_id, property_value_id, category_property_id, is_active, "createdAt", "updatedAt") VALUES (6, 1, 34, 1, true, '2023-06-26 21:48:03.123+03', '2023-06-26 21:48:03.123+03');
INSERT INTO public.product_property_values (product_property_value_id, product_id, property_value_id, category_property_id, is_active, "createdAt", "updatedAt") VALUES (7, 2, 20, 6, true, '2023-06-26 21:53:01.867+03', '2023-06-26 21:53:01.867+03');
INSERT INTO public.product_property_values (product_property_value_id, product_id, property_value_id, category_property_id, is_active, "createdAt", "updatedAt") VALUES (8, 2, 23, 5, true, '2023-06-26 21:53:07.36+03', '2023-06-26 21:53:07.36+03');
INSERT INTO public.product_property_values (product_property_value_id, product_id, property_value_id, category_property_id, is_active, "createdAt", "updatedAt") VALUES (9, 2, 24, 4, true, '2023-06-26 21:53:17.562+03', '2023-06-26 21:53:17.562+03');
INSERT INTO public.product_property_values (product_property_value_id, product_id, property_value_id, category_property_id, is_active, "createdAt", "updatedAt") VALUES (10, 2, 28, 3, true, '2023-06-26 21:53:22.326+03', '2023-06-26 21:53:22.326+03');
INSERT INTO public.product_property_values (product_property_value_id, product_id, property_value_id, category_property_id, is_active, "createdAt", "updatedAt") VALUES (11, 2, 32, 2, true, '2023-06-26 21:53:27.091+03', '2023-06-26 21:53:27.091+03');
INSERT INTO public.product_property_values (product_property_value_id, product_id, property_value_id, category_property_id, is_active, "createdAt", "updatedAt") VALUES (12, 2, 33, 1, true, '2023-06-26 21:53:41.448+03', '2023-06-26 21:53:41.448+03');
INSERT INTO public.product_property_values (product_property_value_id, product_id, property_value_id, category_property_id, is_active, "createdAt", "updatedAt") VALUES (13, 3, 18, 6, true, '2023-06-26 21:54:48.81+03', '2023-06-26 21:54:48.81+03');
INSERT INTO public.product_property_values (product_property_value_id, product_id, property_value_id, category_property_id, is_active, "createdAt", "updatedAt") VALUES (14, 3, 21, 5, true, '2023-06-26 21:54:53.639+03', '2023-06-26 21:54:53.639+03');
INSERT INTO public.product_property_values (product_property_value_id, product_id, property_value_id, category_property_id, is_active, "createdAt", "updatedAt") VALUES (15, 3, 25, 4, true, '2023-06-26 21:55:00.498+03', '2023-06-26 21:55:00.498+03');
INSERT INTO public.product_property_values (product_property_value_id, product_id, property_value_id, category_property_id, is_active, "createdAt", "updatedAt") VALUES (16, 3, 29, 3, true, '2023-06-26 21:55:05.397+03', '2023-06-26 21:55:05.397+03');
INSERT INTO public.product_property_values (product_property_value_id, product_id, property_value_id, category_property_id, is_active, "createdAt", "updatedAt") VALUES (17, 3, 30, 2, true, '2023-06-26 21:55:09.415+03', '2023-06-26 21:55:09.415+03');
INSERT INTO public.product_property_values (product_property_value_id, product_id, property_value_id, category_property_id, is_active, "createdAt", "updatedAt") VALUES (18, 3, 35, 1, true, '2023-06-26 21:55:13.453+03', '2023-06-26 21:55:13.453+03');
INSERT INTO public.product_property_values (product_property_value_id, product_id, property_value_id, category_property_id, is_active, "createdAt", "updatedAt") VALUES (19, 4, 4, 20, true, '2023-06-26 21:59:11.297+03', '2023-06-26 21:59:11.297+03');
INSERT INTO public.product_property_values (product_property_value_id, product_id, property_value_id, category_property_id, is_active, "createdAt", "updatedAt") VALUES (20, 4, 5, 19, true, '2023-06-26 21:59:17.612+03', '2023-06-26 21:59:17.612+03');
INSERT INTO public.product_property_values (product_property_value_id, product_id, property_value_id, category_property_id, is_active, "createdAt", "updatedAt") VALUES (21, 4, 9, 18, true, '2023-06-26 21:59:21.88+03', '2023-06-26 21:59:21.88+03');
INSERT INTO public.product_property_values (product_property_value_id, product_id, property_value_id, category_property_id, is_active, "createdAt", "updatedAt") VALUES (22, 4, 36, 17, true, '2023-06-26 21:59:26.259+03', '2023-06-26 22:00:21.762+03');
INSERT INTO public.product_property_values (product_property_value_id, product_id, property_value_id, category_property_id, is_active, "createdAt", "updatedAt") VALUES (23, 4, 15, 16, true, '2023-06-26 22:00:28.287+03', '2023-06-26 22:00:28.287+03');
INSERT INTO public.product_property_values (product_property_value_id, product_id, property_value_id, category_property_id, is_active, "createdAt", "updatedAt") VALUES (24, 4, 16, 15, true, '2023-06-26 22:00:32.486+03', '2023-06-26 22:00:32.486+03');
INSERT INTO public.product_property_values (product_property_value_id, product_id, property_value_id, category_property_id, is_active, "createdAt", "updatedAt") VALUES (25, 5, 3, 20, true, '2023-06-26 22:01:39.296+03', '2023-06-26 22:01:39.296+03');
INSERT INTO public.product_property_values (product_property_value_id, product_id, property_value_id, category_property_id, is_active, "createdAt", "updatedAt") VALUES (26, 5, 7, 19, true, '2023-06-26 22:01:44.263+03', '2023-06-26 22:01:48.986+03');
INSERT INTO public.product_property_values (product_property_value_id, product_id, property_value_id, category_property_id, is_active, "createdAt", "updatedAt") VALUES (27, 5, 8, 18, true, '2023-06-26 22:01:53.223+03', '2023-06-26 22:01:53.223+03');
INSERT INTO public.product_property_values (product_property_value_id, product_id, property_value_id, category_property_id, is_active, "createdAt", "updatedAt") VALUES (28, 5, 37, 17, true, '2023-06-26 22:03:50.434+03', '2023-06-26 22:03:50.434+03');
INSERT INTO public.product_property_values (product_property_value_id, product_id, property_value_id, category_property_id, is_active, "createdAt", "updatedAt") VALUES (29, 5, 14, 16, true, '2023-06-26 22:03:56.592+03', '2023-06-26 22:03:56.592+03');
INSERT INTO public.product_property_values (product_property_value_id, product_id, property_value_id, category_property_id, is_active, "createdAt", "updatedAt") VALUES (30, 5, 17, 15, true, '2023-06-26 22:04:00.604+03', '2023-06-26 22:04:00.604+03');
INSERT INTO public.product_property_values (product_property_value_id, product_id, property_value_id, category_property_id, is_active, "createdAt", "updatedAt") VALUES (31, 6, 4, 20, true, '2023-06-26 22:05:43.031+03', '2023-06-26 22:05:43.031+03');
INSERT INTO public.product_property_values (product_property_value_id, product_id, property_value_id, category_property_id, is_active, "createdAt", "updatedAt") VALUES (32, 6, 6, 19, true, '2023-06-26 22:05:52.932+03', '2023-06-26 22:05:52.932+03');
INSERT INTO public.product_property_values (product_property_value_id, product_id, property_value_id, category_property_id, is_active, "createdAt", "updatedAt") VALUES (33, 6, 9, 18, true, '2023-06-26 22:05:57.803+03', '2023-06-26 22:05:57.803+03');
INSERT INTO public.product_property_values (product_property_value_id, product_id, property_value_id, category_property_id, is_active, "createdAt", "updatedAt") VALUES (34, 6, 10, 17, true, '2023-06-26 22:06:04.343+03', '2023-06-26 22:06:04.343+03');
INSERT INTO public.product_property_values (product_property_value_id, product_id, property_value_id, category_property_id, is_active, "createdAt", "updatedAt") VALUES (35, 6, 13, 16, true, '2023-06-26 22:06:08.792+03', '2023-06-26 22:06:08.792+03');
INSERT INTO public.product_property_values (product_property_value_id, product_id, property_value_id, category_property_id, is_active, "createdAt", "updatedAt") VALUES (36, 6, 16, 15, true, '2023-06-26 22:06:12.601+03', '2023-06-26 22:06:12.601+03');
INSERT INTO public.product_property_values (product_property_value_id, product_id, property_value_id, category_property_id, is_active, "createdAt", "updatedAt") VALUES (37, 7, 38, 12, true, '2023-06-26 22:12:07.403+03', '2023-06-26 22:12:07.403+03');
INSERT INTO public.product_property_values (product_property_value_id, product_id, property_value_id, category_property_id, is_active, "createdAt", "updatedAt") VALUES (38, 7, 41, 11, true, '2023-06-26 22:14:22.796+03', '2023-06-26 22:14:22.796+03');
INSERT INTO public.product_property_values (product_property_value_id, product_id, property_value_id, category_property_id, is_active, "createdAt", "updatedAt") VALUES (39, 7, 8, 10, true, '2023-06-26 22:14:37.016+03', '2023-06-26 22:14:37.016+03');
INSERT INTO public.product_property_values (product_property_value_id, product_id, property_value_id, category_property_id, is_active, "createdAt", "updatedAt") VALUES (40, 7, 37, 9, true, '2023-06-26 22:14:50.761+03', '2023-06-26 22:14:50.761+03');
INSERT INTO public.product_property_values (product_property_value_id, product_id, property_value_id, category_property_id, is_active, "createdAt", "updatedAt") VALUES (41, 7, 44, 8, true, '2023-06-26 22:16:36.985+03', '2023-06-26 22:16:36.985+03');
INSERT INTO public.product_property_values (product_property_value_id, product_id, property_value_id, category_property_id, is_active, "createdAt", "updatedAt") VALUES (42, 7, 17, 7, true, '2023-06-26 22:16:49.694+03', '2023-06-26 22:16:49.694+03');
INSERT INTO public.product_property_values (product_property_value_id, product_id, property_value_id, category_property_id, is_active, "createdAt", "updatedAt") VALUES (43, 8, 39, 12, true, '2023-06-26 22:18:05.041+03', '2023-06-26 22:18:05.041+03');
INSERT INTO public.product_property_values (product_property_value_id, product_id, property_value_id, category_property_id, is_active, "createdAt", "updatedAt") VALUES (44, 8, 42, 11, true, '2023-06-26 22:18:28.391+03', '2023-06-26 22:18:28.391+03');
INSERT INTO public.product_property_values (product_property_value_id, product_id, property_value_id, category_property_id, is_active, "createdAt", "updatedAt") VALUES (45, 8, 9, 10, true, '2023-06-26 22:18:34.196+03', '2023-06-26 22:18:34.196+03');
INSERT INTO public.product_property_values (product_property_value_id, product_id, property_value_id, category_property_id, is_active, "createdAt", "updatedAt") VALUES (46, 8, 49, 9, true, '2023-06-26 22:19:54.783+03', '2023-06-26 22:19:54.783+03');
INSERT INTO public.product_property_values (product_property_value_id, product_id, property_value_id, category_property_id, is_active, "createdAt", "updatedAt") VALUES (47, 8, 45, 8, true, '2023-06-26 22:20:06.436+03', '2023-06-26 22:20:06.436+03');
INSERT INTO public.product_property_values (product_property_value_id, product_id, property_value_id, category_property_id, is_active, "createdAt", "updatedAt") VALUES (48, 8, 16, 7, true, '2023-06-26 22:20:23.134+03', '2023-06-26 22:20:23.134+03');
INSERT INTO public.product_property_values (product_property_value_id, product_id, property_value_id, category_property_id, is_active, "createdAt", "updatedAt") VALUES (49, 9, 40, 12, true, '2023-06-26 22:22:23.214+03', '2023-06-26 22:22:23.214+03');
INSERT INTO public.product_property_values (product_property_value_id, product_id, property_value_id, category_property_id, is_active, "createdAt", "updatedAt") VALUES (50, 9, 43, 11, true, '2023-06-26 22:22:33.785+03', '2023-06-26 22:22:33.785+03');
INSERT INTO public.product_property_values (product_property_value_id, product_id, property_value_id, category_property_id, is_active, "createdAt", "updatedAt") VALUES (51, 9, 9, 10, true, '2023-06-26 22:23:45.734+03', '2023-06-26 22:23:45.734+03');
INSERT INTO public.product_property_values (product_property_value_id, product_id, property_value_id, category_property_id, is_active, "createdAt", "updatedAt") VALUES (52, 9, 11, 9, true, '2023-06-26 22:23:51.251+03', '2023-06-26 22:23:51.251+03');
INSERT INTO public.product_property_values (product_property_value_id, product_id, property_value_id, category_property_id, is_active, "createdAt", "updatedAt") VALUES (53, 9, 46, 8, true, '2023-06-26 22:24:07.413+03', '2023-06-26 22:24:07.413+03');
INSERT INTO public.product_property_values (product_property_value_id, product_id, property_value_id, category_property_id, is_active, "createdAt", "updatedAt") VALUES (54, 9, 16, 7, true, '2023-06-26 22:24:11.17+03', '2023-06-26 22:24:11.17+03');


--
-- TOC entry 3511 (class 0 OID 54530)
-- Dependencies: 221
-- Data for Name: product_reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3512 (class 0 OID 54536)
-- Dependencies: 222
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.products (product_id, name, is_active, descr, price, file_id, category_id, developer_id, "createdAt", "updatedAt") VALUES (1, 'Беззеркальная камера Nikon Z 9 Body черная', true, 'Беззеркальная камера Nikon Z 9 Body создана для профессионалов. Высокая детализация изображения обеспечивается благодаря полнокадровой матрице КМОП с эффективным разрешением 45.7 Мп и процессору EXPEED 7. Система автоматической фокусировки быстро и точно отслеживает объекты в кадре.
В камере установлен дисплей 3.2 дюйма с сенсорным управлением и наклонным механизмом. Nikon Z 9 Body поддерживает носители CFexpress 1.0 Type B и XQD для хранения файлов в двух слотах. Из беспроводных интерфейсов реализованы Bluetooth, GPS, Wi-Fi. В комплекте поставляются аккумулятор, ремень, защитная крышка и другие принадлежности.', 479999, 15, 8, 1, '2023-06-26 21:44:11.237+03', '2023-06-26 21:48:21.697+03');
INSERT INTO public.products (product_id, name, is_active, descr, price, file_id, category_id, developer_id, "createdAt", "updatedAt") VALUES (3, 'Беззеркальная камера Canon EOS M200 Kit 15-45mm IS STM черная', true, 'Беззеркальная камера Canon EOS M200 Kit 15-45mm IS STM с матрицей CMOS 24.1 Мп обеспечивает получение детализированных, реалистичных и красочных фотоизображений и видеороликов в разрешении до 4K. Широкие возможности настройки параметров позволяют реализовать творческие идеи. Для просмотра контента и интуитивного управления в камере установлен сенсорный дисплей 3 дюйма.
Canon EOS M200 поставляется в комплекте с объективом с регулируемым диапазоном фокусных расстояний. Устройство обладает поддержкой проводных и беспроводных средств коммуникации, включая модули Wi-Fi и Bluetooth. Полного заряда аккумулятора достаточно для создания 485 фотографий.', 47999, 19, 8, 1, '2023-06-26 21:54:36.431+03', '2023-06-26 21:55:14.931+03');
INSERT INTO public.products (product_id, name, is_active, descr, price, file_id, category_id, developer_id, "createdAt", "updatedAt") VALUES (4, '6.7" Смартфон Apple iPhone 14 Pro Max 512 ГБ золотистый', true, 'Смартфон Apple iPhone 14 Pro Max на 1000 гигабайт представлен в фиолетовом цвете. Имеет функцию замедленной съемки в FullHD, а также может снимать 4К-видео. На задней части смартфона расположены три камеры, одна из которых на 48 Мп, а две других на 12 Мп. Фронтальная камера также на 12 Мп.', 158199, 20, 5, 2, '2023-06-26 21:57:47.33+03', '2023-06-26 22:00:34.139+03');
INSERT INTO public.products (product_id, name, is_active, descr, price, file_id, category_id, developer_id, "createdAt", "updatedAt") VALUES (7, '7" Планшет DEXP Ursus H370 3G 32 ГБ синий', true, 'Планшет DEXP Ursus H370 Armor — высокопрочное функциональное устройство синего цвета. Модель имеет небольшой размер и скошенные углы, благодаря чему без труда помещается в рюкзак или сумку. IPS-матрица с плотностью пикселей 170 ppi обеспечивает качественное и детализированное изображение разрешением 1024x600 пикселей. Экран диагональю 7 дюймов оптимален для просмотра фильмов или игр.
Планшет DEXP Ursus H370 Armor изготовлен из высокопрочного и износостойкого пластика. За высокую производительность отвечает 1 ГБ оперативной памяти и 4-ядерный процессор. Для хранения личных данных или загрузки приложений есть 32 ГБ памяти. Слот для карт памяти позволяет увеличить виртуальное пространство на 64 ГБ. Для подключения к точкам доступа есть Wi-Fi-модуль. Емкостный мультитач-экран обеспечивает быстрый отклик по всей рабочей поверхности.', 2999, 23, 6, 5, '2023-06-26 22:08:15.577+03', '2023-06-26 22:26:09.259+03');
INSERT INTO public.products (product_id, name, is_active, descr, price, file_id, category_id, developer_id, "createdAt", "updatedAt") VALUES (5, '5" Смартфон DEXP G450 One 32 ГБ красный', true, 'Смартфон DEXP G450 One станет достойным выбором каждого, кому потребовался компактный, надежный и многофункциональный ассистент для совершения звонков и комфортного времяпрепровождения. Насладиться просмотром любимых роликов и снимков в максимальном разрешении 854x480 пикселей вам поможет 5-дюймовый дисплей. Для повсеместного доступа к площадкам Всемирной паутины предусмотрен модуль Wi-Fi 4 (802.11n).
Смартфон DEXP G450 One не способен внести непредвиденные коррективы в намеченные пользователем планы внезапно низким уровнем заряда аккумулятора, ведь его емкость повышена до 2000 мАч – таким образом, вам гарантировано до 250 ч работы в режиме ожидания. Основная камера с разрешением матрицы 2 Мп и светодиодной вспышкой – настоящая палочка-выручалочка при создании качественных памятных кадров. Процессор MediaTek MT6580M с 4 ядрами обеспечит не только быструю реакцию на команды пользователя, но и мгновенную загрузку необходимых приложений.', 2199, 21, 5, 3, '2023-06-26 22:01:29.084+03', '2023-06-26 22:04:06.114+03');
INSERT INTO public.products (product_id, name, is_active, descr, price, file_id, category_id, developer_id, "createdAt", "updatedAt") VALUES (6, '6.67" Смартфон Nothing Phone 1 256 ГБ белый', true, 'Смартфон Nothing Phone 1 обеспечивает комфортную и длительную эксплуатацию. Модель подходит для работы, общения, серфинга в Интернете или игр. Оперативная память на 8 ГБ и 8-ядерный процессор обеспечивают моментальную загрузку приложений и быструю передачу данных. Модель рассчитана на установку двух карт SIM и поддерживает работу в сети 5G. Корпус белого цвета имеет высокий уровень защиты от попадания влаги и пыли, а стекло устойчиво к образованию царапин и потертостей. Экран диагональю 6.55 дюймов демонстрирует яркое и детализированное изображение.
Смартфон Nothing Phone 1 с дисплеем OLED имеет частоту 120 Гц, которая способствует плавному переходу. Для хранения большого количества данных есть 256 ГБ. Батарея емкостью 4500 мА*ч поддерживает технологию быстрой зарядки, что позволяет всегда оставаться на связи. С помощью основной камеры 50+50 Мп можно делать фото в высоком разрешении и записывать видео в формате Ultra HD 4K.', 40999, 22, 5, 3, '2023-06-26 22:05:12.233+03', '2023-06-26 22:06:13.846+03');
INSERT INTO public.products (product_id, name, is_active, descr, price, file_id, category_id, developer_id, "createdAt", "updatedAt") VALUES (8, 'Характеристики 12.9" Планшет Apple iPad Pro (2022) 5G 2048 ГБ серебристый', true, 'Удивительная производительность. Невероятно продвинутый дисплей. Сверхбыстрая беспроводная связь. Возможности Apple Pencil 2-го поколения. Мощные функции в iPadOS 16. Непревзойденные возможности iPad.', 202399, 24, 6, 2, '2023-06-26 22:17:44.663+03', '2023-06-26 22:20:24.51+03');
INSERT INTO public.products (product_id, name, is_active, descr, price, file_id, category_id, developer_id, "createdAt", "updatedAt") VALUES (9, '12.4" Планшет Samsung Galaxy Tab S7+ Wi-Fi 128 ГБ коричневый', true, '12.4ʺ Планшет Samsung Galaxy Tab S7+ 128 ГБ обладает тонким, но прочным корпусом из металла коричневого цвета. Экран Super AMOLED с разрешением 2800x1752р и частотой обновления в 120 Гц позволяет обрабатывать фотографии и работать в графических программах. Для максимального удобства при взаимодействии с экраном к планшету прилагается стилус. 8 ядер процессора Snapdragon 865 Plus обеспечивают стабильную и быструю работу всех компонентов планшета. А благодаря 6 ГБ ОЗУ на планшете можно играть в довольно требовательные игры.
Планшет Samsung Galaxy Tab S7+ оснащен тыловой (5; 13 Мп) и фронтальной (8 Мп) камерами, которые позволят вести фото- или видеосъемку в высоком качестве. Поддержка технологии OTG предусматривает объединение планшета с другими устройствами в одну сеть, чтобы было удобнее обмениваться данными. Для хранения различных файлов в планшете имеется встроенная память на 128 ГБ. При необходимости ее можно увеличить до 1 ТБ, установив в специальный слот карту памяти. Выход с планшета в интернет обеспечивает модуль Wi-Fi.', 62999, 25, 6, 3, '2023-06-26 22:22:13.047+03', '2023-06-26 22:24:30.506+03');
INSERT INTO public.products (product_id, name, is_active, descr, price, file_id, category_id, developer_id, "createdAt", "updatedAt") VALUES (2, 'Беззеркальная камера Fujifilm X-T4 Kit XF 18-55mm серебристая', true, 'Беззеркальная камера Fujifilm X-T4 Kit XF 18-55mm предназначена для профессиональной съемки. Она поставляется в наборе со сменным объективом с фокусным расстоянием 18-55 мм – универсальное решение для снимков различных жанров (портреты, пейзажи и прочие). Матрица X-Trans CMOS IV в сочетании с системой оптической стабилизации и рядом настраиваемых параметров помогает добиться реалистичности снимков в любых условиях.
Корпус камеры имеет защищенную конструкцию, поэтому возможна съемка в любую погоду. Для удобства в пользовании установлен сенсорный дисплей 3 дюйма. Fujifilm X-T4 оснащена проводными и беспроводными интерфейсами подключения. В качестве хранилища отснятого материала может использоваться карта памяти до 512 ГБ. В наборе поставляются защитные крышки, аккумулятор, кабель USB, плечевой ремень.', 199999, 18, 8, 4, '2023-06-26 21:52:41.046+03', '2023-06-27 03:01:09.884+03');


--
-- TOC entry 3514 (class 0 OID 54544)
-- Dependencies: 224
-- Data for Name: promo_products; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3515 (class 0 OID 54547)
-- Dependencies: 225
-- Data for Name: promos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3517 (class 0 OID 54553)
-- Dependencies: 227
-- Data for Name: properties; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.properties (property_id, name, is_active, "createdAt", "updatedAt") VALUES (3, 'Частота обновления экрана', true, '2023-06-26 21:10:18.567+03', '2023-06-26 21:12:01.707+03');
INSERT INTO public.properties (property_id, name, is_active, "createdAt", "updatedAt") VALUES (6, 'Поддержка беспроводной зарядки ', true, '2023-06-26 21:18:28.446+03', '2023-06-26 21:18:44.73+03');
INSERT INTO public.properties (property_id, name, is_active, "createdAt", "updatedAt") VALUES (7, 'Общее число мегапикселей матрицы ', true, '2023-06-26 21:21:17.097+03', '2023-06-26 21:23:06.095+03');
INSERT INTO public.properties (property_id, name, is_active, "createdAt", "updatedAt") VALUES (8, 'Число эффективных мегапикселей', true, '2023-06-26 21:24:26.534+03', '2023-06-26 21:25:52.153+03');
INSERT INTO public.properties (property_id, name, is_active, "createdAt", "updatedAt") VALUES (9, 'Максимальное разрешение', true, '2023-06-26 21:26:12.16+03', '2023-06-26 21:27:22.141+03');
INSERT INTO public.properties (property_id, name, is_active, "createdAt", "updatedAt") VALUES (10, 'Расширенная максимальная чувствительность (ISO)', true, '2023-06-26 21:28:03.971+03', '2023-06-26 21:29:15.994+03');
INSERT INTO public.properties (property_id, name, is_active, "createdAt", "updatedAt") VALUES (11, 'Скорость съемки', true, '2023-06-26 21:29:41.53+03', '2023-06-26 21:31:04.466+03');
INSERT INTO public.properties (property_id, name, is_active, "createdAt", "updatedAt") VALUES (12, 'Число пикселей ЖК-экрана', true, '2023-06-26 21:31:40.891+03', '2023-06-26 21:33:53.9+03');
INSERT INTO public.properties (property_id, name, is_active, "createdAt", "updatedAt") VALUES (1, 'Диагональ экрана (дюйм)', true, '2023-06-26 21:05:21.662+03', '2023-06-26 22:11:44.856+03');
INSERT INTO public.properties (property_id, name, is_active, "createdAt", "updatedAt") VALUES (2, 'Разрешение экрана', true, '2023-06-26 21:07:58.738+03', '2023-06-26 22:13:53.33+03');
INSERT INTO public.properties (property_id, name, is_active, "createdAt", "updatedAt") VALUES (5, 'Емкость аккумулятора', true, '2023-06-26 21:15:07.29+03', '2023-06-26 22:16:07.182+03');
INSERT INTO public.properties (property_id, name, is_active, "createdAt", "updatedAt") VALUES (4, 'Объем встроенной памяти', true, '2023-06-26 21:12:38.261+03', '2023-06-26 22:19:32.338+03');


--
-- TOC entry 3519 (class 0 OID 54558)
-- Dependencies: 229
-- Data for Name: property_values; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.property_values (property_value_id, name, property_id, is_active, "createdAt", "updatedAt") VALUES (2, '6.7', 1, true, '2023-06-26 21:06:17.074+03', '2023-06-26 21:06:17.074+03');
INSERT INTO public.property_values (property_value_id, name, property_id, is_active, "createdAt", "updatedAt") VALUES (3, '6.1', 1, true, '2023-06-26 21:06:56.5+03', '2023-06-26 21:06:56.5+03');
INSERT INTO public.property_values (property_value_id, name, property_id, is_active, "createdAt", "updatedAt") VALUES (4, '6.67', 1, true, '2023-06-26 21:07:37.923+03', '2023-06-26 21:07:37.923+03');
INSERT INTO public.property_values (property_value_id, name, property_id, is_active, "createdAt", "updatedAt") VALUES (5, '2400x1080', 2, true, '2023-06-26 21:08:15.447+03', '2023-06-26 21:08:15.447+03');
INSERT INTO public.property_values (property_value_id, name, property_id, is_active, "createdAt", "updatedAt") VALUES (6, '1600x720', 2, true, '2023-06-26 21:08:49.882+03', '2023-06-26 21:08:49.882+03');
INSERT INTO public.property_values (property_value_id, name, property_id, is_active, "createdAt", "updatedAt") VALUES (7, ' 854x480', 2, true, '2023-06-26 21:09:49.375+03', '2023-06-26 21:09:49.375+03');
INSERT INTO public.property_values (property_value_id, name, property_id, is_active, "createdAt", "updatedAt") VALUES (8, '60 Гц', 3, true, '2023-06-26 21:10:31.616+03', '2023-06-26 21:10:31.616+03');
INSERT INTO public.property_values (property_value_id, name, property_id, is_active, "createdAt", "updatedAt") VALUES (9, '120 Гц', 3, true, '2023-06-26 21:10:58.89+03', '2023-06-26 21:10:58.89+03');
INSERT INTO public.property_values (property_value_id, name, property_id, is_active, "createdAt", "updatedAt") VALUES (10, '256 ГБ', 4, true, '2023-06-26 21:13:12.826+03', '2023-06-26 21:13:12.826+03');
INSERT INTO public.property_values (property_value_id, name, property_id, is_active, "createdAt", "updatedAt") VALUES (11, '128 ГБ', 4, true, '2023-06-26 21:13:53.409+03', '2023-06-26 21:13:53.409+03');
INSERT INTO public.property_values (property_value_id, name, property_id, is_active, "createdAt", "updatedAt") VALUES (12, '64 ГБ', 4, true, '2023-06-26 21:13:57.86+03', '2023-06-26 21:13:57.86+03');
INSERT INTO public.property_values (property_value_id, name, property_id, is_active, "createdAt", "updatedAt") VALUES (13, '4500 мА*ч', 5, true, '2023-06-26 21:15:20.264+03', '2023-06-26 21:15:20.264+03');
INSERT INTO public.property_values (property_value_id, name, property_id, is_active, "createdAt", "updatedAt") VALUES (14, '2000 мА*ч', 5, true, '2023-06-26 21:15:58.709+03', '2023-06-26 21:15:58.709+03');
INSERT INTO public.property_values (property_value_id, name, property_id, is_active, "createdAt", "updatedAt") VALUES (15, ' 4800 мА*ч', 5, true, '2023-06-26 21:17:06.456+03', '2023-06-26 21:17:06.456+03');
INSERT INTO public.property_values (property_value_id, name, property_id, is_active, "createdAt", "updatedAt") VALUES (16, 'есть', 6, true, '2023-06-26 21:18:37.795+03', '2023-06-26 21:18:37.795+03');
INSERT INTO public.property_values (property_value_id, name, property_id, is_active, "createdAt", "updatedAt") VALUES (17, 'нету', 6, true, '2023-06-26 21:18:42.565+03', '2023-06-26 21:18:42.565+03');
INSERT INTO public.property_values (property_value_id, name, property_id, is_active, "createdAt", "updatedAt") VALUES (18, '25.8 Мп', 7, true, '2023-06-26 21:21:29.311+03', '2023-06-26 21:21:29.311+03');
INSERT INTO public.property_values (property_value_id, name, property_id, is_active, "createdAt", "updatedAt") VALUES (19, '52.37 Мп', 7, true, '2023-06-26 21:22:27.711+03', '2023-06-26 21:22:27.711+03');
INSERT INTO public.property_values (property_value_id, name, property_id, is_active, "createdAt", "updatedAt") VALUES (20, '26.1 Мп', 7, true, '2023-06-26 21:23:03.513+03', '2023-06-26 21:23:03.513+03');
INSERT INTO public.property_values (property_value_id, name, property_id, is_active, "createdAt", "updatedAt") VALUES (21, '24.1 Мп', 8, true, '2023-06-26 21:24:38.444+03', '2023-06-26 21:24:38.444+03');
INSERT INTO public.property_values (property_value_id, name, property_id, is_active, "createdAt", "updatedAt") VALUES (22, '45.7 Мп', 8, true, '2023-06-26 21:25:14.246+03', '2023-06-26 21:25:14.246+03');
INSERT INTO public.property_values (property_value_id, name, property_id, is_active, "createdAt", "updatedAt") VALUES (23, ' 26.1 Мп', 8, true, '2023-06-26 21:25:50.474+03', '2023-06-26 21:25:50.474+03');
INSERT INTO public.property_values (property_value_id, name, property_id, is_active, "createdAt", "updatedAt") VALUES (24, ' 6240 x 4160', 9, true, '2023-06-26 21:26:28.426+03', '2023-06-26 21:26:28.426+03');
INSERT INTO public.property_values (property_value_id, name, property_id, is_active, "createdAt", "updatedAt") VALUES (25, '6000 x 4000', 9, true, '2023-06-26 21:26:51.784+03', '2023-06-26 21:26:51.784+03');
INSERT INTO public.property_values (property_value_id, name, property_id, is_active, "createdAt", "updatedAt") VALUES (26, ' 8256 x 5504', 9, true, '2023-06-26 21:27:20.244+03', '2023-06-26 21:27:20.244+03');
INSERT INTO public.property_values (property_value_id, name, property_id, is_active, "createdAt", "updatedAt") VALUES (27, '102400', 10, true, '2023-06-26 21:28:13.845+03', '2023-06-26 21:28:13.845+03');
INSERT INTO public.property_values (property_value_id, name, property_id, is_active, "createdAt", "updatedAt") VALUES (28, '51200', 10, true, '2023-06-26 21:28:43.697+03', '2023-06-26 21:28:43.697+03');
INSERT INTO public.property_values (property_value_id, name, property_id, is_active, "createdAt", "updatedAt") VALUES (29, '25600', 10, true, '2023-06-26 21:29:13.251+03', '2023-06-26 21:29:13.251+03');
INSERT INTO public.property_values (property_value_id, name, property_id, is_active, "createdAt", "updatedAt") VALUES (30, '6.1 кадр./сек', 11, true, '2023-06-26 21:29:52.041+03', '2023-06-26 21:29:52.041+03');
INSERT INTO public.property_values (property_value_id, name, property_id, is_active, "createdAt", "updatedAt") VALUES (31, '120 кадр./сек', 11, true, '2023-06-26 21:30:31.798+03', '2023-06-26 21:30:31.798+03');
INSERT INTO public.property_values (property_value_id, name, property_id, is_active, "createdAt", "updatedAt") VALUES (32, '30 кадр./сек', 11, true, '2023-06-26 21:31:02.511+03', '2023-06-26 21:31:02.511+03');
INSERT INTO public.property_values (property_value_id, name, property_id, is_active, "createdAt", "updatedAt") VALUES (33, '1620000', 12, true, '2023-06-26 21:31:56.698+03', '2023-06-26 21:31:56.698+03');
INSERT INTO public.property_values (property_value_id, name, property_id, is_active, "createdAt", "updatedAt") VALUES (34, ' 2100000', 12, true, '2023-06-26 21:33:36.997+03', '2023-06-26 21:33:36.997+03');
INSERT INTO public.property_values (property_value_id, name, property_id, is_active, "createdAt", "updatedAt") VALUES (35, ' 1040000', 12, true, '2023-06-26 21:33:52.764+03', '2023-06-26 21:33:52.764+03');
INSERT INTO public.property_values (property_value_id, name, property_id, is_active, "createdAt", "updatedAt") VALUES (36, '512 ГБ', 4, true, '2023-06-26 22:00:04.936+03', '2023-06-26 22:00:04.936+03');
INSERT INTO public.property_values (property_value_id, name, property_id, is_active, "createdAt", "updatedAt") VALUES (37, '32 ГБ', 4, true, '2023-06-26 22:03:27.114+03', '2023-06-26 22:03:27.114+03');
INSERT INTO public.property_values (property_value_id, name, property_id, is_active, "createdAt", "updatedAt") VALUES (38, '7', 1, true, '2023-06-26 22:11:24.045+03', '2023-06-26 22:11:24.045+03');
INSERT INTO public.property_values (property_value_id, name, property_id, is_active, "createdAt", "updatedAt") VALUES (39, '12.9', 1, true, '2023-06-26 22:11:38.106+03', '2023-06-26 22:11:38.106+03');
INSERT INTO public.property_values (property_value_id, name, property_id, is_active, "createdAt", "updatedAt") VALUES (40, '12.4', 1, true, '2023-06-26 22:11:41.916+03', '2023-06-26 22:11:41.916+03');
INSERT INTO public.property_values (property_value_id, name, property_id, is_active, "createdAt", "updatedAt") VALUES (41, '1024x600', 2, true, '2023-06-26 22:12:44.602+03', '2023-06-26 22:12:44.602+03');
INSERT INTO public.property_values (property_value_id, name, property_id, is_active, "createdAt", "updatedAt") VALUES (42, '2732x2048', 2, true, '2023-06-26 22:12:58.378+03', '2023-06-26 22:12:58.378+03');
INSERT INTO public.property_values (property_value_id, name, property_id, is_active, "createdAt", "updatedAt") VALUES (43, '2800x1752', 2, true, '2023-06-26 22:13:49.206+03', '2023-06-26 22:13:49.206+03');
INSERT INTO public.property_values (property_value_id, name, property_id, is_active, "createdAt", "updatedAt") VALUES (44, '5000 мА*ч', 5, true, '2023-06-26 22:15:36.882+03', '2023-06-26 22:15:36.882+03');
INSERT INTO public.property_values (property_value_id, name, property_id, is_active, "createdAt", "updatedAt") VALUES (45, '10702 мА*ч', 5, true, '2023-06-26 22:15:50.931+03', '2023-06-26 22:15:50.931+03');
INSERT INTO public.property_values (property_value_id, name, property_id, is_active, "createdAt", "updatedAt") VALUES (46, '10090 мА*ч', 5, true, '2023-06-26 22:16:05.523+03', '2023-06-26 22:16:05.523+03');
INSERT INTO public.property_values (property_value_id, name, property_id, is_active, "createdAt", "updatedAt") VALUES (48, '1024 ГБ', 4, true, '2023-06-26 22:19:20.277+03', '2023-06-26 22:19:20.277+03');
INSERT INTO public.property_values (property_value_id, name, property_id, is_active, "createdAt", "updatedAt") VALUES (49, '2048 ГБ', 4, true, '2023-06-26 22:19:30.608+03', '2023-06-26 22:19:30.608+03');
INSERT INTO public.property_values (property_value_id, name, property_id, is_active, "createdAt", "updatedAt") VALUES (50, '27.8 Мп', 7, true, '2023-06-27 23:07:19.294+03', '2023-06-27 23:07:19.294+03');


--
-- TOC entry 3521 (class 0 OID 54563)
-- Dependencies: 231
-- Data for Name: shop_products; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3523 (class 0 OID 54569)
-- Dependencies: 233
-- Data for Name: shops; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.shops (shop_id, file_id, address, cords, "openFrom", "openTo", "createdAt", "updatedAt") VALUES (2, 46, 'fsdfffsdfffsdfffsdff', '55.79649522684434,49.105883509847985', '23:13', '23:12', '2023-06-29 23:25:49.338+03', '2023-06-30 19:16:40.175+03');
INSERT INTO public.shops (shop_id, file_id, address, cords, "openFrom", "openTo", "createdAt", "updatedAt") VALUES (1, 45, '1111', '55.76855130841029,49.12002755305592', '11:11', '11:11', '2023-06-29 18:54:15.642+03', '2023-07-02 00:39:10.587+03');
INSERT INTO public.shops (shop_id, file_id, address, cords, "openFrom", "openTo", "createdAt", "updatedAt") VALUES (3, 50, 'Новый магазин', '55.82928153295052,49.13437929842217', '01:01', '20:20', '2023-07-02 00:41:11.697+03', '2023-07-02 00:41:11.697+03');
INSERT INTO public.shops (shop_id, file_id, address, cords, "openFrom", "openTo", "createdAt", "updatedAt") VALUES (5, 53, 'Новый магазин', '55.761702542434435,49.53366366121511', '01:01', '20:20', '2023-07-02 00:41:11.799+03', '2023-07-02 01:10:52.244+03');
INSERT INTO public.shops (shop_id, file_id, address, cords, "openFrom", "openTo", "createdAt", "updatedAt") VALUES (4, 54, 'Новый магазин', '55.81238920970393,48.943835170004164', '01:01', '20:20', '2023-07-02 00:41:11.793+03', '2023-07-02 01:11:12.492+03');


--
-- TOC entry 3525 (class 0 OID 54575)
-- Dependencies: 235
-- Data for Name: sliders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sliders (slider_id, title, text, file_id, product_id, is_active, start_active_dt, end_active_dt, "createdAt", "updatedAt") VALUES (1, 'Этот слайдер тянется с бэка', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventor', 27, 2, true, '2023-06-21 03:00:00+03', '2023-06-27 03:00:00+03', '2023-06-27 00:10:21.438+03', '2023-06-27 00:10:21.438+03');
INSERT INTO public.sliders (slider_id, title, text, file_id, product_id, is_active, start_active_dt, end_active_dt, "createdAt", "updatedAt") VALUES (2, '  ', '', 49, 3, true, '2023-06-25 03:00:00+03', '2023-06-30 03:00:00+03', '2023-06-27 00:18:58.994+03', '2023-07-01 00:20:27.999+03');


--
-- TOC entry 3527 (class 0 OID 54582)
-- Dependencies: 237
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (user_id, name, email, password, role, "createdAt", "updatedAt") VALUES (1, 'admin123@yandex.ru', 'admin123@yandex.ru', '$2b$04$VgbkYzsahopREl8X2S4xvOlO7kepA4.wAPVglXK6lBjjyZbMkH87K', 'admin', '2023-06-26 20:48:55.991+03', '2023-06-26 20:48:55.991+03');


--
-- TOC entry 3560 (class 0 OID 0)
-- Dependencies: 210
-- Name: categories_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_category_id_seq', 16, true);


--
-- TOC entry 3561 (class 0 OID 0)
-- Dependencies: 212
-- Name: category_properties_category_property_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_properties_category_property_id_seq', 26, true);


--
-- TOC entry 3562 (class 0 OID 0)
-- Dependencies: 214
-- Name: developers_developer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.developers_developer_id_seq', 5, true);


--
-- TOC entry 3563 (class 0 OID 0)
-- Dependencies: 216
-- Name: files_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.files_file_id_seq', 54, true);


--
-- TOC entry 3564 (class 0 OID 0)
-- Dependencies: 241
-- Name: get_methods_get_method_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.get_methods_get_method_id_seq', 2, true);


--
-- TOC entry 3565 (class 0 OID 0)
-- Dependencies: 245
-- Name: order_products_order_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_products_order_product_id_seq', 23, true);


--
-- TOC entry 3566 (class 0 OID 0)
-- Dependencies: 243
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_order_id_seq', 18, true);


--
-- TOC entry 3567 (class 0 OID 0)
-- Dependencies: 239
-- Name: payment_methods_payment_method_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_methods_payment_method_id_seq', 2, true);


--
-- TOC entry 3568 (class 0 OID 0)
-- Dependencies: 218
-- Name: product_photos_product_photo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_photos_product_photo_id_seq', 4, true);


--
-- TOC entry 3569 (class 0 OID 0)
-- Dependencies: 220
-- Name: product_property_values_product_property_value_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_property_values_product_property_value_id_seq', 55, true);


--
-- TOC entry 3570 (class 0 OID 0)
-- Dependencies: 223
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_product_id_seq', 10, true);


--
-- TOC entry 3571 (class 0 OID 0)
-- Dependencies: 226
-- Name: promos_promo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.promos_promo_id_seq', 1, false);


--
-- TOC entry 3572 (class 0 OID 0)
-- Dependencies: 228
-- Name: properties_property_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.properties_property_id_seq', 12, true);


--
-- TOC entry 3573 (class 0 OID 0)
-- Dependencies: 230
-- Name: property_values_property_value_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.property_values_property_value_id_seq', 50, true);


--
-- TOC entry 3574 (class 0 OID 0)
-- Dependencies: 232
-- Name: shop_products_shop_product_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shop_products_shop_product_seq', 1, false);


--
-- TOC entry 3575 (class 0 OID 0)
-- Dependencies: 234
-- Name: shops_shop_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shops_shop_id_seq', 5, true);


--
-- TOC entry 3576 (class 0 OID 0)
-- Dependencies: 236
-- Name: sliders_slider_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sliders_slider_id_seq', 2, true);


--
-- TOC entry 3577 (class 0 OID 0)
-- Dependencies: 238
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 1, true);


--
-- TOC entry 3294 (class 2606 OID 54604)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);


--
-- TOC entry 3296 (class 2606 OID 54606)
-- Name: category_properties category_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category_properties
    ADD CONSTRAINT category_properties_pkey PRIMARY KEY (category_property_id);


--
-- TOC entry 3298 (class 2606 OID 54608)
-- Name: developers developers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.developers
    ADD CONSTRAINT developers_pkey PRIMARY KEY (developer_id);


--
-- TOC entry 3300 (class 2606 OID 54610)
-- Name: files files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (file_id);


--
-- TOC entry 3330 (class 2606 OID 54769)
-- Name: get_methods get_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.get_methods
    ADD CONSTRAINT get_methods_pkey PRIMARY KEY (get_method_id);


--
-- TOC entry 3334 (class 2606 OID 54803)
-- Name: order_products order_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT order_products_pkey PRIMARY KEY (order_product_id);


--
-- TOC entry 3332 (class 2606 OID 54780)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- TOC entry 3328 (class 2606 OID 54762)
-- Name: payment_methods payment_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_methods
    ADD CONSTRAINT payment_methods_pkey PRIMARY KEY (payment_method_id);


--
-- TOC entry 3302 (class 2606 OID 54616)
-- Name: product_photos product_photos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_photos
    ADD CONSTRAINT product_photos_pkey PRIMARY KEY (product_photo_id);


--
-- TOC entry 3304 (class 2606 OID 54618)
-- Name: product_property_values product_property_values_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_property_values
    ADD CONSTRAINT product_property_values_pkey PRIMARY KEY (product_property_value_id);


--
-- TOC entry 3306 (class 2606 OID 54620)
-- Name: product_reviews product_reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_reviews
    ADD CONSTRAINT product_reviews_pkey PRIMARY KEY (user_id, product_id);


--
-- TOC entry 3308 (class 2606 OID 54622)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- TOC entry 3310 (class 2606 OID 54624)
-- Name: promo_products promo_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promo_products
    ADD CONSTRAINT promo_products_pkey PRIMARY KEY (promo_id, product_id);


--
-- TOC entry 3312 (class 2606 OID 54626)
-- Name: promos promos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promos
    ADD CONSTRAINT promos_pkey PRIMARY KEY (promo_id);


--
-- TOC entry 3314 (class 2606 OID 54628)
-- Name: properties properties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_pkey PRIMARY KEY (property_id);


--
-- TOC entry 3316 (class 2606 OID 54630)
-- Name: property_values property_values_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.property_values
    ADD CONSTRAINT property_values_pkey PRIMARY KEY (property_value_id);


--
-- TOC entry 3318 (class 2606 OID 54632)
-- Name: shop_products shop_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_products
    ADD CONSTRAINT shop_products_pkey PRIMARY KEY (shop_product);


--
-- TOC entry 3320 (class 2606 OID 54634)
-- Name: shops shops_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shops
    ADD CONSTRAINT shops_pkey PRIMARY KEY (shop_id);


--
-- TOC entry 3322 (class 2606 OID 54636)
-- Name: sliders sliders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sliders
    ADD CONSTRAINT sliders_pkey PRIMARY KEY (slider_id);


--
-- TOC entry 3324 (class 2606 OID 54638)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 3326 (class 2606 OID 54640)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 3335 (class 2606 OID 54641)
-- Name: categories categories_file_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_file_id_fkey FOREIGN KEY (file_id) REFERENCES public.files(file_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3336 (class 2606 OID 54646)
-- Name: category_properties category_properties_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category_properties
    ADD CONSTRAINT category_properties_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(category_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3337 (class 2606 OID 54651)
-- Name: category_properties category_properties_property_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category_properties
    ADD CONSTRAINT category_properties_property_id_fkey FOREIGN KEY (property_id) REFERENCES public.properties(property_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3338 (class 2606 OID 54656)
-- Name: developers developers_file_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.developers
    ADD CONSTRAINT developers_file_id_fkey FOREIGN KEY (file_id) REFERENCES public.files(file_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3359 (class 2606 OID 54804)
-- Name: order_products order_products_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT order_products_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3358 (class 2606 OID 54791)
-- Name: orders orders_get_method_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_get_method_id_fkey FOREIGN KEY (get_method_id) REFERENCES public.get_methods(get_method_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3357 (class 2606 OID 54786)
-- Name: orders orders_payment_method_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_payment_method_id_fkey FOREIGN KEY (payment_method_id) REFERENCES public.payment_methods(payment_method_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3356 (class 2606 OID 54781)
-- Name: orders orders_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3339 (class 2606 OID 54671)
-- Name: product_photos product_photos_file_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_photos
    ADD CONSTRAINT product_photos_file_id_fkey FOREIGN KEY (file_id) REFERENCES public.files(file_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3340 (class 2606 OID 54676)
-- Name: product_photos product_photos_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_photos
    ADD CONSTRAINT product_photos_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3341 (class 2606 OID 54681)
-- Name: product_property_values product_property_values_category_property_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_property_values
    ADD CONSTRAINT product_property_values_category_property_id_fkey FOREIGN KEY (category_property_id) REFERENCES public.category_properties(category_property_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3342 (class 2606 OID 54686)
-- Name: product_property_values product_property_values_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_property_values
    ADD CONSTRAINT product_property_values_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3343 (class 2606 OID 54691)
-- Name: product_property_values product_property_values_property_value_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_property_values
    ADD CONSTRAINT product_property_values_property_value_id_fkey FOREIGN KEY (property_value_id) REFERENCES public.property_values(property_value_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3344 (class 2606 OID 54696)
-- Name: product_reviews product_reviews_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_reviews
    ADD CONSTRAINT product_reviews_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3345 (class 2606 OID 54701)
-- Name: product_reviews product_reviews_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_reviews
    ADD CONSTRAINT product_reviews_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3346 (class 2606 OID 54706)
-- Name: products products_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(category_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3347 (class 2606 OID 54711)
-- Name: products products_developer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_developer_id_fkey FOREIGN KEY (developer_id) REFERENCES public.developers(developer_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3348 (class 2606 OID 54716)
-- Name: products products_file_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_file_id_fkey FOREIGN KEY (file_id) REFERENCES public.files(file_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3349 (class 2606 OID 54721)
-- Name: promo_products promo_products_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promo_products
    ADD CONSTRAINT promo_products_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3350 (class 2606 OID 54726)
-- Name: promo_products promo_products_promo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promo_products
    ADD CONSTRAINT promo_products_promo_id_fkey FOREIGN KEY (promo_id) REFERENCES public.promos(promo_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3351 (class 2606 OID 54731)
-- Name: property_values property_values_property_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.property_values
    ADD CONSTRAINT property_values_property_id_fkey FOREIGN KEY (property_id) REFERENCES public.properties(property_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3352 (class 2606 OID 54736)
-- Name: shop_products shop_products_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_products
    ADD CONSTRAINT shop_products_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3353 (class 2606 OID 54741)
-- Name: shop_products shop_products_shop_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_products
    ADD CONSTRAINT shop_products_shop_id_fkey FOREIGN KEY (shop_id) REFERENCES public.shops(shop_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3354 (class 2606 OID 54746)
-- Name: sliders sliders_file_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sliders
    ADD CONSTRAINT sliders_file_id_fkey FOREIGN KEY (file_id) REFERENCES public.files(file_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3355 (class 2606 OID 54751)
-- Name: sliders sliders_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sliders
    ADD CONSTRAINT sliders_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id) ON UPDATE CASCADE ON DELETE SET NULL;


-- Completed on 2023-07-05 17:54:48

--
-- PostgreSQL database dump complete
--

