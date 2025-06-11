DROP SCHEMA IF EXISTS makani_db;
CREATE SCHEMA makani_db;
USE makani_db;



CREATE TABLE store_product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL UNIQUE,
    description VARCHAR(60),
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL
);

CREATE TABLE card_payment_info (
  card_payment_info_id INT AUTO_INCREMENT PRIMARY KEY,
  payment_id BIGINT NOT NULL,
  token TEXT NOT NULL,
  card_type VARCHAR(7) NOT NULL
);

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
    end_time TIME NOT NULL,
    course_id INT NOT NULL,
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

CREATE TABLE customer_auth (
    customer_auth_id INT AUTO_INCREMENT PRIMARY KEY,
    provider VARCHAR(9) NOT NULL,
    token TEXT NOT NULL
);

CREATE TABLE internal_auth (
    internal_auth_id INT AUTO_INCREMENT PRIMARY KEY,
    username_token TEXT NOT NULL,
    password_token TEXT NOT NULL,
    role VARCHAR(50) NOT NULL
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
    email VARCHAR(50) NOT NULL UNIQUE,
    phone VARCHAR(20) NOT NULL UNIQUE,
    address VARCHAR(100) NOT NULL,
    zip_code VARCHAR(5) NOT NULL,
    employee_type VARCHAR(30) NOT NULL,
    internal_auth_id INT NOT NULL,
    birthdate DATE NOT NULL,
    FOREIGN KEY (internal_auth_id) REFERENCES internal_auth(internal_auth_id)
);

CREATE TABLE store_transaction (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    transaction_datetime DATETIME NOT NULL,
    transaction_type VARCHAR(30) NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    employee_id INT,
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id)
);

CREATE TABLE store_sale_item (
    sale_item_id INT AUTO_INCREMENT PRIMARY KEY,
    transaction_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price_at_sale DECIMAL(10, 2) NOT NULL,
    item_total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (transaction_id) REFERENCES store_transaction(transaction_id),
    FOREIGN KEY (product_id) REFERENCES store_product(product_id)
);

CREATE TABLE collaborator (
    collaborator_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    phone VARCHAR(20) NOT NULL UNIQUE,
    address VARCHAR(100) NOT NULL,
    zip_code VARCHAR(5) NOT NULL,
    internal_auth_id INT NOT NULL,
    skills VARCHAR(100),
    profile_picture MEDIUMBLOB,
    birthdate DATE NOT NULL,
    FOREIGN KEY (internal_auth_id) REFERENCES internal_auth(internal_auth_id)
);

CREATE TABLE membership (
    membership_id INT AUTO_INCREMENT PRIMARY KEY,
    membership_type VARCHAR(10) NOT NULL,
    fee DOUBLE NOT NULL,
    description VARCHAR(100) NOT NULL
);

CREATE TABLE course_available_collaborators (
    course_id INT NOT NULL,
    collaborator_id INT NOT NULL,
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    FOREIGN KEY (collaborator_id) REFERENCES collaborator(collaborator_id),
    PRIMARY KEY (course_id, collaborator_id)
);

CREATE TABLE adult_student (
    adult_student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    phone VARCHAR(20) NOT NULL UNIQUE,
    address VARCHAR(100) NOT NULL,
    zip_code VARCHAR(5) NOT NULL,
    customer_auth_id INT NOT NULL,
    profile_picture MEDIUMBLOB,
    birthdate DATE NOT NULL,
    FOREIGN KEY (customer_auth_id) REFERENCES customer_auth(customer_auth_id)
);

CREATE TABLE tutor (
    tutor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    email VARCHAR(50) UNIQUE,
    phone VARCHAR(15) NOT NULL UNIQUE,
    customer_auth_id INT,
    FOREIGN KEY (customer_auth_id) REFERENCES customer_auth(customer_auth_id)
);

CREATE TABLE minor_student (
    minor_student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    phone VARCHAR(20) NOT NULL UNIQUE,
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

CREATE TABLE course_event (
    course_event_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT NOT NULL,
    collaborator_id INT NOT NULL,
    schedule_id INT NOT NULL,
    event_date DATE NOT NULL,
    event_title VARCHAR(50) NOT NULL,
    event_description VARCHAR(200) NOT NULL,
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    FOREIGN KEY (collaborator_id) REFERENCES collaborator(collaborator_id),
    FOREIGN KEY (schedule_id) REFERENCES schedule(schedule_id)
);

CREATE TABLE membership_adult_student (
    membership_adult_student_id INT AUTO_INCREMENT PRIMARY KEY,
    membership_id INT NOT NULL,
    adult_student_id INT NOT NULL,
    start_date DATE NOT NULL,
    due_date DATE NOT NULL,
    course_id INT NOT NULL,
    FOREIGN KEY (membership_id) REFERENCES membership(membership_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    FOREIGN KEY (adult_student_id) REFERENCES adult_student(adult_student_id)
);

CREATE TABLE membership_tutor (
    membership_tutor_id INT AUTO_INCREMENT PRIMARY KEY,
    membership_id INT NOT NULL,
    tutor_id INT NOT NULL,
    start_date DATE NOT NULL,
    due_date DATE NOT NULL,
    course_id INT NOT NULL,
    FOREIGN KEY (membership_id) REFERENCES membership(membership_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    FOREIGN KEY (tutor_id) REFERENCES tutor(tutor_id)
);

CREATE TABLE payment_adult_student (
    payment_adult_student_id INT AUTO_INCREMENT PRIMARY KEY,
    payment_date DATE NOT NULL,
    amount DOUBLE NOT NULL,
    payment_method VARCHAR(25) NOT NULL,
    membership_adult_student_id INT NOT NULL,
    FOREIGN KEY (membership_adult_student_id) REFERENCES membership_adult_student(membership_adult_student_id)
);

CREATE TABLE payment_tutor (
    payment_tutor_id INT AUTO_INCREMENT PRIMARY KEY,
    payment_date DATE NOT NULL,
    amount DOUBLE NOT NULL,
    payment_method VARCHAR(25) NOT NULL,
    membership_tutor_id INT NOT NULL,
    FOREIGN KEY (membership_tutor_id) REFERENCES membership_tutor(membership_tutor_id)
);

CREATE TABLE course_event_attendees (
    course_event_id INT NOT NULL,
    adult_student_id INT NOT NULL,
    minor_student_id INT NOT NULL,
    FOREIGN KEY (course_event_id) REFERENCES course_event(course_event_id),
    FOREIGN KEY (adult_student_id) REFERENCES adult_student(adult_student_id),
    FOREIGN KEY (minor_student_id) REFERENCES minor_student(minor_student_id),
    PRIMARY KEY (course_event_id, adult_student_id, minor_student_id)
);

CREATE TABLE membership_course (
    membership_id INT NOT NULL,
    course_id INT NOT NULL,
    FOREIGN KEY (membership_id) REFERENCES membership(membership_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    PRIMARY KEY (membership_id, course_id)
);