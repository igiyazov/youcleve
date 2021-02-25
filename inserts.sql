--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1
-- Dumped by pg_dump version 13.1

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
-- Data for Name: authentication_customuser; Type: TABLE DATA; Schema: public; Owner: macbook
--

INSERT INTO public.authentication_customuser (id, password, last_login, email, is_active, is_admin, username) VALUES (13, '123456', '2021-02-24 10:48:48+03', 'minkov.roma@list.ru', true, false, 'Alfred');
INSERT INTO public.authentication_customuser (id, password, last_login, email, is_active, is_admin, username) VALUES (11, 'pbkdf2_sha256$216000$z2dvApcTYrea$B0V64FzVZn9ODIGdiuH5ry7iTy4Ess0EF6AQpjYVirE=', NULL, 'brand@new.com', true, false, 'Pasha');
INSERT INTO public.authentication_customuser (id, password, last_login, email, is_active, is_admin, username) VALUES (10, 'passs', NULL, 'der@der.com', true, false, 'Roma');
INSERT INTO public.authentication_customuser (id, password, last_login, email, is_active, is_admin, username) VALUES (3, 'newnewnew', NULL, 'new@new.com', true, false, 'John');
INSERT INTO public.authentication_customuser (id, password, last_login, email, is_active, is_admin, username) VALUES (1, 'pbkdf2_sha256$216000$STBzq3MSsGJy$/UE6diX8MqWjk1y2hqjcQZXqGFZyQuT5KPOjvFIkcAM=', '2021-02-24 11:36:56+03', 'admin@admin.com', true, true, 'Tom');
INSERT INTO public.authentication_customuser (id, password, last_login, email, is_active, is_admin, username) VALUES (12, 'pbkdf2_sha256$216000$Dj41iq3eiPt4$MHS7aJjbCD313PYc9D1e/UcePWNE0No2HCIGfTRHzsc=', NULL, 'bro@bro.com', true, false, 'Sasha');


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: macbook
--

INSERT INTO public.django_content_type (id, app_label, model) VALUES (1, 'authentication', 'customuser');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (2, 'admin', 'logentry');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (3, 'auth', 'permission');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (4, 'auth', 'group');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (6, 'sessions', 'session');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (7, 'courses', 'course');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (9, 'courses', 'module');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (8, 'courses', 'category');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (10, 'courses', 'lesson');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (11, 'courses', 'subcategory');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (12, 'token_blacklist', 'blacklistedtoken');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (13, 'token_blacklist', 'outstandingtoken');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (14, 'courses', 'level');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (15, 'authentication', 'profile');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (16, 'activity', 'comment');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (17, 'activity', 'like');


--
-- Data for Name: activity_comment; Type: TABLE DATA; Schema: public; Owner: macbook
--



--
-- Data for Name: activity_like; Type: TABLE DATA; Schema: public; Owner: macbook
--



--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: macbook
--



--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: macbook
--

INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (1, 'Can add custom user', 1, 'add_customuser');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (2, 'Can change custom user', 1, 'change_customuser');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (3, 'Can delete custom user', 1, 'delete_customuser');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (4, 'Can view custom user', 1, 'view_customuser');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (5, 'Can add log entry', 2, 'add_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (6, 'Can change log entry', 2, 'change_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (7, 'Can delete log entry', 2, 'delete_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (8, 'Can view log entry', 2, 'view_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (9, 'Can add permission', 3, 'add_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (10, 'Can change permission', 3, 'change_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (11, 'Can delete permission', 3, 'delete_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (12, 'Can view permission', 3, 'view_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (13, 'Can add group', 4, 'add_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (14, 'Can change group', 4, 'change_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (15, 'Can delete group', 4, 'delete_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (16, 'Can view group', 4, 'view_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (25, 'Can add course', 7, 'add_course');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (26, 'Can change course', 7, 'change_course');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (27, 'Can delete course', 7, 'delete_course');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (28, 'Can view course', 7, 'view_course');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (29, 'Can add subject', 8, 'add_subject');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (30, 'Can change subject', 8, 'change_subject');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (31, 'Can delete subject', 8, 'delete_subject');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (32, 'Can view subject', 8, 'view_subject');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (33, 'Can add module', 9, 'add_module');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (34, 'Can change module', 9, 'change_module');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (35, 'Can delete module', 9, 'delete_module');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (36, 'Can view module', 9, 'view_module');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (37, 'Can add lesson', 10, 'add_lesson');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (38, 'Can change lesson', 10, 'change_lesson');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (39, 'Can delete lesson', 10, 'delete_lesson');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (40, 'Can view lesson', 10, 'view_lesson');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (41, 'Can add subcategory', 11, 'add_subcategory');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (42, 'Can change subcategory', 11, 'change_subcategory');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (43, 'Can delete subcategory', 11, 'delete_subcategory');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (44, 'Can view subcategory', 11, 'view_subcategory');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (45, 'Can add category', 8, 'add_category');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (46, 'Can change category', 8, 'change_category');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (47, 'Can delete category', 8, 'delete_category');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (48, 'Can view category', 8, 'view_category');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (49, 'Can add blacklisted token', 12, 'add_blacklistedtoken');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (50, 'Can change blacklisted token', 12, 'change_blacklistedtoken');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (51, 'Can delete blacklisted token', 12, 'delete_blacklistedtoken');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (52, 'Can view blacklisted token', 12, 'view_blacklistedtoken');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (53, 'Can add outstanding token', 13, 'add_outstandingtoken');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (54, 'Can change outstanding token', 13, 'change_outstandingtoken');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (55, 'Can delete outstanding token', 13, 'delete_outstandingtoken');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (56, 'Can view outstanding token', 13, 'view_outstandingtoken');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (57, 'Can add level', 14, 'add_level');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (58, 'Can change level', 14, 'change_level');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (59, 'Can delete level', 14, 'delete_level');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (60, 'Can view level', 14, 'view_level');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (61, 'Can add profile', 15, 'add_profile');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (62, 'Can change profile', 15, 'change_profile');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (63, 'Can delete profile', 15, 'delete_profile');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (64, 'Can view profile', 15, 'view_profile');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (65, 'Can add comment', 16, 'add_comment');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (66, 'Can change comment', 16, 'change_comment');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (67, 'Can delete comment', 16, 'delete_comment');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (68, 'Can view comment', 16, 'view_comment');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (69, 'Can add like', 17, 'add_like');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (70, 'Can change like', 17, 'change_like');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (71, 'Can delete like', 17, 'delete_like');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (72, 'Can view like', 17, 'view_like');


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: macbook
--



--
-- Data for Name: authentication_profile; Type: TABLE DATA; Schema: public; Owner: macbook
--

INSERT INTO public.authentication_profile (id, custom_user_id, photo, bill_number, bonus, geo, promocode, site, follow_end, description) VALUES (1, 13, 'profile/beauty.png', '123456', 0, 'London', '123456', 'www.smth.com', '2021-02-24 10:50:42+03', 'supergood');
INSERT INTO public.authentication_profile (id, custom_user_id, photo, bill_number, bonus, geo, promocode, site, follow_end, description) VALUES (4, 11, 'profile/hook_hjkRlAZ.png', '123456', 0, 'New York', '123456', 'www.fdgdfg.ru', NULL, 'supergood');
INSERT INTO public.authentication_profile (id, custom_user_id, photo, bill_number, bonus, geo, promocode, site, follow_end, description) VALUES (3, 10, 'profile/hook_rSteYBM.png', '123456', 0, 'Челны', '123456', 'www.qwqw.com', NULL, 'supergood');
INSERT INTO public.authentication_profile (id, custom_user_id, photo, bill_number, bonus, geo, promocode, site, follow_end, description) VALUES (2, 3, 'profile/hook.png', '123456', 0, 'Kazan', '123456', 'www.sdfsdf.com', '2021-02-24 11:21:22+03', 'supergood');
INSERT INTO public.authentication_profile (id, custom_user_id, photo, bill_number, bonus, geo, promocode, site, follow_end, description) VALUES (6, 1, 'profile/hook_AIS3ULP.png', '123456', 0, 'Moscow', '123456', 'www.dfsdf.ua', NULL, 'supergood');
INSERT INTO public.authentication_profile (id, custom_user_id, photo, bill_number, bonus, geo, promocode, site, follow_end, description) VALUES (5, 12, 'profile/p1.jpg', '123456', 0, 'New Dhely', '123456', 'www.retertert.com', '2021-02-24 11:54:31+03', 'supergood');


--
-- Data for Name: authentication_profile_followings; Type: TABLE DATA; Schema: public; Owner: macbook
--

INSERT INTO public.authentication_profile_followings (id, from_profile_id, to_profile_id) VALUES (1, 4, 5);
INSERT INTO public.authentication_profile_followings (id, from_profile_id, to_profile_id) VALUES (2, 3, 4);
INSERT INTO public.authentication_profile_followings (id, from_profile_id, to_profile_id) VALUES (3, 3, 5);
INSERT INTO public.authentication_profile_followings (id, from_profile_id, to_profile_id) VALUES (4, 2, 3);
INSERT INTO public.authentication_profile_followings (id, from_profile_id, to_profile_id) VALUES (5, 2, 4);
INSERT INTO public.authentication_profile_followings (id, from_profile_id, to_profile_id) VALUES (6, 2, 5);
INSERT INTO public.authentication_profile_followings (id, from_profile_id, to_profile_id) VALUES (7, 6, 2);
INSERT INTO public.authentication_profile_followings (id, from_profile_id, to_profile_id) VALUES (8, 6, 3);
INSERT INTO public.authentication_profile_followings (id, from_profile_id, to_profile_id) VALUES (9, 6, 4);
INSERT INTO public.authentication_profile_followings (id, from_profile_id, to_profile_id) VALUES (10, 6, 5);
INSERT INTO public.authentication_profile_followings (id, from_profile_id, to_profile_id) VALUES (11, 1, 2);
INSERT INTO public.authentication_profile_followings (id, from_profile_id, to_profile_id) VALUES (12, 1, 3);
INSERT INTO public.authentication_profile_followings (id, from_profile_id, to_profile_id) VALUES (13, 1, 4);
INSERT INTO public.authentication_profile_followings (id, from_profile_id, to_profile_id) VALUES (14, 1, 5);
INSERT INTO public.authentication_profile_followings (id, from_profile_id, to_profile_id) VALUES (15, 1, 6);
INSERT INTO public.authentication_profile_followings (id, from_profile_id, to_profile_id) VALUES (16, 4, 1);
INSERT INTO public.authentication_profile_followings (id, from_profile_id, to_profile_id) VALUES (17, 4, 2);
INSERT INTO public.authentication_profile_followings (id, from_profile_id, to_profile_id) VALUES (18, 4, 6);
INSERT INTO public.authentication_profile_followings (id, from_profile_id, to_profile_id) VALUES (19, 5, 1);
INSERT INTO public.authentication_profile_followings (id, from_profile_id, to_profile_id) VALUES (20, 5, 3);
INSERT INTO public.authentication_profile_followings (id, from_profile_id, to_profile_id) VALUES (21, 5, 4);
INSERT INTO public.authentication_profile_followings (id, from_profile_id, to_profile_id) VALUES (22, 5, 5);
INSERT INTO public.authentication_profile_followings (id, from_profile_id, to_profile_id) VALUES (23, 5, 6);


--
-- Data for Name: courses_category; Type: TABLE DATA; Schema: public; Owner: macbook
--

INSERT INTO public.courses_category (id, title, slug, description, photo, draft) VALUES (6, 'Иностранные языки', 'inostrannye-yazyki', 'Хотите выучить язык? Вам сюда', 'category/lang.png', false);
INSERT INTO public.courses_category (id, title, slug, description, photo, draft) VALUES (5, 'Информационные технологии', 'informacionnye-tehnologii', 'Все, что связано с миром IT', 'category/it_n1vDyki.png', false);
INSERT INTO public.courses_category (id, title, slug, description, photo, draft) VALUES (8, 'Красота и здоровье', 'krasota-i-zdorove', 'Прически, визаж, ногти, массаж, медицина, для беременных и новорожденных и др.', 'category/beauty_iVHYF4j.png', false);
INSERT INTO public.courses_category (id, title, slug, description, photo, draft) VALUES (11, 'Наука', 'nauka', 'Подготовка детей, физика, химия, астрономия, экономика, история и др.', 'category/science.png', false);
INSERT INTO public.courses_category (id, title, slug, description, photo, draft) VALUES (10, 'Развитие личности', 'razvitie-lichnosti', 'Финансовая грамотность, семейные отношения, психология, лидерские качества и др.', 'category/person.png', false);
INSERT INTO public.courses_category (id, title, slug, description, photo, draft) VALUES (7, 'Спорт и фитнес', 'sport-i-fitnes', 'Фитнес, йога, тренажеры и др.', 'category/sport.png', false);
INSERT INTO public.courses_category (id, title, slug, description, photo, draft) VALUES (9, 'Хобби и увлечения', 'hobbi-i-uvlecheniya', 'Рисование, рукоделие, кулинария, музыка, фото и др.', 'category/hobby.png', false);
INSERT INTO public.courses_category (id, title, slug, description, photo, draft) VALUES (12, 'Gaming', 'gaming', 'Курсы по популярным Online-играм: CS:GO, Dota2, Fortnite и др.', 'category/gaming.png', true);


--
-- Data for Name: courses_level; Type: TABLE DATA; Schema: public; Owner: macbook
--

INSERT INTO public.courses_level (id, key, body, draft) VALUES (1, 'CH', 'Для детей', false);
INSERT INTO public.courses_level (id, key, body, draft) VALUES (2, 'BG', 'Для начинающих', false);
INSERT INTO public.courses_level (id, key, body, draft) VALUES (3, 'AD', 'Для продвинутых', false);


--
-- Data for Name: courses_subcategory; Type: TABLE DATA; Schema: public; Owner: macbook
--

INSERT INTO public.courses_subcategory (id, title, category_id, draft, slug) VALUES (2, 'C++', 5, false, 'cplusplus');
INSERT INTO public.courses_subcategory (id, title, category_id, draft, slug) VALUES (1, 'Python', 5, false, 'python');
INSERT INTO public.courses_subcategory (id, title, category_id, draft, slug) VALUES (4, 'Spanish', 6, false, 'spanish');
INSERT INTO public.courses_subcategory (id, title, category_id, draft, slug) VALUES (3, 'English', 6, false, 'english');


--
-- Data for Name: courses_course; Type: TABLE DATA; Schema: public; Owner: macbook
--

INSERT INTO public.courses_course (id, created_at, updated_at, title, slug, overview, owner_id, subcategory_id, course_duration, draft, likes, photo, price, rating, views, level_id, category_id) VALUES (7, '2021-02-16 11:58:04.856774+03', '2021-02-19 12:49:19.282321+03', 'Python', 'python8', 'цуавыаыаы', 11, 3, '01:35:24', false, 234, 'courses/<django.db.models.fields.CharField>/p5_JUAFHH0.png', 234, 5.5, 234, 1, 6);
INSERT INTO public.courses_course (id, created_at, updated_at, title, slug, overview, owner_id, subcategory_id, course_duration, draft, likes, photo, price, rating, views, level_id, category_id) VALUES (8, '2021-02-16 20:36:40.402064+03', '2021-02-19 12:49:29.255809+03', 'C++ Begginer', 'c-begginer', 'qwdqwdqwdq', 12, 2, '00:02:10', false, 1000, 'courses/<django.db.models.fields.CharField>/1200px-ISO_C_Logo.svg_1.png', 10, 4, 300, 2, 5);
INSERT INTO public.courses_course (id, created_at, updated_at, title, slug, overview, owner_id, subcategory_id, course_duration, draft, likes, photo, price, rating, views, level_id, category_id) VALUES (6, '2021-02-16 11:57:37.593599+03', '2021-02-19 12:49:39.415184+03', 'Python', 'python6', 'кпарпарапрап', 12, 2, '01:35:24', false, 234, 'courses/<django.db.models.fields.CharField>/p2_FXB483C.jpg', 234, 2, 234, 1, 5);
INSERT INTO public.courses_course (id, created_at, updated_at, title, slug, overview, owner_id, subcategory_id, course_duration, draft, likes, photo, price, rating, views, level_id, category_id) VALUES (5, '2021-02-16 11:56:53.33467+03', '2021-02-19 12:50:40.822356+03', 'Python', 'python334', 'вапвапвап', 12, 1, '01:35:24', false, 234, 'courses/<django.db.models.fields.CharField>/p1_YvKHmaI.jpg', 234, 2, 324, 3, 5);
INSERT INTO public.courses_course (id, created_at, updated_at, title, slug, overview, owner_id, subcategory_id, course_duration, draft, likes, photo, price, rating, views, level_id, category_id) VALUES (4, '2021-02-16 11:56:21.077115+03', '2021-02-19 12:50:50.845166+03', 'Python', 'python34', 'уцкккуцкцукцк', 11, 1, '01:35:24', false, 2342, 'courses/<django.db.models.fields.CharField>/p1.jpg', 234, 3, 324, 2, 5);
INSERT INTO public.courses_course (id, created_at, updated_at, title, slug, overview, owner_id, subcategory_id, course_duration, draft, likes, photo, price, rating, views, level_id, category_id) VALUES (3, '2021-02-16 11:55:32.519604+03', '2021-02-19 12:51:08.37344+03', 'Python', 'python2', 'куеуеукеуке', 11, 3, '01:35:24', false, 12344, 'courses/<django.db.models.fields.CharField>/p3.jpg', 123, 3.5, 123, 3, 6);
INSERT INTO public.courses_course (id, created_at, updated_at, title, slug, overview, owner_id, subcategory_id, course_duration, draft, likes, photo, price, rating, views, level_id, category_id) VALUES (2, '2021-02-16 11:54:59.485542+03', '2021-02-19 12:51:57.452034+03', 'Python', 'python1', 'одрлолплр', 10, 2, '01:35:24', false, 15, 'courses/<django.db.models.fields.CharField>/p5.png', 156, 5, 156, 2, 5);
INSERT INTO public.courses_course (id, created_at, updated_at, title, slug, overview, owner_id, subcategory_id, course_duration, draft, likes, photo, price, rating, views, level_id, category_id) VALUES (1, '2021-02-16 11:53:33.117187+03', '2021-02-19 12:52:06.663888+03', 'Python', 'python', 'супер курс', 3, 1, '01:35:24', false, 56, 'courses/<django.db.models.fields.CharField>/p2.jpg', 515, 4, 156, 1, 5);


--
-- Data for Name: authentication_profile_saved; Type: TABLE DATA; Schema: public; Owner: macbook
--

INSERT INTO public.authentication_profile_saved (id, profile_id, course_id) VALUES (1, 1, 6);
INSERT INTO public.authentication_profile_saved (id, profile_id, course_id) VALUES (2, 2, 5);


--
-- Data for Name: courses_lesson; Type: TABLE DATA; Schema: public; Owner: macbook
--

INSERT INTO public.courses_lesson (id, created_at, updated_at, title, duration, course_id, draft, overview, photo, slug, video) VALUES (1, '2021-02-16 20:37:58.262684+03', '2021-02-16 20:37:58.262708+03', 'first lesson', '00:00:20', 8, false, 'qwwqdqw', '', 'first-lesson', '');
INSERT INTO public.courses_lesson (id, created_at, updated_at, title, duration, course_id, draft, overview, photo, slug, video) VALUES (2, '2021-02-16 20:39:18.677047+03', '2021-02-16 20:39:18.67707+03', 'first lesson', '00:00:30', 7, false, 'fghfhgfhf', '', 'first-lesson1', '');


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: macbook
--

INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (1, '2021-02-08 14:30:40.01372+03', '1', 'Physics', 1, '[{"added": {}}]', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (2, '2021-02-08 14:30:43.89701+03', '2', 'Math', 1, '[{"added": {}}]', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (3, '2021-02-08 14:30:52.892977+03', '3', 'History', 1, '[{"added": {}}]', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (4, '2021-02-08 14:31:01.790781+03', '4', 'Biology', 1, '[{"added": {}}]', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (5, '2021-02-12 17:55:01.668672+03', '4', 'Biology', 3, '', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (6, '2021-02-12 17:55:15.180665+03', '3', 'History', 3, '', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (7, '2021-02-12 17:55:15.189751+03', '2', 'Math', 3, '', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (8, '2021-02-12 17:55:15.191395+03', '1', 'Physics', 3, '', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (9, '2021-02-12 18:04:26.761918+03', '5', 'Информационные технологии', 1, '[{"added": {}}]', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (10, '2021-02-12 18:05:47.758332+03', '5', 'Информационные технологии', 2, '[]', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (11, '2021-02-12 18:05:56.138461+03', '5', 'Информационные технологии', 2, '[]', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (12, '2021-02-12 18:06:19.668264+03', '5', 'Информационные технологии', 2, '[]', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (13, '2021-02-12 18:06:47.831557+03', '5', 'Информационные технологии', 2, '[{"changed": {"fields": ["Photo"]}}]', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (14, '2021-02-12 18:08:57.441314+03', '5', 'Информационные технологии', 2, '[{"changed": {"fields": ["Photo"]}}]', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (15, '2021-02-12 18:10:53.831747+03', '6', 'Иностранные языки', 1, '[{"added": {}}]', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (16, '2021-02-12 18:11:56.36032+03', '7', 'Спорт и фитнес', 1, '[{"added": {}}]', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (17, '2021-02-14 15:47:28.104462+03', '8', 'Красота и здоровье', 1, '[{"added": {}}]', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (18, '2021-02-14 15:47:57.271233+03', '9', 'Хобби и увлечения', 1, '[{"added": {}}]', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (19, '2021-02-14 15:48:28.182019+03', '10', 'Развитие личности', 1, '[{"added": {}}]', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (20, '2021-02-14 15:48:58.640996+03', '11', 'Наука', 1, '[{"added": {}}]', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (21, '2021-02-14 15:49:40.444328+03', '12', 'Gaming', 1, '[{"added": {}}]', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (22, '2021-02-16 09:51:09.68041+03', '6', 'Иностранные языки', 2, '[{"changed": {"fields": ["Photo"]}}]', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (23, '2021-02-16 09:51:22.856995+03', '5', 'Информационные технологии', 2, '[{"changed": {"fields": ["Photo"]}}]', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (24, '2021-02-16 09:51:54.662593+03', '8', 'Красота и здоровье', 2, '[{"changed": {"fields": ["Description", "Photo"]}}]', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (25, '2021-02-16 09:52:39.059101+03', '11', 'Наука', 2, '[{"changed": {"fields": ["Description", "Photo"]}}]', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (26, '2021-02-16 09:53:16.368335+03', '10', 'Развитие личности', 2, '[{"changed": {"fields": ["Description", "Photo"]}}]', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (27, '2021-02-16 09:53:47.665939+03', '7', 'Спорт и фитнес', 2, '[{"changed": {"fields": ["Description", "Photo"]}}]', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (28, '2021-02-16 09:54:10.359362+03', '9', 'Хобби и увлечения', 2, '[{"changed": {"fields": ["Description", "Photo"]}}]', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (29, '2021-02-16 10:03:40.324653+03', '12', 'Gaming', 2, '[{"changed": {"fields": ["Draft"]}}]', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (30, '2021-02-16 10:03:51.178032+03', '12', 'Gaming', 2, '[{"changed": {"fields": ["Draft"]}}]', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (31, '2021-02-16 10:05:27.850825+03', '12', 'Gaming', 2, '[{"changed": {"fields": ["Draft"]}}]', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (32, '2021-02-16 11:51:45.877945+03', '1', 'Python', 1, '[{"added": {}}]', 11, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (33, '2021-02-16 11:53:33.132571+03', '1', 'Python', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (34, '2021-02-16 11:54:59.487572+03', '2', 'Python', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (35, '2021-02-16 11:55:32.529852+03', '3', 'Python', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (36, '2021-02-16 11:55:41.02558+03', '2', 'Python', 2, '[{"changed": {"fields": ["Draft"]}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (37, '2021-02-16 11:56:21.086943+03', '4', 'Python', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (38, '2021-02-16 11:56:53.344622+03', '5', 'Python', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (39, '2021-02-16 11:56:58.134139+03', '5', 'Python', 2, '[{"changed": {"fields": ["Draft"]}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (40, '2021-02-16 11:57:37.596466+03', '6', 'Python', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (41, '2021-02-16 11:58:04.859068+03', '7', 'Python', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (42, '2021-02-16 12:39:05.224134+03', '7', 'Python', 2, '[]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (43, '2021-02-16 12:39:12.448824+03', '6', 'Python', 2, '[{"changed": {"fields": ["Rating"]}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (44, '2021-02-16 12:39:22.791214+03', '5', 'Python', 2, '[]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (45, '2021-02-16 12:40:57.637792+03', '3', 'Python', 2, '[{"changed": {"fields": ["Rating"]}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (46, '2021-02-16 12:41:11.854081+03', '7', 'Python', 2, '[{"changed": {"fields": ["Rating"]}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (47, '2021-02-16 20:33:22.154376+03', '1', 'Python', 2, '[{"changed": {"fields": ["Slug"]}}]', 11, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (48, '2021-02-16 20:33:41.877881+03', '2', 'C++', 1, '[{"added": {}}]', 11, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (49, '2021-02-16 20:33:47.563187+03', '1', 'Python', 2, '[{"changed": {"fields": ["Draft"]}}]', 11, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (50, '2021-02-16 20:34:13.977533+03', '3', 'English', 1, '[{"added": {}}]', 11, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (51, '2021-02-16 20:34:27.186069+03', '4', 'Spanish', 1, '[{"added": {}}]', 11, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (52, '2021-02-16 20:34:32.1745+03', '3', 'English', 2, '[{"changed": {"fields": ["Draft"]}}]', 11, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (53, '2021-02-16 20:35:09.811184+03', '7', 'Python', 2, '[]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (54, '2021-02-16 20:36:40.40488+03', '8', 'C++ Begginer', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (55, '2021-02-16 20:37:58.26415+03', '1', 'Lesson object (1)', 1, '[{"added": {}}]', 10, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (56, '2021-02-16 20:39:18.678088+03', '2', 'Lesson object (2)', 1, '[{"added": {}}]', 10, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (57, '2021-02-19 00:12:18.21422+03', '1', 'Level object (1)', 1, '[{"added": {}}]', 14, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (58, '2021-02-19 00:12:45.802619+03', '2', 'Level object (2)', 1, '[{"added": {}}]', 14, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (59, '2021-02-19 00:13:11.939108+03', '3', 'Level object (3)', 1, '[{"added": {}}]', 14, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (60, '2021-02-19 10:16:42.363376+03', '8', 'C++ Begginer', 2, '[{"changed": {"fields": ["Category"]}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (61, '2021-02-19 10:16:58.454465+03', '7', 'Python', 2, '[{"changed": {"fields": ["Category", "Subcategory"]}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (62, '2021-02-19 10:17:12.717432+03', '6', 'Python', 2, '[{"changed": {"fields": ["Category", "Subcategory"]}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (63, '2021-02-19 10:17:22.226986+03', '5', 'Python', 2, '[{"changed": {"fields": ["Category"]}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (64, '2021-02-19 10:17:29.945396+03', '4', 'Python', 2, '[{"changed": {"fields": ["Category"]}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (65, '2021-02-19 10:17:40.224383+03', '3', 'Python', 2, '[{"changed": {"fields": ["Category", "Subcategory"]}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (66, '2021-02-19 10:17:50.599456+03', '2', 'Python', 2, '[{"changed": {"fields": ["Category", "Subcategory"]}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (67, '2021-02-19 10:17:58.474498+03', '1', 'Python', 2, '[{"changed": {"fields": ["Category"]}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (68, '2021-02-19 12:49:09.328774+03', '7', 'Python', 2, '[{"changed": {"fields": ["Level"]}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (69, '2021-02-19 12:49:19.285425+03', '7', 'Python', 2, '[]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (70, '2021-02-19 12:49:29.258552+03', '8', 'C++ Begginer', 2, '[{"changed": {"fields": ["Level"]}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (71, '2021-02-19 12:49:39.41776+03', '6', 'Python', 2, '[{"changed": {"fields": ["Level"]}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (72, '2021-02-19 12:50:40.82779+03', '5', 'Python', 2, '[{"changed": {"fields": ["Level"]}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (73, '2021-02-19 12:50:50.848336+03', '4', 'Python', 2, '[{"changed": {"fields": ["Level"]}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (74, '2021-02-19 12:51:08.376845+03', '3', 'Python', 2, '[{"changed": {"fields": ["Level"]}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (75, '2021-02-19 12:51:57.454795+03', '2', 'Python', 2, '[{"changed": {"fields": ["Level"]}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (76, '2021-02-19 12:52:06.667512+03', '1', 'Python', 2, '[{"changed": {"fields": ["Level"]}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (77, '2021-02-24 10:48:50.30173+03', '13', 'minkov.roma@list.ru', 1, '[{"added": {}}]', 1, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (78, '2021-02-24 11:19:08.559528+03', '1', 'Profile object (1)', 1, '[{"added": {}}]', 15, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (79, '2021-02-24 11:21:32.180945+03', '2', 'Profile object (2)', 1, '[{"added": {}}]', 15, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (80, '2021-02-24 11:22:16.878053+03', '3', 'Profile object (3)', 1, '[{"added": {}}]', 15, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (81, '2021-02-24 11:22:52.3605+03', '4', 'Profile object (4)', 1, '[{"added": {}}]', 15, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (82, '2021-02-24 11:23:29.311905+03', '5', 'Profile object (5)', 1, '[{"added": {}}]', 15, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (83, '2021-02-24 11:24:05.705223+03', '6', 'Profile object (6)', 1, '[{"added": {}}]', 15, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (84, '2021-02-24 11:54:33.138441+03', '12', 'bro@bro.com', 2, '[{"changed": {"fields": ["Username"]}}, {"changed": {"name": "profile", "object": "Sasha", "fields": ["Follow end"]}}]', 1, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (85, '2021-02-24 11:55:00.161451+03', '11', 'brand@new.com', 2, '[{"changed": {"fields": ["Username"]}}, {"changed": {"name": "profile", "object": "Pasha", "fields": ["Followings"]}}]', 1, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (86, '2021-02-24 11:55:43.301833+03', '10', 'der@der.com', 2, '[{"changed": {"fields": ["Username"]}}, {"changed": {"name": "profile", "object": "Roma", "fields": ["Followings"]}}]', 1, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (87, '2021-02-24 11:56:00.893634+03', '3', 'new@new.com', 2, '[{"changed": {"fields": ["Username"]}}, {"changed": {"name": "profile", "object": "John", "fields": ["Followings"]}}]', 1, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (88, '2021-02-24 11:56:40.146262+03', '1', 'admin@admin.com', 2, '[{"changed": {"fields": ["Username"]}}, {"changed": {"name": "profile", "object": "Tom", "fields": ["Followings"]}}]', 1, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (89, '2021-02-24 11:56:54.600209+03', '13', 'minkov.roma@list.ru', 2, '[{"changed": {"name": "profile", "object": "Alfred", "fields": ["Followings"]}}]', 1, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (90, '2021-02-24 12:07:35.886447+03', '13', 'minkov.roma@list.ru', 2, '[{"changed": {"name": "profile", "object": "Alfred", "fields": ["Description"]}}]', 1, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (91, '2021-02-24 12:07:42.956504+03', '12', 'bro@bro.com', 2, '[{"changed": {"name": "profile", "object": "Sasha", "fields": ["Description"]}}]', 1, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (92, '2021-02-24 12:07:57.270757+03', '11', 'brand@new.com', 2, '[{"changed": {"name": "profile", "object": "Pasha", "fields": ["Description", "Followings"]}}]', 1, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (93, '2021-02-24 12:08:05.42867+03', '12', 'bro@bro.com', 2, '[{"changed": {"name": "profile", "object": "Sasha", "fields": ["Followings"]}}]', 1, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (94, '2021-02-24 12:08:14.517666+03', '10', 'der@der.com', 2, '[{"changed": {"name": "profile", "object": "Roma", "fields": ["Description"]}}]', 1, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (95, '2021-02-24 12:08:22.542806+03', '3', 'new@new.com', 2, '[{"changed": {"name": "profile", "object": "John", "fields": ["Description"]}}]', 1, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (96, '2021-02-24 12:08:35.508688+03', '1', 'admin@admin.com', 2, '[{"changed": {"name": "profile", "object": "Tom", "fields": ["Description"]}}]', 1, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (97, '2021-02-24 12:47:40.645678+03', '12', 'bro@bro.com', 2, '[{"changed": {"name": "profile", "object": "Sasha", "fields": ["Photo"]}}]', 1, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (98, '2021-02-24 12:51:43.020806+03', '12', 'bro@bro.com', 2, '[{"changed": {"name": "profile", "object": "Sasha", "fields": ["Photo"]}}]', 1, 1);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: macbook
--

INSERT INTO public.django_migrations (id, app, name, applied) VALUES (1, 'contenttypes', '0001_initial', '2021-02-08 14:26:25.39081+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (2, 'authentication', '0001_initial', '2021-02-08 14:26:25.398864+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (3, 'admin', '0001_initial', '2021-02-08 14:26:25.410608+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2021-02-08 14:26:25.424793+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2021-02-08 14:26:25.429402+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2021-02-08 14:26:25.451448+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (7, 'auth', '0001_initial', '2021-02-08 14:26:25.474338+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (8, 'auth', '0002_alter_permission_name_max_length', '2021-02-08 14:26:25.494555+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (9, 'auth', '0003_alter_user_email_max_length', '2021-02-08 14:26:25.50047+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (10, 'auth', '0004_alter_user_username_opts', '2021-02-08 14:26:25.506053+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (11, 'auth', '0005_alter_user_last_login_null', '2021-02-08 14:26:25.515015+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (12, 'auth', '0006_require_contenttypes_0002', '2021-02-08 14:26:25.516962+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (13, 'auth', '0007_alter_validators_add_error_messages', '2021-02-08 14:26:25.522435+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (14, 'auth', '0008_alter_user_username_max_length', '2021-02-08 14:26:25.528436+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (15, 'auth', '0009_alter_user_last_name_max_length', '2021-02-08 14:26:25.53532+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (16, 'auth', '0010_alter_group_name_max_length', '2021-02-08 14:26:25.542459+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (17, 'auth', '0011_update_proxy_permissions', '2021-02-08 14:26:25.552809+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (18, 'auth', '0012_alter_user_first_name_max_length', '2021-02-08 14:26:25.558631+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (19, 'courses', '0001_initial', '2021-02-08 14:26:25.592512+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (20, 'sessions', '0001_initial', '2021-02-08 14:26:25.610353+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (21, 'courses', '0002_auto_20210209_1019', '2021-02-09 13:19:13.456412+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (22, 'token_blacklist', '0001_initial', '2021-02-11 09:20:34.867289+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (23, 'token_blacklist', '0002_outstandingtoken_jti_hex', '2021-02-11 09:20:34.88509+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (24, 'token_blacklist', '0003_auto_20171017_2007', '2021-02-11 09:20:34.898776+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (25, 'token_blacklist', '0004_auto_20171017_2013', '2021-02-11 09:20:34.909883+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (26, 'token_blacklist', '0005_remove_outstandingtoken_jti', '2021-02-11 09:20:34.918159+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (27, 'token_blacklist', '0006_auto_20171017_2113', '2021-02-11 09:20:34.925888+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (28, 'token_blacklist', '0007_auto_20171017_2214', '2021-02-11 09:20:34.951674+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (29, 'courses', '0003_auto_20210212_1449', '2021-02-12 17:49:32.186183+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (30, 'courses', '0004_auto_20210216_0702', '2021-02-16 10:02:28.115791+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (31, 'courses', '0005_auto_20210216_0704', '2021-02-16 10:04:45.770389+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (32, 'courses', '0006_auto_20210216_0835', '2021-02-16 11:35:17.624592+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (33, 'courses', '0007_subcategory_draft', '2021-02-16 19:16:52.70246+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (34, 'courses', '0008_auto_20210216_1725', '2021-02-16 20:25:30.638301+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (35, 'courses', '0009_subcategory_slug', '2021-02-16 20:33:02.138385+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (36, 'courses', '0010_level', '2021-02-18 15:09:37.996875+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (37, 'courses', '0011_course_level', '2021-02-18 15:10:33.066093+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (38, 'courses', '0012_level_draft', '2021-02-18 16:08:06.126403+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (39, 'courses', '0013_auto_20210219_0635', '2021-02-19 09:54:14.800442+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (40, 'courses', '0014_auto_20210219_0640', '2021-02-19 09:54:16.016454+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (41, 'activity', '0001_initial', '2021-02-21 22:35:04.25597+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (42, 'activity', '0002_auto_20210221_1916', '2021-02-21 22:35:06.325317+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (43, 'authentication', '0002_profile', '2021-02-21 22:35:07.751214+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (44, 'authentication', '0003_profile_photo', '2021-02-23 15:47:03.198576+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (45, 'authentication', '0004_auto_20210223_1238', '2021-02-23 15:47:05.021106+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (46, 'authentication', '0005_auto_20210223_1300', '2021-02-24 10:47:01.072952+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (47, 'authentication', '0006_auto_20210223_1314', '2021-02-24 10:47:02.169304+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (48, 'authentication', '0007_auto_20210223_1338', '2021-02-24 10:47:02.99947+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (49, 'authentication', '0008_auto_20210224_0757', '2021-02-24 11:50:54.989609+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (50, 'authentication', '0009_profile_description', '2021-02-24 12:07:00.291561+03');


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: macbook
--

INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('2qee5l4mv3wbsyndslysoiaxdfsa685a', '.eJxVjMsOwiAQRf-FtSFMgTK4dO83kBkeUjU0Ke3K-O_apAvd3nPOfYlA21rD1vMSpiTOAsTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fGiGyGZ1JGdgozwqKJkNYbGKPg7UqARfAWBA0FNRFR7KoB-ciKj-K9wfe4Dd1:1l94ht:Zqr7sx8RXSsBdWMhPawJTE7vRyV3L0qprx00ReFjQJU', '2021-02-22 14:27:53.677137+03');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('q2zzq4ee7th7xid156dv2ddlpg2wgeqn', '.eJxVjMsOwiAQRf-FtSFMgTK4dO83kBkeUjU0Ke3K-O_apAvd3nPOfYlA21rD1vMSpiTOAsTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fGiGyGZ1JGdgozwqKJkNYbGKPg7UqARfAWBA0FNRFR7KoB-ciKj-K9wfe4Dd1:1lBuAq:KTOAwb36KWtttbWcyvZeQCxWtx1Vol40Euud8vjpowE', '2021-03-02 09:49:28.151286+03');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('8n3czgl31bm3e1bj9vl97cje1v246rcp', '.eJxVjMsOwiAQRf-FtSFMgTK4dO83kBkeUjU0Ke3K-O_apAvd3nPOfYlA21rD1vMSpiTOAsTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fGiGyGZ1JGdgozwqKJkNYbGKPg7UqARfAWBA0FNRFR7KoB-ciKj-K9wfe4Dd1:1lCqYc:p707mn9BOQP0Y84i2elmD9E6mFxKD9X4lVvT1sBiuk4', '2021-03-05 00:09:54.001142+03');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('e8hn8wkxnac2u9i9o1eemobwnbx6kyl6', '.eJxVjMsOwiAQRf-FtSFMgTK4dO83kBkeUjU0Ke3K-O_apAvd3nPOfYlA21rD1vMSpiTOAsTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fGiGyGZ1JGdgozwqKJkNYbGKPg7UqARfAWBA0FNRFR7KoB-ciKj-K9wfe4Dd1:1lCyia:oQhFf7xCYvxF0SlQgPl97hFLJq3-V_SyrrZH5FSkwXE', '2021-03-05 08:52:44.923347+03');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('74c865lf11ekcy62neebbcgk4wqhalni', '.eJxVjMsOwiAQRf-FtSFMgTK4dO83kBkeUjU0Ke3K-O_apAvd3nPOfYlA21rD1vMSpiTOAsTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fGiGyGZ1JGdgozwqKJkNYbGKPg7UqARfAWBA0FNRFR7KoB-ciKj-K9wfe4Dd1:1lEpfE:yF5vVvB4KbacEzHS2fneMR0ylA8PiqGtsURDvUmRjtA', '2021-03-10 11:36:56.587073+03');


--
-- Data for Name: token_blacklist_outstandingtoken; Type: TABLE DATA; Schema: public; Owner: macbook
--

INSERT INTO public.token_blacklist_outstandingtoken (id, token, created_at, expires_at, user_id, jti) VALUES (1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzExMjI5MywianRpIjoiYTQ3NjUwYjY4ZDc1NGQxZGE2ZmZkZmQ3OWJhYTk3MTMiLCJ1c2VyX2lkIjoxMn0.Bj_qbPLev0ePSHq7ax-iHNA8FZmv6Wk4Lzj__uzuijo', '2021-02-11 09:44:53.870316+03', '2021-02-12 09:44:53+03', 12, 'a47650b68d754d1da6ffdfd79baa9713');
INSERT INTO public.token_blacklist_outstandingtoken (id, token, created_at, expires_at, user_id, jti) VALUES (2, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzExMjc1NCwianRpIjoiZmU3NjJjMzlmNTM3NDkzM2JjYzE0YWFhYjFlNGNmMDEiLCJ1c2VyX2lkIjoxMn0.MFeSH5bnbpkBGMeJ4iGnqD-WXkAskGSHAvsZ6cUqumo', '2021-02-11 09:52:34.214551+03', '2021-02-12 09:52:34+03', 12, 'fe762c39f5374933bcc14aaab1e4cf01');
INSERT INTO public.token_blacklist_outstandingtoken (id, token, created_at, expires_at, user_id, jti) VALUES (3, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzQzNTI3OSwianRpIjoiOTVkZjg1MTUzZmVmNGViZjgwOTA3OTBkMDJmNTZjMjkiLCJ1c2VyX2lkIjoxMn0.iKeFFmfJi6yPbtheGeUkLWnCbfafN6ud1VmFX5p5Zo0', '2021-02-15 03:27:59.469446+03', '2021-02-16 03:27:59+03', 12, '95df85153fef4ebf8090790d02f56c29');
INSERT INTO public.token_blacklist_outstandingtoken (id, token, created_at, expires_at, user_id, jti) VALUES (4, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzQ2NTIzMSwianRpIjoiZTAxYjJmZTJmNjljNDg0MWJiYzBkZmU0ZDYzMzEwY2UiLCJ1c2VyX2lkIjoxMn0.eA-tzlv5YOyDQvmq6lTbgH2nJD5R8S1nypFEXBY4vsU', '2021-02-15 11:47:11.808672+03', '2021-02-16 11:47:11+03', 12, 'e01b2fe2f69c4841bbc0dfe4d63310ce');
INSERT INTO public.token_blacklist_outstandingtoken (id, token, created_at, expires_at, user_id, jti) VALUES (5, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzQ2NTI1NSwianRpIjoiNWMxM2ViM2Y4OGJmNDZhOGE3ZDg4ODFhYjZjYzFmZGQiLCJ1c2VyX2lkIjoxMn0.dfiSlw5w9PwSIPhr31gwIb-uEs5jAZp-AvqWIV8Gttg', '2021-02-15 11:47:35.222791+03', '2021-02-16 11:47:35+03', 12, '5c13eb3f88bf46a8a7d8881ab6cc1fdd');
INSERT INTO public.token_blacklist_outstandingtoken (id, token, created_at, expires_at, user_id, jti) VALUES (6, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzQ2NTI3NiwianRpIjoiMTliMGVmMWNiYTYyNDZiYjhhY2ZhZThhYzI0NThjNmQiLCJ1c2VyX2lkIjoxMn0.fy4wJnngbuPjRb-QAnijIHTXdx4HrA8KKV8MKr5pu6Q', '2021-02-15 11:47:56.718557+03', '2021-02-16 11:47:56+03', 12, '19b0ef1cba6246bb8acfae8ac2458c6d');
INSERT INTO public.token_blacklist_outstandingtoken (id, token, created_at, expires_at, user_id, jti) VALUES (7, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzQ2NjY2MSwianRpIjoiN2RhZTAyMWYxMDNlNDNhZTgzOWQ0MzY0YzZlZDg4ZDEiLCJ1c2VyX2lkIjoxMn0.ig8sngQlDMeUidn1ABsBVzo3cfvRTZMX6peGtJrqZxM', '2021-02-15 12:11:01.843573+03', '2021-02-16 12:11:01+03', 12, '7dae021f103e43ae839d4364c6ed88d1');
INSERT INTO public.token_blacklist_outstandingtoken (id, token, created_at, expires_at, user_id, jti) VALUES (8, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzQ2ODA1MCwianRpIjoiZWVhYmEyZjZmOTEyNDA5ZGI5YzY4YzQzMGFjZDJmMTciLCJ1c2VyX2lkIjoxMn0.dMOtJ4-i9gCUR707k5CNPBiuxm_ilAOfe_dY4QIj_Bo', '2021-02-15 12:34:10.128189+03', '2021-02-16 12:34:10+03', 12, 'eeaba2f6f912409db9c68c430acd2f17');
INSERT INTO public.token_blacklist_outstandingtoken (id, token, created_at, expires_at, user_id, jti) VALUES (9, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzQ2OTM4OSwianRpIjoiMTIwYjk4YWQxOTJhNDQ3Y2JlZWMyZDkzYzVjZTMyNWMiLCJ1c2VyX2lkIjoxMn0.TgFeqF-OOvUtFKMRBLF4hYgduv6inuk6lUKUp2yGQ0A', '2021-02-15 12:56:29.678016+03', '2021-02-16 12:56:29+03', 12, '120b98ad192a447cbeec2d93c5ce325c');
INSERT INTO public.token_blacklist_outstandingtoken (id, token, created_at, expires_at, user_id, jti) VALUES (10, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzQ2OTQ1MCwianRpIjoiMTJmZjZjNzMxOWUyNDRhNjhmYjFiMTAxNTlkYTgwMTYiLCJ1c2VyX2lkIjoxMn0.LtMNQ8KKnn27NAZGZPv3aSgTiFBfj0tuu-iT8Y0Ofq4', '2021-02-15 12:57:30.217637+03', '2021-02-16 12:57:30+03', 12, '12ff6c7319e244a68fb1b10159da8016');
INSERT INTO public.token_blacklist_outstandingtoken (id, token, created_at, expires_at, user_id, jti) VALUES (11, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzQ2OTU4NiwianRpIjoiMzY5OTk5ODBkMjczNDY2MDg2YTVmYTQzNDcwOTdjZDYiLCJ1c2VyX2lkIjoxMn0.UOhIv28-tD89jqMt2LRpI6nSbv-3iTkoRDJB24CEpAc', '2021-02-15 12:59:46.159702+03', '2021-02-16 12:59:46+03', 12, '36999980d273466086a5fa4347097cd6');
INSERT INTO public.token_blacklist_outstandingtoken (id, token, created_at, expires_at, user_id, jti) VALUES (12, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzQ2OTY1NywianRpIjoiZTU3ODJkYmM1MDFjNDBjNmIyNTZlNzQ3YWViZGU1ZDgiLCJ1c2VyX2lkIjoxMn0._2hy0ztjWl3oS8fbloiUETJtiGMrN0TlOPS7zCl3Fdc', '2021-02-15 13:00:57.300187+03', '2021-02-16 13:00:57+03', 12, 'e5782dbc501c40c6b256e747aebde5d8');
INSERT INTO public.token_blacklist_outstandingtoken (id, token, created_at, expires_at, user_id, jti) VALUES (13, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzQ3MTA3NywianRpIjoiZDVjOTdhOTM3NTZhNDYwYjhiNTIyY2E5MDY5Y2Q0ZmIiLCJ1c2VyX2lkIjoxMn0.zPAc2N3hA_Az0h9oeO8-0u1wGtCKsDkxrbFmB9YbjCY', '2021-02-15 13:24:37.710086+03', '2021-02-16 13:24:37+03', 12, 'd5c97a93756a460b8b522ca9069cd4fb');
INSERT INTO public.token_blacklist_outstandingtoken (id, token, created_at, expires_at, user_id, jti) VALUES (14, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzQ3MTEyMywianRpIjoiZjJhYWQ5NWY4MmE0NDZmNGE1NTNjZTIzM2JiMTQxYTUiLCJ1c2VyX2lkIjoxfQ.BOvX_vavUfE0UY1I2dKpAdKH-sbZmRJajzsFMTUDBkw', '2021-02-15 13:25:23.366313+03', '2021-02-16 13:25:23+03', 1, 'f2aad95f82a446f4a553ce233bb141a5');
INSERT INTO public.token_blacklist_outstandingtoken (id, token, created_at, expires_at, user_id, jti) VALUES (15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzQ3MTE5NSwianRpIjoiYjY4YjczYjZlYTg5NDc0ZThhNjhjOWNkMDI1MmZiYmYiLCJ1c2VyX2lkIjoxfQ.nXdin37RxIoK7CB7MgryB4fpESUkVWlR6Mzaf_pO7cE', '2021-02-15 13:26:35.52697+03', '2021-02-16 13:26:35+03', 1, 'b68b73b6ea89474e8a68c9cd0252fbbf');
INSERT INTO public.token_blacklist_outstandingtoken (id, token, created_at, expires_at, user_id, jti) VALUES (16, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzQ3NTMyNCwianRpIjoiNjlhNGMwZjNmYjEzNGJmZGJkNTJiNmQ4OWUyOWYyZWQiLCJ1c2VyX2lkIjoxMn0.iM5wEvAg8fsazE4V7VfxOBxEAgPo2lqpjwuUqKk7WBY', '2021-02-15 14:35:24.15061+03', '2021-02-16 14:35:24+03', 12, '69a4c0f3fb134bfdbd52b6d89e29f2ed');
INSERT INTO public.token_blacklist_outstandingtoken (id, token, created_at, expires_at, user_id, jti) VALUES (17, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzQ3NjQzOCwianRpIjoiZWIyYjBjMzM2ZmZmNGZmZmIzNzc1YjQ5MjY2MjExNzUiLCJ1c2VyX2lkIjoxMn0.NdXpGweFHvjJ6pY2Bva_GAan8RCYSw6mf9L1PDTg_c4', '2021-02-15 14:53:58.308622+03', '2021-02-16 14:53:58+03', 12, 'eb2b0c336fff4fffb3775b4926621175');
INSERT INTO public.token_blacklist_outstandingtoken (id, token, created_at, expires_at, user_id, jti) VALUES (18, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzQ3Njk2NywianRpIjoiMzNhN2YxYjU3YzIzNDllNGEyMWExNGRhMDgxMzdiYWYiLCJ1c2VyX2lkIjoxMn0.SwFelrZtC4bu_2UyiD-A8E0rGtiPliEeOzjRPE8H-Hs', '2021-02-15 15:02:47.048694+03', '2021-02-16 15:02:47+03', 12, '33a7f1b57c2349e4a21a14da08137baf');
INSERT INTO public.token_blacklist_outstandingtoken (id, token, created_at, expires_at, user_id, jti) VALUES (19, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzQ3NzAzMCwianRpIjoiN2RjODI0MTc0YzhhNDU0Mzk2MTdiNGU4OGM1NWFkNTIiLCJ1c2VyX2lkIjoxMn0.ildxAwtpwJQ94sIkfmAKYHR8w-4h9jq9_BZP320fb5Q', '2021-02-15 15:03:50.881747+03', '2021-02-16 15:03:50+03', 12, '7dc824174c8a45439617b4e88c55ad52');
INSERT INTO public.token_blacklist_outstandingtoken (id, token, created_at, expires_at, user_id, jti) VALUES (20, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzQ3NzA1OCwianRpIjoiZjAzYzYwZjU0NTM2NDg0M2IzNWE4OTZjOGFlMWEyNTciLCJ1c2VyX2lkIjoxMn0.3ut-ZTKUOcOPgbRpKPuTYUCxT01yfI3q9Xjja6dJ4KY', '2021-02-15 15:04:18.74746+03', '2021-02-16 15:04:18+03', 12, 'f03c60f545364843b35a896c8ae1a257');
INSERT INTO public.token_blacklist_outstandingtoken (id, token, created_at, expires_at, user_id, jti) VALUES (21, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzQ3NzE0NywianRpIjoiNTZjNjU5ZDJmZGY1NGRiN2I4NmViNWUzNjc1M2NkNzMiLCJ1c2VyX2lkIjoxMn0.9kHiqq1SZ4bVLbKGgQMsRJ8E9pOUFUI025113tz8igw', '2021-02-15 15:05:47.509932+03', '2021-02-16 15:05:47+03', 12, '56c659d2fdf54db7b86eb5e36753cd73');
INSERT INTO public.token_blacklist_outstandingtoken (id, token, created_at, expires_at, user_id, jti) VALUES (22, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzQ3NzI2MywianRpIjoiZjQ5MDFlYzM5YzhkNDA0NThkYzQzZTgzZDc0ZDNiYjAiLCJ1c2VyX2lkIjoxMn0.kr_qeF9Sb9M1EuJgARQ8JDG0mSNY09-4ZK9LdtIbzqk', '2021-02-15 15:07:43.535415+03', '2021-02-16 15:07:43+03', 12, 'f4901ec39c8d40458dc43e83d74d3bb0');
INSERT INTO public.token_blacklist_outstandingtoken (id, token, created_at, expires_at, user_id, jti) VALUES (23, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzQ3NzUzOCwianRpIjoiNTI2NGM5ZjFhMGEzNDM1OTg2ZDFlNTM5OTZkNGQzOWEiLCJ1c2VyX2lkIjoxMn0.wYY1c-6dmeQTAsNdZKWKbeN98VP4qQAhGTquz4_N7pk', '2021-02-15 15:12:18.26313+03', '2021-02-16 15:12:18+03', 12, '5264c9f1a0a3435986d1e53996d4d39a');
INSERT INTO public.token_blacklist_outstandingtoken (id, token, created_at, expires_at, user_id, jti) VALUES (24, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzQ3NzU2NiwianRpIjoiODVkNTMyZTExYTk4NGI5MThjYWJkZmIyYmFkNDJmODEiLCJ1c2VyX2lkIjoxMn0.rct5pN9t7D9ZxqEXi8kNxhDWuhvkMF-mX0Q-cI_n5cA', '2021-02-15 15:12:46.791321+03', '2021-02-16 15:12:46+03', 12, '85d532e11a984b918cabdfb2bad42f81');
INSERT INTO public.token_blacklist_outstandingtoken (id, token, created_at, expires_at, user_id, jti) VALUES (25, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzQ3ODM0NCwianRpIjoiZTA1MDNiM2JlYTRmNDRmZGE3Y2EwOWE1Yjg4ODJmZmQiLCJ1c2VyX2lkIjoxfQ.BsMwkxxetOqwzTNdXsSu57nn8__4lwAnWRQI51wsQ1o', '2021-02-15 15:25:44.968435+03', '2021-02-16 15:25:44+03', 1, 'e0503b3bea4f44fda7ca09a5b8882ffd');
INSERT INTO public.token_blacklist_outstandingtoken (id, token, created_at, expires_at, user_id, jti) VALUES (26, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzU1MTgwNywianRpIjoiZDg1MGQxYzRkYzEwNDliZThjZjU0YzY3ZmI3NzllZDUiLCJ1c2VyX2lkIjoxMn0.6IjnkZU_K0fvGXBm2suOus6jc9h5VSD94iORQQQRr-k', '2021-02-16 11:50:07.873691+03', '2021-02-17 11:50:07+03', 12, 'd850d1c4dc1049be8cf54c67fb779ed5');
INSERT INTO public.token_blacklist_outstandingtoken (id, token, created_at, expires_at, user_id, jti) VALUES (27, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzU1MTk1OSwianRpIjoiMGE3Mjc4NmQxNmI1NDU4ZWFkYjYyYTRjOTg2MjJkNWEiLCJ1c2VyX2lkIjoxMn0.no6QbgITmFRjNP5NVb9f5xeIWdL2tvvgoC8-2SZanP4', '2021-02-16 11:52:39.430542+03', '2021-02-17 11:52:39+03', 12, '0a72786d16b5458eadb62a4c98622d5a');
INSERT INTO public.token_blacklist_outstandingtoken (id, token, created_at, expires_at, user_id, jti) VALUES (28, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzU1MjExMiwianRpIjoiMjQ2MzUwMzQxNjMyNGJkYThkMjhjMDQ3MmQyZDQyZmQiLCJ1c2VyX2lkIjoxMn0.8Qfrg_I4flcooewnMbVoK1g9yiSTcE_t4XtqT2G8ONg', '2021-02-16 11:55:12.399371+03', '2021-02-17 11:55:12+03', 12, '2463503416324bda8d28c0472d2d42fd');
INSERT INTO public.token_blacklist_outstandingtoken (id, token, created_at, expires_at, user_id, jti) VALUES (29, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzU1MjEzMSwianRpIjoiN2ZlM2U2NWY2NTBiNDZkYmJiMDg0MWMwZjBhMzE3MmIiLCJ1c2VyX2lkIjoxMn0.OoBYayjizApp4j9cGnZ88IJ5ywwHLzPvqG_EyMw7Y2M', '2021-02-16 11:55:31.215922+03', '2021-02-17 11:55:31+03', 12, '7fe3e65f650b46dbbb0841c0f0a3172b');
INSERT INTO public.token_blacklist_outstandingtoken (id, token, created_at, expires_at, user_id, jti) VALUES (30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzU1MjI1NywianRpIjoiYjk3MjEzOTM1NTA3NGIxNWI1ZjAwMTVhMmE1OTk2NmQiLCJ1c2VyX2lkIjoxMn0.35Go3eXdL98KlpMOWyKTOdHIcALPmuaBzUjyGPP2LTw', '2021-02-16 11:57:37.722015+03', '2021-02-17 11:57:37+03', 12, 'b972139355074b15b5f0015a2a59966d');
INSERT INTO public.token_blacklist_outstandingtoken (id, token, created_at, expires_at, user_id, jti) VALUES (31, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzU1MjMwMSwianRpIjoiMWMwNWZlYTI0Nzc5NDI0Y2JkZDRjYjJjOGNiNWU5ZTAiLCJ1c2VyX2lkIjoxMn0.f9-yXdF255iuPYuLNQmmKHyJegKNfjVS2oinpZn8CAw', '2021-02-16 11:58:21.17534+03', '2021-02-17 11:58:21+03', 12, '1c05fea24779424cbdd4cb2c8cb5e9e0');
INSERT INTO public.token_blacklist_outstandingtoken (id, token, created_at, expires_at, user_id, jti) VALUES (32, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzU1MjMxOCwianRpIjoiMDExMDAzZTNiN2ExNDQ3Zjk4NWYxOTk5OTY2YzkzMjMiLCJ1c2VyX2lkIjoxMn0.i4GzWJX9244EBzSIBtWn_ZejASmYxAizWwxGfAgLs9o', '2021-02-16 11:58:38.713865+03', '2021-02-17 11:58:38+03', 12, '011003e3b7a1447f985f1999966c9323');
INSERT INTO public.token_blacklist_outstandingtoken (id, token, created_at, expires_at, user_id, jti) VALUES (33, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzU1MjQ4MSwianRpIjoiMGI3Nzg5YTY4M2M5NGU4NDlmYWJiNzBkOGU5N2ZiNjAiLCJ1c2VyX2lkIjoxMn0.YnxD8RTU8Dyg0xaPgUhs3_nEfPdQeKCU13SAfuuYE9g', '2021-02-16 12:01:21.499897+03', '2021-02-17 12:01:21+03', 12, '0b7789a683c94e849fabb70d8e97fb60');
INSERT INTO public.token_blacklist_outstandingtoken (id, token, created_at, expires_at, user_id, jti) VALUES (34, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzU1MjU0MCwianRpIjoiMmIyOGNjNzQxZTZiNDc5NmFmN2I5YzRmYmM0NWM2OGYiLCJ1c2VyX2lkIjoxMn0.c-Cc36U7QoYSmFOOy8demuUX_zWOo-Ftfz2waVXpgwc', '2021-02-16 12:02:20.15744+03', '2021-02-17 12:02:20+03', 12, '2b28cc741e6b4796af7b9c4fbc45c68f');
INSERT INTO public.token_blacklist_outstandingtoken (id, token, created_at, expires_at, user_id, jti) VALUES (35, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzU1MjU5OCwianRpIjoiZGNlMGRhNjkwYjhkNDRlMjg0M2UxNjRlZTRkMjZiMGYiLCJ1c2VyX2lkIjoxMn0.XPCIhtoAIGK1qRztU4HUdRe2uEItqiLect0rdYrIMFU', '2021-02-16 12:03:18.004365+03', '2021-02-17 12:03:18+03', 12, 'dce0da690b8d44e2843e164ee4d26b0f');
INSERT INTO public.token_blacklist_outstandingtoken (id, token, created_at, expires_at, user_id, jti) VALUES (36, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzU1MjYxNCwianRpIjoiMDgwM2Q1MTgzZGI2NGFhOWE0MjZhOTM3MDNmMGM5ZWQiLCJ1c2VyX2lkIjoxMn0.ztYWVEyhaZjHy-TBKSmfEzstsasgl4Oe-7LUNumX3z4', '2021-02-16 12:03:34.556309+03', '2021-02-17 12:03:34+03', 12, '0803d5183db64aa9a426a93703f0c9ed');
INSERT INTO public.token_blacklist_outstandingtoken (id, token, created_at, expires_at, user_id, jti) VALUES (37, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzU1MjYzNywianRpIjoiY2I4NTViYjU2NTZkNGQyNmI3ZTY5ZDlhNzQ4NWJiZjAiLCJ1c2VyX2lkIjoxMn0.IMz5ClF--y4NMJdlFS-M3cZqyXzy8yIfKJK7FU_kiv4', '2021-02-16 12:03:57.849574+03', '2021-02-17 12:03:57+03', 12, 'cb855bb5656d4d26b7e69d9a7485bbf0');
INSERT INTO public.token_blacklist_outstandingtoken (id, token, created_at, expires_at, user_id, jti) VALUES (38, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzU1NTA1NSwianRpIjoiOTY4OTQ3ZjM5N2M3NGI3ZGFjNjhhMmUzZGFlMWY1NTIiLCJ1c2VyX2lkIjoxMn0.0m4EP0fxBFpxpz9SxZnqGNsJhECttZY_1syGVIo4Mzs', '2021-02-16 12:44:15.20412+03', '2021-02-17 12:44:15+03', 12, '968947f397c74b7dac68a2e3dae1f552');
INSERT INTO public.token_blacklist_outstandingtoken (id, token, created_at, expires_at, user_id, jti) VALUES (39, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzU1NTI2MiwianRpIjoiMDI5MmEyMjUwMWM2NDJlNWFmNTEyNjllNGQ2MGE0NGMiLCJ1c2VyX2lkIjoxMn0.M-H6dN2jzY8JJr0yy-CJYBmssGNfgIpng0fwnFJdIrk', '2021-02-16 12:47:42.106474+03', '2021-02-17 12:47:42+03', 12, '0292a22501c642e5af51269e4d60a44c');
INSERT INTO public.token_blacklist_outstandingtoken (id, token, created_at, expires_at, user_id, jti) VALUES (40, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMzU1Nzg4NiwianRpIjoiY2IyYjQ5MzNhNTA2NDFiNThhNTlhMzFiMWRhYTcyZWIiLCJ1c2VyX2lkIjoxMn0.8JFzr1nbKqzU5brHdpimQtjvWNbgYTS5lc-F9MpzWFA', '2021-02-16 13:31:26.290142+03', '2021-02-17 13:31:26+03', 12, 'cb2b4933a50641b58a59a31b1daa72eb');


--
-- Data for Name: token_blacklist_blacklistedtoken; Type: TABLE DATA; Schema: public; Owner: macbook
--

INSERT INTO public.token_blacklist_blacklistedtoken (id, blacklisted_at, token_id) VALUES (1, '2021-02-11 09:54:44.644386+03', 2);


--
-- Name: activity_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: macbook
--

SELECT pg_catalog.setval('public.activity_comment_id_seq', 1, false);


--
-- Name: activity_like_id_seq; Type: SEQUENCE SET; Schema: public; Owner: macbook
--

SELECT pg_catalog.setval('public.activity_like_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: macbook
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: macbook
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: macbook
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 72, true);


--
-- Name: authentication_customuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: macbook
--

SELECT pg_catalog.setval('public.authentication_customuser_id_seq', 13, true);


--
-- Name: authentication_profile_followings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: macbook
--

SELECT pg_catalog.setval('public.authentication_profile_followings_id_seq', 23, true);


--
-- Name: authentication_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: macbook
--

SELECT pg_catalog.setval('public.authentication_profile_id_seq', 6, true);


--
-- Name: authentication_profile_saved_id_seq; Type: SEQUENCE SET; Schema: public; Owner: macbook
--

SELECT pg_catalog.setval('public.authentication_profile_saved_id_seq', 2, true);


--
-- Name: courses_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: macbook
--

SELECT pg_catalog.setval('public.courses_course_id_seq', 8, true);


--
-- Name: courses_lesson_id_seq; Type: SEQUENCE SET; Schema: public; Owner: macbook
--

SELECT pg_catalog.setval('public.courses_lesson_id_seq', 2, true);


--
-- Name: courses_level_id_seq; Type: SEQUENCE SET; Schema: public; Owner: macbook
--

SELECT pg_catalog.setval('public.courses_level_id_seq', 3, true);


--
-- Name: courses_subcategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: macbook
--

SELECT pg_catalog.setval('public.courses_subcategory_id_seq', 4, true);


--
-- Name: courses_subject_id_seq; Type: SEQUENCE SET; Schema: public; Owner: macbook
--

SELECT pg_catalog.setval('public.courses_subject_id_seq', 12, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: macbook
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 98, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: macbook
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 17, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: macbook
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 50, true);


--
-- Name: token_blacklist_blacklistedtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: macbook
--

SELECT pg_catalog.setval('public.token_blacklist_blacklistedtoken_id_seq', 1, true);


--
-- Name: token_blacklist_outstandingtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: macbook
--

SELECT pg_catalog.setval('public.token_blacklist_outstandingtoken_id_seq', 40, true);


--
-- PostgreSQL database dump complete
--

