USE makani_db;

CREATE TABLE store_product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL UNIQUE,
    description VARCHAR(500),
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL
);

CREATE TABLE card_payment_info (
  card_payment_info_id INT AUTO_INCREMENT PRIMARY KEY,
  payment_id BIGINT NOT NULL,
  token TEXT NOT NULL,
  card_type VARCHAR(20) NOT NULL
);

CREATE TABLE email (
    email_id INT AUTO_INCREMENT PRIMARY KEY,
    subject VARCHAR(255) NOT NULL,
    body TEXT NOT NULL,
    sender VARCHAR(255) NOT NULL
);

CREATE TABLE email_recipients (
    email_recipient_id INT AUTO_INCREMENT PRIMARY KEY,
    email_id INT NOT NULL,
    recipient_email VARCHAR(255) NOT NULL,
    FOREIGN KEY (email_id) REFERENCES email(email_id)
);

CREATE TABLE email_attachments (
    email_attachment_id INT AUTO_INCREMENT PRIMARY KEY,
    email_id INT NOT NULL,
    attachment_url VARCHAR(500) NOT NULL,
    FOREIGN KEY (email_id) REFERENCES email(email_id)
);

CREATE TABLE course (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    course_description VARCHAR(500) NOT NULL,
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
    provider VARCHAR(50) NOT NULL,
    token TEXT NOT NULL
);

CREATE TABLE internal_auth (
    internal_auth_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    role VARCHAR(50) NOT NULL
);

CREATE TABLE compensation (
    compensation_id INT AUTO_INCREMENT PRIMARY KEY,
    compensation_type VARCHAR(50) NOT NULL,
    amount DECIMAL(15, 2) NOT NULL
);

CREATE TABLE person_pii (
    person_pii_id INT AUTO_INCREMENT PRIMARY KEY,

    -- Encrypted PII fields (assuming Base64 encoded string storage for VARBINARY data)
    -- VARCHAR(500) chosen for robust length, explained below.
    encrypted_full_name VARCHAR(500),
    encrypted_phone_number VARCHAR(500),
    encrypted_email VARCHAR(500),
    encrypted_address_line1 VARCHAR(500),
    encrypted_address_line2 VARCHAR(500),
    encrypted_city VARCHAR(255),
    encrypted_state VARCHAR(255),
    encrypted_zip_code VARCHAR(100),
    encrypted_country VARCHAR(255),

    -- Hash fields only for uniqueness (email and phone)
    phone_number_hash VARCHAR(64) NOT NULL UNIQUE,
    email_hash VARCHAR(64) NOT NULL UNIQUE,

    -- No full_name_hash or address_hash as they are not needed for uniqueness checks
    -- or direct lookups based on your updated requirement.

    INDEX idx_pii_phone_hash (phone_number_hash),
    INDEX idx_pii_email_hash (email_hash)
);

CREATE TABLE employee (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_type VARCHAR(50) NOT NULL,
    birthdate DATE NOT NULL,
    internal_auth_id INT NOT NULL UNIQUE,
    person_pii_id INT NOT NULL UNIQUE,
    FOREIGN KEY (person_pii_id) REFERENCES person_pii(person_pii_id),
    FOREIGN KEY (internal_auth_id) REFERENCES internal_auth(internal_auth_id)
);

CREATE TABLE store_transaction (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    transaction_datetime DATETIME NOT NULL,
    transaction_type VARCHAR(50) NOT NULL,
    total_amount DECIMAL(15, 2) NOT NULL,
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
    internal_auth_id INT NOT NULL UNIQUE,
    encrypted_profile_picture MEDIUMBLOB,
    birthdate DATE NOT NULL,
    person_pii_id INT NOT NULL UNIQUE,
    FOREIGN KEY (person_pii_id) REFERENCES person_pii(person_pii_id),
    FOREIGN KEY (internal_auth_id) REFERENCES internal_auth(internal_auth_id)
);

CREATE TABLE membership (
    membership_id INT AUTO_INCREMENT PRIMARY KEY,
    membership_type VARCHAR(50) NOT NULL,
    fee DECIMAL(10, 2) NOT NULL,
    description VARCHAR(255) NOT NULL
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
    customer_auth_id INT NOT NULL UNIQUE,
    birthdate DATE NOT NULL,
    profile_picture MEDIUMBLOB,
    person_pii_id INT NOT NULL UNIQUE,
    FOREIGN KEY (person_pii_id) REFERENCES person_pii(person_pii_id),
    FOREIGN KEY (customer_auth_id) REFERENCES customer_auth(customer_auth_id)
);

CREATE TABLE tutor (
    tutor_id INT AUTO_INCREMENT PRIMARY KEY,
    person_pii_id INT NOT NULL UNIQUE,
    customer_auth_id INT UNIQUE,
    FOREIGN KEY (person_pii_id) REFERENCES person_pii(person_pii_id),
    FOREIGN KEY (customer_auth_id) REFERENCES customer_auth(customer_auth_id)
);

CREATE TABLE minor_student (
    minor_student_id INT AUTO_INCREMENT PRIMARY KEY,
    birthdate DATE NOT NULL,
    profile_picture MEDIUMBLOB,
    customer_auth_id INT NOT NULL UNIQUE,
    tutor_id INT NOT NULL,
    person_pii_id INT NOT NULL UNIQUE,
    FOREIGN KEY (person_pii_id) REFERENCES person_pii(person_pii_id),
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
    event_title VARCHAR(100) NOT NULL,
    event_description VARCHAR(500) NOT NULL,
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
    course_id INT,
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
    course_id INT,
    FOREIGN KEY (membership_id) REFERENCES membership(membership_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    FOREIGN KEY (tutor_id) REFERENCES tutor(tutor_id)
);

CREATE TABLE payment_adult_student (
    payment_adult_student_id INT AUTO_INCREMENT PRIMARY KEY,
    payment_date DATE NOT NULL,
    amount DECIMAL(15, 2) NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    membership_adult_student_id INT NOT NULL,
    FOREIGN KEY (membership_adult_student_id) REFERENCES membership_adult_student(membership_adult_student_id)
);

CREATE TABLE payment_tutor (
    payment_tutor_id INT AUTO_INCREMENT PRIMARY KEY,
    payment_date DATE NOT NULL,
    amount DECIMAL(15, 2) NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    membership_tutor_id INT NOT NULL,
    FOREIGN KEY (membership_tutor_id) REFERENCES membership_tutor(membership_tutor_id)
);

CREATE TABLE course_event_adult_attendees (
    course_event_id INT NOT NULL,
    adult_student_id INT NOT NULL,
    PRIMARY KEY (course_event_id, adult_student_id),
    FOREIGN KEY (course_event_id) REFERENCES course_event(course_event_id),
    FOREIGN KEY (adult_student_id) REFERENCES adult_student(adult_student_id)
);

CREATE TABLE course_event_minor_attendees (
    course_event_id INT NOT NULL,
    minor_student_id INT NOT NULL,
    PRIMARY KEY (course_event_id, minor_student_id),
    FOREIGN KEY (course_event_id) REFERENCES course_event(course_event_id),
    FOREIGN KEY (minor_student_id) REFERENCES minor_student(minor_student_id)
);

CREATE TABLE membership_course (
    membership_id INT NOT NULL,
    course_id INT NOT NULL,
    FOREIGN KEY (membership_id) REFERENCES membership(membership_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    PRIMARY KEY (membership_id, course_id)
);