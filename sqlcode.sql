CREATE TABLE organization (
	organization_id INT PRIMARY KEY,
	description VARCHAR(32)
);

CREATE TABLE administration (
	administration_id INT PRIMARY KEY,
	country VARCHAR(32),
	city VARCHAR(32),
	organization_id INT, 
	FOREIGN KEY (organization_id) REFERENCES organization (organization_id)
);

CREATE TABLE hospital (
	hospital_id INT PRIMARY KEY,
              hospital_name VARCHAR(64),
	address VARCHAR(100), 
	director_name VARCHAR(32),
	director_surname VARCHAR(32),
	phone_number BIGINT,
	e_mail VARCHAR(32),
	administration_id INT,
	FOREIGN KEY (administration_id) REFERENCES administration (administration_id)
);

CREATE TABLE employee (
	employee_id INT PRIMARY KEY,
	emp_name VARCHAR(32),
	emp_surname VARCHAR(32),
	start_date DATE,
	end_date DATE,
	phone_number BIGINT,
	hospital_id INT,
	FOREIGN KEY (hospital_id) REFERENCES hospital (hospital_id)
);

CREATE TABLE position (
	position_id INT PRIMARY KEY,
	post VARCHAR(50), 
	employee_id INT,
	FOREIGN KEY (employee_id) REFERENCES employee (employee_id)
);

CREATE TABLE patient (
	patient_id INT PRIMARY KEY,
	pat_name VARCHAR(32),
	pat_surn VARCHAR(32),
	birth_date DATE,
	gender VARCHAR(12),
	iin BIGINT,
	address VARCHAR(100),
	hospital_id INT,
	FOREIGN KEY (hospital_id) REFERENCES hospital (hospital_id)
);

CREATE TABLE pat_info (
	pat_info_id INT PRIMARY KEY,
	current_health VARCHAR(32), 
	description VARCHAR(100), 
	blood_type INT,
	lvl_pressure VARCHAR(32),
	lvl_blood VARCHAR(32), 
	patient_id INT,
	FOREIGN KEY (patient_id) REFERENCES patient (patient_id)
);

CREATE TABLE floor_hospital (
	floor_id INT PRIMARY KEY,
	description VARCHAR(32)
);

CREATE TABLE method_healing (
	method_healing_id INT PRIMARY KEY,
	address_hospital VARCHAR(100),
	duration VARCHAR(32), 
	room INT,
	floor_id INT,
	FOREIGN KEY (floor_id) REFERENCES floor_hospital (floor_id)
);

CREATE TABLE disease (
	disease_id INT PRIMARY KEY,
	name_disease VARCHAR(32),
	description VARCHAR(32) 
);

CREATE TABLE medicine (
	medicine_id INT PRIMARY KEY,
	name_medicine VARCHAR(64),
	description VARCHAR(100)
);

CREATE TABLE appointment (
	appointment_id INT PRIMARY KEY,
	app_date DATE,
	app_time VARCHAR(10),
	description VARCHAR(64), 
	employee_id INT,
	patient_id INT,
	method_healing_id INT,
	disease_id INT,
	medicine_id INT,
	FOREIGN KEY (employee_id) REFERENCES employee (employee_id),
	FOREIGN KEY (patient_id) REFERENCES patient (patient_id),
	FOREIGN KEY (method_healing_id) REFERENCES method_healing (method_healing_id),
	FOREIGN KEY (disease_id) REFERENCES disease (disease_id),
	FOREIGN KEY (medicine_id) REFERENCES medicine (medicine_id)
);


INSERT INTO organization (organization_id, description) 
VALUES (1, 'Municipal'),
(2, 'Private');

INSERT INTO administration (administration_id, country, city, organization_id)
VALUES (10, 'Kazakhstan', 'Nur-Sultan', 1), 
(11, 'Kazakhstan', 'Shymkent', 1), 
(12, 'Kazakhstan', 'Almaty', 2),
(13, 'Kazakhstan', 'Semey', 2),
(14, 'Kazakhstan', 'Pavlodar', 1);

INSERT INTO hospital (hospital_id, hospital_name, address, director_name, director_surname, phone_number, e_mail, administration_id)
VALUES (20, 'City hospital No. 2', 'Republic 50', 'Lyazzat', 'Ruspekova', 87172398259, 'manager@2-emhana.kz', 10),
(21, 'City hospital No. 10', 'Kosshygululy 8', 'Gulnar', 'Alpysbekova', 87172708685, 'apk10-astana@med.mail.kz', 10),
(22, 'Regional clinical hospital', 'Maylikozha 4', 'Eldos', 'Sultanov', 87252536514, 'gkkp_okb@mail.ru', 11),
(23, 'City polyclinic No. 1', 'Tauke-Khan Avenue 35', 'Chingiz', 'Baymenov', 87252534922, 'info@ukogorpol1.kz', 11),
(24, 'EMIRMED', 'Nusupbekova 26/1', 'Yusup', 'Muhamedov', 87780910746, 'emirmed@mail.ru', 12),
(25, 'Allergo Clinic', 'Navoi 208', 'Danara', 'Artygalieva', 87008366711, NULL, 12),
(26, 'Multidisciplinary Medical Center', 'Shakarim 72', NULL, NULL, 87222639444, 'Densaulyk2017@mail.ru', 13),
(27, 'TOQTAMYS', 'Shakarin 84', NULL, NULL, 87222526854, NULL, 13),
(28, 'City hospital No. 4', 'Tkacheva 16', 'Arman', 'Otarbekov', 87182657005, NULL, 14),
(29, 'City hospital No. 1', 'Lomova 49', NULL, NULL, 87182662340, 'pol1_pvl@bk.ru', 14);

INSERT INTO employee (employee_id, emp_name, emp_surname, start_date, end_date, phone_number, hospital_id)
VALUES (100, 'Sabina', 'Rahimzhanova', '2018-04-01', NULL, 87779827891, 20),
(101, 'Kuat', 'Ibraev', '2016-01-23', NULL, 87079878064, 20),
(102, 'Anatoliy', 'Utigaliev', '2014-05-05', NULL, 87718986546, 20),
(103, 'Irena', 'Savelova', '2015-12-24', NULL, 87716548047, 20),
(104, 'Ulbolsyn', 'Kydyrbaeva', '2016-10-28', NULL, 87471543984, 20),
(105, 'Ansar', 'Smailov', '06-May-2016', '2018-03-22', 870787985456, 20),
(106, 'Mahabbat', 'Mahaeva', '2014-06-14', NULL, 87778729871, 21),
(107, 'Umarbek', 'Iskakov', '2016-02-03', NULL, 87076829876, 21),
(108, 'Zhanyl', 'Ismailova', '2013-11-30', NULL, 87478901564, 21),
(109, 'Anastasiya', 'Balah', '2012-01-08', NULL, 87716812133, 21),
(110, 'Elena', 'Bikbaeva', '2017-08-26', NULL, 87775483253, 21),
(111, 'Madina', 'Saulenbekova', '2012-08-15', '2020-02-20', 87078995867, 21),
(112, 'Saltanat', 'Abdulova', '2017-09-29', NULL, 870789706548, 22),
(113, 'Berik', 'Amanzholov', '2014-03-30', NULL, 87779878978, 22),
(114, 'Saule', 'Turgunbaeva', '2019-12-01', NULL, 87475648201, 22),
(115, 'Gulnar', 'Orazbay', '2013-10-11', NULL, 87470235420, 22),
(116, 'Eskendir', 'Rysaldiev', '2015-01-15', NULL, 87076800564, 22),
(117, 'Svetlana', 'Shahmetova', '2016-05-03', '2018-03-18', 87079789782, 22),
(118, 'Ulbala', 'Umiralieva', '2010-01-31', NULL, 87779873159, 23),
(119, 'Galymzhan', 'Asanov', '2016-05-08', NULL, 87475616870, 23),
(120, 'Elmira', 'Baymuhanbetova', '2014-08-16', NULL, 87776543050, 23),
(121, 'Moldir', 'Baymuhanbetova', '2017-04-26', NULL, 87716800354, 23),
(122, 'Bakyt', 'Tokmurzaeva', '2014-01-04', NULL, 87779023250, 23),
(123, 'Daulet', 'Abaev', '2011-11-23', '2020-08-27', 87778109069, 23),
(124, 'Gulnazhar', 'Tleukhan', '2014-05-16', NULL, 87078791058, 24),
(125, 'Evgeniya', 'Konyuhova', '2016-07-24', NULL, 87779046709, 24),
(126, 'Akerke', 'Shitanova', '2016-02-09', NULL, 87077006871, 24),
(127, 'Botagul', 'Kabdoldanova', '2015-05-01', NULL, 87079878081, 24),
(128, 'Nabohon', 'Ibragimov', '2018-01-28', NULL, 87716880487, 24),
(129, 'Zhanna', 'Amirova', '2014-05-16', '2019-06-18', 87718905891, 24),
(130, 'Indira', 'Zurdunova', '2015-08-30', NULL, 87470800684, 25),
(131, 'Dinara', 'Talgatbekova', '2014-06-30', NULL, 87778706548, 25),
(132, 'Gilnora', 'Mahmudova', '2016-05-16', NULL, 87478601658, 25),
(133, 'Mariya', 'Demchenko', '2016-09-02', NULL, 87719830284, 25),
(134, 'Maya', 'Murathanova', '2018-12-20', NULL, 87418980416, 25),
(135, 'Dariga', 'Smakova', '2015-01-11', '2019-03-05', 87776841156, 25),
(136, 'Madina', 'Ikombayeva', '2018-08-22', NULL, 87770897782, 26),
(137, 'Dana', 'Madrahomova', '2017-12-14', NULL, 87718944822, 26),
(138, 'Oksana', 'Haydarova', '2019-09-09', NULL, 87079556857, 26),
(139, 'Aset', 'Kusainov', '2018-06-24', NULL, 87071257785, 26),
(140, 'Kulshat', 'Kalieva', '2018-05-22', NULL, 87478080889, 26),
(141, 'Asiya', 'Aubakir', '2019-05-19', '2020-03-25', 87770704890, 26),
(142, 'Aliya', 'Alimbayeva', '2014-09-24' , NULL, 87773092838, 27),
(143, 'Tamara', 'Rymbayeva', '2018-04-25' , NULL, 87470953095, 27),
(144, 'Aizhan', 'Orazalina', '2014-12-04' , NULL, 87719046472, 27),
(145, 'Badigul', 'Musafirova', '2016-03-08' , NULL, 87771409244, 27),
(146, 'Askar', 'Uanov', '2017-10-19' , NULL, 8777125578, 27),
(147, 'Tomiris', 'Kaltayeva', '2015-11-11' , '2017-06-27', 8707859142, 27),
(148, 'Olga', 'Prohodko', '2015-12-01', NULL, 87778907266, 28),
(149, 'Asyl', 'Idrisov', '2015-03-27', NULL, 8707026609, 28),
(150, 'Karima', 'Zhetpyspaeva', '2015-05-19', NULL, 87716475882, 28),
(151, 'Olesya', 'Halitova', '2017-09-22', NULL, 87076250544, 28),
(152, 'Tolganay', 'Seytalina', '2014-04-06', NULL, 87079915433, 28),
(153, 'Aisha', 'Turgunbayeva', '2013-12-21', '2019-08-28', 87076423091, 28),
(154, 'Kanat', 'Asylhanov', '2015-05-09', NULL, 87771316778, 29),
(155, 'Galiya', 'Ahmetova', '2014-02-11', NULL, 87716820121, 29),
(156, 'Sovetkhan', 'Smakov', '2016-12-02', NULL, 87779001557, 29),
(157, 'Zhanara', 'Altynbekova', '2016-06-01', NULL, 87475351584, 29),
(158, 'Leyla', 'Argandykova', '2017-10-29', NULL, 87476462493, 29),
(159, 'Zhansaya', 'Omarova', '2017-02-18', '2019-11-09', 87775605711, 29);

INSERT INTO position (position_id, post, employee_id) 
VALUES (200, 'surgeon', 100),
(201, 'traumatologist', 101),
(202, 'neurologist', 102),
(203, 'allergist', 103),
(204, 'cardiologist', 104),
(205, 'therapist', 105),
(206, 'therapist', 106),
(207, 'surgeon', 107),
(208, 'endocrinologist', 108),
(209, 'radiologist', 109),
(210, 'infectious disease specialist', 110),
(211, 'cardiologist', 111),
(212, 'hematologist', 112),
(213, 'dentist', 113),
(214, 'ENT doctor', 114),
(215, 'cardiologist', 115),
(216, 'urologist', 116),
(217, 'surgeon', 117),
(218, 'gynecologist', 118),
(219, 'surgeon', 119),
(220, 'cardiologist', 120),
(221, 'psychologist', 121),
(222, 'allergist', 122),
(223, 'infectious disease specialist', 123),
(224, 'oculist', 124), 
(225, 'neurologist', 125),
(226, 'gynecologist', 126),
(227, 'therapist', 127),
(228, 'proctologist', 128),
(229, 'urologist', 129),
(230, 'allergist', 130),
(231, 'immunologist', 131),
(232, 'gastroenterologist', 132),
(233, 'allergist', 133),
(234, 'dermatologist', 134),
(235, 'therapist', 135),
(236, 'pediatrician', 136),
(237, 'neuropathologist', 137),
(238, 'cardiologist', 138),
(239, 'urologist', 139),
(240, 'therapist', 140), 
(241, 'cardiologist', 141),
(242, 'pediatrician', 142),
(243, 'cardiologist', 143), 
(244, 'pulmonologist', 144),
(245, 'speech therapist', 145),
(246, 'hematologist', 146),
(247, 'pediatrician', 147), 
(248, 'therapist', 148),
(249, 'urologist', 149),
(250, 'neuropathologist', 150),
(251, 'endocrinologist', 151),
(252, 'gynecologist', 152),
(253, 'surgeon', 153),
(254, 'traumatologist', 154),
(255, 'gynecologist', 155),
(256, 'surgeon', 156),
(257, 'radiologist', 157),
(258, 'cardiologist', 158),
(259, 'ENT doctor', 159);

INSERT INTO patient (patient_id, pat_name, pat_surn, birth_date, gender, iin, address, hospital_id)
VALUES (500, 'Nurlan', 'Mahmetzhanov', '1992-06-16', 'Male', 920616551252, 'Kyz Zhybek 41', 20),
(501, 'Irina', 'Evenko', '1966-10-05', 'Female', 661005658045, 'Tashenova 9/3', 20),
(502, 'Ainur', 'Omerhan', '1996-09-15', 'Female', 960915658046, 'Aleksandr Baraev 10', 21),
(503, 'Ersyn', 'Muhamadiev', '1985-12-10', 'Male', 851210550987, 'Imanbaeva 3', 21),
(504, 'Ulzhalgas', 'Zhundibayeva', '1985-08-28', 'Female', 850828650871, 'Kunaeva 63', 22),
(505, 'Nurbolat', 'Baydos', '2001-11-11', 'Male', 011111554315, 'Baytursynova 70', 22),
(506, 'Dana', 'Abdyhanova', '1991-10-11', 'Female', 911011650511, 'Sayramskaya 198', 23),
(507, 'Arman', 'Tulegenov', '1984-10-11', 'Male', 841011558164, 'Zhibek Zholy 56', 23),
(508, 'Didar', 'Madeliev', '1989-11-15', 'Male', 891115554301, 'Zhandosova 11', 24),
(509, 'Adil', 'Imenov', '1996-06-10', 'Male', 960610551034, 'Satpayeva 54', 24),
(510, 'Anara', 'Aydarbekova', '1994-08-20', 'Female', 940820650315, 'Rozybakieva 140', 25),
(511, 'Indira', 'Tazhibayeva', '1980-12-23', 'Female', 801223659807, 'Tole bi 221', 25),
(512, 'Almas', 'Dairov', '1991-02-17', 'Male', 910217556425, 'Trusova 72', 26),
(513, 'Gazizkhan', 'Tanirbergen', '2001-05-02', 'Male', 010502556427, 'Momyshuly 70', 26),
(514, 'Oryngul', 'Kaldybayeva', '1976-11-17', 'Female', 761117658106, 'Shakarim 89', 27),
(515, 'Asel', 'Omarbekova', '1987-04-05', 'Female', 870405651970, 'Naymanbayeva 152', 27),
(516, 'Nikita', 'Kostromin', '2000-05-16', 'Male', 000516553245, 'Mayri 23', 28),
(517, 'Aliya', 'Aitkozha', '2003-01-04', 'Female', 030104650511, 'Tkacheva 17', 28),
(518, 'Dina', 'Amanzholova', '1999-09-01', 'Female', 990901650907, 'Lomova 30', 29),
(519, 'Daniyar', 'Kayrullin', '1992-09-26', 'Male', 920926553102, 'Chokina 99', 29);

INSERT INTO pat_info (pat_info_id, current_health, description, blood_type, lvl_pressure, lvl_blood, patient_id)
VALUES (600, 'healthy', NULL, 1, '122', '133', 500),
(601, 'unhealthy', 'cough', 2, '137', '119', 501),
(602, 'unhealthy', 'cough', 3, '132', '125', 502),
(603, 'healthy', NULL, NULL, NULL, NULL, 503),
(604, 'unhealthy', NULL, 1, '128', '148', 504),
(605, 'healthy', NULL, 2, '134', '139', 505), 
(606, 'unhealthy', 'depression', 3, '133', '127', 506),
(607, 'healthy', NULL, 4, NULL, NULL, 507),
(608, 'unhealthy', 'cough', 1, '136', '133', 508),
(609, 'healthy', NULL, 2, NULL, NULL, 509),
(610, 'unhealthy', 'irritability', 3, '164', '110', 510),
(611, 'unhealthy', 'irritability', 4, '148', '123', 511),
(612, 'healthy', NULL, NULL, NULL, NULL, 512),
(613, 'unhealthy', 'cough', 2, '155', '133', 513),
(614, 'healthy', NULL, 3, '128', '130', 514),
(615, 'healthy', NULL, 4, NULL, NULL, 515),
(616, 'healthy', NULL, 1, '145', '128', 516),
(617, 'unhealthy', 'dizziness', 3, '134', '97', 517),
(618, 'healthy', 'pregnancy, abdominal pain', 2, '129', '135', 518),
(619, 'healthy', NULL, 4, '135', '126', 519);

INSERT INTO floor_hospital (floor_id, description)
VALUES (2, 'operation'),
(3, 'covid-19'),
(4, 'other'),
(5, 'mental health');

INSERT INTO method_healing (method_healing_id, address_hospital, duration, room, floor_id)
VALUES (1100, 'at home', '2 weeks', NULL, NULL),
(1101, 'Manas 22, Nur-Sultan', '2 months', 20, 3),
(1102, 'Maylikozha 4, Shymkent', '4 weeks', 9, 5),
(1103, 'Saltykova-Shedrina 63, Pavlodar', '1 month', 5, 2),
(1104, '2-nd Southern 51, Pavlodar', '5 month', 4, 4),
(1105, 'Sechenova 1, Semey', '2 weeks', 6, 5),
(1106, 'Manas 22, Nur-Sultan', '2 month', 6, 3),
(1107, 'Demchenko 83, Almaty', '1 year', 12, 3),
(1108, 'Sechenova 1, Semey', '3 months', 16, 3),
(1109, 'Sechenova 1, Semey', '3 weeks', 7, 4);

INSERT INTO disease (disease_id, name_disease, description)
VALUES (1200, 'covid-19', 'cold, high temperature'),
(1201, 'pregnancy', 'abdominal pain'),
(1202, 'caries', 'pain in the teeth'),
(1203, 'depression', 'sadness'),
(1204, 'allergy', 'irritability'),
(1205, 'anemia', 'dizziness'),
(1206, 'cancer', 'skin change, cough, fatigue'),
(1207, 'diabetes', 'thirsty, weight loss, urinating'),
(1208, 'flu', 'runny nose, fever, headache'),
(1209, 'bronchitis', 'cough');

INSERT INTO medicine (medicine_id, name_medicine, description)
VALUES (1300, 'suprastin', 'allergy'),
(1301, 'favilavir', 'covid-19'),
(1302, 'vitamin E', 'pregnancy'),
(1303, 'ferronat', 'anemia'),
(1304, 'paracetamol', 'high temperature'),
(1305, 'ampilin', 'high lvl pressure'),
(1306, 'lesphil', 'kidney'),
(1307, 'pertussin', 'throat'),
(1308, 'mukaltin', 'cough'),
(1309, 'lazolvan', 'cough');

INSERT INTO appointment (appointment_id, app_date, app_time, description, employee_id, patient_id, method_healing_id, disease_id, medicine_id)
VALUES (1000, '2019-02-01', '10:15', 'free', 100, 500, NULL, NULL, NULL),
(1001, '2020-06-25', '12:00', 'free', 105, 501, 1101, 1200, 1301),
(1002, '2020-05-01', '15:45', 'free', 106, 502, 1106, 1200, 1301),
(1004, '2019-12-05', '09:00', 'free', 113, 504, NULL, 1202, NULL),
(1005, '2019-07-22', '17:30', 'free', 115, 505, NULL, NULL, NULL),
(1006, '2020-03-05', '16:45', 'free', 121, 506, 1102, 1203, NULL),
(1008, '2020-05-03', '16:15', '2400', 127, 508, 1107, 1200, 1301),
(1010, '2020-01-08', '11:15', '3000', 130, 510, 1100, 1204, 1300),
(1011, '2019-04-23', '12:30', '2500', 133, 511, 1100, 1204, 1300), 
(1013, '2020-06-10', '17:15', '2600', 140, 513, 1108, 1200, 1301),
(1014, '2019-11-23', '11:00', '3300', 143, 514, NULL, NULL, NULL), 
(1016, '2019-06-30', '09:15', 'free', 150, 516, NULL, NULL, NULL),
(1017, '2019-08-29', '12:15', 'free', 148, 517, 1100, 1205, 1303), 
(1018, '2020-04-01', '08:30', 'free', 155, 518, 1103, 1201, 1302), 
(1019, '2019-09-11', '11:45', 'free', 158, 519, NULL, NULL, NULL);
