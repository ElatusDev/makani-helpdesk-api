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

   -- Data for employee (10 rows)
   INSERT INTO employee (first_name, last_name, email, phone, address, zip_code, employee_type, internal_auth_id, birthdate) VALUES
('cbaffdde3d1b27c59e494cfb52bb2ef2444874dc00b365c2b320f9958b33d63a2d', '8775a7cee40546ef1eac4ea003505c22ef0662fd2f61f01cc51e670a67ddda32e15b7f', '3dbfa83dc7d2b48dcda84762a39488b86f0561ea41794be305e3241ddfe1a8cef5daf123d641f667074c3a924d2ced', 'cb825ec75451dcb90d1eb09dab2eb90aeb09ccab151c6a8f86e5ac8fe339d15ed4d46c25b19e19a9', '7401be097bd3ae770982fedd8716dafdfb19ffd03bfc5479e9174ebbc185160a96dc54f08730c2', '93eb83934b18682f0d0fcccda00de153cd6c14f4e700a28c78a28e60745030353d', 'Full-time', 1, '1990-05-15'),
('e3b29ed495f8f4e6682d17d379df8786c19a3754668d356818668f64698a0f', '6624a221ba660c4902a4675c6363c434adcf7040691a37ecebf1d412248108899789a849', 'e8202b40f820e3e0f349b35062e4e91d6799410fbfcc343a9546df296be1eb9ca8bd2666652b9613ce3639630b', '65349314323525bc99a641ab57ec2928a42f8e970413a063c0fb16f940c380815d5db6ec7ac6e575', '2aae39dc5f4ff326a31b462a53e75428e508b752472a986cfdf7e29a21d979aca0ab4c618205a6', 'b280b775cb9d1df2e03ac71fd0107b2b0fc9c389449cd5a9cd6997bb9ecc6b32b7', 'Part-time', 2, '1985-10-20'),
('b99779c67026f54230753025f185dede2b17515efeb148ee72be815d8ed427f6a5c2da', '8a89e73a490b97a000336720be6028dc5b05b093c77b03556ddaa53e31a1699317', '85884a7ec43b70ceba85330185072cb92a11d52f11886e77e4c99b9e875c774148ecabe414c1550140135e44caffbd761f', '5e7bece7ebaf53fb0e319127f9d2d990918f4fca8a71faf13a99cbefb3124defcc4c0a4cc924c101', '139d14ed8281735fcec6002c4f66da80b5ec5ef6aa468bc2c7d473e58edb15c3d66bd56b01f2a6', 'dc9be7ad707cccc4b5f4f093e5e4dbab33a360fe1b12cec0de2684bb328c954acc', 'Contract', 3, '1992-08-01'),
('f1884e19330817b99d91acad95d15c242ca030a305122928b772ce3913999e061a', '13a13476d159e00dbd7b3be19cecc6b99f7f5c1ae642b4f6361dfe91eee8df1f98', '1c9d73ba75f93e459d2d83fc2af07c00327e1b9ec77d3e8bfef1b64152ab4aedb76083a8fe71a8b7f088da4c7bf4d7', '5b6a6a90ba31196cd15c1988cb9d889b2083bd15b24419645b7afda26c376091bdeece4befccfae1', '04748ad819607c1c415ca6b6dc558aba50c4948403835e39a8ff685a509907d4c0368ff0af68', '406e65f5dee3cd4f3bc3b426542109c8f3f314d3022e15cad1fd3fa102fc69712d', 'Full-time', 4, '1988-02-28'),
('934d8b6ffe9489ae97059f2421feeb5c440405f00d7a792e5446b7ef5674fc90dc', 'bef780b4446fd642812942ad5e05db822fabd53be5ad8c1442e5c2b31f3f25197707', '81a4ba8091c39aa79bc43512a5da4cdf94eb3bcb44d2bc389ff2e7a579d22bc35f8f1436480696bb9daf8e0e712c13', 'cead511a3aaca4132e9dcaf07c298b559b1ec47c34b6dfe967597991dd03b99e13beb071e8a2c2ff', '9b055fc40e9cade100fe80620bef317f4fbbc0082b50032d027567b5d80a0bec453c83611513d60e', '7f97d0d74ca9592fb2634ade4300377032a6cbfe0c156727712f657cd9ba825686', 'Part-time', 5, '1995-11-10'),
('7b8c95aa0e8c5dc6f3eb92bd07939fa3ab5136ffc590569b55fc108e0cde72f1ca', '42978f1f8d1eabeda48b4a744642ccf6bab7b13130e3802877ff170885132a6b0ebd', '5975f39499e9bd4074fba22340a473d4b71e625ee454caf54dca52e4b1f18b06477a871413e2f8afa8c42a9d475536', '7fdcfb2c99060eeb9d827c25d15561590ff4eb8bf55a3488074fd0bf839b6c9f58751239422aefa6', 'fbc80b85e806ac7321c15b69cf6e236a707d69de31fef78678a220811f774bd7d7de6ff47f4d4467', '5a273ab8ab150639da57f9af7725e92a0064f36d5c6033a4f5833f3da0bf54729a', 'Contract', 6, '1991-07-05'),
('207ea213f0fa3682ca8f60f0e45871a476556d4e8ad5e1c3eecef353dceb6d9317', 'fa3463cc39c26780854b1604b2d1b801325ff8aac2828b2e4b168c12dc54eb0adb', '93f0657cd48177a017810aa4dcdefb5ad722f1e152d724ad1545bd6f28ff8ba4c98709d9d7e65776adb0f8545f375c', 'af383718023dbcda2bed30ee4424fe0a0ae9b2e8158e07650a049f41f94dd551da02c8034dd4a388', '7755c867a95ddeef5c0153cf842fca55e1804ce1f795a11896a980e6650db27b674f500307505e1181', '66695cefc30ad7ed5c4d2f7c540ca4f93c6b687ed92f7fb39647d0ad9ca4b7acd2', 'Full-time', 7, '1987-04-12'),
('2ae84b815245c824868bdaaeb6601a9c114aa4969a9f4d36a1e45e49e54b328d34', 'f0901d2e33b45257510584fb71914f33fa15b284afe57320e5e06f548844d51469c3', '06bac0771dfd9871c77e65f2685a79a8bdc12a5d5c1ce14308fa449196fd3d0a5cbd57ef34677facdae1b021cd5627', '8fce013154559c04bcc0e6310297e6feca0e70a9dc8d429ab8f29e1f62427d80d2c30c3659daff4b', '8f08d1267f6e7d8f3571210ee2a221a0dc222f92b7acf28915537c33383ee6d9f05eb64b6da2b20c', '3a6ec93a54c00d16fe885301fa1f919fb10441fab1fc912e703ac5945b840a99df', 'Part-time', 8, '1993-09-22'),
('a065b69c9d272599f17bc419fbf4facc0a32f24a1fab0a526311d8831d679e', '0642f7a7e61a8eab75c8ce80bb7dfffa5024d0222301b48cc82f863d454d17bc37448b1e', '099bf686d3bb84a60727ffe8a444761981df3595ff223f715b0cb54e9039d5ee909c60201045124d1485da0850', '5d9668094709affd0c4fd7db57e1ff1d8857d5284412bb7222b7076ee2377b4f14c5db27218f57d2', 'ae758988990298826412e302cec85b8ac3eadd3e999d3d86746f07247fdd0f13bac4d4110b64541e25cd', 'ece355b47c3e9ac5a8caffa3842b596605b042ecd510cd167f0a7035713ecbce97', 'Contract', 9, '1996-06-30'),
('9a54fd7153d5aca6f317e50137895a43f12920f8d179b29fc0f0bdac78c7fb3e', 'b4ccdaeefc54be7e5f9b43a05ba7176397e6cd85dbd17bb5460656bb8a14ed8d05bf', 'f9e78671a496e2cb165543406e9adb223f9718cbd254719aec63bce4dcaeb14c4cf606a0e506d7d35f37fd04a713', 'de20095b307ae56dd6a427d656d6e76d23af4b1e647c64c64677ea1ad50991dc45665568d60ec1a6', 'bf7d8f7ffc0e44c3ba9ad72c99d9de6ee350705c1d69d5e1a99f2188dc5abc0b5157cd94a55c19862fa8373f', '1070147f0dc6b9fdaef51eb35f97bfc271ce3bd83ad5fff5a32dfdfc52f5096f08', 'Full-time', 10, '1989-01-18');

   -- Data for collaborator (10 rows)
   INSERT INTO collaborator (first_name, last_name, email, phone, address, zip_code, internal_auth_id, skills, profile_picture, birthdate) VALUES
   ('Karen', 'White', 'karen.w@example.com', '333-444-5555', '333 Pinecrest Ln', '33333', 1, 'Painting, Drawing', NULL, '1980-03-25'),
   ('Liam', 'Hall', 'liam.h@example.com', '444-333-2222', '444 River Rd', '44444', 2, 'Sculpture', NULL, '1976-11-08'),
   ('Mia', 'Young', 'mia.y@example.com', '555-666-7777', '555 Lakeview Dr', '55555', 3, 'Digital Art, Animation', NULL, '1983-09-18'),
   ('Noah', 'King', 'noah.k@example.com', '666-555-4444', '666 Forest Ave', '66666', 4, 'Photography', NULL, '1979-06-12'),
   ('Olivia', 'Wright', 'olivia.w@example.com', '777-111-2222', '777 Hilltop Ct', '77777', 5, 'Creative Writing', NULL, '1985-02-03'),
   ('Peter', 'Green', 'peter.g@example.com', '888-222-3333', '888 Meadow Ln', '88888', 6, 'Music Theory', NULL, '1981-12-21'),
   ('Quinn', 'Adams', 'quinn.a@example.com', '999-333-1111', '999 Valley Rd', '99999', 7, 'Dance', NULL, '1986-10-09'),
   ('Ryan', 'Nelson', 'ryan.n@example.com', '101-202-3030', '101 Mountain View', '10101', 8, 'Acting', NULL, '1982-08-16'),
   ('Sophia', 'Carter', 'sophia.c@example.com', '202-303-4040', '202 Sunset Blvd', '20202', 9, 'Graphic Design', NULL, '1987-05-04'),
   ('Thomas', 'Roberts', 'thomas.r@example.com', '303-404-5050', '303 Ocean Dr', '30303', 10, 'Web Development', NULL, '1984-01-11');

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
    INSERT INTO tutor (first_name, last_name, email, phone, customer_auth_id) VALUES
    ('Liam', 'Baker', 'liam.baker@example.com', '111-222-3333', 1),
    ('Olivia', 'Clark', 'olivia.c@example.com', '222-333-4444', 2),
    ('Noah', 'Davis', 'noah.d@example.com', '333-444-5555', 3),
    ('Emma', 'Evans', 'emma.e@example.com', '444-555-6666', 4),
    ('Jackson', 'Foster', 'jackson.f@example.com', '555-666-7777', 5),
    ('Sophia', 'Green', 'sophia.g@example.com', '666-777-8888', 6),
    ('Aiden', 'Hill', 'aiden.h@example.com', '777-888-9999', 7),
    ('Ava', 'King', 'ava.k@example.com', '888-999-0000', 8),
    ('Lucas', 'Lewis', 'lucas.l@example.com', '999-000-1111', 9),
    ('Mia', 'Moore', 'mia.m@example.com', '000-111-2222', 10);

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
