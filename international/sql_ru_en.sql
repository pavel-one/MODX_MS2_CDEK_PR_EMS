-- phpMyAdmin SQL Dump
-- version 4.7.5
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Ноя 13 2017 г., 14:20
-- Версия сервера: 5.7.19-17-beget-5.7.19-17-1-log
-- Версия PHP: 7.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `web2maab_tina01`
--

-- --------------------------------------------------------

--
-- Структура таблицы `web2_ems_country`
--

CREATE TABLE `web2_ems_country` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `name_RU` varchar(255) NOT NULL,
  `name_EN` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `web2_ems_country`
--

INSERT INTO `web2_ems_country` (`id`, `slug`, `name_RU`, `name_EN`) VALUES
(1, '﻿AC', 'о-в Вознесения', 'Ascension Island'),
(2, 'AD', 'Андорра', 'Andorra'),
(3, 'AE', 'ОАЭ', 'United Arab Emirates'),
(4, 'AF', 'Афганистан', 'Afghanistan'),
(5, 'AG', 'Антигуа и Барбуда', 'Antigua & Barbuda'),
(6, 'AI', 'Ангилья', 'Anguilla'),
(7, 'AL', 'Албания', 'Albania'),
(8, 'AM', 'Армения', 'Armenia'),
(9, 'AN', 'Нидерландские Антильские о-ва', 'Netherlands Antilles'),
(10, 'AO', 'Ангола', 'Angola'),
(11, 'AQ', 'Антарктида', 'Antarctica'),
(12, 'AR', 'Аргентина', 'Argentina'),
(13, 'AS', 'Американское Самоа', 'American Samoa'),
(14, 'AT', 'Австрия', 'Austria'),
(15, 'AU', 'Австралия', 'Australia'),
(16, 'AW', 'Аруба', 'Aruba'),
(17, 'AX', 'Аландские о-ва', 'Åland Islands'),
(18, 'AZ', 'Азербайджан', 'Azerbaijan'),
(19, 'BA', 'Босния и Герцеговина', 'Bosnia & Herzegovina'),
(20, 'BB', 'Барбадос', 'Barbados'),
(21, 'BD', 'Бангладеш', 'Bangladesh'),
(22, 'BE', 'Бельгия', 'Belgium'),
(23, 'BF', 'Буркина-Фасо', 'Burkina Faso'),
(24, 'BG', 'Болгария', 'Bulgaria'),
(25, 'BH', 'Бахрейн', 'Bahrain'),
(26, 'BI', 'Бурунди', 'Burundi'),
(27, 'BJ', 'Бенин', 'Benin'),
(28, 'BL', 'Сен-Бартельми', 'St. Barthélemy'),
(29, 'BM', 'Бермудские о-ва', 'Bermuda'),
(30, 'BN', 'Бруней-Даруссалам', 'Brunei'),
(31, 'BO', 'Боливия', 'Bolivia'),
(32, 'BQ', 'Бонэйр, Синт-Эстатиус и Саба', 'Caribbean Netherlands'),
(33, 'BR', 'Бразилия', 'Brazil'),
(34, 'BS', 'Багамские о-ва', 'Bahamas'),
(35, 'BT', 'Бутан', 'Bhutan'),
(36, 'BV', 'о-в Буве', 'Bouvet Island'),
(37, 'BW', 'Ботсвана', 'Botswana'),
(38, 'BY', 'Беларусь', 'Belarus'),
(39, 'BZ', 'Белиз', 'Belize'),
(40, 'CA', 'Канада', 'Canada'),
(41, 'CC', 'Кокосовые о-ва', 'Cocos (Keeling) Islands'),
(42, 'CD', 'Конго - Киншаса', 'Congo - Kinshasa'),
(43, 'CF', 'ЦАР', 'Central African Republic'),
(44, 'CG', 'Конго - Браззавиль', 'Congo - Brazzaville'),
(45, 'CH', 'Швейцария', 'Switzerland'),
(46, 'CI', 'Кот-д’Ивуар', 'Côte d’Ivoire'),
(47, 'CK', 'о-ва Кука', 'Cook Islands'),
(48, 'CL', 'Чили', 'Chile'),
(49, 'CM', 'Камерун', 'Cameroon'),
(50, 'CN', 'Китай', 'China'),
(51, 'CO', 'Колумбия', 'Colombia'),
(52, 'CP', 'о-в Клиппертон', 'Clipperton Island'),
(53, 'CR', 'Коста-Рика', 'Costa Rica'),
(54, 'CU', 'Куба', 'Cuba'),
(55, 'CV', 'Кабо-Верде', 'Cape Verde'),
(56, 'CW', 'Кюрасао', 'Curaçao'),
(57, 'CX', 'о-в Рождества', 'Christmas Island'),
(58, 'CY', 'Кипр', 'Cyprus'),
(59, 'CZ', 'Чехия', 'Czech Republic'),
(60, 'DE', 'Германия', 'Germany'),
(61, 'DG', 'Диего-Гарсия', 'Diego Garcia'),
(62, 'DJ', 'Джибути', 'Djibouti'),
(63, 'DK', 'Дания', 'Denmark'),
(64, 'DM', 'Доминика', 'Dominica'),
(65, 'DO', 'Доминиканская Республика', 'Dominican Republic'),
(66, 'DZ', 'Алжир', 'Algeria'),
(67, 'EA', 'Сеута и Мелилья', 'Ceuta & Melilla'),
(68, 'EC', 'Эквадор', 'Ecuador'),
(69, 'EE', 'Эстония', 'Estonia'),
(70, 'EG', 'Египет', 'Egypt'),
(71, 'EH', 'Западная Сахара', 'Western Sahara'),
(72, 'ER', 'Эритрея', 'Eritrea'),
(73, 'ES', 'Испания', 'Spain'),
(74, 'ET', 'Эфиопия', 'Ethiopia'),
(75, 'EU', 'Европейский союз', 'European Union'),
(76, 'FI', 'Финляндия', 'Finland'),
(77, 'FJ', 'Фиджи', 'Fiji'),
(78, 'FK', 'Фолклендские о-ва', 'Falkland Islands'),
(79, 'FM', 'Федеративные Штаты Микронезии', 'Micronesia'),
(80, 'FO', 'Фарерские о-ва', 'Faroe Islands'),
(81, 'FR', 'Франция', 'France'),
(82, 'GA', 'Габон', 'Gabon'),
(83, 'GB', 'Великобритания', 'United Kingdom'),
(84, 'GD', 'Гренада', 'Grenada'),
(85, 'GE', 'Грузия', 'Georgia'),
(86, 'GF', 'Французская Гвиана', 'French Guiana'),
(87, 'GG', 'Гернси', 'Guernsey'),
(88, 'GH', 'Гана', 'Ghana'),
(89, 'GI', 'Гибралтар', 'Gibraltar'),
(90, 'GL', 'Гренландия', 'Greenland'),
(91, 'GM', 'Гамбия', 'Gambia'),
(92, 'GN', 'Гвинея', 'Guinea'),
(93, 'GP', 'Гваделупа', 'Guadeloupe'),
(94, 'GQ', 'Экваториальная Гвинея', 'Equatorial Guinea'),
(95, 'GR', 'Греция', 'Greece'),
(96, 'GS', 'Южная Георгия и Южные Сандвичевы о-ва', 'South Georgia & South Sandwich Islands'),
(97, 'GT', 'Гватемала', 'Guatemala'),
(98, 'GU', 'Гуам', 'Guam'),
(99, 'GW', 'Гвинея-Бисау', 'Guinea-Bissau'),
(100, 'GY', 'Гайана', 'Guyana'),
(101, 'HK', 'Гонконг (особый район)', 'Hong Kong SAR China'),
(102, 'HM', 'о-ва Херд и Макдональд', 'Heard & McDonald Islands'),
(103, 'HN', 'Гондурас', 'Honduras'),
(104, 'HR', 'Хорватия', 'Croatia'),
(105, 'HT', 'Гаити', 'Haiti'),
(106, 'HU', 'Венгрия', 'Hungary'),
(107, 'IC', 'Канарские о-ва', 'Canary Islands'),
(108, 'ID', 'Индонезия', 'Indonesia'),
(109, 'IE', 'Ирландия', 'Ireland'),
(110, 'IL', 'Израиль', 'Israel'),
(111, 'IM', 'О-в Мэн', 'Isle of Man'),
(112, 'IN', 'Индия', 'India'),
(113, 'IO', 'Британская территория в Индийском океане', 'British Indian Ocean Territory'),
(114, 'IQ', 'Ирак', 'Iraq'),
(115, 'IR', 'Иран', 'Iran'),
(116, 'IS', 'Исландия', 'Iceland'),
(117, 'IT', 'Италия', 'Italy'),
(118, 'JE', 'Джерси', 'Jersey'),
(119, 'JM', 'Ямайка', 'Jamaica'),
(120, 'JO', 'Иордания', 'Jordan'),
(121, 'JP', 'Япония', 'Japan'),
(122, 'KE', 'Кения', 'Kenya'),
(123, 'KG', 'Киргизия', 'Kyrgyzstan'),
(124, 'KH', 'Камбоджа', 'Cambodia'),
(125, 'KI', 'Кирибати', 'Kiribati'),
(126, 'KM', 'Коморские о-ва', 'Comoros'),
(127, 'KN', 'Сент-Китс и Невис', 'St. Kitts & Nevis'),
(128, 'KP', 'КНДР', 'North Korea'),
(129, 'KR', 'Республика Корея', 'South Korea'),
(130, 'KW', 'Кувейт', 'Kuwait'),
(131, 'KY', 'Каймановы о-ва', 'Cayman Islands'),
(132, 'KZ', 'Казахстан', 'Kazakhstan'),
(133, 'LA', 'Лаос', 'Laos'),
(134, 'LB', 'Ливан', 'Lebanon'),
(135, 'LC', 'Сент-Люсия', 'St. Lucia'),
(136, 'LI', 'Лихтенштейн', 'Liechtenstein'),
(137, 'LK', 'Шри-Ланка', 'Sri Lanka'),
(138, 'LR', 'Либерия', 'Liberia'),
(139, 'LS', 'Лесото', 'Lesotho'),
(140, 'LT', 'Литва', 'Lithuania'),
(141, 'LU', 'Люксембург', 'Luxembourg'),
(142, 'LV', 'Латвия', 'Latvia'),
(143, 'LY', 'Ливия', 'Libya'),
(144, 'MA', 'Марокко', 'Morocco'),
(145, 'MC', 'Монако', 'Monaco'),
(146, 'MD', 'Молдова', 'Moldova'),
(147, 'ME', 'Черногория', 'Montenegro'),
(148, 'MF', 'Сен-Мартен', 'St. Martin'),
(149, 'MG', 'Мадагаскар', 'Madagascar'),
(150, 'MH', 'Маршалловы о-ва', 'Marshall Islands'),
(151, 'MK', 'Македония', 'Macedonia'),
(152, 'ML', 'Мали', 'Mali'),
(153, 'MM', 'Мьянма (Бирма)', 'Myanmar (Burma)'),
(154, 'MN', 'Монголия', 'Mongolia'),
(155, 'MO', 'Макао (особый район)', 'Macau SAR China'),
(156, 'MP', 'Северные Марианские о-ва', 'Northern Mariana Islands'),
(157, 'MQ', 'Мартиника', 'Martinique'),
(158, 'MR', 'Мавритания', 'Mauritania'),
(159, 'MS', 'Монтсеррат', 'Montserrat'),
(160, 'MT', 'Мальта', 'Malta'),
(161, 'MU', 'Маврикий', 'Mauritius'),
(162, 'MV', 'Мальдивские о-ва', 'Maldives'),
(163, 'MW', 'Малави', 'Malawi'),
(164, 'MX', 'Мексика', 'Mexico'),
(165, 'MY', 'Малайзия', 'Malaysia'),
(166, 'MZ', 'Мозамбик', 'Mozambique'),
(167, 'NA', 'Намибия', 'Namibia'),
(168, 'NC', 'Новая Каледония', 'New Caledonia'),
(169, 'NE', 'Нигер', 'Niger'),
(170, 'NF', 'о-в Норфолк', 'Norfolk Island'),
(171, 'NG', 'Нигерия', 'Nigeria'),
(172, 'NI', 'Никарагуа', 'Nicaragua'),
(173, 'NL', 'Нидерланды', 'Netherlands'),
(174, 'NO', 'Норвегия', 'Norway'),
(175, 'NP', 'Непал', 'Nepal'),
(176, 'NR', 'Науру', 'Nauru'),
(177, 'NU', 'Ниуэ', 'Niue'),
(178, 'NZ', 'Новая Зеландия', 'New Zealand'),
(179, 'OM', 'Оман', 'Oman'),
(180, 'PA', 'Панама', 'Panama'),
(181, 'PE', 'Перу', 'Peru'),
(182, 'PF', 'Французская Полинезия', 'French Polynesia'),
(183, 'PG', 'Папуа – Новая Гвинея', 'Papua New Guinea'),
(184, 'PH', 'Филиппины', 'Philippines'),
(185, 'PK', 'Пакистан', 'Pakistan'),
(186, 'PL', 'Польша', 'Poland'),
(187, 'PM', 'Сен-Пьер и Микелон', 'St. Pierre & Miquelon'),
(188, 'PN', 'Питкэрн', 'Pitcairn Islands'),
(189, 'PR', 'Пуэрто-Рико', 'Puerto Rico'),
(190, 'PS', 'Палестинские территории', 'Palestinian Territories'),
(191, 'PT', 'Португалия', 'Portugal'),
(192, 'PW', 'Палау', 'Palau'),
(193, 'PY', 'Парагвай', 'Paraguay'),
(194, 'QA', 'Катар', 'Qatar'),
(195, 'QO', 'Внешняя Океания', 'Outlying Oceania'),
(196, 'RE', 'Реюньон', 'Réunion'),
(197, 'RO', 'Румыния', 'Romania'),
(198, 'RS', 'Сербия', 'Serbia'),
(199, 'RU', 'Россия', 'Russia'),
(200, 'RW', 'Руанда', 'Rwanda'),
(201, 'SA', 'Саудовская Аравия', 'Saudi Arabia'),
(202, 'SB', 'Соломоновы о-ва', 'Solomon Islands'),
(203, 'SC', 'Сейшельские о-ва', 'Seychelles'),
(204, 'SD', 'Судан', 'Sudan'),
(205, 'SE', 'Швеция', 'Sweden'),
(206, 'SG', 'Сингапур', 'Singapore'),
(207, 'SH', 'О-в Св. Елены', 'St. Helena'),
(208, 'SI', 'Словения', 'Slovenia'),
(209, 'SJ', 'Шпицберген и Ян-Майен', 'Svalbard & Jan Mayen'),
(210, 'SK', 'Словакия', 'Slovakia'),
(211, 'SL', 'Сьерра-Леоне', 'Sierra Leone'),
(212, 'SM', 'Сан-Марино', 'San Marino'),
(213, 'SN', 'Сенегал', 'Senegal'),
(214, 'SO', 'Сомали', 'Somalia'),
(215, 'SR', 'Суринам', 'Suriname'),
(216, 'SS', 'Южный Судан', 'South Sudan'),
(217, 'ST', 'Сан-Томе и Принсипи', 'São Tomé & Príncipe'),
(218, 'SV', 'Сальвадор', 'El Salvador'),
(219, 'SX', 'Синт-Мартен', 'Saint Martin'),
(220, 'SY', 'Сирия', 'Syria'),
(221, 'SZ', 'Свазиленд', 'Swaziland'),
(222, 'TA', 'Тристан-да-Кунья', 'Tristan da Cunha'),
(223, 'TC', 'О-ва Тёркс и Кайкос', 'Turks & Caicos Islands'),
(224, 'TD', 'Чад', 'Chad'),
(225, 'TF', 'Французские Южные Территории', 'French Southern Territories'),
(226, 'TG', 'Того', 'Togo'),
(227, 'TH', 'Таиланд', 'Thailand'),
(228, 'TJ', 'Таджикистан', 'Tajikistan'),
(229, 'TK', 'Токелау', 'Tokelau'),
(230, 'TL', 'Восточный Тимор', 'Timor-Leste'),
(231, 'TM', 'Туркменистан', 'Turkmenistan'),
(232, 'TN', 'Тунис', 'Tunisia'),
(233, 'TO', 'Тонга', 'Tonga'),
(234, 'TR', 'Турция', 'Turkey'),
(235, 'TT', 'Тринидад и Тобаго', 'Trinidad & Tobago'),
(236, 'TV', 'Тувалу', 'Tuvalu'),
(237, 'TW', 'Тайвань', 'Taiwan'),
(238, 'TZ', 'Танзания', 'Tanzania'),
(239, 'UA', 'Украина', 'Ukraine'),
(240, 'UG', 'Уганда', 'Uganda'),
(241, 'UM', 'Внешние малые о-ва (США)', 'U.S. Outlying Islands'),
(242, 'US', 'Соединенные Штаты', 'United States'),
(243, 'UY', 'Уругвай', 'Uruguay'),
(244, 'UZ', 'Узбекистан', 'Uzbekistan'),
(245, 'VA', 'Ватикан', 'Vatican City'),
(246, 'VC', 'Сент-Винсент и Гренадины', 'St. Vincent & Grenadines'),
(247, 'VE', 'Венесуэла', 'Venezuela'),
(248, 'VG', 'Виргинские о-ва (Британские)', 'British Virgin Islands'),
(249, 'VI', 'Виргинские о-ва (США)', 'U.S. Virgin Islands'),
(250, 'VN', 'Вьетнам', 'Vietnam'),
(251, 'VU', 'Вануату', 'Vanuatu'),
(252, 'WF', 'Уоллис и Футуна', 'Wallis & Futuna'),
(253, 'WS', 'Самоа', 'Samoa'),
(254, 'XK', 'Косово', 'Kosovo'),
(255, 'YE', 'Йемен', 'Yemen'),
(256, 'YT', 'Майотта', 'Mayotte'),
(257, 'ZA', 'ЮАР', 'South Africa'),
(258, 'ZM', 'Замбия', 'Zambia'),
(259, 'ZW', 'Зимбабве', 'Zimbabwe'),
(260, 'ZZ', 'Неизвестный регион', 'Unknown Region');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `web2_ems_country`
--
ALTER TABLE `web2_ems_country`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `web2_ems_country`
--
ALTER TABLE `web2_ems_country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=261;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
