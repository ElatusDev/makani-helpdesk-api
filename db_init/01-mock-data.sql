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
   -- Original data for internal_auth: 
-- INSERT INTO internal_auth (username_token, password_token, role) VALUES
--    ('user1', 'pass1', 'ADMIN';


INSERT INTO internal_auth (encrypted_username, encrypted_password, encrypted_role) VALUES ('[112, 100, 81, 98, 111, 47, 115, 103, 102, 110, 78, 82, 98, 107, 104, 81, 112, 73, 121, 57, 120, 98, 122, 69, 77, 87, 49, 119, 75, 86, 52, 114, 108, 88, 76, 50, 110, 47, 122, 116, 74, 70, 115, 51]', '[121, 54, 68, 73, 120, 100, 87, 72, 48, 102, 109, 100, 79, 56, 100, 69, 82, 104, 112, 81, 73, 66, 47, 77, 111, 43, 54, 69, 99, 79, 82, 56, 80, 77, 103, 74, 105, 74, 90, 87, 52, 72, 48, 54]', '[82, 76, 75, 76, 114, 74, 85, 67, 83, 56, 68, 120, 72, 113, 55, 99, 43, 51, 57, 100, 84, 83, 110, 105, 69, 78, 77, 114, 50, 54, 101, 84, 76, 52, 118, 98, 103, 100, 69, 47, 74, 116, 77, 121, 105, 81, 61, 61]');

-- Original data for internal_auth: 
-- INSERT INTO internal_auth (username_token, password_token, role) VALUES
--    ),
--    ('user2', 'pass2', 'USER';


INSERT INTO internal_auth (encrypted_username, encrypted_password, encrypted_role) VALUES ('[67, 122, 89, 108, 74, 101, 72, 43, 81, 110, 101, 81, 77, 55, 84, 122, 78, 47, 121, 100, 118, 48, 103, 121, 84, 84, 89, 51, 81, 70, 43, 50, 87, 115, 80, 56, 86, 65, 61, 61]', '[101, 109, 52, 103, 105, 87, 109, 109, 55, 50, 48, 52, 120, 89, 117, 56, 72, 77, 52, 104, 85, 86, 116, 77, 47, 78, 79, 66, 51, 106, 115, 104, 108, 69, 79, 73, 117, 70, 73, 56, 82, 101, 115, 75, 117, 74, 54, 70]', '[100, 85, 47, 83, 104, 90, 113, 55, 43, 122, 72, 56, 82, 77, 49, 49, 77, 119, 88, 108, 52, 57, 47, 109, 65, 87, 83, 90, 107, 68, 52, 84, 71, 108, 69, 80, 70, 81, 78, 53, 86, 47, 102, 52]');

-- Original data for internal_auth: 
-- INSERT INTO internal_auth (username_token, password_token, role) VALUES
--    ),
--    ('user3', 'pass3', 'CSR';


INSERT INTO internal_auth (encrypted_username, encrypted_password, encrypted_role) VALUES ('[122, 103, 122, 70, 71, 90, 74, 57, 86, 70, 102, 43, 87, 106, 66, 98, 81, 104, 119, 103, 113, 108, 86, 106, 69, 114, 57, 107, 97, 108, 98, 88, 85, 71, 66, 84, 52, 103, 61, 61]', '[48, 80, 110, 101, 55, 99, 50, 120, 75, 66, 102, 50, 71, 115, 115, 99, 72, 72, 90, 97, 100, 103, 103, 78, 115, 102, 107, 100, 84, 71, 102, 104, 109, 74, 81, 120, 82, 82, 88, 98, 113, 71, 111, 67, 88, 69, 118, 105]', '[82, 103, 99, 103, 114, 56, 83, 67, 69, 80, 110, 56, 75, 82, 84, 51, 48, 81, 107, 120, 82, 89, 102, 80, 118, 118, 109, 77, 54, 79, 102, 77, 102, 118, 87, 65, 55, 88, 108, 43, 83, 84, 66, 119]');

-- Original data for internal_auth: 
-- INSERT INTO internal_auth (username_token, password_token, role) VALUES
--    ),
--    ('user4', 'pass4', 'COLLABORATOR';


INSERT INTO internal_auth (encrypted_username, encrypted_password, encrypted_role) VALUES ('[120, 53, 51, 106, 78, 66, 57, 74, 82, 89, 52, 98, 70, 110, 56, 77, 84, 106, 85, 106, 72, 77, 101, 110, 89, 55, 57, 50, 74, 75, 88, 70, 83, 110, 52, 116, 117, 81, 61, 61]', '[72, 105, 80, 87, 119, 77, 52, 81, 90, 82, 50, 55, 53, 82, 106, 87, 66, 47, 84, 104, 106, 101, 83, 120, 111, 85, 85, 83, 115, 69, 97, 106, 117, 51, 88, 85, 57, 84, 108, 74, 111, 53, 65, 115, 51, 110, 66, 48]', '[76, 79, 107, 121, 109, 106, 87, 51, 118, 71, 121, 106, 120, 103, 114, 70, 98, 72, 99, 104, 78, 48, 49, 73, 80, 97, 80, 85, 85, 81, 72, 79, 77, 85, 104, 48, 76, 81, 105, 77, 50, 47, 86, 68]');

-- Original data for internal_auth: 
-- INSERT INTO internal_auth (username_token, password_token, role) VALUES
--    ),
--    ('user5', 'pass5', 'PRINCIPAL';


INSERT INTO internal_auth (encrypted_username, encrypted_password, encrypted_role) VALUES ('[120, 122, 111, 51, 111, 68, 56, 56, 43, 116, 74, 66, 87, 122, 48, 101, 68, 65, 114, 54, 102, 72, 43, 90, 54, 90, 88, 55, 90, 53, 43, 66, 116, 57, 85, 83, 111, 81, 61, 61]', '[83, 105, 78, 101, 106, 108, 89, 115, 83, 70, 117, 98, 110, 66, 86, 79, 78, 120, 103, 54, 101, 104, 90, 78, 78, 54, 69, 114, 47, 65, 112, 116, 79, 54, 107, 80, 122, 112, 116, 54, 122, 75, 57, 121, 97, 77, 54, 43]', '[43, 71, 52, 86, 79, 87, 71, 74, 120, 100, 57, 100, 101, 87, 103, 72, 119, 106, 122, 106, 114, 106, 98, 57, 98, 65, 47, 86, 110, 50, 99, 110, 52, 120, 48, 65, 109, 118, 76, 57, 71, 86, 79, 68]');

-- Original data for internal_auth: 
-- INSERT INTO internal_auth (username_token, password_token, role) VALUES
--    ),
--    ('user6', 'pass6', 'USER';


INSERT INTO internal_auth (encrypted_username, encrypted_password, encrypted_role) VALUES ('[116, 98, 50, 49, 47, 54, 84, 43, 105, 51, 68, 51, 71, 85, 117, 43, 118, 55, 51, 77, 107, 43, 50, 106, 55, 72, 56, 80, 52, 101, 71, 99, 79, 53, 80, 115, 70, 103, 61, 61]', '[81, 72, 105, 101, 105, 80, 97, 80, 65, 89, 66, 106, 76, 112, 49, 68, 117, 89, 74, 89, 106, 88, 108, 111, 105, 51, 100, 120, 107, 118, 110, 117, 71, 66, 79, 122, 83, 109, 48, 67, 47, 80, 72, 81, 118, 120, 113, 65]', '[110, 50, 84, 57, 110, 117, 67, 51, 57, 65, 121, 83, 111, 105, 101, 47, 78, 65, 83, 52, 48, 54, 54, 74, 43, 70, 121, 84, 89, 108, 98, 80, 43, 70, 81, 65, 120, 54, 66, 110, 99, 112, 70, 115]');

-- Original data for internal_auth: 
-- INSERT INTO internal_auth (username_token, password_token, role) VALUES
--    ),
--    ('user7', 'pass7', 'COLLABORATOR';


INSERT INTO internal_auth (encrypted_username, encrypted_password, encrypted_role) VALUES ('[53, 86, 87, 111, 68, 80, 121, 85, 56, 108, 120, 56, 57, 75, 120, 106, 89, 117, 73, 47, 86, 78, 120, 116, 82, 85, 68, 89, 90, 102, 48, 51, 75, 113, 110, 120, 53, 119, 61, 61]', '[114, 53, 47, 80, 116, 71, 78, 107, 56, 110, 103, 80, 67, 120, 84, 122, 74, 97, 103, 84, 109, 70, 86, 104, 80, 112, 68, 118, 73, 57, 80, 68, 77, 112, 109, 101, 84, 113, 79, 98, 105, 78, 106, 118, 66, 57, 71, 76]', '[109, 67, 97, 88, 84, 85, 76, 75, 106, 66, 110, 90, 50, 80, 76, 71, 55, 89, 113, 114, 118, 86, 111, 74, 104, 68, 84, 84, 121, 86, 112, 67, 103, 116, 56, 56, 51, 84, 117, 111, 119, 55, 71, 47]');

-- Original data for internal_auth: 
-- INSERT INTO internal_auth (username_token, password_token, role) VALUES
--    ),
--    ('user8', 'pass8', 'CSR';


INSERT INTO internal_auth (encrypted_username, encrypted_password, encrypted_role) VALUES ('[105, 57, 121, 65, 52, 69, 106, 78, 65, 74, 120, 85, 48, 120, 49, 51, 112, 98, 74, 47, 70, 108, 65, 71, 51, 50, 118, 55, 99, 49, 90, 84, 75, 84, 116, 75, 85, 119, 61, 61]', '[81, 115, 57, 86, 100, 122, 79, 112, 119, 103, 72, 89, 82, 82, 84, 97, 51, 49, 88, 88, 73, 68, 84, 121, 72, 106, 105, 51, 111, 108, 81, 43, 50, 82, 50, 74, 100, 56, 117, 119, 84, 65, 119, 87, 87, 51, 65, 76]', '[83, 90, 54, 119, 78, 54, 107, 121, 69, 111, 104, 43, 106, 77, 112, 65, 56, 119, 104, 119, 78, 56, 52, 67, 121, 86, 115, 118, 120, 101, 57, 86, 105, 57, 121, 65, 113, 117, 90, 69, 109, 54, 117, 88]');

-- Original data for internal_auth: 
-- INSERT INTO internal_auth (username_token, password_token, role) VALUES
--    ),
--    ('user9', 'pass9', 'USER';


INSERT INTO internal_auth (encrypted_username, encrypted_password, encrypted_role) VALUES ('[101, 116, 82, 57, 99, 55, 82, 70, 53, 99, 120, 50, 71, 53, 74, 113, 114, 77, 82, 114, 97, 76, 105, 89, 83, 53, 75, 81, 73, 50, 97, 122, 79, 86, 99, 79, 68, 119, 61, 61]', '[77, 103, 43, 103, 112, 83, 57, 67, 57, 51, 120, 106, 113, 71, 115, 120, 79, 73, 108, 87, 84, 79, 110, 49, 77, 83, 101, 57, 79, 118, 108, 119, 54, 57, 79, 69, 72, 55, 82, 120, 72, 106, 117, 50, 56, 87, 80, 109]', '[79, 81, 49, 76, 99, 70, 98, 118, 49, 122, 52, 100, 102, 121, 77, 77, 117, 109, 110, 106, 99, 56, 66, 109, 88, 74, 113, 108, 116, 84, 82, 81, 113, 75, 71, 100, 103, 105, 122, 83, 119, 112, 117, 65]');

-- Original data for internal_auth: 
-- INSERT INTO internal_auth (username_token, password_token, role) VALUES
--    ),
--    ('user10', 'pass10', 'COLLABORATOR';


INSERT INTO internal_auth (encrypted_username, encrypted_password, encrypted_role) VALUES ('[52, 84, 120, 76, 81, 67, 116, 78, 68, 48, 98, 65, 71, 85, 56, 116, 118, 122, 49, 86, 99, 56, 84, 99, 106, 74, 83, 81, 74, 49, 52, 122, 73, 107, 114, 83, 90, 103, 61, 61]', '[105, 80, 104, 71, 48, 69, 70, 89, 57, 111, 57, 116, 76, 121, 54, 80, 119, 103, 52, 88, 117, 106, 83, 70, 75, 121, 98, 110, 50, 89, 74, 105, 111, 89, 73, 48, 65, 52, 74, 86, 86, 100, 110, 77, 116, 120, 114, 48, 79, 103, 61, 61]', '[51, 71, 79, 114, 89, 75, 50, 69, 80, 47, 43, 56, 88, 78, 67, 75, 122, 82, 65, 69, 104, 54, 85, 119, 102, 108, 118, 89, 50, 81, 73, 71, 89, 77, 112, 82, 99, 107, 98, 112, 111, 97, 118, 90, 86, 119, 61, 61]');

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
   -- Original data for employee: 
-- INSERT INTO employee (first_name, last_name, email, phone, address, zip_code, employee_type, internal_auth_id, birthdate) VALUES
--    ('Alice', 'Johnson', 'alice.j@example.com', '3312345678', '123 Main St', '45000', 'Full-time', 1, '1990-05-15';


INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100000, '[76, 89, 116, 84, 112, 119, 107, 52, 99, 56, 55, 56, 76, 88, 51, 113, 115, 53, 50, 77, 69, 103, 75, 66, 55, 53, 65, 87, 107, 80, 100, 49, 90, 69, 50, 104, 49, 100, 79, 68, 83, 48, 119, 111]', '[98, 71, 108, 122, 106, 77, 88, 107, 88, 74, 53, 104, 76, 108, 108, 75, 76, 97, 80, 48, 110, 99, 121, 56, 83, 49, 114, 52, 43, 122, 118, 111, 99, 82, 55, 80, 87, 88, 47, 107, 122, 55, 66, 83, 48, 102, 73, 61]', '[104, 76, 79, 81, 118, 54, 118, 68, 110, 118, 112, 66, 108, 83, 88, 75, 110, 121, 77, 69, 89, 88, 106, 88, 90, 48, 66, 102, 113, 66, 77, 88, 79, 87, 102, 82, 97, 107, 112, 108, 70, 51, 102, 82, 116, 114, 113, 100, 97, 73, 99, 61]', '[112, 116, 85, 69, 100, 86, 111, 114, 115, 114, 115, 75, 117, 49, 54, 47, 102, 86, 117, 110, 114, 100, 79, 101, 43, 110, 108, 68, 88, 118, 101, 70, 105, 79, 89, 50, 90, 84, 120, 119, 80, 87, 88, 72, 72, 73, 53, 107, 119, 108, 111, 112, 73, 83, 107, 101, 100, 56, 110, 121, 122, 68, 81, 61]', '[119, 100, 81, 109, 114, 56, 88, 104, 78, 68, 100, 66, 99, 122, 100, 113, 121, 72, 87, 70, 88, 118, 43, 98, 105, 105, 113, 97, 52, 76, 72, 69, 65, 119, 51, 106, 83, 109, 82, 88, 102, 100, 84, 97, 115, 72, 111, 121, 83, 105, 53, 68]', '[85, 86, 107, 85, 103, 76, 73, 106, 114, 52, 87, 104, 68, 102, 68, 52, 113, 89, 121, 75, 55, 112, 82, 113, 86, 100, 80, 97, 110, 119, 99, 77, 87, 85, 48, 81, 121, 105, 70, 100, 84, 86, 52, 113]', '62091c05538b25e7b00cdd294780080aee9cd5b3aa352141cb9fd47f3e43702a', 'bdd0098e6e171a5778e2d04ad38bc204e9306ea6573b3c6a4f50ce905ed09d3f');
INSERT INTO employee (employee_type, birthdate, internal_auth_id, person_pii_id, created_at) VALUES ('Full-time', ''1990-05-15', 1, 100000, '2025-08-19 18:01:38');

-- Original data for employee: 
-- INSERT INTO employee (first_name, last_name, email, phone, address, zip_code, employee_type, internal_auth_id, birthdate) VALUES
--    ),
--    ('Bob', 'Williams', 'bob.w@example.com', '3323456789', '456 Oak Ave', '45100', 'Part-time', 2, '1985-10-20';


INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100001, '[98, 122, 47, 99, 118, 113, 76, 108, 108, 119, 111, 81, 102, 110, 51, 72, 53, 52, 69, 48, 117, 77, 101, 78, 115, 72, 119, 85, 114, 75, 71, 47, 118, 79, 79, 83, 122, 81, 61, 61]', '[82, 53, 82, 66, 72, 118, 83, 102, 75, 98, 75, 78, 110, 72, 89, 68, 108, 89, 82, 68, 122, 55, 106, 72, 105, 122, 71, 83, 110, 86, 53, 48, 110, 76, 102, 90, 110, 89, 114, 114, 83, 86, 97, 86, 111, 119, 61, 61]', '[98, 97, 53, 82, 85, 68, 100, 74, 117, 109, 114, 55, 110, 107, 78, 99, 55, 111, 117, 81, 81, 90, 112, 77, 106, 74, 120, 99, 106, 48, 115, 117, 103, 120, 110, 81, 47, 70, 111, 53, 100, 55, 56, 115, 72, 119, 86, 83, 86, 67, 50, 101, 119, 88, 49, 101, 101, 72, 52, 115]', '[113, 68, 118, 115, 77, 90, 80, 73, 80, 97, 65, 49, 51, 101, 105, 65, 56, 88, 68, 110, 88, 77, 84, 70, 51, 109, 116, 47, 81, 47, 97, 75, 106, 74, 56, 80, 98, 47, 122, 87, 51, 88, 53, 51, 76, 108, 117, 112]', '[55, 103, 50, 85, 69, 77, 77, 120, 113, 82, 69, 68, 55, 99, 79, 80, 89, 76, 79, 84, 101, 109, 43, 106, 75, 103, 69, 111, 112, 113, 114, 55, 101, 107, 75, 104, 82, 79, 115, 89, 107, 69, 116, 70, 108, 86, 81, 98, 110, 97, 65, 61]', '[90, 78, 51, 77, 83, 43, 98, 67, 121, 88, 52, 76, 90, 71, 75, 68, 75, 109, 54, 111, 77, 54, 79, 52, 86, 80, 57, 57, 109, 105, 85, 66, 49, 120, 69, 114, 118, 73, 114, 81, 67, 113, 66, 87, 78, 121, 51, 74, 105, 98, 87, 110]', '5b315f2353857961c96fd3bf37a34d57fa008ef971c10b86cf398bb11d8205ec', '6e8d8801f51aafe8426f8d95c75de8f3f404ccae62f116070ca643403484a243');
INSERT INTO employee (employee_type, birthdate, internal_auth_id, person_pii_id, created_at) VALUES ('45100', '2', 'Part-time', 100001, '2025-08-19 18:01:38');

-- Original data for employee: 
-- INSERT INTO employee (first_name, last_name, email, phone, address, zip_code, employee_type, internal_auth_id, birthdate) VALUES
--    ),
--    ('Charlie', 'Brown', 'charlie.b@example.com', '3334567891', '789 Pine Ln', '45200', 'Contract', 3, '1992-08-01';


INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100002, '[112, 56, 118, 86, 55, 114, 105, 115, 97, 121, 89, 56, 111, 88, 81, 102, 78, 99, 84, 54, 71, 118, 114, 73, 115, 117, 109, 116, 55, 74, 55, 56, 107, 55, 102, 90, 67, 81, 61, 61]', '[74, 48, 80, 81, 104, 55, 121, 57, 74, 83, 114, 106, 78, 107, 53, 79, 50, 104, 99, 106, 80, 117, 68, 117, 48, 101, 122, 74, 110, 71, 97, 118, 82, 77, 85, 78, 115, 55, 90, 43, 68, 118, 90, 52, 69, 43, 76, 122, 115, 43, 81, 61]', '[101, 50, 110, 57, 90, 88, 119, 82, 114, 80, 120, 70, 72, 110, 118, 104, 110, 108, 90, 68, 71, 86, 70, 73, 99, 111, 111, 50, 65, 107, 47, 72, 80, 111, 86, 83, 111, 76, 49, 85, 118, 54, 89, 50, 111, 101, 116, 49, 87, 111, 110, 86, 100, 79, 49, 99, 81, 88, 99, 80, 70, 109, 75, 51, 106, 119, 61, 61]', '[109, 109, 53, 98, 106, 81, 120, 55, 119, 70, 68, 121, 108, 43, 50, 78, 81, 86, 103, 56, 74, 111, 121, 51, 120, 103, 69, 102, 114, 107, 56, 79, 112, 83, 83, 69, 122, 99, 75, 49, 85, 80, 99, 109]', '[99, 99, 75, 67, 80, 66, 74, 87, 120, 108, 76, 83, 110, 81, 68, 53, 70, 122, 79, 117, 117, 54, 107, 98, 87, 80, 109, 104, 43, 84, 121, 112, 120, 102, 105, 102, 84, 49, 100, 52, 51, 118, 108, 72, 74, 104, 72, 116, 104, 99, 111, 61]', '[89, 50, 66, 54, 75, 99, 113, 98, 86, 83, 112, 116, 55, 100, 52, 76, 51, 53, 74, 52, 70, 53, 70, 103, 102, 116, 74, 76, 88, 122, 49, 74, 86, 97, 113, 109, 110, 97, 88, 43, 70, 108, 65, 49, 114, 50, 82, 102, 73, 121, 109, 56]', '0c8fdbeba950c8c54686e176b688453629696727af2285ecb2c51f478e99da68', '18f285592896ec8ead1b69d90ee4080300ba8dc31665a6ad97550c8f81b15502');
INSERT INTO employee (employee_type, birthdate, internal_auth_id, person_pii_id, created_at) VALUES ('45200', '3', 'Contract', 100002, '2025-08-19 18:01:38');

-- Original data for employee: 
-- INSERT INTO employee (first_name, last_name, email, phone, address, zip_code, employee_type, internal_auth_id, birthdate) VALUES
--    ),
--    ('David', 'Davis', 'david.d@example.com', '3345678901', '101 Elm St', '45300', 'Full-time', 4, '1988-02-28';


INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100003, '[53, 109, 117, 83, 48, 69, 99, 120, 107, 120, 116, 119, 85, 110, 86, 53, 43, 122, 118, 115, 50, 50, 109, 71, 114, 106, 104, 98, 56, 79, 117, 82, 55, 82, 51, 56, 53, 65, 61, 61]', '[112, 105, 80, 105, 116, 88, 47, 90, 100, 76, 66, 69, 54, 89, 82, 97, 53, 99, 118, 110, 54, 99, 89, 52, 55, 65, 113, 67, 100, 50, 79, 85, 106, 107, 81, 57, 121, 47, 119, 50, 51, 68, 74, 48, 89, 43, 106, 105]', '[99, 81, 76, 76, 74, 81, 118, 120, 50, 76, 103, 76, 87, 76, 88, 103, 113, 97, 110, 69, 116, 74, 77, 97, 81, 79, 110, 85, 104, 65, 103, 57, 57, 70, 54, 52, 103, 67, 99, 119, 87, 73, 83, 117, 106, 79, 88, 51, 47, 48, 122, 120, 117, 57, 117, 88, 81, 47, 113, 72, 121, 47, 85, 61]', '[114, 57, 79, 117, 117, 101, 87, 110, 47, 57, 66, 79, 68, 118, 121, 73, 113, 56, 55, 79, 73, 86, 67, 120, 52, 77, 85, 115, 55, 80, 110, 70, 43, 119, 120, 98, 104, 73, 55, 98, 107, 110, 113, 85]', '[47, 49, 55, 88, 51, 73, 100, 116, 120, 71, 43, 47, 122, 52, 55, 57, 105, 80, 49, 86, 74, 78, 85, 70, 89, 79, 47, 103, 103, 65, 43, 69, 79, 122, 72, 48, 78, 54, 97, 52, 119, 49, 77, 43, 73, 74, 113, 103, 115, 117, 103, 61]', '[89, 80, 120, 100, 72, 49, 82, 85, 48, 70, 73, 99, 69, 72, 53, 90, 81, 118, 88, 117, 55, 53, 122, 102, 54, 100, 110, 79, 105, 56, 87, 49, 109, 90, 53, 73, 110, 89, 55, 98, 122, 119, 114, 110, 70, 55, 89, 43, 122, 80, 52, 61]', '066a54be8e0d5472d7a2d9144a989518eaf0f6e9eac557c3cec1952bd26ef5c3', '683313d69084379711e47f9e23cc8d7a4cf1a3fac5b48a8b6c560232ef7619a6');
INSERT INTO employee (employee_type, birthdate, internal_auth_id, person_pii_id, created_at) VALUES ('45300', '4', 'Full-time', 100003, '2025-08-19 18:01:38');

-- Original data for employee: 
-- INSERT INTO employee (first_name, last_name, email, phone, address, zip_code, employee_type, internal_auth_id, birthdate) VALUES
--    ),
--    ('Emily', 'Wilson', 'emily.w@example.com', '3356789012', '202 Maple Dr', '45400', 'Part-time', 5, '1995-11-10';


INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100004, '[107, 97, 88, 114, 71, 85, 104, 117, 74, 47, 100, 107, 115, 79, 90, 82, 43, 47, 50, 114, 86, 43, 120, 66, 55, 122, 50, 51, 85, 107, 69, 69, 90, 121, 90, 52, 87, 103, 61, 61]', '[85, 116, 66, 70, 55, 117, 80, 79, 97, 111, 71, 74, 87, 105, 68, 108, 87, 51, 87, 50, 114, 71, 120, 73, 71, 98, 43, 68, 81, 102, 122, 50, 68, 99, 115, 87, 110, 56, 88, 69, 104, 82, 74, 69, 109, 85, 111, 102]', '[116, 50, 118, 56, 97, 108, 65, 80, 88, 55, 81, 110, 111, 90, 53, 119, 100, 98, 43, 112, 87, 117, 50, 72, 122, 49, 47, 101, 89, 121, 97, 107, 111, 101, 90, 112, 97, 109, 90, 109, 89, 119, 57, 47, 122, 119, 81, 97, 57, 90, 47, 101, 57, 110, 100, 77, 74, 55, 84, 66, 107, 71, 69, 61]', '[111, 81, 81, 112, 101, 116, 112, 57, 65, 105, 98, 117, 89, 74, 108, 119, 54, 112, 106, 90, 79, 118, 114, 78, 56, 102, 113, 78, 74, 74, 66, 81, 112, 113, 85, 50, 114, 110, 120, 67, 65, 85, 76, 50, 75, 103, 61, 61]', '[87, 122, 101, 55, 122, 114, 43, 78, 72, 113, 120, 117, 70, 86, 107, 84, 122, 109, 100, 68, 89, 115, 120, 104, 88, 112, 121, 110, 112, 111, 112, 70, 88, 71, 122, 67, 102, 54, 105, 75, 71, 67, 107, 48, 75, 80, 66, 81, 43, 80, 69, 61]', '[90, 120, 65, 88, 106, 78, 82, 68, 69, 97, 109, 100, 117, 97, 72, 54, 121, 78, 78, 65, 118, 88, 78, 112, 84, 75, 70, 87, 56, 49, 48, 102, 102, 43, 107, 76, 76, 90, 83, 116, 75, 55, 66, 106, 88, 43, 69, 86, 112, 87, 97, 110, 122, 81, 61, 61]', 'f805c848ff3a637a4b798c04efbe2d425ad242e14069869dd9cbf9ba80154183', 'fb7961d139e4da12af18c24571a166fb77c391a15abbf24d6ccf85186f441bbe');
INSERT INTO employee (employee_type, birthdate, internal_auth_id, person_pii_id, created_at) VALUES ('45400', '5', 'Part-time', 100004, '2025-08-19 18:01:38');

-- Original data for employee: 
-- INSERT INTO employee (first_name, last_name, email, phone, address, zip_code, employee_type, internal_auth_id, birthdate) VALUES
--    ),
--    ('Frank', 'Miller', 'frank.m@example.com', '3367890123', '321 Cedar Rd', '45500', 'Contract', 6, '1991-07-05';


INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100005, '[66, 104, 85, 89, 53, 86, 72, 111, 102, 67, 43, 117, 112, 49, 65, 51, 103, 69, 52, 66, 105, 57, 75, 77, 104, 85, 119, 118, 72, 83, 111, 77, 87, 100, 48, 55, 112, 103, 61, 61]', '[122, 49, 75, 105, 99, 120, 75, 108, 113, 113, 47, 112, 75, 75, 87, 106, 114, 99, 97, 115, 114, 104, 53, 52, 98, 79, 78, 77, 54, 81, 69, 52, 109, 100, 83, 120, 98, 52, 108, 51, 48, 102, 67, 83, 100, 78, 82, 88]', '[85, 88, 83, 121, 51, 114, 79, 75, 81, 69, 73, 78, 74, 50, 48, 110, 53, 69, 87, 108, 77, 98, 54, 48, 110, 57, 70, 109, 53, 111, 85, 118, 121, 83, 100, 47, 49, 83, 71, 66, 120, 98, 106, 72, 78, 43, 119, 105, 49, 116, 105, 53, 78, 90, 99, 77, 73, 76, 109, 119, 99, 104, 89, 61]', '[89, 47, 101, 65, 76, 112, 53, 109, 106, 100, 99, 65, 74, 77, 119, 77, 99, 70, 119, 118, 104, 85, 98, 107, 120, 111, 76, 97, 101, 102, 117, 48, 71, 99, 111, 84, 53, 67, 110, 52, 52, 54, 73, 70, 47, 65, 61, 61]', '[109, 122, 116, 104, 106, 50, 77, 98, 74, 84, 67, 79, 117, 82, 65, 115, 119, 107, 52, 116, 51, 82, 109, 43, 108, 48, 81, 68, 115, 70, 118, 71, 90, 85, 114, 49, 110, 72, 117, 107, 118, 83, 74, 114, 69, 53, 52, 73, 117, 98, 65, 61]', '[115, 84, 108, 71, 43, 77, 73, 85, 66, 83, 85, 115, 97, 74, 78, 57, 78, 122, 115, 74, 50, 69, 113, 116, 73, 82, 97, 115, 102, 83, 47, 85, 120, 56, 54, 119, 69, 121, 110, 118, 52, 81, 82, 65, 55, 103, 103, 71, 69, 77, 101, 121, 105, 119, 61, 61]', 'f607333a86522140652c7683d51e845bfc9c10a77a4561ea8f9cea4fbb3f8d46', '716545ea5827317b597b9f531b753bb931989bbe63df4307ef312fdb7374a154');
INSERT INTO employee (employee_type, birthdate, internal_auth_id, person_pii_id, created_at) VALUES ('45500', '6', 'Contract', 100005, '2025-08-19 18:01:38');

-- Original data for employee: 
-- INSERT INTO employee (first_name, last_name, email, phone, address, zip_code, employee_type, internal_auth_id, birthdate) VALUES
--    ),
--    ('Grace', 'Moore', 'grace.m@example.com', '3378901234', '654 Willow Ct', '45600', 'Full-time', 7, '1987-04-12';


INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100006, '[99, 51, 81, 83, 66, 49, 55, 87, 49, 109, 83, 122, 50, 75, 115, 121, 107, 89, 106, 79, 57, 106, 113, 51, 112, 119, 99, 75, 117, 79, 68, 69, 115, 98, 81, 73, 78, 119, 61, 61]', '[102, 121, 83, 51, 66, 85, 65, 54, 122, 57, 67, 79, 89, 87, 72, 121, 116, 73, 101, 75, 77, 65, 51, 120, 111, 48, 50, 121, 90, 118, 109, 55, 84, 122, 115, 87, 51, 56, 73, 98, 57, 112, 85, 56, 86, 75, 101, 50]', '[51, 52, 90, 54, 113, 114, 55, 116, 85, 52, 78, 52, 70, 103, 121, 82, 112, 74, 73, 52, 121, 89, 82, 55, 90, 66, 107, 85, 103, 106, 97, 85, 67, 72, 108, 113, 53, 80, 72, 102, 98, 74, 87, 84, 99, 54, 112, 50, 121, 111, 113, 118, 66, 88, 78, 84, 100, 97, 89, 57, 107, 76, 65, 61]', '[108, 48, 84, 49, 104, 110, 108, 81, 65, 117, 68, 118, 99, 66, 70, 114, 88, 99, 121, 89, 120, 71, 114, 114, 73, 105, 77, 107, 119, 109, 54, 106, 47, 54, 55, 68, 114, 121, 99, 80, 57, 53, 43, 57]', '[106, 86, 84, 84, 50, 101, 110, 82, 75, 70, 55, 49, 109, 121, 82, 73, 54, 103, 71, 106, 121, 113, 90, 74, 114, 71, 77, 101, 66, 119, 70, 103, 109, 112, 101, 77, 90, 73, 112, 115, 108, 102, 70, 83, 103, 101, 71, 74, 117, 82, 89, 61]', '[65, 85, 99, 110, 56, 71, 102, 118, 79, 82, 75, 120, 100, 55, 97, 117, 100, 50, 72, 100, 87, 90, 75, 66, 75, 68, 105, 103, 114, 88, 111, 83, 69, 86, 83, 66, 66, 87, 68, 112, 108, 67, 77, 109, 119, 55, 57, 104, 111, 119, 53, 110, 89, 76, 89, 61]', 'd0ab6ed1b6392484f51d9ad62ba17486aa0fc3abf566c13a35c29fa5ac440d53', '07724304d1fc4136ab5d671b6bac40d197c04299a4b714662077c82dac815c0f');
INSERT INTO employee (employee_type, birthdate, internal_auth_id, person_pii_id, created_at) VALUES ('45600', '7', 'Full-time', 100006, '2025-08-19 18:01:38');

-- Original data for employee: 
-- INSERT INTO employee (first_name, last_name, email, phone, address, zip_code, employee_type, internal_auth_id, birthdate) VALUES
--    ),
--    ('Henry', 'Taylor', 'henry.t@example.com', '3389012345', '987 Birch St', '45700', 'Part-time', 8, '1993-09-22';


INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100007, '[54, 115, 87, 114, 50, 56, 110, 122, 102, 103, 119, 104, 73, 74, 78, 115, 81, 99, 86, 78, 122, 50, 66, 100, 108, 74, 57, 119, 101, 74, 89, 73, 55, 82, 99, 121, 75, 65, 61, 61]', '[83, 69, 77, 71, 48, 57, 81, 114, 81, 65, 73, 67, 108, 73, 98, 102, 109, 108, 119, 50, 73, 112, 85, 104, 69, 104, 103, 104, 97, 112, 52, 113, 67, 120, 66, 78, 82, 118, 50, 119, 97, 115, 72, 68, 55, 56, 71, 83]', '[78, 104, 76, 113, 68, 107, 77, 88, 84, 84, 72, 110, 75, 73, 50, 84, 87, 103, 85, 76, 111, 90, 73, 71, 50, 112, 85, 89, 77, 56, 103, 65, 116, 73, 54, 97, 84, 66, 97, 81, 109, 85, 72, 77, 49, 76, 118, 71, 110, 47, 103, 74, 52, 49, 89, 50, 49, 100, 71, 109, 76, 79, 56, 61]', '[79, 71, 85, 109, 66, 106, 86, 104, 68, 99, 73, 110, 54, 106, 54, 76, 70, 113, 56, 79, 112, 104, 84, 98, 52, 69, 112, 75, 51, 76, 55, 68, 54, 80, 101, 53, 119, 88, 117, 85, 104, 57, 104, 66, 67, 119, 61, 61]', '[76, 74, 106, 77, 52, 90, 110, 69, 116, 86, 76, 72, 111, 57, 118, 74, 121, 52, 81, 109, 117, 80, 56, 77, 83, 82, 115, 120, 86, 80, 102, 81, 111, 47, 109, 105, 77, 112, 89, 71, 112, 54, 118, 116, 87, 50, 116, 99, 101, 89, 81, 61]', '[79, 99, 90, 81, 104, 57, 55, 51, 111, 70, 49, 115, 74, 99, 98, 84, 109, 97, 75, 56, 116, 107, 72, 101, 100, 69, 100, 72, 112, 87, 89, 121, 53, 47, 69, 90, 69, 51, 102, 83, 79, 67, 100, 110, 117, 78, 83, 81, 104, 120, 66, 47, 69, 103, 61, 61]', '520d2c818fd55dbb2cf339e3de979b66098448cd45c05b5bbae50b085e6c62b0', 'c2793b826cc96e7fe5bd695d00af187d2d9b5e4e0bfe7619c041d8f6f4972362');
INSERT INTO employee (employee_type, birthdate, internal_auth_id, person_pii_id, created_at) VALUES ('45700', '8', 'Part-time', 100007, '2025-08-19 18:01:38');

-- Original data for employee: 
-- INSERT INTO employee (first_name, last_name, email, phone, address, zip_code, employee_type, internal_auth_id, birthdate) VALUES
--    ),
--    ('Ivy', 'Anderson', 'ivy.a@example.com', '3390123456', '111 Spruce Ave', '45800', 'Contract', 9, '1996-06-30';


INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100008, '[119, 103, 68, 102, 68, 122, 49, 120, 100, 57, 111, 77, 102, 80, 109, 86, 77, 105, 102, 50, 54, 101, 109, 88, 113, 118, 71, 119, 82, 122, 119, 97, 53, 112, 87, 56, 50, 103, 61, 61]', '[104, 49, 117, 78, 57, 71, 105, 120, 121, 52, 47, 73, 118, 107, 100, 69, 118, 47, 80, 98, 116, 119, 78, 49, 79, 115, 90, 68, 76, 105, 54, 116, 121, 86, 98, 84, 88, 99, 71, 101, 108, 113, 53, 104, 83, 119, 61, 61]', '[86, 66, 81, 99, 48, 74, 117, 55, 52, 101, 49, 74, 85, 67, 66, 85, 117, 118, 98, 69, 114, 43, 116, 110, 83, 73, 52, 53, 78, 53, 113, 100, 111, 99, 113, 112, 121, 43, 118, 50, 89, 57, 55, 121, 118, 105, 107, 104, 66, 49, 57, 115, 55, 103, 100, 109, 101, 67, 86, 70]', '[77, 52, 86, 118, 78, 110, 65, 107, 76, 77, 48, 107, 52, 113, 80, 56, 118, 103, 66, 118, 121, 65, 56, 47, 101, 84, 51, 89, 99, 85, 122, 77, 119, 48, 107, 87, 56, 79, 79, 114, 72, 105, 47, 52, 49, 121, 69, 87]', '[104, 87, 53, 90, 110, 68, 100, 109, 80, 56, 74, 107, 52, 87, 78, 98, 99, 112, 99, 70, 79, 55, 70, 90, 100, 97, 49, 110, 67, 117, 119, 72, 65, 111, 108, 102, 89, 97, 108, 82, 54, 54, 122, 110, 120, 98, 56, 83, 75, 84, 89, 61]', '[89, 70, 47, 88, 108, 120, 111, 55, 119, 65, 66, 108, 83, 109, 107, 89, 116, 53, 108, 43, 74, 111, 56, 83, 122, 65, 86, 73, 80, 52, 87, 109, 112, 78, 100, 115, 47, 74, 85, 84, 83, 107, 67, 72, 69, 85, 50, 121, 118, 52, 56, 111, 83, 87, 111, 116]', '8f8627f0b3962acea3042476c404f1c011d849012f0afd7b20cc37f2ac6bb667', '9eac806b76bab0185444c731f3f419fe67f52bc777431faba5e671097528abd3');
INSERT INTO employee (employee_type, birthdate, internal_auth_id, person_pii_id, created_at) VALUES ('45800', '9', 'Contract', 100008, '2025-08-19 18:01:38');

-- Original data for employee: 
-- INSERT INTO employee (first_name, last_name, email, phone, address, zip_code, employee_type, internal_auth_id, birthdate) VALUES
--    ),
--    ('Jack', 'Thomas', 'jack.t@example.com', '3301234567', '222 Oakwood Blvd', '45900', 'Full-time', 10, '1989-01-18';


INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100009, '[78, 114, 70, 80, 73, 71, 50, 97, 74, 73, 104, 47, 48, 47, 73, 102, 73, 101, 53, 84, 100, 55, 52, 85, 99, 122, 98, 73, 47, 57, 88, 50, 57, 78, 48, 87, 99, 103, 61, 61]', '[78, 111, 116, 79, 69, 66, 57, 89, 83, 109, 79, 69, 102, 85, 87, 119, 77, 55, 49, 65, 120, 113, 88, 103, 66, 122, 72, 56, 112, 56, 66, 69, 122, 121, 57, 113, 47, 105, 84, 106, 66, 49, 101, 110, 86, 72, 69, 61]', '[50, 80, 105, 89, 69, 110, 69, 88, 65, 53, 66, 74, 75, 79, 73, 72, 56, 57, 55, 103, 98, 109, 79, 99, 43, 54, 97, 54, 100, 116, 48, 108, 82, 98, 98, 114, 122, 116, 76, 70, 109, 76, 105, 82, 106, 112, 119, 67, 103, 68, 80, 104, 56, 80, 66, 72, 70, 71, 50, 90, 87, 103, 61, 61]', '[106, 121, 50, 97, 103, 114, 50, 89, 112, 56, 84, 78, 78, 48, 69, 109, 52, 98, 85, 119, 43, 83, 117, 49, 102, 72, 82, 48, 77, 89, 77, 54, 120, 53, 73, 118, 99, 51, 111, 50, 73, 68, 105, 65, 71, 65, 61, 61]', '[80, 71, 53, 102, 78, 75, 108, 48, 99, 76, 112, 106, 109, 118, 68, 97, 118, 47, 107, 81, 82, 77, 89, 68, 80, 73, 112, 98, 109, 83, 90, 90, 68, 107, 119, 110, 104, 68, 120, 66, 121, 73, 108, 52, 98, 84, 90, 89, 54, 57, 69, 61]', '[57, 48, 101, 110, 73, 51, 87, 47, 43, 119, 107, 53, 81, 68, 55, 103, 79, 82, 101, 122, 83, 103, 116, 83, 116, 77, 99, 119, 108, 43, 74, 104, 77, 121, 118, 68, 87, 67, 57, 103, 52, 116, 74, 73, 104, 101, 110, 122, 79, 78, 81, 116, 65, 90, 83, 56, 119, 57, 85, 61]', 'd036d816a6d172dbcda4fb9aaccbadb1568c9be6263dc6d4dad0e0181b985e6f', '5dfcf9ef1fb1ecbce32fefe37ae99aff68832a7e2ac74f52daa5a1bcd8038118');
INSERT INTO employee (employee_type, birthdate, internal_auth_id, person_pii_id, created_at) VALUES ('45900', '10', 'Full-time', 100009, '2025-08-19 18:01:38');

   -- -----------------------------------------------------------------------------
   -- Data for `collaborator` table - with UNIQUE emails and phones
   -- -----------------------------------------------------------------------------
   -- Original data for collaborator: 
-- INSERT INTO collaborator (first_name, last_name, email, phone, address, zip_code, internal_auth_id, skills, profile_picture, birthdate) VALUES
--    ('Karen', 'White', 'karen.w@example.com', '3311122233', '333 Pinecrest Ln', '46000', 1, 'Painting, Drawing', NULL, '1980-03-25';


INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100010, '[69, 48, 100, 53, 69, 71, 103, 69, 83, 98, 52, 56, 81, 73, 111, 97, 79, 116, 119, 103, 103, 48, 57, 88, 102, 103, 120, 56, 89, 82, 89, 66, 85, 49, 122, 47, 78, 67, 120, 111, 57, 51, 43, 103]', '[108, 52, 87, 107, 101, 67, 51, 118, 65, 66, 50, 69, 107, 113, 108, 121, 67, 97, 76, 113, 122, 48, 55, 97, 112, 48, 100, 67, 118, 104, 104, 69, 85, 78, 80, 50, 54, 121, 116, 66, 52, 119, 79, 107]', '[53, 104, 47, 121, 87, 70, 115, 68, 102, 55, 98, 112, 66, 77, 70, 53, 116, 67, 87, 98, 75, 118, 52, 78, 53, 77, 52, 108, 113, 69, 88, 86, 86, 79, 103, 107, 68, 119, 50, 78, 66, 99, 78, 73, 108, 112, 106, 72, 102, 70, 48, 61]', '[87, 49, 102, 76, 47, 116, 122, 113, 98, 88, 115, 66, 77, 55, 51, 85, 55, 43, 85, 115, 115, 50, 106, 110, 81, 111, 119, 110, 104, 70, 77, 89, 73, 119, 54, 100, 88, 115, 115, 121, 47, 120, 89, 73, 100, 53, 69, 78, 120, 113, 57, 118, 105, 65, 90, 116, 73, 79, 110, 77, 70, 98, 115, 61]', '[102, 122, 56, 89, 53, 84, 74, 105, 65, 79, 106, 99, 98, 118, 122, 118, 87, 114, 85, 76, 65, 99, 87, 69, 100, 104, 121, 106, 67, 72, 72, 117, 109, 90, 115, 104, 50, 79, 99, 52, 118, 77, 116, 85, 113, 73, 54, 109, 113, 84, 84, 100, 107, 113, 71, 89, 111, 99, 111, 61]', '[99, 119, 108, 120, 82, 67, 99, 69, 120, 75, 65, 105, 70, 76, 107, 106, 79, 116, 65, 71, 82, 108, 75, 53, 72, 88, 80, 66, 102, 121, 66, 88, 69, 107, 112, 68, 88, 89, 98, 52, 73, 82, 106, 83]', 'bc5fc7dfc32af1a860fee4a4ef9f9df79580c86ba5a195a34beb045defbb1453', '08fc623c62f671f10781b447a51b1e4f7732d2f39e9ae766e8bc4c1cb5932f0c');
INSERT INTO collaborator (internal_auth_id, encrypted_profile_picture, skills, birthdate, person_pii_id, created_at) VALUES (1, NULL, 'Painting, Drawing', ''1980-03-25', 100010, '2025-08-19 18:01:38');

-- Original data for collaborator: 
-- INSERT INTO collaborator (first_name, last_name, email, phone, address, zip_code, internal_auth_id, skills, profile_picture, birthdate) VALUES
--    ),
--    ('Liam', 'Hall', 'liam.h@example.com', '3322233344', '46100', '444 River Rd', '46100', 2, 'Sculpture', NULL, '1976-11-08';


INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100011, '[47, 57, 77, 52, 112, 90, 55, 90, 107, 111, 79, 79, 82, 109, 82, 67, 104, 90, 111, 48, 67, 72, 74, 89, 73, 68, 87, 51, 79, 108, 76, 115, 119, 112, 120, 53, 90, 103, 61, 61]', '[100, 69, 117, 109, 107, 67, 65, 89, 107, 100, 82, 66, 116, 78, 99, 53, 98, 89, 116, 106, 73, 85, 114, 122, 99, 52, 74, 113, 97, 43, 118, 74, 84, 81, 67, 108, 88, 78, 105, 73, 82, 81, 50, 47, 83, 49, 52, 61]', '[111, 86, 82, 73, 110, 119, 119, 109, 106, 101, 87, 71, 107, 98, 55, 118, 112, 109, 104, 105, 54, 118, 105, 81, 54, 111, 49, 77, 111, 52, 79, 51, 77, 85, 115, 101, 102, 73, 47, 55, 82, 82, 112, 78, 103, 85, 109, 79, 90, 79, 53, 114, 119, 54, 87, 115, 77, 83, 108, 98, 121, 65, 61, 61]', '[48, 77, 118, 78, 121, 107, 83, 54, 78, 110, 43, 117, 70, 102, 107, 52, 106, 53, 99, 121, 119, 115, 54, 119, 70, 66, 71, 103, 84, 89, 88, 118, 88, 83, 48, 73, 109, 57, 113, 79, 90, 75, 65, 61]', '[109, 76, 82, 113, 77, 89, 90, 68, 108, 104, 72, 97, 51, 49, 71, 90, 49, 111, 90, 104, 104, 102, 54, 120, 53, 105, 57, 87, 65, 108, 67, 120, 114, 104, 73, 53, 65, 83, 53, 48, 73, 98, 87, 79, 84, 104, 53, 90, 116, 111, 56, 61]', '[78, 56, 54, 112, 51, 85, 70, 119, 76, 54, 73, 97, 103, 70, 68, 71, 54, 75, 74, 70, 52, 67, 101, 67, 82, 101, 81, 70, 87, 102, 99, 122, 81, 69, 114, 118, 48, 43, 116, 117, 113, 117, 106, 74]', '567f803d04984b351c353085bcb63fbb703e4968fde59337a89af07ce4ffc2f9', '25c7e17d3e9906a3ebe30c1b91b8a3fc507f4192f32ad8cfee0c68249244c747');
INSERT INTO collaborator (internal_auth_id, encrypted_profile_picture, skills, birthdate, person_pii_id, created_at) VALUES ('444 River Rd', '[47, 99, 102, 86, 114, 106, 100, 82, 53, 78, 72, 55, 53, 48, 83, 65, 78, 121, 82, 90, 120, 47, 52, 74, 66, 83, 118, 86, 117, 82, 111, 54, 100, 54, 57, 76, 103, 65, 111, 61]', '46100', 'Sculpture', 100011, '2025-08-19 18:01:38');

-- Original data for collaborator: 
-- INSERT INTO collaborator (first_name, last_name, email, phone, address, zip_code, internal_auth_id, skills, profile_picture, birthdate) VALUES
--    ),
--    ('Mia', 'Young', 'mia.y@example.com', '3333344455', '555 Lakeview Dr', '46200', 3, 'Digital Art, Animation', NULL, '1983-09-18';


INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100012, '[80, 98, 84, 110, 53, 70, 57, 83, 83, 97, 75, 71, 122, 107, 119, 105, 78, 116, 119, 76, 115, 86, 68, 100, 105, 107, 55, 102, 119, 110, 57, 79, 43, 102, 77, 84, 50, 65, 61, 61]', '[81, 118, 73, 102, 65, 88, 116, 82, 85, 86, 51, 67, 108, 72, 82, 79, 111, 89, 74, 118, 54, 72, 52, 113, 106, 122, 52, 102, 48, 78, 110, 51, 121, 90, 122, 109, 98, 52, 89, 72, 79, 71, 118, 86, 43, 119, 61, 61]', '[110, 109, 118, 83, 83, 78, 57, 108, 56, 122, 108, 75, 114, 43, 105, 50, 79, 90, 47, 101, 113, 78, 117, 108, 56, 101, 121, 52, 72, 84, 84, 75, 104, 74, 112, 116, 117, 107, 43, 55, 105, 89, 70, 84, 75, 122, 109, 119, 110, 72, 84, 52, 90, 77, 102, 101, 52, 53, 90, 78]', '[85, 80, 87, 107, 57, 70, 67, 69, 84, 51, 77, 108, 66, 120, 50, 68, 87, 108, 76, 121, 97, 82, 80, 77, 68, 65, 89, 56, 43, 65, 112, 47, 120, 105, 50, 86, 107, 122, 69, 117, 121, 88, 120, 53]', '[113, 113, 74, 119, 78, 120, 75, 116, 80, 57, 54, 50, 117, 116, 52, 86, 117, 72, 97, 76, 102, 87, 100, 75, 76, 53, 119, 116, 55, 113, 49, 83, 49, 100, 118, 71, 66, 72, 101, 49, 118, 97, 68, 102, 121, 79, 106, 109, 76, 106, 81, 61]', '[47, 115, 73, 71, 54, 43, 76, 89, 55, 121, 121, 73, 105, 48, 81, 69, 119, 57, 52, 98, 48, 118, 104, 87, 53, 110, 102, 75, 109, 66, 89, 50, 117, 122, 84, 116, 119, 51, 76, 113, 120, 55, 121, 104, 109, 81, 83, 79, 99, 66, 88, 55, 87, 98, 55, 56, 97, 103, 61, 61]', 'bcdc1c8aa2cf0f30a55512e6c10c65b0399c1bdfddcd769bffe1f89d1630d89e', '548674f78c8db9628b4934f6bcf16eb53052bb00f38a66b8f454d7ea2f76c841');
INSERT INTO collaborator (internal_auth_id, encrypted_profile_picture, skills, birthdate, person_pii_id, created_at) VALUES ('46200', '[116, 57, 53, 84, 43, 100, 100, 43, 102, 106, 48, 112, 79, 105, 99, 109, 85, 112, 115, 87, 48, 54, 69, 55, 118, 72, 116, 103, 52, 89, 87, 84, 86, 104, 109, 100, 82, 81, 72, 116, 97, 111, 101, 109, 71, 79, 54, 115, 83, 114, 107, 48, 66, 70, 76, 105, 50, 76, 116, 98, 69, 76, 76, 49, 70, 88, 49, 121, 105, 103, 61, 61]', '3', 'NULL', 100012, '2025-08-19 18:01:38');

-- Original data for collaborator: 
-- INSERT INTO collaborator (first_name, last_name, email, phone, address, zip_code, internal_auth_id, skills, profile_picture, birthdate) VALUES
--    ),
--    ('Noah', 'King', 'noah.k@example.com', '3344455566', '666 Forest Ave', '46300', 4, 'Photography', NULL, '1979-06-12';


INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100013, '[90, 86, 97, 57, 66, 97, 108, 47, 103, 79, 81, 83, 112, 74, 47, 68, 122, 121, 67, 109, 54, 85, 75, 105, 65, 102, 85, 108, 118, 71, 75, 99, 109, 85, 76, 109, 83, 81, 61, 61]', '[77, 106, 121, 100, 72, 75, 49, 102, 66, 72, 53, 88, 67, 67, 50, 50, 54, 117, 70, 43, 120, 112, 110, 53, 80, 68, 74, 74, 65, 43, 70, 107, 120, 113, 121, 88, 66, 122, 71, 66, 65, 70, 115, 101, 68, 51, 107, 61]', '[49, 67, 107, 122, 79, 110, 66, 65, 111, 101, 55, 99, 83, 69, 88, 117, 108, 76, 115, 89, 82, 82, 68, 52, 107, 106, 76, 79, 51, 79, 109, 112, 100, 107, 104, 121, 55, 51, 68, 116, 85, 73, 66, 75, 83, 87, 118, 122, 109, 66, 101, 111, 83, 108, 53, 100, 72, 73, 118, 57, 69, 65, 61, 61]', '[47, 47, 66, 109, 101, 82, 78, 69, 52, 103, 97, 69, 86, 49, 53, 71, 54, 48, 49, 75, 69, 74, 50, 106, 75, 121, 51, 69, 106, 56, 103, 49, 78, 67, 104, 108, 43, 107, 112, 71, 115, 100, 99, 61]', '[100, 57, 122, 78, 120, 118, 48, 99, 104, 73, 55, 69, 118, 104, 88, 66, 81, 112, 55, 103, 116, 97, 65, 80, 51, 121, 106, 88, 112, 79, 75, 102, 65, 111, 83, 112, 56, 111, 99, 107, 122, 57, 110, 56, 50, 72, 52, 111, 67, 97, 115, 61]', '[68, 104, 110, 100, 69, 111, 71, 106, 88, 76, 49, 81, 75, 78, 80, 51, 98, 52, 115, 67, 82, 117, 115, 105, 112, 74, 111, 71, 108, 52, 105, 49, 114, 105, 85, 54, 55, 70, 118, 112, 74, 66, 52, 106, 70, 81, 113, 101, 108, 54, 66, 106, 109, 43, 72, 75]', 'e56365901f65d85397cc8c2ca4c15f1f8d1712b6d9458ceb84ec67e0a347def2', '13166b63aaa73022433839e2a56117c9d04bc638877b53f945c06c4f665e159d');
INSERT INTO collaborator (internal_auth_id, encrypted_profile_picture, skills, birthdate, person_pii_id, created_at) VALUES ('46300', '[116, 67, 53, 57, 113, 104, 57, 100, 114, 69, 65, 108, 43, 120, 51, 66, 104, 106, 112, 78, 52, 122, 121, 111, 117, 116, 43, 119, 107, 56, 72, 117, 48, 82, 106, 107, 83, 67, 47, 113, 52, 55, 56, 74, 57, 103, 99, 103, 80, 100, 71, 89, 103, 83, 52, 61]', '4', 'NULL', 100013, '2025-08-19 18:01:38');

-- Original data for collaborator: 
-- INSERT INTO collaborator (first_name, last_name, email, phone, address, zip_code, internal_auth_id, skills, profile_picture, birthdate) VALUES
--    ),
--    ('Olivia', 'Wright', 'olivia.w@example.com', '3355566677', '777 Hilltop Ct', '46400', 5, 'Creative Writing', NULL, '1985-02-03';


INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100014, '[50, 78, 78, 72, 104, 118, 97, 53, 49, 83, 47, 82, 47, 106, 76, 54, 109, 110, 102, 72, 74, 103, 43, 74, 115, 100, 71, 120, 117, 84, 69, 70, 47, 67, 105, 88, 80, 103, 61, 61]', '[117, 77, 114, 68, 81, 101, 71, 65, 100, 57, 85, 101, 111, 102, 52, 80, 84, 72, 88, 75, 108, 88, 57, 75, 74, 100, 120, 65, 98, 105, 100, 122, 82, 89, 74, 102, 74, 113, 74, 66, 118, 73, 51, 53, 99, 107, 122, 113, 119, 65, 61, 61]', '[115, 80, 71, 84, 115, 68, 81, 78, 75, 112, 103, 89, 104, 120, 114, 97, 111, 48, 86, 98, 120, 68, 71, 57, 112, 121, 66, 75, 49, 53, 100, 120, 108, 107, 102, 82, 90, 78, 102, 81, 52, 73, 111, 53, 110, 102, 69, 52, 79, 119, 114, 115, 69, 116, 122, 105, 116, 72, 89, 109, 109, 51, 54, 90]', '[101, 65, 83, 100, 104, 48, 80, 52, 54, 122, 111, 81, 107, 66, 120, 70, 100, 78, 87, 74, 108, 83, 113, 107, 72, 106, 97, 100, 67, 88, 86, 65, 79, 101, 70, 52, 55, 112, 112, 84, 79, 50, 118, 102, 116, 65, 61, 61]', '[90, 121, 77, 55, 112, 71, 68, 118, 68, 65, 86, 56, 107, 43, 112, 77, 120, 117, 101, 49, 84, 103, 113, 117, 70, 73, 69, 89, 75, 52, 79, 56, 43, 108, 75, 55, 51, 103, 51, 86, 88, 90, 105, 43, 48, 65, 75, 105, 88, 49, 73, 61]', '[50, 80, 88, 66, 83, 67, 101, 76, 118, 116, 116, 122, 83, 85, 75, 120, 48, 52, 56, 75, 113, 105, 102, 101, 80, 43, 83, 114, 65, 102, 109, 67, 43, 99, 75, 85, 90, 71, 120, 122, 78, 70, 53, 76, 47, 76, 52, 65, 109, 119, 79, 77, 107, 65, 65, 110]', 'cd4ac87ab38174b4a7e29348782cb3dcb7225f4049ebdaa42d045c37d671bc01', 'b16370a17fc3ac268567063e248fb0c96215cecba0ab4fb267d4f97217638cc2');
INSERT INTO collaborator (internal_auth_id, encrypted_profile_picture, skills, birthdate, person_pii_id, created_at) VALUES ('46400', '[109, 107, 106, 103, 54, 55, 112, 70, 90, 85, 71, 55, 113, 57, 56, 47, 113, 107, 66, 110, 55, 104, 112, 43, 114, 112, 101, 67, 106, 86, 107, 52, 69, 72, 70, 65, 74, 100, 118, 73, 50, 119, 110, 115, 49, 56, 67, 48, 89, 77, 65, 49, 71, 104, 56, 88, 112, 120, 111, 79, 66, 119, 61, 61]', '5', 'NULL', 100014, '2025-08-19 18:01:38');

-- Original data for collaborator: 
-- INSERT INTO collaborator (first_name, last_name, email, phone, address, zip_code, internal_auth_id, skills, profile_picture, birthdate) VALUES
--    ),
--    ('Peter', 'Green', 'peter.g@example.com', '3366677788', '888 Meadow Ln', '46500', 6, 'Music Theory', NULL, '1981-12-21';


INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100015, '[73, 51, 100, 85, 75, 79, 84, 77, 122, 103, 102, 97, 43, 76, 73, 120, 107, 83, 114, 119, 47, 89, 72, 71, 108, 77, 43, 53, 77, 114, 112, 68, 113, 100, 57, 76, 78, 119, 61, 61]', '[117, 110, 98, 43, 117, 68, 104, 56, 55, 101, 117, 107, 86, 73, 78, 77, 72, 54, 56, 102, 67, 110, 98, 84, 71, 54, 103, 88, 73, 115, 116, 85, 85, 106, 98, 82, 112, 113, 99, 107, 90, 50, 88, 74, 75, 47, 101, 68]', '[106, 48, 105, 79, 107, 103, 49, 75, 111, 75, 110, 117, 43, 115, 113, 78, 115, 52, 72, 84, 80, 113, 118, 100, 51, 83, 99, 66, 83, 113, 70, 98, 109, 65, 102, 113, 113, 87, 121, 85, 80, 80, 66, 111, 111, 78, 54, 88, 121, 65, 71, 113, 56, 79, 47, 65, 82, 49, 52, 106, 110, 98, 65, 61]', '[97, 79, 98, 53, 113, 89, 106, 70, 71, 54, 107, 101, 76, 80, 116, 73, 79, 79, 70, 118, 110, 68, 79, 49, 80, 106, 89, 55, 84, 85, 114, 48, 81, 107, 65, 80, 71, 76, 67, 122, 52, 54, 104, 87]', '[73, 54, 57, 69, 108, 66, 55, 89, 51, 78, 118, 54, 121, 66, 116, 80, 72, 110, 75, 121, 72, 76, 118, 112, 97, 72, 80, 53, 47, 75, 70, 102, 82, 88, 114, 110, 117, 99, 82, 102, 112, 72, 90, 71, 86, 111, 54, 65, 56, 110, 73, 61]', '[53, 50, 48, 43, 71, 114, 122, 72, 52, 54, 69, 80, 111, 113, 118, 83, 104, 114, 77, 115, 76, 105, 87, 71, 76, 111, 65, 82, 84, 100, 70, 68, 70, 48, 80, 98, 71, 77, 114, 114, 69, 112, 102, 86, 69, 105, 114, 111, 43, 49, 57, 105, 103, 90, 48, 61]', 'f1765a922cc929ee42cab02112f28288b138bbfeebc40548b4f8be64432bc2e1', 'd486dfbd5fb578340bccbdd0a662527eab38550648d5f44517e5ac71b8824703');
INSERT INTO collaborator (internal_auth_id, encrypted_profile_picture, skills, birthdate, person_pii_id, created_at) VALUES ('46500', '[75, 97, 113, 56, 78, 70, 72, 54, 103, 106, 99, 115, 50, 67, 85, 121, 65, 55, 113, 88, 76, 70, 72, 65, 49, 48, 107, 48, 113, 105, 78, 68, 80, 84, 78, 76, 66, 69, 80, 89, 79, 101, 97, 78, 69, 54, 111, 73, 104, 102, 81, 76, 84, 47, 72, 118]', '6', 'NULL', 100015, '2025-08-19 18:01:38');

-- Original data for collaborator: 
-- INSERT INTO collaborator (first_name, last_name, email, phone, address, zip_code, internal_auth_id, skills, profile_picture, birthdate) VALUES
--    ),
--    ('Quinn', 'Adams', 'quinn.a@example.com', '3377788899', '999 Valley Rd', '46600', 7, 'Dance', NULL, '1986-10-09';


INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100016, '[117, 68, 76, 86, 106, 89, 68, 50, 119, 49, 57, 118, 76, 114, 117, 76, 49, 73, 118, 74, 70, 114, 102, 49, 57, 111, 57, 81, 56, 89, 77, 120, 56, 89, 113, 76, 106, 65, 61, 61]', '[81, 68, 90, 57, 65, 77, 101, 53, 71, 65, 119, 90, 80, 107, 83, 98, 97, 65, 105, 54, 109, 117, 47, 65, 66, 120, 102, 98, 43, 77, 77, 98, 51, 85, 68, 109, 107, 110, 79, 65, 54, 110, 49, 48, 104, 106, 78, 76]', '[86, 104, 118, 111, 66, 97, 66, 98, 97, 82, 111, 106, 88, 77, 78, 117, 111, 51, 65, 47, 90, 85, 108, 110, 73, 75, 57, 112, 47, 55, 88, 69, 72, 122, 72, 98, 85, 115, 43, 116, 89, 43, 53, 73, 105, 82, 43, 120, 47, 84, 71, 113, 105, 105, 68, 74, 51, 69, 107, 55, 67, 56, 119, 61]', '[72, 55, 103, 69, 65, 100, 98, 65, 82, 80, 122, 89, 78, 80, 48, 112, 106, 104, 82, 84, 56, 88, 76, 119, 108, 90, 82, 55, 81, 112, 117, 99, 116, 116, 103, 102, 99, 119, 115, 43, 100, 84, 49, 72]', '[48, 116, 85, 117, 117, 75, 121, 117, 43, 107, 49, 120, 82, 65, 79, 84, 75, 51, 120, 108, 77, 47, 83, 122, 99, 109, 75, 52, 73, 57, 81, 76, 101, 87, 68, 120, 50, 79, 108, 68, 83, 109, 78, 72, 98, 118, 54, 55, 108, 112, 107, 61]', '[106, 50, 106, 108, 77, 78, 83, 51, 88, 90, 76, 82, 106, 72, 121, 120, 78, 117, 48, 97, 119, 119, 112, 57, 97, 121, 73, 88, 48, 88, 99, 79, 102, 115, 51, 103, 114, 100, 90, 97, 73, 50, 82, 53, 74, 79, 113, 111, 50, 104, 89, 49, 84, 52, 48, 61]', '76ce6c668f59df39457f47cd87d6b3079da9162d5c6a609dca1bcfce02bc7031', 'f84f9ac83eb552c4eaff227b6c2016b7625c88023c681253166ccf3cef64df09');
INSERT INTO collaborator (internal_auth_id, encrypted_profile_picture, skills, birthdate, person_pii_id, created_at) VALUES ('46600', '[48, 47, 105, 119, 77, 117, 83, 114, 112, 48, 106, 52, 70, 115, 49, 89, 110, 79, 114, 52, 57, 108, 51, 78, 107, 115, 50, 113, 87, 98, 110, 75, 75, 48, 85, 73, 47, 43, 107, 71, 66, 110, 115, 85, 85, 70, 115, 61]', '7', 'NULL', 100016, '2025-08-19 18:01:38');

-- Original data for collaborator: 
-- INSERT INTO collaborator (first_name, last_name, email, phone, address, zip_code, internal_auth_id, skills, profile_picture, birthdate) VALUES
--    ),
--    ('Ryan', 'Nelson', 'ryan.n@example.com', '3388899900', '101 Mountain View', '46700', 8, 'Acting', NULL, '1982-08-16';


INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100017, '[89, 65, 106, 107, 110, 86, 102, 97, 112, 54, 90, 98, 52, 121, 117, 75, 114, 102, 78, 100, 115, 111, 51, 115, 52, 109, 122, 100, 88, 99, 122, 55, 57, 87, 86, 75, 114, 65, 61, 61]', '[75, 82, 68, 81, 79, 80, 69, 85, 110, 81, 75, 56, 114, 51, 74, 78, 106, 85, 118, 114, 99, 75, 104, 79, 66, 65, 103, 112, 48, 103, 67, 110, 74, 120, 116, 101, 66, 55, 104, 102, 109, 104, 99, 122, 83, 116, 85, 61]', '[57, 97, 66, 51, 48, 82, 65, 84, 56, 85, 86, 66, 90, 74, 47, 108, 98, 54, 86, 78, 49, 65, 100, 85, 57, 121, 116, 100, 54, 85, 98, 103, 103, 88, 54, 70, 118, 110, 107, 78, 56, 81, 43, 118, 116, 121, 80, 72, 112, 116, 118, 122, 56, 66, 100, 49, 53, 121, 48, 106, 69, 103, 61, 61]', '[51, 113, 104, 76, 89, 110, 77, 104, 83, 88, 121, 70, 54, 43, 72, 48, 117, 79, 57, 88, 120, 55, 108, 50, 80, 105, 115, 100, 120, 66, 71, 43, 56, 65, 88, 74, 102, 109, 53, 66, 101, 55, 79, 86, 51, 103, 61, 61]', '[66, 66, 76, 101, 51, 70, 47, 47, 122, 106, 71, 97, 83, 56, 74, 76, 43, 99, 43, 49, 80, 53, 48, 52, 102, 81, 55, 51, 69, 118, 52, 65, 118, 87, 78, 75, 57, 90, 121, 118, 117, 85, 48, 105, 119, 56, 97, 97, 79, 51, 69, 61]', '[51, 90, 105, 79, 105, 100, 119, 54, 98, 107, 51, 56, 102, 75, 76, 65, 73, 75, 54, 114, 84, 83, 108, 69, 99, 120, 76, 65, 122, 72, 109, 48, 79, 79, 80, 86, 48, 81, 122, 98, 74, 104, 121, 101, 43, 102, 75, 86, 51, 50, 115, 88, 76, 70, 49, 113, 100, 120, 115, 73]', '6b41e082f7d3e2228ac3ee9b5631d4c7fcf1a4a1ba50581722d6b06e6947195c', '818d0e5ffae3c30dfbe68dbb57896728bc1598d0094467bb378db4cb21a1774c');
INSERT INTO collaborator (internal_auth_id, encrypted_profile_picture, skills, birthdate, person_pii_id, created_at) VALUES ('46700', '[71, 55, 118, 53, 99, 119, 118, 113, 107, 47, 76, 55, 76, 65, 74, 66, 84, 53, 112, 65, 57, 113, 99, 81, 114, 76, 107, 53, 120, 87, 119, 101, 77, 53, 77, 74, 100, 87, 54, 47, 100, 106, 116, 66, 97, 82, 110, 99]', '8', 'NULL', 100017, '2025-08-19 18:01:38');

-- Original data for collaborator: 
-- INSERT INTO collaborator (first_name, last_name, email, phone, address, zip_code, internal_auth_id, skills, profile_picture, birthdate) VALUES
--    ),
--    ('Sophia', 'Carter', 'sophia.c@example.com', '3399900011', '202 Sunset Blvd', '46800', 9, 'Graphic Design', NULL, '1987-05-04';


INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100018, '[65, 80, 49, 103, 78, 53, 49, 121, 69, 119, 69, 99, 48, 97, 110, 118, 98, 90, 119, 69, 49, 54, 68, 113, 67, 84, 82, 84, 67, 99, 77, 112, 75, 88, 111, 65, 53, 103, 61, 61]', '[119, 53, 71, 114, 101, 89, 72, 121, 50, 67, 101, 117, 116, 111, 69, 117, 65, 70, 56, 115, 77, 101, 48, 65, 82, 53, 88, 82, 117, 112, 66, 82, 79, 109, 51, 115, 53, 113, 117, 83, 55, 66, 111, 77, 100, 90, 112, 73, 112, 103, 61, 61]', '[50, 114, 98, 110, 86, 84, 71, 71, 55, 86, 69, 77, 56, 97, 109, 49, 78, 79, 103, 74, 103, 50, 72, 74, 48, 106, 118, 109, 48, 109, 122, 121, 71, 55, 108, 88, 103, 89, 47, 68, 116, 43, 72, 101, 73, 80, 79, 75, 47, 48, 88, 104, 69, 86, 53, 98, 90, 111, 106, 52, 75, 43, 82, 90]', '[49, 100, 73, 67, 49, 50, 76, 102, 76, 119, 55, 99, 75, 47, 101, 66, 84, 113, 70, 103, 78, 86, 90, 118, 43, 90, 79, 49, 69, 109, 66, 65, 84, 113, 75, 69, 81, 112, 78, 80, 111, 65, 47, 111, 74, 103, 61, 61]', '[57, 49, 82, 100, 120, 104, 73, 53, 73, 50, 101, 67, 89, 74, 56, 119, 67, 116, 99, 67, 66, 104, 119, 119, 101, 43, 70, 90, 103, 118, 120, 65, 103, 79, 72, 118, 54, 84, 72, 119, 47, 78, 111, 47, 68, 102, 102, 87, 47, 102, 48, 61]', '[101, 69, 48, 68, 88, 121, 51, 68, 83, 84, 118, 47, 120, 66, 74, 115, 88, 86, 70, 54, 116, 121, 51, 100, 109, 111, 81, 85, 69, 83, 102, 68, 50, 114, 82, 73, 66, 104, 89, 100, 70, 43, 104, 105, 82, 98, 72, 112, 118, 55, 43, 54, 77, 72, 86, 110, 68, 65, 61, 61]', '521155a25848c1233abdacea46b187dd11adb1834aec1857cf8b38451413746b', '25eb92ae54cc5089e9b995f4176795d3c67d927069a3009a655c76cf0e447536');
INSERT INTO collaborator (internal_auth_id, encrypted_profile_picture, skills, birthdate, person_pii_id, created_at) VALUES ('46800', '[49, 82, 87, 105, 83, 57, 49, 56, 116, 101, 75, 120, 47, 49, 87, 108, 50, 107, 116, 55, 86, 57, 51, 81, 105, 74, 54, 120, 51, 75, 71, 81, 109, 56, 54, 80, 122, 87, 56, 107, 103, 112, 75, 71, 104, 117, 99, 102, 107, 113, 116, 97, 104, 51, 105, 99, 50, 78, 77, 61]', '9', 'NULL', 100018, '2025-08-19 18:01:38');

-- Original data for collaborator: 
-- INSERT INTO collaborator (first_name, last_name, email, phone, address, zip_code, internal_auth_id, skills, profile_picture, birthdate) VALUES
--    ),
--    ('Thomas', 'Roberts', 'thomas.r@example.com', '3300011122', '303 Ocean Dr', '46900', 10, 'Web Development', NULL, '1984-01-11';


INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100019, '[101, 111, 115, 55, 103, 49, 47, 84, 105, 83, 81, 106, 78, 110, 76, 86, 109, 99, 53, 89, 108, 71, 89, 79, 114, 75, 87, 50, 76, 111, 76, 89, 116, 76, 84, 83, 105, 119, 61, 61]', '[71, 76, 89, 115, 80, 53, 70, 48, 77, 122, 82, 101, 53, 122, 86, 99, 54, 51, 81, 65, 102, 66, 88, 113, 122, 47, 77, 102, 76, 75, 88, 68, 75, 73, 77, 114, 121, 68, 81, 68, 70, 73, 109, 65, 88, 78, 80, 97, 66, 65, 61, 61]', '[98, 103, 102, 117, 76, 85, 119, 106, 49, 82, 56, 105, 47, 119, 74, 81, 89, 88, 102, 71, 56, 74, 104, 106, 120, 51, 72, 74, 111, 65, 55, 99, 121, 122, 103, 104, 119, 104, 97, 52, 70, 57, 117, 100, 49, 51, 98, 111, 79, 56, 51, 118, 53, 80, 98, 107, 67, 102, 103, 99, 120, 70, 85, 51]', '[51, 114, 97, 48, 118, 49, 103, 89, 83, 69, 112, 50, 103, 117, 119, 110, 108, 53, 88, 105, 115, 84, 120, 101, 76, 67, 79, 90, 47, 105, 55, 98, 75, 122, 43, 70, 87, 43, 51, 73, 103, 70, 47, 85, 83, 68, 99, 61]', '[75, 49, 57, 71, 56, 76, 118, 70, 82, 111, 106, 48, 54, 120, 111, 81, 77, 120, 116, 106, 70, 116, 115, 74, 80, 102, 106, 100, 70, 116, 103, 67, 43, 75, 89, 43, 65, 43, 50, 110, 90, 48, 82, 113, 119, 106, 75, 115, 101, 121, 85, 61]', '[118, 120, 104, 99, 49, 89, 98, 89, 111, 48, 100, 52, 68, 67, 111, 86, 99, 122, 55, 99, 115, 85, 107, 54, 107, 52, 86, 121, 83, 83, 43, 100, 80, 106, 55, 52, 100, 113, 113, 122, 52, 105, 118, 114, 67, 88, 97, 89, 87, 80, 77, 66, 56, 65, 61, 61]', '84db8ca9cdb6bc4b51f00ed6ee424086481417b07674b224af5e427b0482b6c3', 'ce5f866533e35b55a39194c0a36c80cde4d4d9fe3d0c20921841f9b5c57c45e9');
INSERT INTO collaborator (internal_auth_id, encrypted_profile_picture, skills, birthdate, person_pii_id, created_at) VALUES ('46900', '[71, 47, 57, 88, 66, 69, 107, 48, 53, 111, 83, 116, 69, 115, 114, 107, 85, 55, 117, 80, 104, 68, 121, 73, 121, 120, 89, 55, 71, 56, 47, 67, 80, 66, 79, 79, 68, 83, 118, 49, 49, 47, 75, 108, 79, 79, 104, 80, 88, 80, 47, 71, 78, 74, 98, 111, 80, 105, 103, 104]', '10', 'NULL', 100019, '2025-08-19 18:01:38');
   --
   -- DML for `adult_student` table - with UNIQUE emails and phones
   --
   -- Original data for adult_student: 
-- INSERT INTO adult_student (first_name, last_name, email, phone, address, zip_code, customer_auth_id, profile_picture, birthdate) VALUES
--    ('Ava', 'Rodriguez', 'ava.r@example.com', '3311111111', '111 Pine St', '44000', 1, NULL, '1998-07-15';


INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100020, '[48, 51, 48, 121, 68, 115, 70, 56, 84, 89, 121, 82, 43, 114, 98, 68, 107, 49, 115, 117, 50, 122, 114, 105, 90, 107, 47, 104, 118, 88, 53, 75, 106, 48, 53, 84, 81, 99, 101, 109, 66, 65, 61, 61]', '[68, 73, 67, 48, 76, 116, 57, 54, 98, 65, 81, 122, 84, 101, 89, 86, 108, 98, 67, 119, 115, 68, 89, 48, 66, 98, 115, 57, 78, 72, 89, 47, 121, 84, 121, 103, 82, 72, 119, 82, 109, 74, 83, 81, 81, 115, 71, 49, 84, 81, 61, 61]', '[47, 51, 52, 65, 114, 100, 54, 98, 65, 82, 50, 113, 102, 121, 106, 67, 115, 108, 112, 99, 119, 106, 57, 99, 56, 97, 48, 118, 102, 53, 47, 76, 76, 53, 83, 81, 102, 69, 114, 122, 66, 99, 47, 56, 121, 77, 51, 84, 100, 69, 89, 61]', '[54, 101, 97, 97, 85, 90, 117, 116, 87, 66, 109, 68, 71, 99, 120, 57, 113, 66, 86, 89, 74, 113, 69, 97, 67, 52, 87, 121, 69, 109, 83, 73, 83, 79, 72, 85, 52, 108, 104, 122, 120, 99, 67, 43, 84, 72, 77, 120, 56, 90, 116, 110, 49, 47, 78, 56, 55, 110, 97, 70]', '[108, 104, 110, 114, 118, 54, 121, 98, 76, 99, 102, 81, 89, 84, 98, 90, 102, 113, 116, 84, 104, 84, 119, 77, 120, 78, 122, 88, 74, 113, 48, 55, 48, 53, 55, 69, 50, 52, 71, 79, 48, 69, 83, 52, 81, 111, 103, 68, 70, 104, 114, 88]', '[43, 85, 120, 111, 55, 110, 77, 47, 87, 115, 115, 54, 90, 109, 112, 120, 78, 117, 86, 89, 116, 76, 88, 71, 87, 78, 105, 100, 107, 51, 99, 105, 74, 70, 77, 104, 110, 51, 121, 80, 83, 89, 71, 49]', '72add3591daaa5279f1ec13068449a663d9a6f8e32f9304a8e838cc7ca104065', '669e864bec9bc8d8ba71e3e3558db5180c3a0898600a901295e0a245f7b760ce');
INSERT INTO adult_student (customer_auth_id, birthdate, encrypted_profile_picture, person_pii_id, created_at) VALUES (1, ''1998-07-15', NULL, 100020, '2025-08-19 18:01:38');

-- Original data for adult_student: 
-- INSERT INTO adult_student (first_name, last_name, email, phone, address, zip_code, customer_auth_id, profile_picture, birthdate) VALUES
--    ),
--    ('Bryan', 'Garcia', 'bryan.g@example.com', '3322222222', '222 Oak Ave', '44100', 2, NULL, '1997-03-20';


INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100021, '[53, 87, 48, 105, 85, 49, 65, 43, 54, 57, 65, 72, 78, 105, 109, 66, 105, 107, 70, 85, 50, 120, 74, 77, 71, 74, 76, 55, 97, 87, 114, 82, 112, 102, 69, 43, 71, 65, 61, 61]', '[72, 83, 119, 110, 90, 48, 55, 103, 47, 71, 88, 121, 67, 69, 90, 75, 110, 105, 78, 119, 83, 113, 68, 87, 108, 105, 83, 88, 57, 56, 101, 73, 97, 65, 78, 116, 53, 68, 106, 69, 113, 119, 120, 81, 68, 103, 66, 100]', '[109, 71, 110, 112, 71, 109, 50, 49, 115, 65, 70, 57, 116, 76, 99, 100, 100, 108, 83, 70, 52, 108, 47, 82, 104, 88, 113, 84, 74, 115, 116, 119, 113, 119, 98, 114, 77, 81, 43, 77, 78, 106, 73, 57, 77, 122, 111, 57, 113, 113, 82, 105, 99, 77, 77, 105, 102, 122, 72, 56, 114, 57, 115, 61]', '[74, 69, 54, 65, 85, 49, 49, 90, 50, 111, 52, 111, 121, 118, 87, 70, 107, 106, 102, 57, 57, 104, 90, 117, 47, 57, 119, 51, 57, 78, 80, 112, 86, 56, 52, 57, 67, 87, 118, 73, 74, 53, 68, 109, 43, 65, 61, 61]', '[98, 99, 100, 81, 55, 122, 50, 48, 118, 90, 49, 55, 87, 86, 83, 97, 88, 52, 97, 67, 113, 82, 67, 112, 109, 89, 83, 111, 122, 98, 100, 65, 111, 86, 47, 75, 102, 99, 79, 104, 89, 48, 53, 66, 74, 48, 98, 109, 117, 82, 52, 61]', '[65, 100, 85, 97, 87, 69, 98, 54, 100, 119, 77, 99, 108, 116, 74, 116, 104, 122, 57, 99, 50, 76, 67, 55, 85, 116, 84, 113, 70, 90, 70, 110, 113, 103, 110, 74, 114, 121, 49, 98, 97, 110, 121, 80, 80, 67, 112, 47, 104, 112, 52, 56]', '28f98336927fcacd817c915aecc3f18eb683891d0402a653e13de37133bbafac', '2c3aaefea8267c66822f6edc0e42d9b7384695f9c0407eabda141770aab8901e');
INSERT INTO adult_student (customer_auth_id, birthdate, encrypted_profile_picture, person_pii_id, created_at) VALUES ('44100', 'NULL', '[120, 116, 51, 121, 76, 49, 100, 82, 83, 89, 101, 55, 101, 87, 86, 112, 52, 88, 88, 67, 102, 80, 119, 108, 75, 119, 54, 107, 114, 98, 81, 55, 49, 104, 116, 56, 78, 118, 56, 61]', 100021, '2025-08-19 18:01:38');

-- Original data for adult_student: 
-- INSERT INTO adult_student (first_name, last_name, email, phone, address, zip_code, customer_auth_id, profile_picture, birthdate) VALUES
--    ),
--    ('Catherine', 'Lopez', 'catherine.l@example.com', '3333333333', '333 Elm St', '44200', 3, NULL, '1999-12-10';


INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100022, '[71, 111, 118, 74, 68, 49, 114, 47, 106, 81, 74, 85, 90, 54, 104, 83, 100, 43, 105, 83, 51, 80, 88, 90, 108, 73, 109, 121, 57, 100, 116, 101, 53, 106, 97, 109, 89, 119, 61, 61]', '[117, 89, 116, 65, 73, 85, 47, 57, 119, 118, 100, 54, 77, 109, 105, 90, 72, 54, 109, 74, 88, 107, 87, 77, 81, 99, 51, 86, 109, 117, 51, 69, 98, 49, 86, 104, 74, 83, 111, 88, 88, 106, 108, 78, 85, 82, 118, 97, 80, 51, 104, 76, 55, 103, 61, 61]', '[105, 106, 83, 69, 78, 108, 106, 118, 67, 66, 115, 50, 53, 53, 113, 75, 97, 110, 89, 56, 48, 84, 75, 122, 119, 70, 70, 65, 52, 89, 83, 76, 81, 119, 106, 105, 110, 82, 54, 51, 89, 120, 97, 84, 106, 90, 76, 101, 120, 52, 47, 55, 119, 50, 121, 57, 47, 51, 120, 115, 77, 113, 56, 118, 72, 122, 78, 99]', '[48, 80, 70, 108, 71, 69, 51, 80, 114, 49, 83, 83, 73, 102, 99, 84, 47, 52, 79, 89, 118, 77, 82, 79, 73, 74, 53, 82, 100, 70, 120, 116, 112, 54, 102, 83, 113, 87, 84, 47, 66, 71, 77, 47]', '[119, 67, 99, 47, 56, 53, 75, 100, 81, 112, 69, 52, 109, 116, 89, 97, 85, 76, 65, 116, 75, 52, 72, 56, 51, 76, 56, 79, 89, 72, 99, 117, 81, 43, 49, 89, 97, 69, 76, 102, 83, 98, 72, 105, 55, 73, 65, 116, 84, 80, 56, 61]', '[90, 115, 77, 102, 51, 107, 120, 111, 72, 51, 73, 105, 52, 121, 112, 52, 66, 120, 67, 83, 87, 111, 52, 98, 102, 53, 112, 74, 79, 116, 103, 77, 83, 99, 107, 76, 80, 73, 80, 51, 109, 88, 66, 67, 83, 118, 88, 79, 47, 65, 52, 61]', 'd9fc21073d16853a2379c67366bb554f81541abc8765da80c43428b78b01b29b', '95c5dd81e14a7113b7804f53ab2dc715bd141c55db0b4f4ffcdc28a66fda42ea');
INSERT INTO adult_student (customer_auth_id, birthdate, encrypted_profile_picture, person_pii_id, created_at) VALUES ('44200', 'NULL', '[118, 110, 104, 65, 48, 99, 104, 122, 69, 75, 100, 99, 55, 88, 75, 65, 90, 84, 82, 113, 111, 75, 111, 101, 87, 101, 105, 73, 90, 99, 66, 55, 57, 113, 107, 78, 90, 70, 89, 61]', 100022, '2025-08-19 18:01:38');

-- Original data for adult_student: 
-- INSERT INTO adult_student (first_name, last_name, email, phone, address, zip_code, customer_auth_id, profile_picture, birthdate) VALUES
--    ),
--    ('Daniel', 'Hernandez', 'daniel.h@example.com', '3344444444', '444 Maple Ave', '44300', 4, NULL, '1996-09-05';


INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100023, '[120, 104, 110, 97, 117, 117, 110, 49, 105, 82, 52, 122, 66, 50, 99, 121, 106, 114, 118, 75, 88, 87, 56, 65, 54, 85, 117, 111, 71, 88, 119, 107, 49, 72, 84, 115, 122, 103, 61, 61]', '[49, 48, 122, 54, 73, 54, 109, 50, 55, 51, 57, 80, 49, 47, 121, 104, 106, 100, 117, 114, 90, 103, 122, 66, 112, 50, 68, 114, 83, 72, 106, 55, 115, 84, 67, 86, 88, 119, 66, 84, 67, 74, 56, 73, 57, 57, 67, 87, 107, 65, 61, 61]', '[109, 77, 75, 51, 107, 75, 107, 47, 77, 67, 87, 69, 73, 43, 122, 117, 47, 118, 102, 43, 107, 79, 67, 79, 90, 56, 87, 55, 117, 83, 86, 68, 105, 57, 88, 114, 82, 114, 116, 119, 118, 122, 102, 68, 82, 70, 118, 70, 68, 50, 83, 85, 67, 69, 97, 100, 85, 86, 110, 56, 78, 71, 113, 97]', '[82, 76, 70, 57, 75, 97, 100, 56, 122, 74, 102, 57, 78, 115, 108, 87, 48, 43, 73, 117, 102, 53, 78, 71, 71, 70, 101, 97, 78, 119, 100, 77, 50, 114, 75, 79, 102, 87, 50, 97, 50, 102, 101, 65, 103, 112, 113, 100, 43, 65, 61, 61]', '[103, 99, 117, 65, 113, 100, 54, 82, 68, 67, 99, 65, 78, 82, 85, 73, 81, 77, 99, 68, 98, 99, 114, 50, 109, 108, 106, 86, 57, 111, 98, 65, 99, 57, 79, 99, 110, 73, 74, 73, 109, 112, 86, 81, 74, 90, 87, 54, 118, 72, 52, 61]', '[117, 112, 120, 114, 109, 76, 87, 79, 54, 101, 57, 47, 68, 79, 81, 72, 68, 113, 102, 51, 81, 117, 107, 116, 73, 68, 75, 89, 54, 82, 75, 57, 104, 121, 120, 114, 106, 86, 89, 67, 72, 121, 77, 85, 104, 81, 84, 115, 69, 77, 48, 106, 52, 50, 52, 61]', '8ebd73ece3be27cc10b362c906c587b6523748edaeb89c762b3cfee974cbb9dc', 'bf3a101fff20ccd1e2a21cf59608e2c7fba3a2b65c196d981bbb246af0156f98');
INSERT INTO adult_student (customer_auth_id, birthdate, encrypted_profile_picture, person_pii_id, created_at) VALUES ('44300', 'NULL', '[121, 65, 78, 67, 84, 88, 56, 68, 53, 120, 48, 97, 77, 66, 120, 83, 98, 108, 49, 81, 68, 69, 121, 76, 49, 107, 67, 87, 52, 101, 106, 83, 48, 105, 55, 115, 119, 79, 69, 61]', 100023, '2025-08-19 18:01:38');

-- Original data for adult_student: 
-- INSERT INTO adult_student (first_name, last_name, email, phone, address, zip_code, customer_auth_id, profile_picture, birthdate) VALUES
--    ),
--    ('Elizabeth', 'Young', 'elizabeth.y@example.com', '3355555555', '555 Pinecrest Dr', '44400', 5, NULL, '1998-05-01';


INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100024, '[120, 84, 67, 69, 80, 105, 118, 66, 110, 48, 110, 51, 73, 83, 89, 53, 71, 84, 84, 117, 43, 90, 99, 103, 47, 74, 114, 97, 89, 113, 118, 79, 109, 106, 80, 104, 81, 65, 61, 61]', '[49, 55, 55, 90, 71, 119, 71, 69, 53, 67, 54, 76, 43, 121, 101, 67, 55, 118, 80, 84, 54, 118, 120, 100, 77, 104, 80, 110, 68, 53, 105, 70, 82, 47, 107, 43, 72, 72, 103, 116, 107, 47, 90, 121, 100, 102, 68, 84, 68, 106, 105, 105, 99, 65, 61, 61]', '[85, 85, 89, 54, 83, 54, 79, 111, 55, 104, 54, 79, 117, 120, 76, 53, 107, 103, 69, 105, 86, 82, 116, 118, 102, 55, 66, 112, 82, 65, 81, 70, 100, 105, 65, 90, 50, 51, 88, 48, 68, 103, 53, 54, 105, 71, 88, 83, 87, 84, 43, 119, 110, 69, 81, 53, 56, 53, 56, 47, 100, 111, 80, 75, 87, 115, 113, 57]', '[43, 89, 102, 79, 65, 65, 99, 118, 74, 107, 114, 82, 116, 75, 78, 83, 49, 71, 99, 101, 86, 90, 82, 66, 117, 111, 51, 71, 67, 51, 55, 101, 85, 78, 88, 114, 47, 98, 97, 85, 120, 105, 78, 55]', '[48, 90, 66, 80, 89, 74, 69, 112, 114, 98, 50, 56, 121, 75, 52, 115, 100, 54, 81, 90, 105, 81, 115, 119, 105, 57, 103, 49, 49, 86, 103, 52, 104, 83, 102, 72, 99, 117, 85, 83, 82, 109, 48, 48, 49, 65, 80, 81, 67, 55, 119, 61]', '[77, 105, 71, 86, 80, 70, 48, 104, 118, 120, 65, 71, 122, 107, 55, 43, 117, 89, 67, 84, 52, 100, 108, 85, 85, 119, 122, 54, 102, 83, 82, 51, 85, 113, 76, 102, 120, 80, 88, 78, 43, 48, 72, 50, 112, 113, 50, 97, 72, 122, 114, 68, 109, 74, 52, 88, 114, 52, 107, 61]', '120e62113868ca97c9f96c86b8ef34900ad568fce471b8cfe0ba0f7451031bdc', '548674f78c8db9628b4934f6bcf16eb53052bb00f38a66b8f454d7ea2f76c841');
INSERT INTO adult_student (customer_auth_id, birthdate, encrypted_profile_picture, person_pii_id, created_at) VALUES ('44400', 'NULL', '[80, 57, 100, 99, 105, 120, 116, 118, 47, 49, 98, 101, 97, 119, 87, 118, 110, 57, 119, 81, 114, 122, 65, 107, 76, 118, 67, 101, 121, 90, 79, 107, 85, 87, 76, 77, 108, 66, 77, 61]', 100024, '2025-08-19 18:01:38');

-- Original data for adult_student: 
-- INSERT INTO adult_student (first_name, last_name, email, phone, address, zip_code, customer_auth_id, profile_picture, birthdate) VALUES
--    ),
--    ('Gabriel', 'Allen', 'gabriel.a@example.com', '3366666666', '666 Riverview Rd', '44500', 6, NULL, '1997-01-22';


INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100025, '[111, 47, 104, 66, 86, 104, 107, 79, 97, 54, 49, 68, 118, 65, 107, 118, 75, 108, 99, 82, 73, 68, 55, 99, 49, 70, 74, 81, 80, 57, 48, 49, 99, 43, 86, 50, 107, 119, 61, 61]', '[118, 85, 109, 111, 72, 101, 106, 75, 68, 54, 105, 43, 116, 90, 97, 54, 80, 115, 82, 100, 81, 97, 122, 120, 55, 51, 113, 74, 73, 67, 98, 120, 56, 67, 76, 99, 65, 74, 69, 110, 115, 85, 56, 85, 110, 65, 84, 99, 113, 97, 107, 61]', '[83, 51, 57, 51, 118, 80, 109, 104, 48, 117, 119, 119, 43, 113, 66, 109, 47, 65, 103, 103, 119, 47, 71, 71, 76, 98, 89, 53, 116, 80, 86, 88, 55, 106, 66, 76, 97, 69, 116, 71, 57, 75, 76, 101, 98, 51, 117, 100, 51, 71, 79, 111, 83, 98, 69, 89, 53, 122, 117, 74, 90, 82, 51, 117, 86, 119, 61, 61]', '[85, 57, 83, 81, 110, 66, 121, 119, 97, 77, 99, 100, 100, 99, 66, 105, 88, 78, 98, 87, 53, 100, 66, 50, 81, 85, 53, 110, 53, 108, 120, 90, 121, 53, 113, 74, 77, 115, 66, 88, 102, 98, 118, 117]', '[80, 71, 75, 113, 76, 119, 101, 68, 88, 47, 49, 90, 73, 116, 99, 50, 52, 70, 89, 110, 117, 98, 88, 79, 54, 75, 104, 120, 69, 57, 52, 79, 89, 116, 56, 103, 74, 55, 78, 71, 109, 72, 90, 81, 89, 82, 90, 105, 112, 98, 56, 61]', '[99, 83, 83, 105, 111, 51, 66, 68, 55, 103, 48, 55, 117, 116, 73, 74, 70, 55, 115, 55, 67, 110, 55, 73, 69, 85, 53, 82, 107, 88, 107, 86, 117, 53, 54, 110, 47, 49, 77, 97, 49, 83, 114, 114, 43, 119, 77, 70, 83, 43, 85, 66, 67, 105, 100, 101, 52, 104, 52, 61]', '7a536efbbb6136bf7fe0d6975c2e59b7a11ebac4d766203b93c4de9dc08825cf', '1670f014790650707eee6c027de573361658cfec15010d58bbc70af14a3ebb8d');
INSERT INTO adult_student (customer_auth_id, birthdate, encrypted_profile_picture, person_pii_id, created_at) VALUES ('44500', 'NULL', '[116, 80, 83, 83, 78, 88, 77, 103, 99, 43, 72, 97, 74, 50, 97, 76, 119, 75, 105, 81, 87, 111, 48, 119, 81, 97, 77, 117, 43, 111, 86, 88, 98, 107, 51, 115, 54, 67, 52, 61]', 100025, '2025-08-19 18:01:38');

-- Original data for adult_student: 
-- INSERT INTO adult_student (first_name, last_name, email, phone, address, zip_code, customer_auth_id, profile_picture, birthdate) VALUES
--    ),
--    ('Hannah', 'Sanchez', 'hannah.s@example.com', '3377777777', '777 Lakeside Ln', '44600', 7, NULL, '1999-09-14';


INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100026, '[99, 70, 75, 97, 112, 104, 120, 66, 72, 68, 54, 67, 66, 90, 112, 104, 98, 112, 121, 90, 78, 78, 84, 52, 47, 113, 106, 108, 113, 72, 67, 121, 47, 48, 65, 114, 122, 65, 61, 61]', '[122, 99, 83, 84, 65, 106, 121, 110, 85, 68, 53, 57, 78, 119, 103, 51, 69, 76, 107, 115, 109, 116, 83, 112, 87, 105, 90, 113, 74, 77, 100, 56, 48, 76, 74, 67, 75, 82, 115, 103, 54, 50, 100, 72, 115, 73, 79, 98, 53, 119, 61, 61]', '[70, 83, 79, 101, 107, 104, 65, 86, 83, 80, 106, 114, 90, 77, 56, 72, 122, 66, 52, 122, 48, 89, 43, 98, 56, 103, 109, 68, 78, 77, 101, 83, 75, 47, 83, 89, 103, 101, 109, 79, 51, 76, 70, 53, 114, 116, 100, 118, 57, 113, 109, 118, 72, 48, 119, 116, 114, 83, 57, 75, 122, 111, 88, 103]', '[78, 74, 65, 100, 78, 105, 97, 50, 83, 75, 90, 78, 72, 106, 104, 107, 54, 87, 50, 76, 78, 70, 110, 108, 79, 67, 69, 118, 75, 107, 83, 83, 86, 103, 52, 103, 111, 57, 79, 99, 107, 114, 83, 56, 56, 87, 69, 61]', '[115, 122, 118, 117, 73, 48, 79, 68, 102, 106, 43, 70, 48, 114, 104, 86, 70, 103, 90, 52, 71, 73, 69, 81, 97, 53, 97, 80, 98, 51, 98, 71, 56, 100, 89, 83, 80, 113, 119, 108, 79, 89, 84, 106, 114, 80, 70, 111, 121, 83, 119, 61]', '[54, 53, 79, 103, 112, 70, 57, 80, 120, 120, 101, 71, 109, 49, 98, 99, 82, 87, 111, 121, 65, 56, 47, 49, 51, 120, 84, 113, 110, 100, 76, 108, 51, 72, 79, 116, 87, 77, 109, 56, 109, 43, 87, 48, 88, 50, 111, 116, 53, 108, 115, 122, 70, 98, 102, 65, 99, 103, 61, 61]', '81ef87d7e38642d68a76b3f5aca4245e275385c1f6dbde4f7fe610bd5b226536', '1cdcfc3885f538bc4c6ef194013dc7450af9a44e26cfa2a4d0f89344406caf26');
INSERT INTO adult_student (customer_auth_id, birthdate, encrypted_profile_picture, person_pii_id, created_at) VALUES ('44600', 'NULL', '[50, 113, 79, 104, 77, 85, 50, 78, 80, 72, 71, 85, 88, 116, 105, 72, 104, 87, 48, 50, 101, 120, 116, 48, 48, 98, 115, 79, 89, 118, 53, 112, 83, 114, 110, 55, 65, 98, 81, 61]', 100026, '2025-08-19 18:01:38');

-- Original data for adult_student: 
-- INSERT INTO adult_student (first_name, last_name, email, phone, address, zip_code, customer_auth_id, profile_picture, birthdate) VALUES
--    ),
--    ('Isaac', 'Morris', 'isaac.m@example.com', '3388888888', '888 Forest Hills', '44700', 8, NULL, '1996-04-08';


INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100027, '[119, 116, 77, 108, 48, 118, 101, 89, 119, 43, 72, 121, 76, 57, 74, 65, 107, 49, 117, 82, 47, 101, 114, 68, 97, 81, 101, 73, 75, 51, 48, 105, 72, 69, 88, 56, 53, 65, 61, 61]', '[75, 90, 111, 85, 78, 106, 71, 79, 43, 47, 113, 50, 103, 81, 116, 65, 87, 99, 102, 71, 89, 121, 51, 83, 115, 107, 56, 83, 82, 110, 50, 80, 51, 43, 99, 54, 101, 90, 56, 100, 76, 65, 86, 122, 98, 55, 77, 77]', '[50, 52, 100, 89, 102, 78, 86, 67, 82, 54, 101, 43, 98, 112, 54, 106, 109, 106, 77, 68, 88, 86, 99, 111, 122, 84, 76, 72, 66, 76, 116, 80, 67, 118, 55, 113, 107, 76, 98, 79, 57, 116, 56, 90, 80, 70, 65, 113, 49, 82, 112, 118, 98, 106, 43, 97, 43, 109, 75, 109, 79, 115, 77, 61]', '[85, 53, 54, 76, 114, 101, 57, 109, 106, 73, 50, 65, 113, 80, 107, 106, 86, 85, 69, 119, 106, 76, 51, 104, 55, 107, 118, 47, 108, 111, 100, 103, 74, 107, 65, 87, 109, 106, 110, 110, 104, 71, 67, 110, 65, 81, 61, 61]', '[77, 82, 114, 90, 119, 109, 65, 107, 67, 106, 102, 80, 112, 77, 113, 115, 106, 106, 88, 118, 113, 121, 65, 85, 84, 85, 74, 118, 66, 53, 78, 82, 118, 101, 99, 53, 69, 117, 73, 53, 81, 85, 112, 68, 76, 122, 65, 68, 50, 54, 103, 61]', '[43, 66, 53, 122, 103, 54, 84, 116, 108, 105, 106, 87, 75, 81, 98, 70, 122, 54, 112, 104, 101, 47, 109, 71, 83, 108, 84, 72, 101, 83, 57, 52, 79, 103, 119, 65, 115, 52, 104, 111, 110, 69, 120, 85, 112, 81, 77, 102, 78, 108, 101, 114, 43, 112, 117, 55, 90, 71, 48, 61]', '40c15a475dd55b640f7c9a3c7b4f19c9c660dfd8b4709ef356c60ac417b60a42', '7f2cc2d8db905052b35620b7b081495960bc6193f2ccad1ad031398393205ed0');
INSERT INTO adult_student (customer_auth_id, birthdate, encrypted_profile_picture, person_pii_id, created_at) VALUES ('44700', 'NULL', '[120, 70, 122, 111, 72, 75, 86, 90, 49, 56, 55, 98, 101, 75, 110, 87, 43, 56, 118, 56, 121, 115, 112, 73, 55, 50, 113, 50, 109, 84, 120, 119, 80, 107, 109, 100, 77, 74, 69, 61]', 100027, '2025-08-19 18:01:38');

-- Original data for adult_student: 
-- INSERT INTO adult_student (first_name, last_name, email, phone, address, zip_code, customer_auth_id, profile_picture, birthdate) VALUES
--    ),
--    ('Jasmine', 'Nguyen', 'jasmine.n@example.com', '3399999999', '999 Meadowbrook Dr', '44800', 9, NULL, '1998-11-28';


INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100028, '[113, 109, 101, 116, 120, 52, 88, 118, 121, 70, 104, 73, 87, 86, 76, 97, 99, 118, 43, 120, 90, 97, 82, 71, 76, 87, 65, 73, 85, 122, 73, 109, 100, 72, 106, 72, 77, 81, 61, 61]', '[54, 70, 73, 122, 117, 77, 113, 114, 54, 87, 43, 99, 79, 75, 49, 76, 84, 73, 86, 48, 43, 116, 117, 99, 107, 81, 56, 88, 85, 75, 105, 103, 99, 80, 102, 97, 53, 97, 107, 120, 65, 108, 67, 65, 79, 80, 87, 77, 43, 69, 65, 61]', '[68, 105, 56, 109, 52, 70, 103, 50, 116, 108, 108, 74, 83, 108, 99, 48, 97, 77, 71, 98, 73, 54, 88, 114, 98, 83, 68, 75, 55, 43, 79, 122, 77, 55, 74, 113, 73, 86, 74, 68, 68, 108, 71, 80, 83, 76, 50, 99, 80, 100, 117, 89, 117, 100, 79, 119, 90, 76, 84, 52, 47, 116, 47, 84, 70, 65, 61, 61]', '[69, 75, 71, 74, 69, 110, 101, 72, 102, 101, 68, 54, 71, 121, 70, 75, 71, 113, 73, 114, 116, 101, 89, 101, 51, 115, 81, 76, 48, 107, 71, 78, 108, 54, 111, 85, 117, 103, 102, 67, 55, 121, 75, 47, 85, 103, 61, 61]', '[100, 86, 101, 66, 108, 101, 72, 78, 49, 109, 99, 70, 55, 77, 100, 86, 79, 105, 75, 55, 84, 75, 99, 107, 120, 115, 56, 82, 101, 85, 43, 79, 119, 77, 104, 70, 109, 111, 87, 65, 75, 80, 116, 100, 118, 111, 97, 72, 53, 72, 52, 61]', '[113, 84, 82, 56, 119, 52, 74, 88, 67, 102, 52, 48, 56, 109, 76, 52, 75, 73, 53, 90, 107, 105, 79, 55, 70, 47, 54, 68, 77, 122, 88, 112, 68, 120, 115, 74, 76, 66, 99, 53, 76, 106, 85, 99, 116, 114, 51, 113, 47, 78, 106, 47, 81, 88, 53, 104, 103, 87, 88, 69, 98, 81, 61, 61]', '6a3c8207b39c0646ae0ba1efc7a61b5c249fad04794b8e2825c35dc23dac6b93', '213c4d2db026ed435600846708e0d056658f34fab86071f297925e534d209325');
INSERT INTO adult_student (customer_auth_id, birthdate, encrypted_profile_picture, person_pii_id, created_at) VALUES ('44800', 'NULL', '[50, 69, 102, 122, 47, 80, 106, 116, 67, 108, 80, 117, 112, 66, 100, 115, 76, 57, 47, 73, 52, 56, 81, 111, 66, 76, 43, 85, 120, 119, 78, 66, 116, 109, 66, 117, 66, 82, 99, 61]', 100028, '2025-08-19 18:01:38');

-- Original data for adult_student: 
-- INSERT INTO adult_student (first_name, last_name, email, phone, address, zip_code, customer_auth_id, profile_picture, birthdate) VALUES
--    ),
--    ('Kevin', 'Bell', 'kevin.b@example.com', '3300000000', '100 Sunset Ter', '44900', 10, NULL, '1997-08-17';


INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100029, '[54, 116, 110, 74, 120, 105, 121, 88, 90, 67, 76, 102, 50, 86, 80, 88, 67, 53, 55, 115, 82, 98, 84, 73, 69, 119, 122, 121, 110, 76, 81, 53, 78, 104, 113, 100, 90, 81, 61, 61]', '[66, 111, 109, 113, 82, 74, 54, 108, 85, 116, 116, 118, 109, 102, 57, 48, 48, 88, 81, 71, 49, 122, 90, 79, 114, 78, 76, 113, 115, 69, 119, 111, 120, 65, 114, 122, 71, 98, 71, 107, 84, 116, 102, 50, 51, 102, 109, 69]', '[117, 47, 99, 73, 67, 70, 90, 98, 118, 99, 81, 109, 122, 109, 90, 86, 77, 102, 71, 101, 106, 103, 43, 115, 97, 116, 75, 88, 117, 82, 105, 48, 87, 103, 70, 110, 84, 81, 70, 43, 112, 52, 111, 68, 98, 117, 106, 51, 56, 90, 54, 74, 54, 81, 69, 113, 102, 108, 115, 49, 119, 83, 48, 61]', '[76, 71, 116, 99, 112, 89, 122, 80, 84, 75, 82, 66, 100, 47, 79, 53, 50, 82, 72, 102, 119, 83, 112, 90, 114, 82, 106, 78, 103, 97, 85, 117, 105, 118, 121, 116, 70, 122, 54, 52, 122, 74, 81, 61]', '[121, 84, 72, 97, 75, 57, 49, 78, 102, 52, 70, 77, 66, 54, 102, 116, 97, 66, 77, 97, 85, 82, 120, 54, 54, 110, 121, 68, 82, 99, 52, 56, 121, 76, 98, 56, 90, 55, 106, 68, 89, 86, 107, 82, 116, 75, 73, 103, 101, 52, 52, 61]', '[113, 85, 75, 99, 48, 120, 65, 110, 55, 55, 85, 88, 80, 77, 57, 48, 122, 81, 73, 68, 121, 56, 78, 49, 54, 100, 68, 115, 49, 112, 111, 115, 75, 47, 121, 108, 53, 117, 105, 85, 98, 118, 102, 73, 52, 74, 77, 88, 54, 121, 67, 82, 103, 48, 66, 73]', 'd150396feb16a33f707aca4003e6fa3f29e6f97bcb0dd976808e99cddd22a008', '8e80b2b4b22af3a71ca0a3d671a60749ede566e46113d3c6cd5edd66d3914116');
INSERT INTO adult_student (customer_auth_id, birthdate, encrypted_profile_picture, person_pii_id, created_at) VALUES ('44900', 'NULL', '[80, 116, 85, 48, 77, 66, 89, 55, 50, 111, 89, 106, 53, 112, 82, 50, 49, 57, 110, 103, 71, 79, 84, 101, 100, 103, 82, 48, 73, 50, 114, 86, 77, 118, 78, 118, 102, 105, 57, 86]', 100029, '2025-08-19 18:01:38');

   -- -----------------------------------------------------------------------------
   -- Data for `tutor` table - with UNIQUE emails and phones
   --
   -- Original data for tutor: 
-- INSERT INTO tutor (first_name, last_name, email, phone, customer_auth_id, birthdate) VALUES
--    ('Liam', 'Baker', 'liam.baker@example.com', '3312223333', 1, '1985-01-15';


INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100040, '[102, 47, 47, 65, 80, 50, 115, 111, 120, 82, 82, 90, 105, 82, 67, 85, 57, 108, 106, 105, 65, 97, 81, 80, 117, 122, 83, 112, 110, 76, 103, 75, 111, 106, 99, 122, 70, 84, 118, 51, 119, 100, 81, 61]', '[84, 98, 113, 74, 52, 43, 112, 50, 78, 102, 82, 73, 53, 74, 114, 71, 56, 108, 53, 119, 50, 82, 76, 88, 55, 74, 90, 86, 76, 103, 65, 82, 72, 89, 74, 120, 106, 111, 109, 113, 82, 78, 121, 89]', '[57, 69, 56, 89, 43, 81, 54, 97, 112, 112, 82, 118, 68, 87, 73, 118, 99, 81, 102, 110, 71, 89, 43, 119, 71, 82, 65, 54, 43, 50, 74, 113, 117, 103, 90, 79, 104, 73, 55, 89, 57, 67, 50, 106, 48, 88, 111, 105, 51, 74, 48, 61]', '[107, 55, 98, 77, 43, 81, 74, 107, 110, 121, 53, 55, 68, 75, 69, 109, 90, 87, 87, 48, 98, 48, 78, 49, 75, 75, 87, 109, 73, 99, 100, 53, 88, 109, 52, 66, 56, 110, 54, 88, 57, 65, 77, 89, 104, 68, 68, 87, 57, 66, 51, 89, 89, 50, 120, 79, 104, 66, 55, 90, 105, 75, 90, 97, 76, 80, 119, 61]', '[75, 48, 73, 105, 90, 86, 107, 90, 110, 57, 67, 65, 67, 71, 47, 74, 115, 48, 113, 52, 99, 118, 112, 121, 98, 53, 55, 100, 75, 86, 80, 115, 83, 108, 103, 122, 102, 54, 115, 61]', '[54, 112, 79, 82, 66, 73, 108, 87, 107, 83, 83, 85, 119, 81, 114, 56, 47, 80, 76, 114, 117, 77, 85, 75, 52, 114, 68, 86, 53, 116, 49, 112, 47, 75, 90, 89, 98, 118, 89, 73, 113, 111, 77, 56, 80, 55, 73, 116, 97, 68, 106, 69]', '2ca5c565b741d93b571dc7a251205399403b9b8e94110df229a37176fd8e725b', 'b4e833098dc02469609cdc89c8b9046faee9dbe96129d550e27aed1df843ac6f');
INSERT INTO tutor (birthdate, customer_auth_id, person_pii_id, created_at) VALUES (''1985-01-15', 1, 100040, '2025-08-19 18:01:38');

-- Original data for tutor: 
-- INSERT INTO tutor (first_name, last_name, email, phone, customer_auth_id, birthdate) VALUES
--    ),
--    ('Olivia', 'Clark', 'olivia.c@example.com', '3323334444', 2, '1990-03-22';


INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100041, '[106, 43, 83, 82, 52, 48, 52, 50, 76, 65, 108, 89, 83, 117, 105, 106, 87, 99, 77, 83, 69, 113, 55, 100, 85, 54, 76, 78, 79, 114, 85, 48, 89, 68, 84, 77, 67, 119, 61, 61]', '[83, 50, 98, 49, 77, 83, 86, 69, 81, 85, 65, 50, 48, 71, 52, 52, 115, 98, 83, 47, 104, 82, 98, 113, 120, 122, 48, 79, 68, 101, 48, 74, 83, 89, 114, 98, 101, 108, 81, 51, 50, 54, 113, 69, 81, 108, 83, 89, 87, 119, 61, 61]', '[106, 43, 122, 105, 70, 53, 105, 48, 120, 68, 69, 112, 79, 71, 70, 50, 117, 101, 86, 113, 110, 56, 100, 80, 109, 73, 119, 83, 115, 80, 115, 66, 99, 87, 54, 85, 116, 81, 67, 68, 106, 52, 111, 88, 98, 100, 121, 54, 78, 77, 109, 56, 75, 122, 88, 116, 121, 115, 119, 97, 49, 122, 52, 86]', '[48, 97, 79, 103, 48, 49, 108, 68, 112, 84, 117, 82, 87, 81, 113, 49, 56, 103, 113, 79, 76, 65, 70, 105, 122, 84, 122, 66, 104, 117, 71, 114, 72, 52, 50, 83, 67, 76, 48, 51, 102, 89, 57, 118]', '[70, 73, 83, 101, 90, 82, 82, 51, 66, 107, 104, 88, 69, 119, 73, 82, 112, 114, 57, 114, 77, 112, 86, 48, 79, 103, 84, 69, 53, 97, 71, 119, 79, 50, 110, 57, 118, 103, 120, 56, 82, 47, 98, 84, 57, 116, 104, 86, 52, 79, 52, 61]', '[117, 73, 104, 101, 67, 115, 79, 52, 87, 87, 99, 113, 89, 107, 74, 106, 119, 83, 78, 105, 52, 85, 79, 89, 98, 73, 68, 85, 85, 114, 47, 52, 48, 119, 55, 65, 119, 107, 69, 61]', '84ba4e105470d893b9e3a9a1f56be8194b0c42df4ece8ed0d490916dc19526d4', 'baa4941d577137bd09abfca4f9d82e2d8f43ac76cc9a53ac58006f5341ee541d');
INSERT INTO tutor (birthdate, customer_auth_id, person_pii_id, created_at) VALUES ('2', '3323334444', 100041, '2025-08-19 18:01:38');

-- Original data for tutor: 
-- INSERT INTO tutor (first_name, last_name, email, phone, customer_auth_id, birthdate) VALUES
--    ),
--    ('Noah', 'Davis', 'noah.d@example.com', '3334445555', 3, '1978-07-01';


INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100042, '[105, 105, 74, 99, 83, 56, 67, 66, 71, 82, 48, 65, 47, 53, 72, 97, 110, 54, 85, 75, 90, 89, 47, 99, 70, 81, 78, 81, 120, 111, 97, 102, 110, 102, 85, 43, 83, 65, 61, 61]', '[82, 112, 74, 114, 56, 55, 85, 81, 90, 50, 76, 43, 121, 113, 55, 102, 66, 115, 115, 50, 89, 80, 47, 100, 114, 73, 71, 115, 54, 47, 101, 75, 54, 83, 102, 104, 116, 119, 70, 108, 66, 122, 80, 47, 119, 108, 52, 61]', '[89, 112, 90, 100, 70, 51, 103, 80, 102, 43, 108, 112, 81, 69, 106, 100, 109, 68, 97, 54, 89, 78, 78, 103, 47, 112, 66, 118, 67, 107, 86, 71, 101, 110, 75, 90, 115, 71, 101, 111, 87, 55, 43, 122, 98, 80, 98, 65, 80, 120, 115, 113, 113, 71, 71, 119, 88, 72, 87, 51, 109, 119, 61, 61]', '[49, 101, 101, 51, 99, 86, 72, 75, 87, 88, 50, 109, 116, 75, 68, 90, 122, 83, 79, 70, 99, 47, 80, 110, 98, 106, 78, 103, 101, 54, 113, 65, 122, 52, 55, 119, 112, 76, 110, 72, 108, 69, 68, 54]', '[117, 111, 80, 89, 80, 70, 79, 86, 43, 68, 56, 81, 113, 86, 110, 90, 68, 110, 71, 89, 72, 117, 98, 53, 108, 77, 82, 57, 65, 101, 114, 73, 121, 50, 110, 85, 116, 109, 54, 98, 119, 74, 55, 80, 87, 47, 82, 75, 89, 100, 103, 61]', '[107, 67, 50, 71, 84, 83, 81, 75, 108, 105, 122, 65, 66, 71, 68, 122, 81, 116, 53, 53, 43, 52, 71, 79, 84, 98, 52, 102, 86, 43, 69, 89, 49, 116, 53, 50, 120, 103, 77, 61]', '09bac6c148190a94599bd0d3accd69f41c09e68b7678cb60121487245501c873', '683313d69084379711e47f9e23cc8d7a4cf1a3fac5b48a8b6c560232ef7619a6');
INSERT INTO tutor (birthdate, customer_auth_id, person_pii_id, created_at) VALUES ('3', '3334445555', 100042, '2025-08-19 18:01:38');

-- Original data for tutor: 
-- INSERT INTO tutor (first_name, last_name, email, phone, customer_auth_id, birthdate) VALUES
--    ),
--    ('Emma', 'Evans', 'emma.e@example.com', '3345556666', 4, '1995-09-11';


INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100043, '[68, 104, 49, 104, 47, 113, 54, 52, 71, 70, 73, 108, 101, 106, 87, 85, 55, 115, 115, 57, 69, 119, 119, 70, 48, 98, 65, 83, 54, 82, 122, 115, 73, 79, 87, 89, 56, 65, 61, 61]', '[120, 73, 99, 71, 117, 56, 82, 101, 68, 49, 113, 50, 68, 75, 90, 100, 71, 87, 119, 103, 120, 99, 112, 107, 68, 52, 118, 48, 86, 113, 97, 67, 120, 88, 82, 102, 116, 52, 89, 116, 87, 78, 66, 83, 68, 118, 111, 61]', '[85, 111, 72, 76, 70, 80, 99, 52, 70, 112, 90, 120, 115, 80, 114, 67, 116, 65, 73, 71, 70, 122, 114, 113, 117, 57, 108, 48, 90, 72, 108, 88, 68, 100, 112, 87, 84, 113, 105, 110, 70, 107, 54, 115, 69, 87, 79, 80, 49, 70, 86, 119, 107, 52, 103, 83, 56, 114, 116, 69, 67, 81, 61, 61]', '[113, 50, 50, 43, 47, 48, 107, 97, 88, 112, 74, 120, 53, 80, 55, 67, 74, 116, 112, 82, 43, 54, 106, 100, 87, 113, 103, 97, 67, 71, 122, 90, 81, 79, 104, 76, 65, 55, 79, 43, 69, 47, 53, 109]', '[90, 81, 68, 107, 97, 79, 122, 51, 114, 119, 48, 69, 74, 103, 109, 72, 78, 103, 55, 118, 109, 52, 99, 78, 103, 109, 72, 104, 103, 110, 121, 49, 122, 108, 80, 79, 112, 83, 106, 78, 66, 117, 87, 49, 108, 43, 98, 69, 76, 71, 89, 61]', '[114, 121, 81, 104, 112, 114, 66, 68, 78, 87, 117, 54, 89, 105, 71, 43, 67, 110, 73, 86, 101, 119, 98, 75, 66, 57, 50, 118, 55, 53, 105, 84, 67, 55, 66, 83, 71, 73, 119, 61]', 'f3c177c9276dda78a1a3e6edca69ccb21695884efd609ae242ad3f416e9a1795', '8658ebf1edf525094102102eb55229187c236f9147950c775273b2d33af516f0');
INSERT INTO tutor (birthdate, customer_auth_id, person_pii_id, created_at) VALUES ('4', '3345556666', 100043, '2025-08-19 18:01:38');

-- Original data for tutor: 
-- INSERT INTO tutor (first_name, last_name, email, phone, customer_auth_id, birthdate) VALUES
--    ),
--    ('Jackson', 'Foster', 'jackson.f@example.com', '3356667777', 5, '1982-12-05';


INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100044, '[51, 109, 57, 107, 57, 72, 121, 65, 57, 47, 74, 107, 54, 69, 116, 113, 105, 81, 48, 109, 80, 78, 107, 55, 116, 52, 106, 53, 122, 122, 97, 117, 104, 84, 55, 43, 98, 119, 61, 61]', '[47, 105, 108, 77, 86, 113, 111, 68, 67, 88, 69, 90, 80, 85, 87, 74, 106, 76, 83, 86, 50, 68, 77, 100, 110, 80, 101, 89, 116, 68, 85, 67, 102, 52, 122, 110, 122, 81, 52, 47, 103, 109, 118, 80, 105, 49, 57, 110, 43, 105, 48, 61]', '[75, 114, 90, 66, 66, 71, 99, 115, 66, 103, 71, 83, 76, 110, 74, 66, 101, 111, 89, 53, 111, 57, 88, 115, 56, 51, 100, 76, 43, 50, 90, 51, 83, 82, 56, 76, 122, 112, 68, 111, 83, 105, 116, 81, 49, 52, 116, 81, 81, 87, 57, 114, 70, 121, 101, 107, 120, 111, 111, 48, 116, 122, 71, 72, 77, 65, 61, 61]', '[43, 90, 56, 68, 90, 103, 79, 73, 117, 88, 102, 50, 47, 71, 114, 73, 48, 105, 117, 56, 89, 105, 113, 117, 109, 100, 97, 112, 121, 51, 68, 109, 112, 75, 74, 55, 115, 65, 85, 110, 43, 73, 67, 111, 112, 81, 61, 61]', '[90, 55, 82, 113, 103, 87, 117, 112, 89, 83, 43, 119, 103, 87, 74, 98, 67, 74, 105, 68, 80, 73, 108, 87, 100, 65, 110, 115, 100, 66, 57, 90, 56, 85, 50, 83, 110, 103, 89, 107, 105, 119, 110, 49, 119, 68, 117, 55, 70, 109, 103, 61]', '[110, 50, 87, 81, 99, 108, 75, 80, 81, 97, 99, 103, 48, 89, 72, 107, 97, 51, 76, 110, 54, 72, 106, 76, 100, 97, 69, 70, 77, 110, 108, 49, 72, 120, 103, 51, 47, 101, 77, 61]', '2bf8f5ae3c85dfa0ab96a0f396ac5f10e566a745cb43858450bc9dcf49290530', '7229de2d88d23cb0dd58131b4a2e974a6f5a988d4d003ec359abcc231d3dc590');
INSERT INTO tutor (birthdate, customer_auth_id, person_pii_id, created_at) VALUES ('5', '3356667777', 100044, '2025-08-19 18:01:38');

-- Original data for tutor: 
-- INSERT INTO tutor (first_name, last_name, email, phone, customer_auth_id, birthdate) VALUES
--    ),
--    ('Sophia', 'Green', 'sophia.g@example.com', '3367778888', 6, '1988-02-28';


INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100045, '[89, 111, 102, 115, 86, 100, 83, 74, 50, 99, 119, 108, 90, 99, 121, 82, 78, 121, 89, 121, 66, 76, 56, 86, 52, 110, 86, 48, 72, 118, 51, 87, 50, 109, 52, 51, 69, 81, 61, 61]', '[86, 98, 52, 117, 120, 69, 116, 121, 113, 53, 109, 51, 112, 67, 57, 56, 118, 89, 47, 112, 56, 84, 120, 67, 71, 72, 89, 77, 73, 80, 97, 52, 84, 51, 102, 79, 50, 112, 50, 72, 111, 75, 89, 79, 119, 49, 82, 114, 49, 103, 61, 61]', '[47, 120, 81, 107, 67, 74, 84, 119, 115, 73, 55, 116, 77, 53, 74, 84, 122, 88, 54, 67, 120, 103, 76, 108, 68, 105, 48, 101, 80, 122, 97, 83, 76, 81, 114, 67, 98, 116, 57, 43, 102, 78, 109, 110, 100, 65, 79, 113, 71, 55, 89, 74, 82, 48, 57, 77, 48, 85, 48, 119, 53, 106, 80, 47]', '[50, 115, 122, 67, 90, 56, 122, 117, 117, 84, 75, 47, 90, 65, 50, 76, 50, 104, 90, 90, 51, 48, 105, 53, 103, 101, 122, 74, 52, 99, 71, 103, 104, 52, 73, 65, 118, 49, 75, 118, 114, 52, 121, 99]', '[101, 85, 112, 88, 81, 101, 104, 57, 70, 56, 47, 82, 87, 75, 116, 119, 102, 114, 119, 54, 109, 89, 112, 119, 115, 98, 55, 119, 76, 112, 67, 109, 82, 112, 101, 87, 88, 50, 51, 68, 72, 67, 110, 78, 117, 52, 72, 83, 118, 51, 103, 61]', '[49, 89, 87, 73, 98, 68, 105, 106, 110, 119, 52, 66, 117, 83, 97, 121, 66, 76, 104, 108, 50, 83, 49, 55, 119, 79, 110, 84, 70, 88, 87, 100, 75, 112, 109, 80, 89, 74, 119, 61]', 'a6c95c0971d0ca4cc3f67edb7dbf41b120b9d974419fdf45e72e7ed8adcff17e', 'd486dfbd5fb578340bccbdd0a662527eab38550648d5f44517e5ac71b8824703');
INSERT INTO tutor (birthdate, customer_auth_id, person_pii_id, created_at) VALUES ('6', '3367778888', 100045, '2025-08-19 18:01:38');

-- Original data for tutor: 
-- INSERT INTO tutor (first_name, last_name, email, phone, customer_auth_id, birthdate) VALUES
--    ),
--    ('Aiden', 'Hill', 'aiden.h@example.com', '3378889999', 7, '1975-04-18';


INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100046, '[52, 114, 65, 85, 82, 75, 114, 68, 57, 107, 78, 117, 85, 110, 56, 104, 111, 82, 67, 54, 81, 70, 90, 53, 89, 43, 106, 122, 110, 111, 101, 103, 52, 65, 88, 66, 43, 65, 61, 61]', '[115, 65, 103, 119, 88, 83, 118, 121, 65, 52, 70, 98, 99, 112, 79, 74, 85, 116, 97, 72, 81, 66, 112, 115, 65, 48, 65, 79, 86, 88, 78, 122, 76, 83, 69, 67, 117, 117, 112, 49, 43, 51, 48, 100, 106, 84, 122, 70]', '[74, 78, 80, 97, 111, 78, 57, 82, 81, 84, 49, 66, 102, 90, 109, 98, 88, 102, 47, 71, 53, 88, 99, 54, 68, 70, 77, 49, 65, 103, 68, 54, 103, 70, 78, 86, 51, 111, 118, 84, 114, 57, 75, 119, 86, 51, 81, 54, 100, 70, 67, 66, 71, 47, 83, 110, 100, 107, 114, 86, 82, 67, 85, 61]', '[57, 122, 113, 48, 51, 72, 83, 76, 87, 115, 49, 97, 106, 74, 73, 116, 87, 43, 120, 55, 104, 76, 76, 104, 120, 83, 76, 67, 98, 73, 54, 107, 84, 68, 85, 69, 121, 72, 88, 74, 55, 72, 119, 61]', '[52, 53, 49, 101, 47, 100, 108, 87, 107, 118, 85, 57, 106, 55, 56, 77, 84, 66, 80, 105, 99, 74, 78, 53, 107, 57, 54, 115, 90, 52, 109, 49, 52, 89, 112, 55, 119, 102, 90, 78, 101, 88, 52, 120, 56, 73, 85, 68, 111, 53, 99, 61]', '[67, 72, 116, 108, 72, 112, 57, 108, 67, 57, 119, 50, 100, 79, 82, 89, 57, 89, 107, 49, 110, 65, 110, 110, 79, 112, 99, 49, 111, 52, 119, 48, 101, 81, 66, 47, 112, 73, 77, 61]', '9377c4071f2a77f4add65ea6afe2254c5bd82c350252e89ac1e35813ba7044e1', '21f5358c1fd3b713a0b8d13634c18d381383d67b2ab0f04c1282cd283c49d82d');
INSERT INTO tutor (birthdate, customer_auth_id, person_pii_id, created_at) VALUES ('7', '3378889999', 100046, '2025-08-19 18:01:38');

-- Original data for tutor: 
-- INSERT INTO tutor (first_name, last_name, email, phone, customer_auth_id, birthdate) VALUES
--    ),
--    ('Ava', 'King', 'ava.k@example.com', '3389990000', 8, '1998-06-30';


INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100047, '[106, 48, 53, 43, 112, 76, 81, 114, 113, 116, 50, 100, 104, 111, 79, 81, 47, 121, 90, 101, 122, 98, 55, 85, 75, 99, 51, 51, 78, 52, 99, 69, 72, 43, 67, 65, 68, 119, 61, 61]', '[53, 111, 121, 119, 119, 121, 112, 65, 104, 89, 97, 87, 66, 88, 115, 43, 102, 108, 68, 57, 75, 67, 80, 80, 107, 103, 83, 73, 104, 87, 79, 55, 68, 117, 102, 78, 103, 54, 113, 87, 111, 122, 84, 70, 108, 65, 61, 61]', '[112, 104, 103, 105, 47, 66, 121, 55, 122, 79, 90, 43, 106, 102, 97, 107, 98, 66, 98, 90, 52, 56, 67, 102, 77, 120, 51, 75, 71, 90, 75, 70, 119, 107, 53, 97, 98, 112, 81, 73, 119, 75, 71, 82, 112, 57, 118, 67, 66, 115, 72, 97, 79, 99, 90, 77, 101, 115, 110, 119]', '[104, 100, 55, 106, 55, 47, 100, 111, 106, 120, 104, 81, 109, 76, 50, 116, 99, 73, 120, 119, 109, 50, 111, 81, 106, 122, 52, 56, 68, 97, 69, 68, 98, 106, 90, 120, 71, 43, 81, 113, 103, 116, 99, 61]', '[80, 70, 81, 112, 76, 79, 117, 111, 57, 122, 50, 68, 107, 73, 121, 43, 115, 47, 90, 110, 101, 122, 115, 118, 88, 71, 65, 119, 78, 118, 77, 49, 51, 81, 98, 56, 77, 43, 107, 110, 86, 109, 103, 115, 108, 113, 56, 48, 107, 109, 56, 61]', '[50, 88, 112, 115, 101, 104, 57, 73, 77, 76, 102, 83, 87, 68, 84, 117, 121, 107, 104, 84, 43, 104, 57, 51, 70, 99, 57, 78, 71, 112, 90, 121, 67, 85, 90, 100, 80, 106, 85, 61]', '9242700f9e3d08253f69a3660261f63819dd967e95365ef1c1ea1260171539d5', '13166b63aaa73022433839e2a56117c9d04bc638877b53f945c06c4f665e159d');
INSERT INTO tutor (birthdate, customer_auth_id, person_pii_id, created_at) VALUES ('8', '3389990000', 100047, '2025-08-19 18:01:38');

-- Original data for tutor: 
-- INSERT INTO tutor (first_name, last_name, email, phone, customer_auth_id, birthdate) VALUES
--    ),
--    ('Lucas', 'Lewis', 'lucas.l@example.com', '3390001111', 9, '1983-10-09';


INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100048, '[76, 104, 53, 115, 119, 88, 78, 52, 80, 76, 67, 118, 108, 73, 85, 110, 122, 50, 77, 66, 104, 90, 69, 119, 104, 88, 80, 105, 104, 105, 83, 85, 114, 76, 108, 122, 48, 119, 61, 61]', '[105, 74, 117, 118, 108, 119, 80, 108, 85, 84, 110, 68, 75, 116, 66, 114, 113, 120, 67, 74, 105, 116, 69, 66, 115, 43, 100, 100, 109, 67, 111, 78, 117, 72, 55, 98, 106, 106, 97, 53, 71, 90, 43, 81, 75, 78, 79, 104]', '[108, 48, 72, 51, 80, 104, 79, 110, 80, 77, 65, 105, 114, 85, 113, 107, 78, 72, 108, 110, 68, 116, 51, 90, 102, 85, 69, 115, 47, 100, 83, 66, 78, 102, 113, 43, 69, 77, 84, 112, 113, 80, 43, 116, 57, 70, 71, 43, 79, 98, 118, 104, 52, 103, 121, 47, 100, 98, 69, 116, 74, 102, 103, 61]', '[84, 72, 49, 90, 69, 81, 72, 72, 54, 121, 118, 117, 122, 119, 66, 103, 78, 118, 65, 87, 71, 72, 71, 119, 74, 66, 84, 77, 84, 77, 54, 84, 54, 113, 65, 65, 99, 109, 113, 119, 74, 52, 89, 52]', '[77, 105, 109, 48, 79, 98, 56, 107, 55, 100, 67, 107, 97, 103, 109, 119, 77, 113, 86, 86, 116, 88, 122, 75, 98, 106, 118, 81, 47, 122, 117, 81, 77, 86, 117, 101, 122, 115, 72, 79, 73, 72, 119, 53, 108, 120, 117, 90, 119, 99, 73, 61]', '[111, 115, 101, 70, 49, 48, 98, 118, 65, 83, 107, 74, 76, 109, 65, 53, 90, 72, 70, 106, 78, 51, 57, 104, 71, 111, 81, 117, 48, 43, 105, 102, 110, 89, 98, 109, 101, 114, 89, 61]', '734b6c1963c34bc2fe1249569c74083eb8922e346168863954f6eedb4d6a4cf9', 'c625ca57418821d8e717df1b71bf589a042d8fc0f0a2c3776090e155d2d377d3');
INSERT INTO tutor (birthdate, customer_auth_id, person_pii_id, created_at) VALUES ('9', '3390001111', 100048, '2025-08-19 18:01:38');

-- Original data for tutor: 
-- INSERT INTO tutor (first_name, last_name, email, phone, customer_auth_id, birthdate) VALUES
--    ),
--    ('Mia', 'Moore', 'mia.m@example.com', '3301112222', 10, '1991-08-25';


INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100049, '[116, 71, 112, 115, 54, 78, 74, 112, 105, 120, 105, 69, 50, 82, 105, 112, 90, 82, 51, 118, 65, 48, 115, 76, 83, 70, 102, 57, 110, 57, 121, 53, 66, 52, 73, 114, 116, 119, 61, 61]', '[106, 90, 65, 78, 53, 67, 111, 65, 48, 113, 77, 82, 79, 66, 104, 77, 80, 82, 101, 118, 121, 111, 103, 89, 89, 90, 118, 85, 98, 115, 65, 68, 109, 51, 54, 88, 118, 86, 56, 97, 74, 51, 56, 73, 114, 119, 61, 61]', '[68, 48, 75, 75, 106, 114, 48, 43, 98, 50, 87, 111, 77, 81, 65, 103, 86, 119, 121, 110, 89, 101, 110, 69, 102, 112, 79, 48, 49, 80, 51, 90, 82, 90, 87, 110, 73, 71, 101, 105, 53, 110, 101, 53, 97, 102, 121, 48, 71, 51, 78, 97, 66, 111, 73, 67, 85, 111, 83, 66]', '[102, 54, 113, 57, 115, 73, 109, 103, 68, 89, 57, 113, 104, 43, 88, 83, 71, 77, 115, 43, 50, 47, 50, 79, 99, 86, 101, 48, 70, 117, 49, 87, 98, 66, 68, 113, 85, 110, 72, 52, 47, 72, 119, 52]', '[82, 85, 72, 87, 122, 85, 87, 109, 49, 101, 115, 69, 88, 67, 98, 90, 50, 57, 117, 100, 111, 120, 55, 51, 43, 79, 81, 71, 73, 74, 114, 100, 80, 68, 109, 101, 117, 80, 83, 80, 106, 107, 73, 53, 106, 49, 111, 106, 89, 101, 69, 61]', '[85, 105, 111, 86, 50, 67, 99, 108, 110, 82, 106, 55, 99, 122, 99, 54, 116, 73, 50, 76, 117, 82, 115, 103, 109, 105, 104, 43, 112, 102, 52, 66, 88, 120, 74, 85, 50, 102, 111, 119]', '4349aa2676811c8fb9cddf2ec4e3ab0a5577eda7844f037d9bcdf4f1bfeee3fa', '07724304d1fc4136ab5d671b6bac40d197c04299a4b714662077c82dac815c0f');
INSERT INTO tutor (birthdate, customer_auth_id, person_pii_id, created_at) VALUES ('10', '3301112222', 100049, '2025-08-19 18:01:38');

   -- -----------------------------------------------------------------------------
   -- Data for `minor_student` table - with UNIQUE emails and phones
   --
   -- Original data for minor_student: 
-- INSERT INTO minor_student (first_name, last_name, email, phone, address, zip_code, customer_auth_id, tutor_id, profile_picture, birthdate) VALUES
--    ('Alice', 'Smith', 'alice.s@example.com', '3312345670', '123 Cherry Ln', '45001', 1, 1, NULL, '2008-02-15';


INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100030, '[81, 69, 55, 79, 87, 67, 105, 99, 72, 97, 86, 108, 117, 57, 76, 74, 65, 120, 105, 84, 71, 120, 90, 56, 56, 121, 119, 52, 109, 121, 66, 48, 51, 89, 109, 68, 82, 99, 76, 100, 81, 71, 71, 78]', '[89, 49, 107, 66, 76, 68, 48, 70, 110, 119, 51, 118, 77, 67, 76, 97, 110, 90, 103, 53, 88, 57, 116, 80, 75, 99, 56, 119, 116, 71, 90, 101, 118, 116, 53, 68, 84, 90, 52, 107, 50, 105, 79, 109]', '[79, 81, 105, 106, 72, 85, 89, 69, 55, 112, 52, 88, 115, 117, 69, 86, 48, 70, 68, 67, 83, 107, 53, 83, 105, 107, 81, 107, 49, 112, 102, 109, 104, 98, 79, 109, 53, 83, 72, 52, 79, 108, 97, 55, 55, 90, 49, 47, 104, 74, 81, 61]', '[119, 116, 120, 119, 82, 55, 52, 118, 82, 66, 65, 47, 110, 97, 56, 55, 69, 74, 68, 90, 75, 114, 114, 84, 85, 103, 55, 118, 73, 89, 76, 54, 89, 102, 106, 112, 102, 67, 48, 117, 86, 120, 83, 110, 113, 120, 69, 111, 120, 79, 100, 105, 88, 108, 83, 116, 120, 77, 53, 82, 105, 55, 69, 61]', '[120, 65, 47, 89, 53, 109, 56, 106, 70, 119, 75, 55, 75, 108, 104, 113, 69, 74, 51, 87, 53, 82, 101, 109, 109, 86, 52, 116, 110, 48, 106, 82, 53, 101, 82, 53, 47, 97, 51, 107, 119, 80, 81, 89, 121, 118, 85, 75, 109, 73, 121, 109, 86, 83, 103, 61]', '[112, 55, 121, 111, 113, 67, 100, 101, 70, 87, 56, 57, 57, 56, 117, 53, 68, 104, 66, 82, 115, 114, 114, 89, 107, 90, 73, 56, 111, 111, 57, 82, 120, 114, 109, 116, 99, 71, 57, 77, 98, 119, 43, 120]', '2976d197a7a6fd16824e6c5462ce847396ceb808316a3fdaa4ef11b39fcf8152', '0b11f4dad50cfb477de2291479621492fe003786660022dc9ad8831e6aeb957f');
INSERT INTO minor_student (birthdate, encrypted_profile_picture, customer_auth_id, tutor_id, person_pii_id, created_at) VALUES ('1', '[88, 51, 55, 56, 48, 79, 114, 83, 77, 65, 53, 55, 56, 108, 111, 51, 79, 56, 72, 79, 71, 103, 116, 84, 109, 101, 66, 122, 119, 118, 119, 84, 79, 97, 67, 106, 71, 83, 89, 61]', NULL, '2008-02-15, 100030, '2025-08-19 18:01:38');

-- Original data for minor_student: 
-- INSERT INTO minor_student (first_name, last_name, email, phone, address, zip_code, customer_auth_id, tutor_id, profile_picture, birthdate) VALUES
--    ),
--    ('Bob', 'Jones', 'bob.j@example.com', '3323456780', '234 Oak Rd', '45002', 2, 2, NULL, '2007-06-20';


INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100031, '[48, 83, 78, 88, 90, 113, 52, 72, 48, 87, 67, 89, 119, 56, 111, 100, 112, 47, 113, 71, 117, 87, 119, 122, 52, 100, 109, 83, 122, 75, 79, 104, 118, 102, 73, 87, 112, 103, 61, 61]', '[99, 106, 80, 120, 100, 107, 109, 71, 107, 84, 110, 76, 75, 103, 104, 57, 90, 108, 85, 74, 89, 114, 65, 74, 118, 110, 98, 76, 57, 118, 54, 106, 57, 99, 69, 89, 120, 50, 117, 101, 84, 47, 80, 53, 68, 65, 61, 61]', '[105, 70, 43, 106, 113, 118, 113, 100, 70, 104, 68, 87, 99, 106, 97, 65, 83, 89, 117, 87, 56, 105, 122, 57, 75, 78, 55, 80, 108, 101, 104, 67, 67, 65, 116, 83, 55, 113, 108, 52, 115, 57, 112, 57, 116, 56, 67, 70, 43, 105, 98, 83, 77, 85, 90, 111, 110, 75, 118, 84]', '[66, 50, 98, 97, 79, 75, 55, 97, 104, 52, 65, 98, 47, 106, 80, 116, 43, 90, 81, 88, 75, 107, 83, 79, 79, 112, 80, 97, 76, 69, 118, 73, 57, 105, 85, 65, 69, 116, 77, 56, 89, 111, 53, 78]', '[53, 43, 55, 90, 86, 48, 86, 112, 106, 97, 97, 108, 48, 82, 75, 110, 109, 114, 74, 75, 55, 119, 51, 114, 56, 79, 110, 79, 112, 112, 115, 77, 50, 121, 121, 110, 73, 80, 84, 57, 67, 73, 83, 88, 47, 101, 116, 113, 97, 76, 119, 61]', '[66, 99, 47, 105, 118, 102, 116, 54, 89, 80, 86, 78, 72, 108, 120, 43, 72, 121, 76, 49, 86, 80, 88, 65, 120, 101, 53, 110, 118, 82, 68, 69, 119, 83, 53, 101, 78, 69, 67, 87, 116, 122, 78, 55, 55, 106, 114, 54, 55, 55, 65, 61]', 'a36e50d65a2da695ba385708be795576bd9eb8211095c5bec2a2987b8e8942e7', 'fe16a94194b3857b569579be460d2079ebcb36e9b8b03649191a92e8b0fe35c9');
INSERT INTO minor_student (birthdate, encrypted_profile_picture, customer_auth_id, tutor_id, person_pii_id, created_at) VALUES ('45002', '[108, 82, 81, 111, 76, 107, 90, 73, 117, 51, 98, 103, 99, 102, 65, 98, 107, 103, 119, 104, 57, 73, 111, 84, 77, 101, 111, 77, 85, 66, 67, 72, 88, 57, 119, 109, 79, 77, 48, 61]', 2, NULL, 100031, '2025-08-19 18:01:38');

-- Original data for minor_student: 
-- INSERT INTO minor_student (first_name, last_name, email, phone, address, zip_code, customer_auth_id, tutor_id, profile_picture, birthdate) VALUES
--    ),
--    ('Charlie', 'Davis', 'charlie.d@example.com', '3334567890', '345 Pine Ave', '45003', 3, 3, NULL, '2009-10-25';


INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100032, '[104, 87, 113, 85, 82, 84, 48, 83, 84, 72, 56, 114, 120, 52, 66, 87, 85, 75, 99, 80, 74, 57, 65, 104, 55, 122, 110, 72, 111, 86, 73, 115, 113, 88, 121, 113, 43, 103, 61, 61]', '[65, 108, 109, 119, 78, 48, 57, 73, 101, 69, 107, 119, 88, 53, 85, 52, 105, 88, 55, 57, 54, 79, 55, 66, 113, 112, 80, 75, 121, 111, 85, 81, 86, 43, 69, 106, 71, 118, 119, 74, 122, 99, 117, 75, 117, 70, 121, 108, 111, 108, 77, 61]', '[101, 51, 79, 119, 89, 106, 116, 73, 102, 102, 48, 106, 88, 78, 84, 77, 78, 87, 78, 82, 122, 90, 90, 104, 103, 51, 48, 67, 57, 47, 85, 52, 51, 102, 99, 82, 70, 76, 68, 111, 111, 87, 47, 83, 115, 79, 77, 90, 83, 119, 118, 87, 121, 67, 57, 66, 119, 118, 85, 99, 55, 86, 105, 98, 54, 65, 61, 61]', '[84, 81, 107, 67, 43, 98, 97, 72, 118, 71, 119, 70, 108, 105, 65, 50, 117, 71, 102, 65, 65, 48, 87, 74, 101, 104, 118, 76, 82, 112, 101, 79, 112, 103, 87, 111, 81, 65, 99, 43, 74, 108, 110, 119]', '[98, 82, 57, 72, 48, 117, 105, 79, 69, 80, 111, 43, 82, 103, 71, 57, 47, 52, 116, 116, 56, 83, 122, 97, 121, 114, 97, 98, 117, 51, 110, 113, 98, 100, 107, 76, 121, 76, 57, 98, 108, 120, 104, 52, 79, 68, 87, 43, 101, 49, 119, 61]', '[98, 67, 85, 43, 54, 97, 84, 105, 77, 56, 68, 118, 98, 101, 82, 122, 101, 51, 108, 119, 55, 118, 114, 102, 106, 75, 102, 86, 70, 73, 73, 71, 86, 90, 80, 76, 65, 82, 97, 48, 100, 67, 83, 66, 72, 111, 102, 83, 99, 88, 67, 84, 121, 119, 61, 61]', 'c5a8e0718f514bc783e13be3a7b9fdc82949baf1dacac50074e7e7ea00b23447', '683313d69084379711e47f9e23cc8d7a4cf1a3fac5b48a8b6c560232ef7619a6');
INSERT INTO minor_student (birthdate, encrypted_profile_picture, customer_auth_id, tutor_id, person_pii_id, created_at) VALUES ('45003', '[69, 82, 119, 71, 76, 69, 76, 76, 112, 103, 57, 100, 109, 120, 81, 103, 89, 52, 50, 67, 84, 112, 111, 83, 90, 114, 53, 85, 89, 99, 113, 69, 73, 69, 72, 52, 86, 81, 115, 61]', 3, NULL, 100032, '2025-08-19 18:01:38');

-- Original data for minor_student: 
-- INSERT INTO minor_student (first_name, last_name, email, phone, address, zip_code, customer_auth_id, tutor_id, profile_picture, birthdate) VALUES
--    ),
--    ('David', 'Wilson', 'david.w@example.com', '3345678901', '456 Elm St', '45004', 4, 4, NULL, '2006-01-30';


INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100033, '[83, 65, 81, 98, 85, 76, 78, 105, 77, 68, 86, 70, 72, 83, 68, 116, 77, 97, 74, 54, 107, 43, 102, 66, 108, 90, 113, 117, 87, 89, 43, 68, 74, 79, 104, 112, 114, 81, 61, 61]', '[43, 52, 67, 54, 78, 115, 82, 105, 102, 66, 55, 119, 105, 112, 73, 119, 70, 100, 85, 83, 52, 52, 55, 103, 48, 55, 49, 106, 70, 74, 81, 118, 76, 97, 53, 84, 65, 114, 106, 104, 69, 65, 115, 114, 57, 51, 115, 101]', '[49, 73, 74, 77, 84, 85, 105, 51, 97, 51, 53, 69, 47, 56, 75, 69, 102, 99, 76, 113, 106, 54, 114, 98, 120, 74, 80, 112, 56, 117, 76, 88, 98, 52, 70, 82, 73, 121, 90, 48, 52, 69, 47, 116, 103, 102, 51, 50, 120, 112, 78, 83, 82, 84, 48, 84, 101, 98, 122, 103, 72, 70, 115, 61]', '[43, 109, 111, 72, 97, 104, 97, 55, 87, 49, 65, 119, 111, 83, 100, 85, 88, 54, 76, 99, 55, 114, 71, 111, 84, 108, 107, 55, 116, 66, 87, 56, 51, 105, 56, 77, 111, 74, 67, 100, 52, 121, 97, 100, 56, 81, 61, 61]', '[50, 119, 49, 104, 55, 55, 114, 99, 85, 70, 69, 69, 70, 49, 111, 89, 74, 98, 84, 65, 57, 52, 50, 80, 48, 49, 78, 65, 55, 122, 107, 122, 87, 113, 105, 88, 49, 102, 120, 88, 90, 55, 112, 100, 73, 104, 84, 112, 84, 116, 99, 61]', '[83, 55, 71, 102, 69, 87, 57, 111, 104, 68, 65, 100, 112, 107, 66, 84, 110, 77, 109, 98, 98, 99, 83, 89, 89, 82, 105, 53, 71, 86, 73, 55, 109, 107, 67, 43, 73, 53, 107, 105, 112, 73, 86, 113, 120, 79, 103, 52, 97, 98, 73, 61]', '594a07fc54ffeab25aa8e039c13b09e915885996e4cb950b62e215a16353cf12', 'fb7961d139e4da12af18c24571a166fb77c391a15abbf24d6ccf85186f441bbe');
INSERT INTO minor_student (birthdate, encrypted_profile_picture, customer_auth_id, tutor_id, person_pii_id, created_at) VALUES ('45004', '[67, 47, 69, 72, 76, 71, 82, 81, 102, 49, 112, 88, 106, 83, 89, 68, 68, 79, 116, 67, 78, 108, 118, 98, 76, 68, 107, 67, 49, 47, 110, 88, 79, 72, 116, 78, 69, 55, 119, 61]', 4, NULL, 100033, '2025-08-19 18:01:38');

-- Original data for minor_student: 
-- INSERT INTO minor_student (first_name, last_name, email, phone, address, zip_code, customer_auth_id, tutor_id, profile_picture, birthdate) VALUES
--    ),
--    ('Emily', 'Garcia', 'emily.g@example.com', '3356789012', '567 Maple Ln', '45005', 5, 5, NULL, '2008-05-05';


INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100034, '[73, 79, 122, 120, 103, 83, 76, 52, 72, 56, 53, 72, 107, 87, 122, 119, 76, 43, 103, 114, 82, 65, 82, 117, 104, 51, 72, 70, 81, 110, 84, 88, 103, 74, 111, 83, 81, 65, 61, 61]', '[109, 121, 113, 78, 105, 75, 74, 112, 90, 121, 69, 98, 98, 117, 79, 121, 89, 111, 90, 121, 68, 119, 83, 66, 118, 113, 66, 89, 87, 105, 86, 80, 109, 117, 82, 68, 88, 82, 113, 43, 66, 71, 121, 69, 71, 113, 69, 52]', '[101, 55, 107, 103, 113, 87, 80, 79, 54, 77, 56, 54, 101, 97, 81, 115, 120, 86, 110, 53, 101, 72, 69, 51, 70, 121, 77, 118, 52, 50, 69, 111, 77, 106, 48, 108, 101, 79, 80, 69, 81, 67, 120, 105, 55, 70, 86, 65, 99, 114, 75, 72, 82, 100, 65, 76, 70, 69, 108, 109, 103, 107, 115, 61]', '[50, 106, 52, 53, 99, 85, 51, 106, 120, 104, 74, 50, 110, 84, 86, 54, 69, 81, 122, 86, 118, 78, 115, 67, 65, 113, 72, 68, 68, 53, 88, 108, 75, 103, 55, 109, 52, 73, 103, 77, 97, 122, 107, 51, 47, 65, 61, 61]', '[66, 79, 112, 43, 122, 48, 106, 67, 73, 97, 108, 118, 87, 97, 117, 69, 117, 114, 110, 81, 71, 43, 114, 99, 56, 99, 89, 50, 73, 72, 77, 88, 112, 101, 52, 47, 102, 90, 47, 82, 119, 79, 89, 73, 116, 114, 48, 85, 43, 100, 65, 61]', '[107, 50, 51, 116, 82, 78, 76, 72, 76, 122, 111, 88, 102, 69, 120, 116, 100, 89, 53, 52, 106, 97, 68, 113, 57, 71, 71, 74, 68, 99, 85, 111, 100, 76, 115, 99, 97, 90, 74, 48, 102, 83, 102, 113, 97, 99, 70, 122, 89, 74, 84, 77, 90, 81, 61, 61]', 'ceb85e959f3aff25af859f75748dcd56da0549f0916839899264fec2ce40c00a', '2c3aaefea8267c66822f6edc0e42d9b7384695f9c0407eabda141770aab8901e');
INSERT INTO minor_student (birthdate, encrypted_profile_picture, customer_auth_id, tutor_id, person_pii_id, created_at) VALUES ('45005', '[79, 110, 51, 101, 79, 82, 106, 120, 121, 78, 56, 90, 116, 89, 98, 50, 122, 67, 53, 100, 52, 97, 98, 65, 56, 56, 98, 80, 100, 112, 75, 47, 83, 43, 49, 53, 114, 88, 69, 61]', 5, NULL, 100034, '2025-08-19 18:01:38');

-- Original data for minor_student: 
-- INSERT INTO minor_student (first_name, last_name, email, phone, address, zip_code, customer_auth_id, tutor_id, profile_picture, birthdate) VALUES
--    ),
--    ('Frank', 'Rodriguez', 'frank.r@example.com', '3367890123', '678 Willow Rd', '45006', 6, 6, NULL, '2007-09-10';


INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100035, '[48, 80, 104, 111, 110, 90, 52, 109, 98, 107, 74, 122, 122, 101, 120, 97, 82, 43, 121, 85, 79, 53, 86, 50, 100, 78, 47, 88, 56, 110, 69, 81, 71, 72, 66, 98, 98, 65, 61, 61]', '[74, 88, 55, 86, 98, 47, 85, 83, 107, 105, 99, 73, 88, 47, 67, 51, 65, 51, 120, 78, 55, 73, 104, 105, 75, 77, 88, 70, 52, 53, 70, 89, 82, 43, 121, 100, 47, 76, 120, 108, 84, 114, 109, 57, 69, 50, 98, 84]', '[79, 50, 112, 119, 115, 65, 84, 76, 81, 76, 68, 118, 66, 113, 116, 66, 115, 98, 77, 99, 114, 82, 106, 110, 120, 90, 73, 43, 97, 86, 101, 51, 68, 112, 78, 120, 110, 53, 66, 85, 89, 102, 100, 87, 66, 78, 112, 55, 103, 48, 69, 53, 57, 78, 43, 69, 83, 52, 54, 122, 110, 122, 69, 61]', '[122, 108, 106, 79, 101, 117, 106, 99, 67, 47, 56, 101, 89, 47, 53, 70, 81, 99, 53, 118, 85, 117, 90, 100, 110, 104, 119, 47, 80, 82, 112, 65, 113, 43, 69, 74, 108, 74, 70, 74, 100, 73, 119, 118, 121, 87, 109, 65, 120, 81, 61, 61]', '[81, 69, 114, 80, 110, 122, 108, 109, 50, 118, 77, 66, 77, 99, 102, 122, 111, 122, 97, 121, 70, 117, 104, 110, 51, 114, 49, 49, 48, 77, 105, 66, 101, 102, 77, 65, 81, 66, 87, 75, 106, 78, 78, 51, 101, 78, 73, 108, 79, 72, 107, 61]', '[120, 90, 70, 107, 121, 115, 72, 71, 115, 51, 50, 113, 113, 81, 97, 101, 103, 109, 48, 112, 89, 72, 54, 82, 118, 72, 79, 72, 75, 56, 119, 76, 54, 87, 48, 89, 103, 115, 88, 117, 101, 53, 103, 86, 120, 104, 53, 78, 115, 107, 106, 55, 47, 76, 89, 61]', 'e7bccd1b43d8acb65dba5c9a2b2241fdc11656160fbc927399cc4981cdded977', '503046646e0c61a5fe27c74a0da0aea7affe2c6a6cc1c77d42241db9e77d0716');
INSERT INTO minor_student (birthdate, encrypted_profile_picture, customer_auth_id, tutor_id, person_pii_id, created_at) VALUES ('45006', '[65, 53, 88, 67, 101, 74, 100, 85, 109, 118, 102, 114, 50, 112, 101, 120, 66, 49, 105, 118, 84, 122, 74, 68, 100, 109, 56, 110, 83, 120, 47, 100, 65, 85, 54, 74, 66, 52, 99, 61]', 6, NULL, 100035, '2025-08-19 18:01:38');

-- Original data for minor_student: 
-- INSERT INTO minor_student (first_name, last_name, email, phone, address, zip_code, customer_auth_id, tutor_id, profile_picture, birthdate) VALUES
--    ),
--    ('Grace', 'Martinez', 'grace.m@example.com', '3378901234', '789 Cedar Ave', '45007', 7, 7, NULL, '2009-01-15';


INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100036, '[50, 108, 65, 71, 119, 109, 114, 114, 48, 87, 109, 68, 55, 76, 105, 103, 57, 70, 112, 103, 115, 111, 97, 77, 120, 90, 49, 112, 66, 118, 79, 65, 106, 99, 83, 113, 75, 103, 61, 61]', '[73, 109, 117, 82, 108, 104, 78, 104, 119, 77, 97, 84, 122, 99, 85, 83, 112, 51, 82, 116, 112, 83, 83, 70, 57, 78, 52, 85, 89, 53, 55, 72, 104, 113, 66, 53, 75, 106, 102, 51, 100, 78, 53, 112, 109, 98, 76, 48]', '[71, 68, 83, 55, 54, 97, 103, 86, 88, 87, 85, 89, 100, 98, 51, 108, 65, 119, 102, 75, 120, 102, 43, 113, 100, 77, 67, 74, 77, 109, 122, 76, 79, 104, 54, 89, 100, 75, 103, 70, 89, 113, 81, 43, 79, 54, 77, 103, 69, 102, 55, 73, 114, 118, 67, 48, 111, 67, 54, 43, 52, 98, 107, 61]', '[75, 75, 99, 66, 120, 113, 87, 101, 77, 105, 56, 71, 55, 68, 107, 112, 102, 89, 69, 88, 71, 100, 73, 70, 67, 79, 50, 47, 114, 43, 108, 103, 103, 50, 90, 73, 82, 107, 68, 68, 108, 86, 67, 75, 75, 82, 65, 89]', '[112, 117, 81, 76, 109, 56, 105, 69, 47, 86, 74, 118, 76, 83, 74, 81, 71, 120, 111, 79, 80, 74, 76, 52, 56, 50, 69, 101, 85, 101, 70, 57, 53, 78, 74, 71, 74, 90, 48, 71, 107, 88, 69, 77, 111, 114, 111, 83, 55, 51, 111, 61]', '[115, 119, 73, 80, 43, 77, 114, 105, 122, 66, 100, 118, 109, 72, 102, 112, 102, 82, 47, 75, 113, 110, 65, 112, 78, 111, 77, 84, 69, 72, 101, 117, 122, 87, 89, 116, 81, 53, 65, 43, 122, 76, 120, 76, 97, 112, 103, 77, 99, 90, 121, 73, 103, 53, 107, 61]', 'd0ab6ed1b6392484f51d9ad62ba17486aa0fc3abf566c13a35c29fa5ac440d53', '1cd8e5f4826e1e694b14ca74ea2f39975dbdfc9ab93b47a7ae7889144c5bc36b');
INSERT INTO minor_student (birthdate, encrypted_profile_picture, customer_auth_id, tutor_id, person_pii_id, created_at) VALUES ('45007', '[47, 52, 113, 82, 51, 102, 86, 43, 113, 68, 111, 101, 104, 68, 104, 43, 122, 68, 86, 120, 113, 90, 113, 102, 85, 81, 65, 50, 120, 51, 83, 113, 82, 51, 78, 72, 70, 117, 81, 61]', 7, NULL, 100036, '2025-08-19 18:01:38');

-- Original data for minor_student: 
-- INSERT INTO minor_student (first_name, last_name, email, phone, address, zip_code, customer_auth_id, tutor_id, profile_picture, birthdate) VALUES
--    ),
--    ('Henry', 'Anderson', 'henry.a@example.com', '3389012345', '890 Birch Ln', '45008', 8, 8, NULL, '2006-04-20';


INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100037, '[107, 70, 53, 43, 120, 119, 55, 116, 101, 84, 98, 114, 97, 56, 52, 48, 87, 102, 82, 121, 72, 108, 118, 113, 80, 48, 57, 112, 76, 70, 111, 54, 111, 55, 108, 43, 70, 65, 61, 61]', '[117, 89, 89, 98, 107, 72, 77, 112, 53, 79, 101, 108, 103, 50, 90, 112, 119, 65, 49, 47, 108, 68, 72, 102, 53, 48, 98, 84, 83, 104, 80, 116, 50, 86, 118, 122, 84, 113, 72, 107, 103, 69, 88, 84, 110, 66, 78, 50]', '[114, 71, 104, 100, 109, 83, 110, 86, 101, 73, 56, 112, 90, 88, 78, 105, 55, 50, 122, 72, 79, 52, 84, 87, 99, 71, 88, 53, 98, 111, 113, 83, 106, 68, 50, 101, 83, 103, 79, 81, 54, 75, 118, 79, 50, 47, 82, 66, 78, 108, 114, 65, 75, 100, 97, 73, 55, 120, 43, 107, 57, 113, 69, 61]', '[97, 88, 56, 87, 73, 106, 86, 51, 56, 113, 109, 55, 80, 83, 90, 77, 85, 120, 111, 90, 77, 71, 110, 103, 110, 99, 115, 80, 103, 76, 88, 111, 76, 120, 105, 50, 47, 112, 97, 79, 115, 87, 49, 109, 107, 106, 57, 122]', '[112, 53, 73, 87, 102, 101, 99, 75, 75, 106, 84, 57, 80, 107, 68, 57, 101, 117, 78, 81, 116, 51, 114, 103, 118, 55, 103, 53, 122, 73, 67, 66, 70, 119, 84, 48, 107, 115, 107, 99, 99, 76, 66, 117, 57, 112, 83, 107, 108, 105, 69, 61]', '[110, 119, 65, 120, 115, 121, 54, 101, 99, 69, 49, 73, 52, 73, 100, 77, 110, 51, 99, 71, 109, 110, 110, 53, 122, 107, 49, 119, 56, 67, 97, 101, 69, 78, 83, 111, 48, 80, 90, 71, 56, 55, 56, 114, 105, 50, 110, 68, 49, 99, 75, 51, 114, 119, 61, 61]', '64ed58c26115a221c4ccb58b184ea88ac75ff0e7a9a66e0e86b3bb6956526095', '9eac806b76bab0185444c731f3f419fe67f52bc777431faba5e671097528abd3');
INSERT INTO minor_student (birthdate, encrypted_profile_picture, customer_auth_id, tutor_id, person_pii_id, created_at) VALUES ('45008', '[65, 108, 73, 73, 74, 107, 108, 103, 97, 76, 73, 76, 72, 112, 74, 77, 115, 56, 97, 66, 97, 109, 50, 113, 52, 52, 117, 99, 83, 120, 114, 116, 104, 87, 116, 80, 102, 116, 77, 61]', 8, NULL, 100037, '2025-08-19 18:01:38');

-- Original data for minor_student: 
-- INSERT INTO minor_student (first_name, last_name, email, phone, address, zip_code, customer_auth_id, tutor_id, profile_picture, birthdate) VALUES
--    ),
--    ('Ivy', 'Thomas', 'ivy.t@example.com', '3390123456', '901 Hickory Rd', '45009', 9, 9, NULL, '2008-08-25';


INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100038, '[106, 75, 77, 103, 122, 48, 71, 88, 102, 75, 48, 107, 56, 121, 53, 65, 108, 116, 83, 72, 56, 84, 87, 113, 50, 84, 81, 80, 52, 121, 84, 52, 105, 55, 110, 54, 50, 65, 61, 61]', '[78, 120, 85, 120, 119, 77, 68, 115, 54, 74, 43, 73, 79, 54, 70, 74, 103, 68, 88, 103, 74, 107, 103, 82, 43, 104, 75, 116, 115, 56, 83, 108, 54, 71, 66, 115, 47, 89, 107, 106, 117, 57, 113, 55, 53, 65, 61, 61]', '[107, 80, 101, 78, 65, 108, 89, 48, 53, 119, 48, 81, 112, 119, 82, 68, 105, 89, 76, 107, 52, 113, 90, 77, 82, 103, 105, 100, 47, 103, 52, 90, 122, 97, 51, 87, 49, 71, 105, 120, 106, 69, 70, 87, 50, 107, 107, 49, 52, 85, 52, 67, 109, 85, 116, 112, 81, 72, 107, 66]', '[65, 102, 101, 86, 50, 55, 57, 70, 121, 52, 115, 119, 70, 57, 100, 102, 82, 84, 89, 119, 89, 48, 67, 114, 117, 103, 103, 102, 114, 102, 89, 71, 117, 100, 99, 75, 72, 99, 83, 106, 68, 103, 122, 89, 49, 65, 61, 61]', '[69, 71, 75, 102, 73, 67, 53, 119, 65, 122, 67, 87, 87, 99, 52, 85, 67, 71, 107, 56, 66, 106, 47, 100, 76, 56, 99, 118, 73, 74, 102, 115, 119, 54, 48, 119, 65, 70, 55, 105, 115, 118, 55, 65, 78, 75, 56, 121, 68, 98, 52, 61]', '[81, 75, 52, 81, 79, 110, 78, 104, 53, 100, 76, 68, 49, 107, 109, 55, 77, 102, 72, 67, 87, 47, 121, 119, 68, 73, 50, 43, 51, 90, 84, 69, 105, 52, 47, 118, 105, 83, 103, 89, 118, 79, 101, 77, 47, 90, 52, 101, 108, 78, 65, 120, 118, 122, 87, 53]', '80b37eeeb71acafbbc143830a8231ba228e193897c9400fb5bfb989e93351da6', '5dfcf9ef1fb1ecbce32fefe37ae99aff68832a7e2ac74f52daa5a1bcd8038118');
INSERT INTO minor_student (birthdate, encrypted_profile_picture, customer_auth_id, tutor_id, person_pii_id, created_at) VALUES ('45009', '[90, 82, 65, 52, 82, 88, 102, 68, 54, 82, 74, 85, 122, 56, 97, 105, 65, 121, 101, 113, 53, 90, 81, 106, 81, 80, 111, 112, 82, 88, 80, 105, 114, 88, 84, 73, 66, 118, 103, 61]', 9, NULL, 100038, '2025-08-19 18:01:38');

-- Original data for minor_student: 
-- INSERT INTO minor_student (first_name, last_name, email, phone, address, zip_code, customer_auth_id, tutor_id, profile_picture, birthdate) VALUES
--    ),
--    ('Jack', 'Jackson', 'jack.j@example.com', '3301234567', '012 Oak St', '45010', 10, 10, NULL, '2007-12-30';


INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100039, '[51, 112, 90, 52, 81, 87, 86, 120, 78, 67, 49, 120, 47, 83, 68, 114, 47, 70, 70, 113, 99, 66, 108, 47, 71, 112, 121, 104, 75, 87, 104, 55, 71, 101, 52, 110, 83, 65, 61, 61]', '[55, 82, 66, 51, 118, 102, 111, 75, 51, 106, 107, 84, 118, 68, 81, 82, 50, 99, 66, 84, 69, 68, 89, 74, 53, 65, 66, 78, 52, 120, 116, 82, 106, 111, 67, 53, 53, 108, 57, 90, 75, 72, 83, 118, 118, 113, 89, 61]', '[121, 120, 76, 98, 87, 103, 81, 110, 114, 84, 98, 48, 101, 109, 78, 113, 84, 108, 68, 57, 122, 103, 118, 65, 113, 75, 121, 69, 86, 48, 120, 55, 74, 122, 86, 43, 65, 88, 51, 53, 52, 49, 99, 51, 49, 104, 47, 73, 104, 82, 70, 90, 108, 98, 104, 53, 67, 90, 111, 120, 54, 81, 61, 61]', '[113, 48, 111, 106, 110, 72, 111, 69, 108, 100, 74, 73, 80, 56, 87, 85, 114, 80, 99, 113, 87, 103, 86, 102, 108, 79, 112, 80, 54, 85, 73, 87, 57, 47, 43, 70, 115, 69, 84, 122, 122, 47, 78, 89, 50, 66, 89, 61]', '[47, 77, 90, 101, 47, 51, 88, 52, 84, 85, 107, 49, 102, 43, 57, 75, 110, 65, 121, 72, 100, 69, 88, 70, 49, 120, 116, 80, 117, 56, 104, 86, 104, 56, 111, 53, 69, 71, 75, 81, 50, 117, 73, 83, 100, 50, 76, 89, 56, 76, 48, 61]', '[73, 108, 71, 101, 101, 72, 102, 51, 56, 110, 118, 75, 82, 100, 47, 86, 68, 71, 71, 88, 56, 104, 67, 120, 85, 106, 81, 114, 48, 66, 73, 86, 110, 74, 49, 70, 73, 122, 69, 121, 47, 98, 108, 75, 74, 78, 83, 120, 78, 72, 48, 61]', '4af50935a804098d1a4bd09481df05bfe7627ad61a2dd1e12bb9d6b1debf50a0', '502ae197407d7228d7b23234763529027e1da6a441301a6f6f405cdc62225208');
INSERT INTO minor_student (birthdate, encrypted_profile_picture, customer_auth_id, tutor_id, person_pii_id, created_at) VALUES ('45010', '[68, 84, 118, 82, 121, 105, 110, 86, 48, 122, 70, 114, 111, 97, 81, 98, 82, 83, 75, 53, 68, 105, 49, 100, 67, 49, 88, 75, 71, 86, 52, 118, 116, 79, 90, 50, 82, 122, 48, 76]', 10, NULL, 100039, '2025-08-19 18:01:38');

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