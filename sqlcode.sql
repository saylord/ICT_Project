CREATE TABLE organization (
	organization_id INT PRIMARY KEY,
	description VARCHAR(32) --(гос, частная)
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
	phone_number INT,
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
	phone_number INT,
	hospital_id INT,
	FOREIGN KEY (hospital_id) REFERENCES hospital (hospital_id)
);

CREATE TABLE position (
	position_id INT PRIMARY KEY,
	post VARCHAR(50), --(кем работает)
	employee_id INT,
	FOREIGN KEY (employee_id) REFERENCES employee (employee_id)
);

CREATE TABLE patient (
	patient_id INT PRIMARY KEY,
	pat_name VARCHAR(32),
	pat_surn VARCHAR(32),
	birth_date DATE,
	gender VARCHAR(12),
	iin INT,
	address VARCHAR(100),
	hospital_id INT,
	FOREIGN KEY (hospital_id) REFERENCES hospital (hospital_id)
);

CREATE TABLE pat_info (
	pat_info_id INT PRIMARY KEY,
	current_health VARCHAR(32), --(здоровый или нет)
	description VARCHAR(100), --(что беспокоит)
	blood_type INT,
	lvl_pressure VARCHAR(32),
	lvl_blood VARCHAR(32), --(можно еще дополнительно)
	patient_id INT,
	FOREIGN KEY (patient_id) REFERENCES patient (patient_id)
);

CREATE TABLE appointment (
	appointment_id INT PRIMARY KEY,
	app_date DATE,
	app_time VARCHAR(10),
	description VARCHAR(64), --(выоздоровел или нетб что было на приеме)
	employee_id INT,
	patient_id INT,
	FOREIGN KEY (employee_id) REFERENCES employee (employee_id),
	FOREIGN KEY (patient_id) REFERENCES patient (patient_id)
);

CREATE TABLE method_healing (
	method_healing_id INT PRIMARY KEY,
	address_hospital VARCHAR(100),
	duration VARCHAR(32), --(сколько будет лежать в больнице)
	room INT,
	appointment_id INT,
	FOREIGN KEY (appointment_id) REFERENCES appointment (appointment_id)
);

CREATE TABLE floor_hospital (
	floor_id INT PRIMARY KEY,
	description VARCHAR(32), --(какой этаж для каких болезней)
	method_healing_id INT,
	FOREIGN KEY (method_healing_id) REFERENCES method_healing (method_healing_id)
);

CREATE TABLE disease (
	disease_id INT PRIMARY KEY,
	name_disease VARCHAR(32), --(болезнь)
	description VARCHAR(32), --(что включает эта болезнь, какие симптомы)
	appointment_id INT,
	FOREIGN KEY (appointment_id) REFERENCES appointment (appointment_id)
);

CREATE TABLE medicine (
	medicine_id INT PRIMARY KEY,
	name_medicine VARCHAR(64),
	description VARCHAR(100), --(про препарат, место где сделано)
	appointment_id INT,
	FOREIGN KEY (appointment_id) REFERENCES appointment (appointment_id)
);
