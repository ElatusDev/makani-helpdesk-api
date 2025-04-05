-- Create the user and grant permissions
CREATE USER IF NOT EXISTS 'dev'@'%' IDENTIFIED BY 'ringo1522';
GRANT ALL PRIVILEGES ON makani_db.* TO 'dev'@'%';
FLUSH PRIVILEGES;

DROP SCHEMA IF EXISTS makani_db;
CREATE SCHEMA makani_db;
USE makani_db;

CREATE TABLE email (
    email_id INT AUTO_INCREMENT PRIMARY KEY,
    subject VARCHAR(100) NOT NULL,
    body TEXT NOT NULL,
    sender VARCHAR(50) NOT NULL
);

CREATE TABLE email_recipients (
    email_id INT NOT NULL,
    recipients VARCHAR(255),
    FOREIGN KEY (email_id) REFERENCES email(email_id)
);

CREATE TABLE email_attachments (
    email_id INT NOT NULL,
    attachments VARCHAR(255),
    FOREIGN KEY (email_id) REFERENCES email(email_id)
);

CREATE TABLE course (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(50) NOT NULL,
    course_description VARCHAR(200) NOT NULL,
    max_capacity INT NOT NULL
);

CREATE TABLE schedule (
    schedule_id INT AUTO_INCREMENT PRIMARY KEY,
    schedule_day VARCHAR(9) NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL
);

CREATE TABLE customer_auth (
    customer_auth_id INT AUTO_INCREMENT PRIMARY KEY,
    provider VARCHAR(9) NOT NULL,
    token TEXT NOT NULL
);

CREATE TABLE employee_auth (
    employee_auth_id INT AUTO_INCREMENT PRIMARY KEY,
    username_token TEXT NOT NULL,
    password_token TEXT NOT NULL
);

CREATE TABLE compensation (
    compensation_id INT AUTO_INCREMENT PRIMARY KEY,
    compensation_type VARCHAR(10) NOT NULL,
    amount DOUBLE NOT NULL
);

CREATE TABLE employee (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    address VARCHAR(100) NOT NULL,
    zip_code VARCHAR(5) NOT NULL,
    employee_type VARCHAR(30) NOT NULL,
    employee_auth_id INT NOT NULL,
    birthdate DATE NOT NULL,
    FOREIGN KEY (employee_auth_id) REFERENCES employee_auth(employee_auth_id)
);

CREATE TABLE instructor (
    instructor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    address VARCHAR(100) NOT NULL,
    zip_code VARCHAR(5) NOT NULL,
    customer_auth_id INT NOT NULL,
    skills VARCHAR(100),
    profile_picture MEDIUMBLOB,
    employee_auth_id INT NOT NULL,
    compensation_id INT NOT NULL,
    birthdate DATE NOT NULL,
    FOREIGN KEY (customer_auth_id) REFERENCES customer_auth(customer_auth_id),
    FOREIGN KEY (employee_auth_id) REFERENCES employee_auth(employee_auth_id),
    FOREIGN KEY (compensation_id) REFERENCES compensation(compensation_id)
);

CREATE TABLE membership (
    membership_id INT AUTO_INCREMENT PRIMARY KEY,
    membership_type VARCHAR(10) NOT NULL,
    fee DOUBLE NOT NULL,
    description VARCHAR(100) NOT NULL,
    course_id INT,
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

CREATE TABLE course_schedule (
    course_id INT NOT NULL,
    schedule_id INT NOT NULL,
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    FOREIGN KEY (schedule_id) REFERENCES schedule(schedule_id),
    PRIMARY KEY (course_id, schedule_id)
);

CREATE TABLE course_available_instructors (
    course_id INT NOT NULL,
    instructor_id INT NOT NULL,
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    FOREIGN KEY (instructor_id) REFERENCES instructor(instructor_id),
    PRIMARY KEY (course_id, instructor_id)
);

CREATE TABLE adult_student (
    adult_student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    address VARCHAR(100) NOT NULL,
    zip_code VARCHAR(5) NOT NULL,
    customer_auth_id INT NOT NULL,
    pay_info_id INT,
    profile_picture MEDIUMBLOB,
    birthdate DATE NOT NULL,
    FOREIGN KEY (customer_auth_id) REFERENCES customer_auth(customer_auth_id),
    FOREIGN KEY (pay_info_id) REFERENCES pay_info(pay_info_id)
);

CREATE TABLE tutor (
    tutor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    address VARCHAR(100) NOT NULL,
    zip_code VARCHAR(5) NOT NULL,
    customer_auth_id INT NOT NULL,
    pay_info_id INT,
    birthdate DATE NOT NULL,
    FOREIGN KEY (customer_auth_id) REFERENCES customer_auth(customer_auth_id),
    FOREIGN KEY (pay_info_id) REFERENCES pay_info(pay_info_id)
);

CREATE TABLE minor_student (
    minor_student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    address VARCHAR(100) NOT NULL,
    zip_code VARCHAR(5) NOT NULL,
    customer_auth_id INT NOT NULL,
    tutor_id INT NOT NULL,
    profile_picture MEDIUMBLOB,
    birthdate DATE NOT NULL,
    FOREIGN KEY (customer_auth_id) REFERENCES customer_auth(customer_auth_id),
    FOREIGN KEY (tutor_id) REFERENCES tutor(tutor_id)
);

CREATE TABLE adult_student_course (
    adult_student_id INT NOT NULL,
    course_id INT NOT NULL,
    FOREIGN KEY (adult_student_id) REFERENCES adult_student(adult_student_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    PRIMARY KEY (adult_student_id, course_id)
);

CREATE TABLE minor_student_course (
    minor_student_id INT NOT NULL,
    course_id INT NOT NULL,
    FOREIGN KEY (minor_student_id) REFERENCES minor_student(minor_student_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    PRIMARY KEY (minor_student_id, course_id)
);

CREATE TABLE calendar_event (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    event_date DATE NOT NULL,
    event_title VARCHAR(50) NOT NULL,
    event_description VARCHAR(200) NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    course_id INT NOT NULL,
    instructor_id INT NOT NULL,
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    FOREIGN KEY (instructor_id) REFERENCES instructor(instructor_id)
);

CREATE TABLE payment_adult_student (
    payment_adult_student_id INT AUTO_INCREMENT PRIMARY KEY,
    payment_date DATE NOT NULL,
    amount DOUBLE NOT NULL,
    payment_method VARCHAR(25) NOT NULL,
    membership_id INT,
    adult_student_id INT,
    FOREIGN KEY (membership_id) REFERENCES membership(membership_id),
    FOREIGN KEY (adult_student_id) REFERENCES adult_student(adult_student_id)
);

CREATE TABLE payment_tutor (
    payment_tutor_id INT AUTO_INCREMENT PRIMARY KEY,
    payment_date TIMESTAMP NOT NULL,
    amount DOUBLE NOT NULL,
    payment_method VARCHAR(25) NOT NULL,
    membership_id INT,
    tutor_id INT,
    FOREIGN KEY (membership_id) REFERENCES membership(membership_id),
    FOREIGN KEY (tutor_id) REFERENCES tutor(tutor_id)
);

CREATE TABLE membership_adult_student (
    membership_adult_student_id INT AUTO_INCREMENT PRIMARY KEY,
    membership_id INT NOT NULL,
    adult_student_id INT NOT NULL,
    start_date DATE NOT NULL,
    due_date DATE NOT NULL,
    FOREIGN KEY (membership_id) REFERENCES membership(membership_id),
    FOREIGN KEY (adult_student_id) REFERENCES adult_student(adult_student_id)
);

CREATE TABLE membership_tutor (
    membership_tutor_id INT AUTO_INCREMENT PRIMARY KEY,
    membership_id INT NOT NULL,
    tutor_id INT NOT NULL,
    start_date DATE NOT NULL,
    due_date DATE NOT NULL,
    FOREIGN KEY (membership_id) REFERENCES membership(membership_id),
    FOREIGN KEY (tutor_id) REFERENCES tutor(tutor_id)
);

CREATE TABLE event_attendees (
    event_id INT NOT NULL,
    adult_student_id INT,
    minor_student_id INT,
    FOREIGN KEY (event_id) REFERENCES calendar_event(event_id),
    FOREIGN KEY (adult_student_id) REFERENCES adult_student(adult_student_id),
    FOREIGN KEY (minor_student_id) REFERENCES minor_student(minor_student_id),
    PRIMARY KEY (event_id, adult_student_id, minor_student_id)
);
