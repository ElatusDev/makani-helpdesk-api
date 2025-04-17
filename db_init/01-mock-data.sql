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
   INSERT INTO email_recipients (email_id, recipients) VALUES
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
   INSERT INTO email_attachments (email_id, attachments) VALUES
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

   -- Data for schedule (10 rows)
   INSERT INTO schedule (schedule_day, start_time, end_time) VALUES
   ('Monday', '10:00:00', '12:00:00'),
   ('Tuesday', '14:00:00', '16:00:00'),
   ('Wednesday', '18:00:00', '20:00:00'),
   ('Thursday', '10:00:00', '12:00:00'),
   ('Friday', '14:00:00', '16:00:00'),
   ('Saturday', '10:00:00', '12:00:00'),
   ('Monday', '14:00:00', '16:00:00'),
   ('Tuesday', '18:00:00', '20:00:00'),
   ('Wednesday', '10:00:00', '12:00:00'),
   ('Thursday', '14:00:00', '16:00:00');

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
   INSERT INTO internal_auth (username_token, password_token) VALUES
   ('user1', 'pass1'),
   ('user2', 'pass2'),
   ('user3', 'pass3'),
   ('user4', 'pass4'),
   ('user5', 'pass5'),
   ('user6', 'pass6'),
   ('user7', 'pass7'),
   ('user8', 'pass8'),
   ('user9', 'pass9'),
   ('user10', 'pass10');

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

   -- Data for employee (10 rows)
   INSERT INTO employee (first_name, last_name, email, phone, address, zip_code, employee_type, internal_auth_id, birthdate) VALUES
   ('Alice', 'Johnson', 'alice.j@example.com', '123-456-7890', '123 Main St', '12345', 'Full-time', 1, '1990-05-15'),
   ('Bob', 'Williams', 'bob.w@example.com', '987-654-3210', '456 Oak Ave', '54321', 'Part-time', 2, '1985-10-20'),
   ('Charlie', 'Brown', 'charlie.b@example.com', '111-222-3333', '789 Pine Ln', '67890', 'Contract', 3, '1992-08-01'),
   ('David', 'Davis', 'david.d@example.com', '444-555-6666', '101 Elm St', '13579', 'Full-time', 4, '1988-02-28'),
   ('Emily', 'Wilson', 'emily.w@example.com', '777-888-9999', '202 Maple Dr', '97531', 'Part-time', 5, '1995-11-10'),
   ('Frank', 'Miller', 'frank.m@example.com', '123-987-4560', '321 Cedar Rd', '24680', 'Contract', 6, '1991-07-05'),
   ('Grace', 'Moore', 'grace.m@example.com', '456-123-7890', '654 Willow Ct', '80201', 'Full-time', 7, '1987-04-12'),
   ('Henry', 'Taylor', 'henry.t@example.com', '789-456-3210', '987 Birch St', '30309', 'Part-time', 8, '1993-09-22'),
   ('Ivy', 'Anderson', 'ivy.a@example.com', '111-999-2222', '111 Spruce Ave', '10001', 'Contract', 9, '1996-06-30'),
   ('Jack', 'Thomas', 'jack.t@example.com', '222-333-4444', '222 Oakwood Blvd', '20002', 'Full-time', 10, '1989-01-18');

   -- Data for collaborator (10 rows)
   INSERT INTO collaborator (first_name, last_name, email, phone, address, zip_code, internal_auth_id, skills, profile_picture, compensation_id, birthdate) VALUES
   ('Karen', 'White', 'karen.w@example.com', '333-444-5555', '333 Pinecrest Ln', '33333', 1, 'Painting, Drawing', NULL, 1, '1980-03-25'),
   ('Liam', 'Hall', 'liam.h@example.com', '444-333-2222', '444 River Rd', '44444', 2, 'Sculpture', NULL, 2, '1976-11-08'),
   ('Mia', 'Young', 'mia.y@example.com', '555-666-7777', '555 Lakeview Dr', '55555', 3, 'Digital Art, Animation', NULL, 3, '1983-09-18'),
   ('Noah', 'King', 'noah.k@example.com', '666-555-4444', '666 Forest Ave', '66666', 4, 'Photography', NULL, 4, '1979-06-12'),
   ('Olivia', 'Wright', 'olivia.w@example.com', '777-111-2222', '777 Hilltop Ct', '77777', 5, 'Creative Writing', NULL, 5, '1985-02-03'),
   ('Peter', 'Green', 'peter.g@example.com', '888-222-3333', '888 Meadow Ln', '88888', 6, 'Music Theory', NULL, 6, '1981-12-21'),
   ('Quinn', 'Adams', 'quinn.a@example.com', '999-333-1111', '999 Valley Rd', '99999', 7, 'Dance', NULL, 7, '1986-10-09'),
   ('Ryan', 'Nelson', 'ryan.n@example.com', '101-202-3030', '101 Mountain View', '10101', 8, 'Acting', NULL, 8, '1982-08-16'),
   ('Sophia', 'Carter', 'sophia.c@example.com', '202-303-4040', '202 Sunset Blvd', '20202', 9, 'Graphic Design', NULL, 9, '1987-05-04'),
   ('Thomas', 'Roberts', 'thomas.r@example.com', '303-404-5050', '303 Ocean Dr', '30303', 10, 'Web Development', NULL, 10, '1984-01-11');

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

   -- Data for course_schedule (Multiple rows per course)
   INSERT INTO course_schedule (course_id, schedule_id) VALUES
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

   -- Data for adult_student (10 rows)
   INSERT INTO adult_student (adult_student_id, first_name, last_name, email, phone, address, zip_code, customer_auth_id, profile_picture, birthdate) VALUES
   (1, 'Ava', 'Rodriguez', 'ava.r@example.com', '111-111-1111', '111 Pine St', '11111', 1, NULL, '1998-07-15'),
   (2, 'Bryan', 'Garcia', 'bryan.g@example.com', '222-222-2222', '222 Oak Ave', '22222', 2, NULL, '1997-03-20'),
   (3, 'Catherine', 'Lopez', 'catherine.l@example.com', '333-333-3333', '333 Elm St', '33333', 3, NULL, '1999-12-10'),
   (4, 'Daniel', 'Hernandez', 'daniel.h@example.com', '444-444-4444', '444 Maple Ave', '44444', 4, NULL, '1996-09-05'),
   (5, 'Elizabeth', 'Young', 'elizabeth.y@example.com', '555-555-5555', '555 Pinecrest Dr', '55555', 5, NULL, '1998-05-01'),
   (6, 'Gabriel', 'Allen', 'gabriel.a@example.com', '666-666-6666', '666 Riverview Rd', '66666', 6, NULL, '1997-01-22'),
   (7, 'Hannah', 'Sanchez', 'hannah.s@example.com', '777-777-7777', '777 Lakeside Ln', '77777', 7, NULL, '1999-09-14'),
   (8, 'Isaac', 'Morris', 'isaac.m@example.com', '888-888-8888', '888 Forest Hills', '88888', 8, NULL, '1996-04-08'),
   (9, 'Jasmine', 'Nguyen', 'jasmine.n@example.com', '999-999-9999', '999 Meadowbrook Dr', '99999', 9, NULL, '1998-11-28'),
   (10, 'Kevin', 'Bell', 'kevin.b@example.com', '100-100-1000', '100 Sunset Ter', '10000', 10, NULL, '1997-08-17');

   -- Data for tutor (10 rows)
   INSERT INTO tutor (tutor_id, first_name, last_name, email, phone, address, zip_code, customer_auth_id, birthdate) VALUES
   (1, 'Lily', 'Mitchell', 'lily.m@example.com', '123-123-1234', '111 Cherry St', '11122', 1, '1975-01-10'),
   (2, 'Mason', 'Perez', 'mason.p@example.com', '234-234-2345', '222 Birch Ave', '22233', 2, '1974-05-15'),
   (3, 'Nora', 'Roberts', 'nora.r@example.com', '345-345-6789', '333 Cedar Ln', '33344', 3, '1977-09-20'),
   (4, 'Owen', 'Turner', 'owen.t@example.com', '456-456-4567', '444 Dogwood Dr', '44455', 4, '1973-03-01'),
   (5, 'Penelope', 'Phillips', 'penelope.p@example.com', '567-567-5678', '555 Elmwood Ct', '55566', 5, '1976-07-06'),
   (6, 'Theodore', 'Campbell', 'theodore.c@example.com', '678-678-6789', '666 Fern Rd', '66677', 6, '1979-11-11'),
   (7, 'Uma', 'Parker', 'uma.p@example.com', '789-789-7890', '777 Grove Ave', '77788', 7, '1972-04-16'),
   (8, 'Victor', 'Evans', 'victor.e@example.com', '890-890-8901', '888 Hickory St', '88899', 8, '1975-08-21'),
   (9, 'Willow', 'Collins', 'willow.c@example.com', '901-901-9012', '999 Ivy Ln', '99900', 9, '1978-12-26'),
   (10, 'Xavier', 'Stewart', 'xavier.s@example.com', '012-012-0123', '100 Juniper Dr', '10011', 10, '1973-06-01');

   -- Data for minor_student (10 rows)
   INSERT INTO minor_student (minor_student_id, first_name, last_name, email, phone, address, zip_code, customer_auth_id, tutor_id, profile_picture, birthdate) VALUES
   (1, 'Alice', 'Smith', 'alice.s@example.com', '123-123-4567', '123 Cherry Ln', '12301', 1, 1, NULL, '2008-02-15'),
   (2, 'Bob', 'Jones', 'bob.j@example.com', '234-234-5678', '234 Oak Rd', '23402', 2, 2, NULL, '2007-06-20'),
   (3, 'Charlie', 'Davis', 'charlie.d@example.com', '345-345-6789', '345 Pine Ave', '34503', 3, 3, NULL, '2009-10-25'),
   (4, 'David', 'Wilson', 'david.w@example.com', '456-456-7890', '456 Elm St', '45604', 4, 4, NULL, '2006-01-30'),
   (5, 'Emily', 'Garcia', 'emily.g@example.com', '567-567-8901', '567 Maple Ln', '56705', 5, 5, NULL, '2008-05-05'),
   (6, 'Frank', 'Rodriguez', 'frank.r@example.com', '678-678-9012', '678 Willow Rd', '67806', 6, 6, NULL, '2007-09-10'),
   (7, 'Grace', 'Martinez', 'grace.m@example.com', '789-789-0123', '789 Cedar Ave', '78907', 7, 7, NULL, '2009-01-15'),
   (8, 'Henry', 'Anderson', 'henry.a@example.com', '890-890-1234', '890 Birch Ln', '89008', 8, 8, NULL, '2006-04-20'),
   (9, 'Ivy', 'Thomas', 'ivy.t@example.com', '901-901-2345', '901 Hickory Rd', '90109', 9, 9, NULL, '2008-08-25'),
   (10, 'Jack', 'Jackson', 'jack.j@example.com', '012-012-3456', '012 Oak St', '01210', 10, 10, NULL, '2007-12-30');

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
