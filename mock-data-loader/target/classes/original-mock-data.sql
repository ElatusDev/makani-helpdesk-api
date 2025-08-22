USE makani_db;

   -- Data for email (10 rows)
   INSERT INTO email (subject, body, sender) VALUES
   ('Meeting Reminder', 'Don''t forget our meeting tomorrow.', 'john.doe@example.com'),
   ('Project Update', 'Here''s the latest project update.', 'jane.smith@example.com'),
   ('Welcome to Our Academy', 'We''re excited to have you!', 'info@makani.com'),
   ('Course Schedule', 'Your course schedule is attached.', 'courses@makani.com'),
   ('Invoice', 'Please find your invoice attached.', 'billing@makani.com'),
   ('Feedback Request', 'We value your feedback.', 'support@makani.com'),
   ('Holiday Announcement', 'Academy closed for the holidays.', 'admin@makani.com'),
   ('Performance Reminder', 'Your performance is due today', 'payroll@makani.com'),
   ('Presentation Reminder', 'Your presentation is due today', 'courses@makani.com'),
   ('End of Course Presentation', 'End of course presentation', 'courses@makani.com');

   -- Data for email_recipients (Multiple rows per email)
   INSERT INTO email_recipients (email_id, recipient_email) VALUES
   (1, 'team@example.com'),
   (1, 'boss@example.com'),
   (2, 'clients@example.com'),
   (3, 'newstudent@example.com'),
   (4, 'student1@example.com'),
   (4, 'student2@example.com'),
   (5, 'customer1@example.com'),
   (6, 'user1@example.com'),
   (7, 'allstaff@example.com'),
   (8, 'instructor1@example.com'),
   (9, 'student3@example.com'),
   (10, 'student4@example.com');

   -- Data for email_attachments (Multiple rows per email)
   INSERT INTO email_attachments (email_id, attachment_url) VALUES
   (4, 'schedule.pdf'),
   (5, 'invoice.pdf'),
   (7, 'holiday_schedule.pdf'),
   (8, 'performance.pdf'),
   (9, 'presentation.pdf'),
   (10, 'end_of_course_presentation.pdf');

   -- Data for course (10 rows)
   INSERT INTO course (course_name, course_description, max_capacity) VALUES
   ('Painting 101', 'Introduction to painting techniques.', 20),
   ('Sculpture Basics', 'Learn the fundamentals of sculpture.', 15),
   ('Digital Art', 'Creating art with digital tools.', 25),
   ('Photography', 'Introduction to photography.', 12),
   ('Creative Writing', 'Writing course.', 20),
   ('Music Theory', 'Music course', 25),
   ('Dance', 'Dance course', 25),
   ('Acting', 'Acting course', 25),
   ('Graphic Design', 'Graphic Design course', 25),
   ('Web Development', 'Web Development course', 25);

  INSERT INTO schedule (schedule_day, start_time, end_time, course_id) VALUES
  -- Monday - Pre-assigned to Courses 1-6
  ('Monday', '08:00:00', '10:00:00', NULL),  -- Course 1
  ('Monday', '10:00:00', '12:00:00', NULL),  -- Course 2
  ('Monday', '12:00:00', '14:00:00', 3),  -- Course 3
  ('Monday', '16:00:00', '18:00:00', 4),  -- Course 4
  ('Monday', '18:00:00', '20:00:00', 5),  -- Course 5
  ('Monday', '20:00:00', '22:00:00', NULL),  -- Course 6

  -- Tuesday - Pre-assigned to Courses 7-10 (first 4 slots)
  ('Tuesday', '08:00:00', '10:00:00', 7),  -- Course 7
  ('Tuesday', '10:00:00', '12:00:00', NULL),  -- Course 8
  ('Tuesday', '12:00:00', '14:00:00', 9),  -- Course 9
  ('Tuesday', '16:00:00', '18:00:00', NULL), -- Course 10

  -- Tuesday - Remaining slots (unassigned)
  ('Tuesday', '18:00:00', '20:00:00', NULL),
  ('Tuesday', '20:00:00', '22:00:00', NULL),

  -- Wednesday - All unassigned
  ('Wednesday', '08:00:00', '10:00:00', NULL),
  ('Wednesday', '10:00:00', '12:00:00', 2),
  ('Wednesday', '12:00:00', '14:00:00', NULL),
  ('Wednesday', '16:00:00', '18:00:00', NULL),
  ('Wednesday', '18:00:00', '20:00:00', NULL),
  ('Wednesday', '20:00:00', '22:00:00', 6),

  -- Thursday - All unassigned
  ('Thursday', '08:00:00', '10:00:00', NULL),
  ('Thursday', '10:00:00', '12:00:00', NULL),
  ('Thursday', '12:00:00', '14:00:00', NULL),
  ('Thursday', '16:00:00', '18:00:00', 8),
  ('Thursday', '18:00:00', '20:00:00', NULL),
  ('Thursday', '20:00:00', '22:00:00', NULL),

  -- Friday - All unassigned
  ('Friday', '08:00:00', '10:00:00', NULL),
  ('Friday', '10:00:00', '12:00:00', NULL),
  ('Friday', '12:00:00', '14:00:00', NULL),
  ('Friday', '16:00:00', '18:00:00', NULL),
  ('Friday', '18:00:00', '20:00:00', NULL),
  ('Friday', '20:00:00', '22:00:00', 10),

  -- Saturday - All unassigned
  ('Saturday', '08:00:00', '10:00:00', 1),
  ('Saturday', '10:00:00', '12:00:00', NULL),
  ('Saturday', '12:00:00', '14:00:00', NULL);

   -- Data for customer_auth (10 rows)
   INSERT INTO customer_auth (provider, token) VALUES
   ('Google', 'google_token_1'),
   ('Facebook', 'facebook_token_2'),
   ('Email', 'email_token_3'),
   ('Google', 'google_token_4'),
   ('Facebook', 'facebook_token_5'),
   ('Email', 'email_token_6'),
   ('Google', 'google_token_7'),
   ('Facebook', 'facebook_token_8'),
   ('Email', 'email_token_9'),
   ('Google', 'google_token_10');

   -- Data for internal_auth (10 rows)
   INSERT INTO internal_auth (username_token, password_token, role) VALUES
   ('user1', 'pass1', 'ADMIN'),
   ('user2', 'pass2', 'USER'),
   ('user3', 'pass3', 'CSR'),
   ('user4', 'pass4', 'COLLABORATOR'),
   ('user5', 'pass5', 'PRINCIPAL'),
   ('user6', 'pass6', 'USER'),
   ('user7', 'pass7', 'COLLABORATOR'),
   ('user8', 'pass8', 'CSR'),
   ('user9', 'pass9', 'USER'),
   ('user10', 'pass10', 'COLLABORATOR');

   -- Data for compensation (10 rows)
   INSERT INTO compensation (compensation_type, amount) VALUES
   ('Hourly', 25.00),
   ('Salary', 50000.00),
   ('Commission', 0.10),
   ('Hourly', 30.00),
   ('Salary', 60000.00),
   ('Commission', 0.12),
   ('Hourly', 28.00),
   ('Salary', 55000.00),
   ('Commission', 0.08),
   ('Hourly', 22.00);

   -- -----------------------------------------------------------------------------
   -- Data for `employee` table - with UNIQUE emails and phones
   -- -----------------------------------------------------------------------------
   INSERT INTO employee (first_name, last_name, email, phone, address, zip_code, employee_type, internal_auth_id, birthdate) VALUES
   ('Alice', 'Johnson', 'alice.j@example.com', '3312345678', '123 Main St', '45000', 'Full-time', 1, '1990-05-15'),
   ('Bob', 'Williams', 'bob.w@example.com', '3323456789', '456 Oak Ave', '45100', 'Part-time', 2, '1985-10-20'),
   ('Charlie', 'Brown', 'charlie.b@example.com', '3334567891', '789 Pine Ln', '45200', 'Contract', 3, '1992-08-01'),
   ('David', 'Davis', 'david.d@example.com', '3345678901', '101 Elm St', '45300', 'Full-time', 4, '1988-02-28'),
   ('Emily', 'Wilson', 'emily.w@example.com', '3356789012', '202 Maple Dr', '45400', 'Part-time', 5, '1995-11-10'),
   ('Frank', 'Miller', 'frank.m@example.com', '3367890123', '321 Cedar Rd', '45500', 'Contract', 6, '1991-07-05'),
   ('Grace', 'Moore', 'grace.m@example.com', '3378901234', '654 Willow Ct', '45600', 'Full-time', 7, '1987-04-12'),
   ('Henry', 'Taylor', 'henry.t@example.com', '3389012345', '987 Birch St', '45700', 'Part-time', 8, '1993-09-22'),
   ('Ivy', 'Anderson', 'ivy.a@example.com', '3390123456', '111 Spruce Ave', '45800', 'Contract', 9, '1996-06-30'),
   ('Jack', 'Thomas', 'jack.t@example.com', '3301234567', '222 Oakwood Blvd', '45900', 'Full-time', 10, '1989-01-18');

   -- -----------------------------------------------------------------------------
   -- Data for `collaborator` table - with UNIQUE emails and phones
   -- -----------------------------------------------------------------------------
   INSERT INTO collaborator (first_name, last_name, email, phone, address, zip_code, internal_auth_id, skills, profile_picture, birthdate) VALUES
   ('Karen', 'White', 'karen.w@example.com', '3311122233', '333 Pinecrest Ln', '46000', 1, 'Painting, Drawing', NULL, '1980-03-25'),
   ('Liam', 'Hall', 'liam.h@example.com', '3322233344', '46100', '444 River Rd', '46100', 2, 'Sculpture', NULL, '1976-11-08'),
   ('Mia', 'Young', 'mia.y@example.com', '3333344455', '555 Lakeview Dr', '46200', 3, 'Digital Art, Animation', NULL, '1983-09-18'),
   ('Noah', 'King', 'noah.k@example.com', '3344455566', '666 Forest Ave', '46300', 4, 'Photography', NULL, '1979-06-12'),
   ('Olivia', 'Wright', 'olivia.w@example.com', '3355566677', '777 Hilltop Ct', '46400', 5, 'Creative Writing', NULL, '1985-02-03'),
   ('Peter', 'Green', 'peter.g@example.com', '3366677788', '888 Meadow Ln', '46500', 6, 'Music Theory', NULL, '1981-12-21'),
   ('Quinn', 'Adams', 'quinn.a@example.com', '3377788899', '999 Valley Rd', '46600', 7, 'Dance', NULL, '1986-10-09'),
   ('Ryan', 'Nelson', 'ryan.n@example.com', '3388899900', '101 Mountain View', '46700', 8, 'Acting', NULL, '1982-08-16'),
   ('Sophia', 'Carter', 'sophia.c@example.com', '3399900011', '202 Sunset Blvd', '46800', 9, 'Graphic Design', NULL, '1987-05-04'),
   ('Thomas', 'Roberts', 'thomas.r@example.com', '3300011122', '303 Ocean Dr', '46900', 10, 'Web Development', NULL, '1984-01-11');
   --
   -- DML for `adult_student` table - with UNIQUE emails and phones
   --
   INSERT INTO adult_student (first_name, last_name, email, phone, address, zip_code, customer_auth_id, profile_picture, birthdate) VALUES
   ('Ava', 'Rodriguez', 'ava.r@example.com', '3311111111', '111 Pine St', '44000', 1, NULL, '1998-07-15'),
   ('Bryan', 'Garcia', 'bryan.g@example.com', '3322222222', '222 Oak Ave', '44100', 2, NULL, '1997-03-20'),
   ('Catherine', 'Lopez', 'catherine.l@example.com', '3333333333', '333 Elm St', '44200', 3, NULL, '1999-12-10'),
   ('Daniel', 'Hernandez', 'daniel.h@example.com', '3344444444', '444 Maple Ave', '44300', 4, NULL, '1996-09-05'),
   ('Elizabeth', 'Young', 'elizabeth.y@example.com', '3355555555', '555 Pinecrest Dr', '44400', 5, NULL, '1998-05-01'),
   ('Gabriel', 'Allen', 'gabriel.a@example.com', '3366666666', '666 Riverview Rd', '44500', 6, NULL, '1997-01-22'),
   ('Hannah', 'Sanchez', 'hannah.s@example.com', '3377777777', '777 Lakeside Ln', '44600', 7, NULL, '1999-09-14'),
   ('Isaac', 'Morris', 'isaac.m@example.com', '3388888888', '888 Forest Hills', '44700', 8, NULL, '1996-04-08'),
   ('Jasmine', 'Nguyen', 'jasmine.n@example.com', '3399999999', '999 Meadowbrook Dr', '44800', 9, NULL, '1998-11-28'),
   ('Kevin', 'Bell', 'kevin.b@example.com', '3300000000', '100 Sunset Ter', '44900', 10, NULL, '1997-08-17');

   -- -----------------------------------------------------------------------------
   -- Data for `tutor` table - with UNIQUE emails and phones
   --
   INSERT INTO tutor (first_name, last_name, email, phone, customer_auth_id, birthdate) VALUES
   ('Liam', 'Baker', 'liam.baker@example.com', '3312223333', 1, '1985-01-15'),
   ('Olivia', 'Clark', 'olivia.c@example.com', '3323334444', 2, '1990-03-22'),
   ('Noah', 'Davis', 'noah.d@example.com', '3334445555', 3, '1978-07-01'),
   ('Emma', 'Evans', 'emma.e@example.com', '3345556666', 4, '1995-09-11'),
   ('Jackson', 'Foster', 'jackson.f@example.com', '3356667777', 5, '1982-12-05'),
   ('Sophia', 'Green', 'sophia.g@example.com', '3367778888', 6, '1988-02-28'),
   ('Aiden', 'Hill', 'aiden.h@example.com', '3378889999', 7, '1975-04-18'),
   ('Ava', 'King', 'ava.k@example.com', '3389990000', 8, '1998-06-30'),
   ('Lucas', 'Lewis', 'lucas.l@example.com', '3390001111', 9, '1983-10-09'),
   ('Mia', 'Moore', 'mia.m@example.com', '3301112222', 10, '1991-08-25');

   -- -----------------------------------------------------------------------------
   -- Data for `minor_student` table - with UNIQUE emails and phones
   --
   INSERT INTO minor_student (first_name, last_name, email, phone, address, zip_code, customer_auth_id, tutor_id, profile_picture, birthdate) VALUES
   ('Alice', 'Smith', 'alice.s@example.com', '3312345670', '123 Cherry Ln', '45001', 1, 1, NULL, '2008-02-15'),
   ('Bob', 'Jones', 'bob.j@example.com', '3323456780', '234 Oak Rd', '45002', 2, 2, NULL, '2007-06-20'),
   ('Charlie', 'Davis', 'charlie.d@example.com', '3334567890', '345 Pine Ave', '45003', 3, 3, NULL, '2009-10-25'),
   ('David', 'Wilson', 'david.w@example.com', '3345678901', '456 Elm St', '45004', 4, 4, NULL, '2006-01-30'),
   ('Emily', 'Garcia', 'emily.g@example.com', '3356789012', '567 Maple Ln', '45005', 5, 5, NULL, '2008-05-05'),
   ('Frank', 'Rodriguez', 'frank.r@example.com', '3367890123', '678 Willow Rd', '45006', 6, 6, NULL, '2007-09-10'),
   ('Grace', 'Martinez', 'grace.m@example.com', '3378901234', '789 Cedar Ave', '45007', 7, 7, NULL, '2009-01-15'),
   ('Henry', 'Anderson', 'henry.a@example.com', '3389012345', '890 Birch Ln', '45008', 8, 8, NULL, '2006-04-20'),
   ('Ivy', 'Thomas', 'ivy.t@example.com', '3390123456', '901 Hickory Rd', '45009', 9, 9, NULL, '2008-08-25'),
   ('Jack', 'Jackson', 'jack.j@example.com', '3301234567', '012 Oak St', '45010', 10, 10, NULL, '2007-12-30');

   -- Data for membership (10 rows)
   INSERT INTO membership (membership_id, membership_type, fee, description) VALUES
   (1, 'Basic', 20.00, 'Access to one course.'),
   (2, 'Standard', 50.00, 'Access to three courses.'),
   (3, 'Premium', 100.00, 'Unlimited course access.'),
   (4, 'Monthly', 30.00, 'Monthly access to courses.'),
   (5, 'Annual', 300.00, 'Annual access to courses.'),
   (6, 'Student', 15.00, 'Discounted student membership.'),
   (7, 'Family', 75.00, 'Membership for up to four family members.'),
   (8, 'Trial', 0.00, 'Free trial membership.'),
   (9, 'Gold', 200.00, 'Gold membership'),
   (10, 'Silver', 100.00, 'Silver membership');

   -- Data for course_available_collaborators (Multiple rows per course)
   INSERT INTO course_available_collaborators (course_id, collaborator_id) VALUES
   (1, 1), (1, 2),
   (2, 2), (2, 3),
   (3, 3), (3, 4),
   (4, 4), (4, 5),
   (5, 5), (5, 6),
   (6, 6), (6, 7),
   (7, 7), (7, 8),
   (8, 8), (8, 9),
   (9, 9), (9, 10),
   (10, 10), (10, 1);

   -- Data for adult_student_course (Multiple rows per student)
   INSERT INTO adult_student_course (adult_student_id, course_id) VALUES
   (1, 1), (1, 2),
   (2, 2), (2, 3),
   (3, 3), (3, 4),
   (4, 4), (4, 5),
   (5, 5), (5, 6),
   (6, 6), (6, 7),
   (7, 7), (7, 8),
   (8, 8), (8, 9),
   (9, 9), (9, 10),
   (10, 10), (10, 1);

   -- Data for minor_student_course (Multiple rows per student)
   INSERT INTO minor_student_course (minor_student_id, course_id) VALUES
   (1, 1), (1, 3),
   (2, 2), (2, 4),
   (3, 3), (3, 5),
   (4, 4), (4, 6),
   (5, 5), (5, 7),
   (6, 6), (6, 8),
   (7, 7), (7, 9),
   (8, 8), (8, 10),
   (9, 9), (9, 1),
   (10, 10), (10, 2);

   -- Data for course_event (10 rows)
   INSERT INTO course_event (course_event_id, course_id, collaborator_id, schedule_id, event_date, event_title, event_description) VALUES
   (1, 1, 1, 1, '2025-05-01', 'Painting Workshop', 'A workshop on oil painting techniques.'),
   (2, 2, 2, 2, '2025-05-08', 'Sculpture Exhibition', 'Exhibition of student sculptures.'),
   (3, 3, 3, 3, '2025-05-15', 'Digital Art Showcase', 'Showcase of digital artwork.'),
   (4, 4, 4, 4, '2025-05-22', 'Photography Walk', 'Outdoor photography session.'),
   (5, 5, 5, 5, '2025-05-29', 'Writing Contest', 'Creative writing competition.'),
   (6, 6, 6, 6, '2025-06-05', 'Music Festival', 'Music festival'),
   (7, 7, 7, 7, '2025-06-12', 'Dance Festival', 'Dance festival'),
   (8, 8, 8, 8, '2025-06-19', 'Acting Presentation', 'Acting presentation'),
   (9, 9, 9, 9, '2025-06-26', 'Graphic Design Presentation', 'Graphic Design presentation'),
   (10, 10, 10, 10, '2025-07-03', 'Web Development Presentation', 'Web Development presentation');

   -- Data for membership_adult_student (10 rows)
   INSERT INTO membership_adult_student (membership_adult_student_id, membership_id, adult_student_id, start_date, due_date, course_id) VALUES
   (1, 1, 1, '2025-04-20', '2025-05-20', 1),
   (2, 2, 2, '2025-04-20', '2025-05-20', 2),
   (3, 3, 3, '2025-04-20', '2025-05-20', 3),
   (4, 4, 4, '2025-04-20', '2025-05-20', 4),
   (5, 5, 5, '2025-04-20', '2025-05-20', 5),
   (6, 6, 6, '2025-04-20', '2025-05-20', 6),
   (7, 7, 7, '2025-04-20', '2025-05-20', 7),
   (8, 8, 8, '2025-04-20', '2025-05-20', 8),
   (9, 9, 9, '2025-04-20', '2025-05-20', 9),
   (10, 10, 10, '2025-04-20', '2025-05-20', 10);

   -- Data for membership_tutor (10 rows)
   INSERT INTO membership_tutor (membership_tutor_id, membership_id, tutor_id, start_date, due_date, course_id) VALUES
   (1, 1, 1, '2025-04-20', '2025-05-20', 1),
   (2, 2, 2, '2025-04-20', '2025-05-20', 2),
   (3, 3, 3, '2025-04-20', '2025-05-20', 3),
   (4, 4, 4, '2025-04-20', '2025-05-20', 4),
   (5, 5, 5, '2025-04-20', '2025-05-20', 5),
   (6, 6, 6, '2025-04-20', '2025-05-20', 6),
   (7, 7, 7, '2025-04-20', '2025-05-20', 7),
   (8, 8, 8, '2025-04-20', '2025-05-20', 8),
   (9, 9, 9, '2025-04-20', '2025-05-20', 9),
   (10, 10, 10, '2025-04-20', '2025-05-20', 10);

   -- Data for payment_adult_student (10 rows)
   INSERT INTO payment_adult_student (payment_adult_student_id, payment_date, amount, payment_method, membership_adult_student_id) VALUES
   (1, '2025-04-25', 20.00, 'Credit Card', 1),
   (2, '2025-04-25', 50.00, 'PayPal', 2),
   (3, '2025-04-25', 100.00, 'Cash', 3),
   (4, '2025-04-25', 30.00, 'Credit Card', 4),
   (5, '2025-04-25', 300.00, 'PayPal', 5),
   (6, '2025-04-25', 15.00, 'Cash', 6),
   (7, '2025-04-25', 75.00, 'Credit Card', 7),
   (8, '2025-04-25', 0.00, 'PayPal', 8),
   (9, '2025-04-25', 200.00, 'Cash', 9),
   (10, '2025-04-25', 100.00, 'Credit Card', 10);

   -- Data for payment_tutor (10 rows)
   INSERT INTO payment_tutor (payment_tutor_id, payment_date, amount, payment_method, membership_tutor_id) VALUES
   (1, '2025-04-30', 25.00, 'Direct Deposit', 1),
   (2, '2025-05-30', 50.00, 'Check', 2),
   (3, '2025-06-30', 75.00, 'Direct Deposit', 3),
   (4, '2025-04-30', 100.00, 'Check', 4),
   (5, '2025-04-30', 125.00, 'Direct Deposit', 5),
   (6, '2025-09-30', 150.00, 'Check', 6),
   (7, '2025-01-30', 175.00, 'Direct Deposit', 7),
   (8, '2025-10-30', 175.00, 'Check', 8),
   (9, '2025-01-30', 275.00, 'Direct Deposit', 9),
   (10, '2025-10-30', 475.00, 'Check', 10);