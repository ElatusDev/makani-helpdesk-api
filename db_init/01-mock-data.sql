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

    -- Data for internal_auth (10 rows)
      -- Original (non-encrypted) data for internal_auth:
   -- INSERT INTO internal_auth (username_token, password_token, role) VALUES
      ('user1', 'pass1', 'ADMIN');

   INSERT INTO internal_auth (encrypted_username, encrypted_password, encrypted_role) VALUES ('9c326fbd788ca0a311aa380adb3c2b1fd679c3cde946f59b1780aa9ec257978437', '118f67c5c0d71998f5dd100314f233d9004f8b54366e0a9947dd351e9071090c0e', '96dd82fdd40f9f6276b9726c44dcac58c070d36398eebcde6f4ff48313324fbfd8');

   -- Original (non-encrypted) data for internal_auth:
   -- INSERT INTO internal_auth (username_token, password_token, role) VALUES
      ('user2', 'pass2', 'USER');

   INSERT INTO internal_auth (encrypted_username, encrypted_password, encrypted_role) VALUES ('530a0b25bd8a115891cd8670fcf860e0777ee1ed6f9c83ffd78fe7d58de07c74d5', '461bfc827ae69e02dfdbd91f35684e985c3a0bfe1bd683e7d7f24c4f7ccfaa57d2', 'afcef3191e8fbd1e8ac659d76c08cd53232c0cc265d9440f8135aa1a086184ca');

   -- Original (non-encrypted) data for internal_auth:
   -- INSERT INTO internal_auth (username_token, password_token, role) VALUES
      ('user3', 'pass3', 'CSR');

   INSERT INTO internal_auth (encrypted_username, encrypted_password, encrypted_role) VALUES ('e6ee3dc25f681631b656c19bbe4fdb9e4bc75c0598f2d944a24363dd9d385124c4', '79cc57cc009232f99e2c6beba6a615fed61b5b192d3f232cee45b1265af79b0e03', '77d1546815cc11df9f897eba8d8513efb5e4741694190bffb415b098e96430');

   -- Original (non-encrypted) data for internal_auth:
   -- INSERT INTO internal_auth (username_token, password_token, role) VALUES
      ('user4', 'pass4', 'COLLABORATOR');

   INSERT INTO internal_auth (encrypted_username, encrypted_password, encrypted_role) VALUES ('9b0991018eed6fa046d5d8f78e0bd9506eb22d6263f0dbf1d7e717e8e618e222be', 'd0424f9357d1da0c45a5c0dbfb5c32d34dc690e5f796028b163c0df81c820e8eeb', '1b13c3d1c7ee542e335b0181e534055387d537234746de6b32eba7628b6d7acf984ae664bf1d6b2d');

   -- Original (non-encrypted) data for internal_auth:
   -- INSERT INTO internal_auth (username_token, password_token, role) VALUES
      ('user5', 'pass5', 'PRINCIPAL');

   INSERT INTO internal_auth (encrypted_username, encrypted_password, encrypted_role) VALUES ('3875d1a9282667718a906632bfbe53d8459a4b67f3510fbe5742d1bc62d84d3501', '27cf50e27b5ef6393c2b10a141584fb418d8a3828de70315217075fa1fe0513622', '03b1e6227d1cc8deb3304a4e19ceb4e11de0768ef2d262568e8c9494453a5e320f642b215d');

   -- Original (non-encrypted) data for internal_auth:
   -- INSERT INTO internal_auth (username_token, password_token, role) VALUES
      ('user6', 'pass6', 'USER');

   INSERT INTO internal_auth (encrypted_username, encrypted_password, encrypted_role) VALUES ('3406d33b15cbcf59e8dbc05f41ad3354fb21ef1e6ea4a19038afd25407c1a99377', '380388baf7fb87a6723bd98f959a9301ffb68fe23385ba4a12b66ddc16d6e140c4', '5b4609b11afd930bd6db4a3f6841f5b352b5f10ba4abba4c9cc02cf8b7c7aa15');

   -- Original (non-encrypted) data for internal_auth:
   -- INSERT INTO internal_auth (username_token, password_token, role) VALUES
      ('user7', 'pass7', 'COLLABORATOR');

   INSERT INTO internal_auth (encrypted_username, encrypted_password, encrypted_role) VALUES ('068f1f7814d3e834c464d629cc33b89edcefc616abaead6bf18172f1f20e2d31c2', '11108e3cd334e4d00af688b56d7671a59fb360e16fd8a76b8a28e3d4a33b1ed37b', 'b9310696e4482db3a9ec0de285c5813642d7a300e24edf069141e9c04aa7b00f69188942b38e7fd1');

   -- Original (non-encrypted) data for internal_auth:
   -- INSERT INTO internal_auth (username_token, password_token, role) VALUES
      ('user8', 'pass8', 'CSR');

   INSERT INTO internal_auth (encrypted_username, encrypted_password, encrypted_role) VALUES ('2b2eac6981a73da41c1c46c882fc91c6fef86f28b83ac53bf1fc7ca9f27ae7b03a', 'aecea276721ddf1aeef4a05f903490dde139347452793d68d59ed2b3151de40f30', '185575f919c097e66791c9c7a199253e27fdebed243ba275a34d4db8c0bc33');

   -- Original (non-encrypted) data for internal_auth:
   -- INSERT INTO internal_auth (username_token, password_token, role) VALUES
      ('user9', 'pass9', 'USER');

   INSERT INTO internal_auth (encrypted_username, encrypted_password, encrypted_role) VALUES ('6c98c9a5d34046b553ee3bd5e43c6535c2b1147beea327800798561cdd6abf4b59', '338d1e2127b4d4aafd9cce1452d459bc4a4e80320f526e34afb6db127ccfd58ab8', 'a137f37d6d5e0b41d3596703bed896713a8773ef28804a1e39479e10923ffa0b');

   -- Original (non-encrypted) data for internal_auth:
   -- INSERT INTO internal_auth (username_token, password_token, role) VALUES
      ('user10', 'pass10', 'COLLABORATOR');

   INSERT INTO internal_auth (encrypted_username, encrypted_password, encrypted_role) VALUES ('201c8502b197e55d655ce2e7267e04e2ddbe772cd6514ae04929203ebbe4dd3f26df', '9868c84080e89d51597f84f13476a2c1f17bb2a049eee710f30507df2b1c3e4c30fa', 'ed9892b3100a3b62748150fe1f124697fdb18786f5836042bb4d357976613f40323863085bc1c409');



  -- Data for employee (10 rows) - Phone numbers adjusted for Mexico
   -- Original (non-encrypted) data for employee:
-- INSERT INTO employee (employee_id, first_name, last_name, email, phone, address, zip_code, employee_type, internal_auth_id, birthdate) VALUES
   (1, 'Alice', 'Johnson', 'alice.j@example.com', '3312345678', '123 Main St', '45000', 'Full-time', 1, '1990-05-15');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100000, 'a1a82ec95844e5dbc320796ef5d3164de6d1e15ae6fb2a1c5d2cccd7deabb2cd26', '66c2fca51d622e534de5eea78afaafe530739157e85b5da2db8e89a2d4baa98e6aa670', '610794a02a2fe2940b645ba9df6c9c037b27a9e89f55ffc288359b9ad2dc303a3ad70f7db2b2', '9379b5d0538ec0979930f41d95b400bcd33d79cc79ca29cf31513f7b9d0f5c40903ed3daff589304d2b15b2955070e', '3d2dba367b562ab72ad82253c7ce25b5bdcb8e04ae6f33ffd126ed3e720f81402f0dded0d8c88b', 'ecbe19ba4e5e645374fa9c5e41f05cd98a56ce46d3f63d5c0369bc9412a7d7a005', '62091c05538b25e7b00cdd294780080aee9cd5b3aa352141cb9fd47f3e43702a', 'bdd0098e6e171a5778e2d04ad38bc204e9306ea6573b3c6a4f50ce905ed09d3f');
INSERT INTO employee (employee_id, employee_type, birthdate, internal_auth_id, person_pii_id, created_at) VALUES (1, 'Full-time', '1990-05-15', 1, 100000, '2025-07-31 15:47:08');

-- Original (non-encrypted) data for employee:
-- INSERT INTO employee (employee_id, first_name, last_name, email, phone, address, zip_code, employee_type, internal_auth_id, birthdate) VALUES
   (2, 'Bob', 'Williams', 'bob.w@example.com', '3323456789', '456 Oak Ave', '45100', 'Part-time', 2, '1985-10-20');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100001, 'c6d2cf9c50aa212c077699bb36856a3bc275420a857312414730a7190dae37', '4bc223eb2f2742453eadc7dcdef1c55ea0860dfde4696384fa425a7d805fe2b2aee7f82f', 'a42b553cc766913cacf80bed6f48bf97819053e5d627f661ae7eb8192cf75c3128212b402a76', '57859819671562ea01994bb2728007ab0cb21e13d91fd9a545706ecc3310a731589809a04a66173be401ba0041', 'abe5b28cf8083cfebf8e7c5e78d43e89f84ae0d6fed6f78fe4ef8094bed1d10d363fe8014c9d02', 'bf7546945d3e6c65751b1df7bc02f191c68df2b878067ecbfdbe10677677f234bb', '01465b85efb1de1a4d32f458fe37c2880548b7287bb6e6765a05784570024760', '5b315f2353857961c96fd3bf37a34d57fa008ef971c10b86cf398bb11d8205ec');
INSERT INTO employee (employee_id, employee_type, birthdate, internal_auth_id, person_pii_id, created_at) VALUES (2, 'Part-time', '1985-10-20', 2, 100001, '2025-07-31 15:47:08');

-- Original (non-encrypted) data for employee:
-- INSERT INTO employee (employee_id, first_name, last_name, email, phone, address, zip_code, employee_type, internal_auth_id, birthdate) VALUES
   (3, 'Charlie', 'Brown', 'charlie.b@example.com', '3334567890', '789 Pine Ln', '45200', 'Contract', 3, '1992-08-01');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100002, '110604ab8482eedd421bbfcb3f800905a8e82570786d83eb941c4197028d566bb5387b', '2aaa4c10a9d749d4def18f824408bd8f5ad370ed4fddc65f05183635bda27dab03', '6a294636a10f8a0437e129f89c1e5f81c9490904ec8ef7c53ed53f685adce5fe1c630ff2def5', 'e1d9c97a7645bd227b5d218183ef22d151cf13e589a6313d7499b93ee993085fef5c482392fe468926ea38e4ff2c888222', '018a1795213e02ef1dfb763b6a8efdb4945f8204051cdafa4ce377cab7a29f0de647163750baac', 'c9711073147aefae45e8d0add2aa453d0b3a15d3cd2dba2c28ac22ef962a6641fe', 'ef3bc3fbcfe18d1162992c5be4f80f4074daa2e7b82fd87e392b3b4af336fb6b', '0c8fdbeba950c8c54686e176b688453629696727af2285ecb2c51f478e99da68');
INSERT INTO employee (employee_id, employee_type, birthdate, internal_auth_id, person_pii_id, created_at) VALUES (3, 'Contract', '1992-08-01', 3, 100002, '2025-07-31 15:47:08');

-- Original (non-encrypted) data for employee:
-- INSERT INTO employee (employee_id, first_name, last_name, email, phone, address, zip_code, employee_type, internal_auth_id, birthdate) VALUES
   (4, 'David', 'Davis', 'david.d@example.com', '3345678901', '101 Elm St', '45300', 'Full-time', 4, '1988-02-28');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100003, '864204ef612d5c328ecab62a5b0e17a34260ae5dc14b00a41e1f747edc1d508a0e', 'f3d6b3eb79d2259422098df28c045c47a005a85a22c37fb98dd69432af28c64a3c', 'c487e00f55114281d1741641280086a4a2f30a7aefacebb4c92885d54411b5499a0c3089aede', '161d21384c8f85863f3f7b5c2188dce92562e372070d12829a194a2504f18a1fca3614474d187c2969f0cf6df47192', '2b0278ecadca9b8bc172ea4d055a190802a1fb35ce60032d1049b0fbb4990d3dbd7ad31050c4', '1b9d637aa84041c3ffcfa4bb3560f6b93e9ada3c8ef47348f78ef7162d86a1d281', 'e81141afb63b68c3e8da24e3e5b45f27988bf5d1947d263b8879049772af99d6', '066a54be8e0d5472d7a2d9144a989518eaf0f6e9eac557c3cec1952bd26ef5c3');
INSERT INTO employee (employee_id, employee_type, birthdate, internal_auth_id, person_pii_id, created_at) VALUES (4, 'Full-time', '1988-02-28', 4, 100003, '2025-07-31 15:47:08');

-- Original (non-encrypted) data for employee:
-- INSERT INTO employee (employee_id, first_name, last_name, email, phone, address, zip_code, employee_type, internal_auth_id, birthdate) VALUES
   (5, 'Emily', 'Wilson', 'emily.w@example.com', '3356789012', '202 Maple Dr', '45400', 'Part-time', 5, '1995-11-10');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100004, '2c58085d9087b71e85eef07a3184969cb8817da8f64afe53c029640a4d4fa4e1fc', '6f36ae407a7c04197d8c36b439790f063bb333a996ff0a0c2e778b7e051e0ee88a26', '88d21ed57fc5bbd4f22e8d1060f6adb85afb08478f989eebd04d8a892ab31dfea6ec889fd440', '6ed52d05dd88c9f45db0987525cb8a5d5acb873cc05e6087f796ee4d9c305a542e607f5b5d0c5840bb67e667613007', 'd32e584d3d7b59654865c0e120d706188ed30816f8c76063a3f8f85a7af0c2882e7a8d80b8b3566f', 'db88f872653f369583bbe0fed5fce1004ff6f157cfb98fee1621f62f3322168789', '7e3bd67e03fb92acc7c25333c76529874e69e7d5731e04055d5ff157cfc5b235', 'f805c848ff3a637a4b798c04efbe2d425ad242e14069869dd9cbf9ba80154183');
INSERT INTO employee (employee_id, employee_type, birthdate, internal_auth_id, person_pii_id, created_at) VALUES (5, 'Part-time', '1995-11-10', 5, 100004, '2025-07-31 15:47:08');

-- Original (non-encrypted) data for employee:
-- INSERT INTO employee (employee_id, first_name, last_name, email, phone, address, zip_code, employee_type, internal_auth_id, birthdate) VALUES
   (6, 'Frank', 'Miller', 'frank.m@example.com', '3367890123', '321 Cedar Rd', '45500', 'Contract', 6, '1991-07-05');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100005, 'c583f18ead6eb00f1bed62b4a9922290e6e765971e9bf7e7d5fc6a2503e72e38d9', '03e91857bcdcd1d40d22f5764d6b7cb32488b77fad60f647bb4d977213916944be43', '14bb24706b238031f7fd18d44a108149c9e2f47aeca27b4da53a0a1078f511429228490aa2e7', '8c842f866cb7cab083faafb7e3a432bb2282e3bfb26c6f633d1b2d2af01b11b14489c8f52e1ffd4f63c3ba3d48ff02', '5c0dbee512bc181a3083d925b9344a3768836f3b871717c8a6aa2b2aeda6cac3c90c01180a2a7ed7', 'a7ee79b375ada2675f546a73964971d00391a54ef9217fda2d32590fe612178255', '7e1c69a85d0416b8235b47917a368bf1f1dd217b60cc212105026f7ecb2b7bc5', 'f607333a86522140652c7683d51e845bfc9c10a77a4561ea8f9cea4fbb3f8d46');
INSERT INTO employee (employee_id, employee_type, birthdate, internal_auth_id, person_pii_id, created_at) VALUES (6, 'Contract', '1991-07-05', 6, 100005, '2025-07-31 15:47:08');

-- Original (non-encrypted) data for employee:
-- INSERT INTO employee (employee_id, first_name, last_name, email, phone, address, zip_code, employee_type, internal_auth_id, birthdate) VALUES
   (7, 'Grace', 'Moore', 'grace.m@example.com', '3378901234', '654 Willow Ct', '45600', 'Full-time', 7, '1987-04-12');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100006, 'a4645beca524a157bfbc5bd44f782adebc5c9cc2a299105637d7260354b818bc83', '8199abd9db07a7156ff9d34697901efe7ff5a7c085724b41f0cdbe35486d840e5f', '94c59266009396f5ae35d402e6f52a212212957b8a34849234755763af978ceeae85cdcfae5f', '187b4ffcc811c3224b1e95e4f26f327dedc2fa00262f8f727cdec1c02d4859afad60f3e147fbae3e04dfa09799478c', 'b1ffac941eb8a3961db416fa0682691b935dec7cf49cb06b6d6441fcba4a28f860b8726cdd65cbfb99', 'a041377a7d073686055cccda3119822f3ff8ffa9df3d342e9ee06fef16b47c3524', '0dd243930f7041585cdfdfc258f241d6a9949b9e54d3ae242dce94aa34a8edec', 'd0ab6ed1b6392484f51d9ad62ba17486aa0fc3abf566c13a35c29fa5ac440d53');
INSERT INTO employee (employee_id, employee_type, birthdate, internal_auth_id, person_pii_id, created_at) VALUES (7, 'Full-time', '1987-04-12', 7, 100006, '2025-07-31 15:47:08');

-- Original (non-encrypted) data for employee:
-- INSERT INTO employee (employee_id, first_name, last_name, email, phone, address, zip_code, employee_type, internal_auth_id, birthdate) VALUES
   (8, 'Henry', 'Taylor', 'henry.t@example.com', '3389012345', '987 Birch St', '45700', 'Part-time', 8, '1993-09-22');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100007, 'f6713099e630f9cde71a79b846e65211cddc031d49bcd335ca8ce2294c1e90bc6e', '2161ebb50ce117198eab78fe91034d10ab304e6eedef2c4a017f363edd5e18ad91cc', 'd149062c3dfbba68daa8f03f3a2043f7f195db22ac995f4e3a0fc72a622ef6eb9add4be0053c', '5ddf706dba9b623b4a383db61c5dab48888f545c8228f347ad96d4a490ddf7733f76f2cbfee349aab6caf3b2e6f7b9', 'ba1c0c0a26b09fd484f9fd27d644764fc0442fff7b2c6f1e73f970064bc6e78a98b6da621fbb1b43', 'd09c195dd768e819234253531a11d37a2dc5ee96b956689463e4d650d224bc63a3', '7a7110c012c84c9b2f9038f3b77fbfebb542459bb7d2272cf682e5c9f90f7d0c', '520d2c818fd55dbb2cf339e3de979b66098448cd45c05b5bbae50b085e6c62b0');
INSERT INTO employee (employee_id, employee_type, birthdate, internal_auth_id, person_pii_id, created_at) VALUES (8, 'Part-time', '1993-09-22', 8, 100007, '2025-07-31 15:47:08');

-- Original (non-encrypted) data for employee:
-- INSERT INTO employee (employee_id, first_name, last_name, email, phone, address, zip_code, employee_type, internal_auth_id, birthdate) VALUES
   (9, 'Ivy', 'Anderson', 'ivy.a@example.com', '3390123456', '111 Spruce Ave', '45800', 'Contract', 9, '1996-06-30');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100008, 'fb8a584507e815c2fd98b6eb87479182aaf4cf7c44fb2b06c548a5d96196f5', 'ec6830cfeb00591c14bcf0d8ca963afc2f1ec7a9e78613ed97686fda6e56bb8ef88b7407', 'b3c95105d2416967e97e9009d8e8f5ce83756baf8df56b6e836a919337e544c38d47d0b22fe3', 'f1f58e1883dd3af88f1cf8e11cba25a3c059536f0a79bacabeeee3cbdbdc56d6b852bd614e507bd6bac20238ea', '489dd33b24aa4f194c0981098cfb0356e75d4725721b9432d2495889cec59c3e4e96f6707ab4b1241b4b', '82d1701765aa48ebd4928bf870a25d29e171980c761a08d5edd0ff9fcebe376510', '0256dddb44e8a40b7936428015f7803852d3152d88ec33d4128b685c5eb6cd98', '8f8627f0b3962acea3042476c404f1c011d849012f0afd7b20cc37f2ac6bb667');
INSERT INTO employee (employee_id, employee_type, birthdate, internal_auth_id, person_pii_id, created_at) VALUES (9, 'Contract', '1996-06-30', 9, 100008, '2025-07-31 15:47:08');

-- Original (non-encrypted) data for employee:
-- INSERT INTO employee (employee_id, first_name, last_name, email, phone, address, zip_code, employee_type, internal_auth_id, birthdate) VALUES
   (10, 'Jack', 'Thomas', 'jack.t@example.com', '3301234567', '222 Oakwood Blvd', '45900', 'Full-time', 10, '1989-01-18');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100009, 'c5c230f9133383296204ac35331d03367b8c52445d654d3ef3dfd577e4948777', 'd3462545d6b31361e48658eeea20c699fbdc03535e18a81df2f5631c2bc31e6915d8', 'd0a8032eca2d9c5333615b8ac93a21bd9f6f38cf4c13aa7273a0919fd0fc76df77f6ad809f18', '50965ac8a0ef352b7e9c98f998a38f2ac7dce50c204358db57ea83be1349626f80228356ec8a0b4766ca0c5d4915', '067f2484b0b5ad1aab9399ccb76319872b5a5546af9632b67a10e143650ea3779a5b076cfc5b39444ff929c7', 'c17df1026a624897830bbd9d4a393dca690e686438b0dee6eb231ccab48cd06b39', 'd11b3b2b3598c2551bece4b316875fcd30cec7c3e49bba28990192b1eca1f8d3', 'd036d816a6d172dbcda4fb9aaccbadb1568c9be6263dc6d4dad0e0181b985e6f');
INSERT INTO employee (employee_id, employee_type, birthdate, internal_auth_id, person_pii_id, created_at) VALUES (10, 'Full-time', '1989-01-18', 10, 100009, '2025-07-31 15:47:08');

   -- Data for collaborator (10 rows) - Phone numbers adjusted for Mexico
   -- Original (non-encrypted) data for collaborator:
-- INSERT INTO collaborator (collaborator_id, first_name, last_name, email, phone, address, zip_code, internal_auth_id, skills, profile_picture, birthdate) VALUES
   (1, 'Karen', 'White', 'karen.w@example.com', '3311122233', '333 Pinecrest Ln', '46000', 1, 'Painting, Drawing', NULL, '1980-03-25');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100010, 'd429f4b945fe5e53377800539438a1a67bc124344a5b4dab17691b3c9cff53e744', '9cf7555e36df6dc6bc7849fa7109c6e03516a6d6429ae856f6f9635a5de3898a59', '4d607f138fc1c583e73a55918ad5c7b3e67eee822a50e153d7077f824441b116acbfa7a8c178', '102e3ad238858f30765db346adb068ddd9b8fffd17c1e94559ac0ef347a6c6053130dec7694c23e82893b3e503910d', '049edf16b368e79338edc53908ce819194b609361ea735146d45f2896fc12e1a40995fab18863f13a068784a', '3a8c54524ef2a301f47a5495c314de465003918eaec550c9eaa9e921e4be1d9c9d', 'bc5fc7dfc32af1a860fee4a4ef9f9df79580c86ba5a195a34beb045defbb1453', '08fc623c62f671f10781b447a51b1e4f7732d2f39e9ae766e8bc4c1cb5932f0c');
INSERT INTO collaborator (collaborator_id, internal_auth_id, encrypted_profile_picture, skills, birthdate, person_pii_id, created_at) VALUES (1, 1, NULL, 'Painting, Drawing', '1980-03-25', 100010, '2025-07-31 15:47:08');

-- Original (non-encrypted) data for collaborator:
-- INSERT INTO collaborator (collaborator_id, first_name, last_name, email, phone, address, zip_code, internal_auth_id, skills, profile_picture, birthdate) VALUES
   (2, 'Liam', 'Hall', 'liam.h@example.com', '3322233344', '444 River Rd', '46100', 2, 'Sculpture', NULL, '1976-11-08');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100011, 'b8e7ecdd73d27e602ba4ccfccfe768647fc56f1c57458ba5ced245ec66a756d9', '43e0559b019be320c8b6edec30ea728c7980e5d5fd064438598c82ffb34f45a3', '9177900795c10c0192c293c1d1a4782b658f045fe513b42f0d06b68d4bf38957d8268ce2b655', '59b82c14ea379c2d95db7079f201aeb945d1a7c250c226f7f4c26ef906fe1f9e01857b0da54706ac30b5c437b2fc', 'a5064cd610701a79001a47363c35926f6b1df4a8984bdcb60b0b024e54cb606816745a040c4d2313', 'b718ece8694f78e4e79dee15b8c3a9c993a89cb21854013267812e051a28f6713f', '5dec969c6f038be070a2de592b11e4e14d445177bc5fc4bae056b8cc17ad4168', '567f803d04984b351c353085bcb63fbb703e4968fde59337a89af07ce4ffc2f9');
INSERT INTO collaborator (collaborator_id, internal_auth_id, encrypted_profile_picture, skills, birthdate, person_pii_id, created_at) VALUES (2, 2, NULL, 'Sculpture', '1976-11-08', 100011, '2025-07-31 15:47:08');

-- Original (non-encrypted) data for collaborator:
-- INSERT INTO collaborator (collaborator_id, first_name, last_name, email, phone, address, zip_code, internal_auth_id, skills, profile_picture, birthdate) VALUES
   (3, 'Mia', 'Young', 'mia.y@example.com', '3333344455', '555 Lakeview Dr', '46200', 3, 'Digital Art, Animation', NULL, '1983-09-18');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100012, '21a204c8c95ed0da5d7bfe25a38a1a6a13f58c97d8f5364e0ac1c0962d51fd', '859161a5cb4c60725f86af4199058c640e8a431c96b97fc2ada3f0b8ab39ddc4b8', 'f78bb9c5a1c3eae05c4a9f8e3f3f64d63d242ca8be31e7118687abc326c9e3d84093b1c1f12a', 'd1bbf00615190b2da8d006cc1c19945c43fe2185c2bd3ebb7c3181d1fe9ac6ec66a9839f7797183c05cb9de2d0', '7360bd72209cd68783ad365cedfb3f09eece6765c093b0c6881fff43293eb6c857a1ab052f35c4ce4655d4', '94de42d818b91cb8876d30c284680a0128454b73360f257db9bbbd053327a73a52', 'fcf8daa4b0f45e5539cb40a550500a6908bebc8ae9816a06022a6a166332c7cb', 'bcdc1c8aa2cf0f30a55512e6c10c65b0399c1bdfddcd769bffe1f89d1630d89e');
INSERT INTO collaborator (collaborator_id, internal_auth_id, encrypted_profile_picture, skills, birthdate, person_pii_id, created_at) VALUES (3, 3, NULL, 'Digital Art, Animation', '1983-09-18', 100012, '2025-07-31 15:47:08');

-- Original (non-encrypted) data for collaborator:
-- INSERT INTO collaborator (collaborator_id, first_name, last_name, email, phone, address, zip_code, internal_auth_id, skills, profile_picture, birthdate) VALUES
   (4, 'Noah', 'King', 'noah.k@example.com', '3344455566', '666 Forest Ave', '46300', 4, 'Photography', NULL, '1979-06-12');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100013, '0a98ca0be615f0cc97fd58745a2737edc5f5d55196722c6ce59fb8de08d87718', 'e084be4dc81b89b97df5acda0e3e748c83ce78b3523ad884f20d912f09fae774', '8dd09cd8e34c8b856168cc1de8f6dd328c14034308ef1680158c652dcacb90e1412e86605b12', '9b178f52236f419048ffd840ad3aa6e04fea3a820d56be5cc4c392fea20a47a729893f55ba4482e16d70c89325ca', 'b27d6ebde6398b0307ed05a18c3fc8253e16d76aae3169055ce89771527fe14e8d16f33f64b85b2c17c5', 'b639be45ac90f763c9a6ee3a997059a287282ec75f165010dcd3167f7937db8894', 'a804bd5aa486c984d3a97e8f0a4bcf829c0fcf341d0b48340c06d8be3e4e77f1', 'e56365901f65d85397cc8c2ca4c15f1f8d1712b6d9458ceb84ec67e0a347def2');
INSERT INTO collaborator (collaborator_id, internal_auth_id, encrypted_profile_picture, skills, birthdate, person_pii_id, created_at) VALUES (4, 4, NULL, 'Photography', '1979-06-12', 100013, '2025-07-31 15:47:08');

-- Original (non-encrypted) data for collaborator:
-- INSERT INTO collaborator (collaborator_id, first_name, last_name, email, phone, address, zip_code, internal_auth_id, skills, profile_picture, birthdate) VALUES
   (5, 'Olivia', 'Wright', 'olivia.w@example.com', '3355566677', '777 Hilltop Ct', '46400', 5, 'Creative Writing', NULL, '1985-02-03');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100014, '87b57bea647d27e56c6c28ebed9d747ebd5df7873c18a84563398a4694f7c585c695', 'af75b681474626463288e1a7a4382a421dc61009f6b99c0337446c0f53500701dfad', '22845b10e0da1c0d8872193944b17c5dcad50f529aee1fdcb8a38fe4e27aa1e0d80b4f8fe330', 'cec78f2646eb3dd1f634ff2bc8557202538112bd1a05d91358b712576546ba61443e3bc313616bd5c618588a6ab61a92', 'bb9332b87d33452b728a2652d50656dc73a75ba6c16b9d76532b94ebceec65b79126480a6383d121b379', 'c252ab0eef76776f0781adc01cf3b18f066e77acc753ec31917db60933f87226a2', 'ecaa587f1311c13a2b92499ec833598add0ee5b354c10641e40c49dc18f644b1', 'cd4ac87ab38174b4a7e29348782cb3dcb7225f4049ebdaa42d045c37d671bc01');
INSERT INTO collaborator (collaborator_id, internal_auth_id, encrypted_profile_picture, skills, birthdate, person_pii_id, created_at) VALUES (5, 5, NULL, 'Creative Writing', '1985-02-03', 100014, '2025-07-31 15:47:08');

-- Original (non-encrypted) data for collaborator:
-- INSERT INTO collaborator (collaborator_id, first_name, last_name, email, phone, address, zip_code, internal_auth_id, skills, profile_picture, birthdate) VALUES
   (6, 'Peter', 'Green', 'peter.g@example.com', '3366677788', '888 Meadow Ln', '46500', 6, 'Music Theory', NULL, '1981-12-21');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100015, '03e97662cd4f0cd34503f3ab5fb85a1a4672e32ec786d805e95782dfca4400d249', '0ae02d06aa5358a761731ae4cc53ac49813dec7d5c631a76011cfb7c42df7747f2', 'f0acf0b26558fe4bd071fa8a662763ee334505ddcd6e595efb938beffcb9c7de6a6c8a17b077', '1b135945a892778e5d41bfaccedc2f618ab6cec4ceb2c2b0bb662aaf15c7310bca8630e66fa5423f0a8ef5d1e10f6c', 'fcbdb90257fb349cf517a99ab2d679a186ddc4d9886a87376ceb702cf65eb4db33f6ad7a91d7bdc93e', '2d25bdfe079ba3bcbed97eeea384c14082c5e7053e2d900b4bdc62bca343cdc934', '2a8460d173d8487aa492433f1519554af504f54e1f5dad989d3ffad37311ad61', 'f1765a922cc929ee42cab02112f28288b138bbfeebc40548b4f8be64432bc2e1');
INSERT INTO collaborator (collaborator_id, internal_auth_id, encrypted_profile_picture, skills, birthdate, person_pii_id, created_at) VALUES (6, 6, NULL, 'Music Theory', '1981-12-21', 100015, '2025-07-31 15:47:08');

-- Original (non-encrypted) data for collaborator:
-- INSERT INTO collaborator (collaborator_id, first_name, last_name, email, phone, address, zip_code, internal_auth_id, skills, profile_picture, birthdate) VALUES
   (7, 'Quinn', 'Adams', 'quinn.a@example.com', '3377788899', '999 Valley Rd', '46600', 7, 'Dance', NULL, '1986-10-09');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100016, '3a6ef69dc7340410d733d4371bf68183599f482be4c6e33c518c6d0e62429540b7', '9f2be3199887a242817d0aaa7fe9c6e3424468ac10557d9425492b5dad2a5bb152', 'b58e2f3f49733e0071b6776a97a73b3e537e8a26c6749ac0ee28701c68a06cd1e29b18feecf3', 'db340894c9242ca1807af8dc686686144b93aa18c1d02d91bded385b79ac6a1102f02ba862f1888d553221d6893a44', '7a5c340a680e18247337d3e7325305c45f3d38e9516743eb68561de6e5680b16dd2d212b396621a923', '66c1a5fb5277edf090c8a2d9e0bc25dc73c16ad12446a14c19575f1c111448fb89', '7d07b189f192a06b58dc58dc17a07d58713fca058fbd07cff4a8fdb1bc1cfea1', '76ce6c668f59df39457f47cd87d6b3079da9162d5c6a609dca1bcfce02bc7031');
INSERT INTO collaborator (collaborator_id, internal_auth_id, encrypted_profile_picture, skills, birthdate, person_pii_id, created_at) VALUES (7, 7, NULL, 'Dance', '1986-10-09', 100016, '2025-07-31 15:47:08');

-- Original (non-encrypted) data for collaborator:
-- INSERT INTO collaborator (collaborator_id, first_name, last_name, email, phone, address, zip_code, internal_auth_id, skills, profile_picture, birthdate) VALUES
   (8, 'Ryan', 'Nelson', 'ryan.n@example.com', '3388899900', '101 Mountain View', '46700', 8, 'Acting', NULL, '1982-08-16');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100017, 'fa9595d47739888bffbab3bc9db17d69d7e415225b3dfb7cfc005532dbff327b', '2c253a0d1a6effa1a24ce8bb561cad6c8ce8cba61bdd64bad9f5568b17a451e4ef8e', '4cfeac8a8faec787fdf896c2f1015744d5e88365180492af21ba8b5f818bef2f22f40f541779', '80eed3adff8b7b56a827788119687533853360461451e0700be64470a2941a504eaee5c8f2a3b06dbdfdaeade9c7', '71a5429afa722df9b50fa89ab4d3a9f5a4db75f103482c7c5182398460cdc817e40b31170ead9864413a13c0c2', 'c9eb8191982fc96993b415525259a89b301f2530511a7893cf188ca6e9ed781a0d', 'd771655fd50b378f50e4525789e3f0dff9c37871ca0f6f7db4cc79dae1d5eb9c', '6b41e082f7d3e2228ac3ee9b5631d4c7fcf1a4a1ba50581722d6b06e6947195c');
INSERT INTO collaborator (collaborator_id, internal_auth_id, encrypted_profile_picture, skills, birthdate, person_pii_id, created_at) VALUES (8, 8, NULL, 'Acting', '1982-08-16', 100017, '2025-07-31 15:47:08');

-- Original (non-encrypted) data for collaborator:
-- INSERT INTO collaborator (collaborator_id, first_name, last_name, email, phone, address, zip_code, internal_auth_id, skills, profile_picture, birthdate) VALUES
   (9, 'Sophia', 'Carter', 'sophia.c@example.com', '3399900011', '202 Sunset Blvd', '46800', 9, 'Graphic Design', NULL, '1987-05-04');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100018, '0be805e3dae984c1f2ae3dc1c65ad819ccb9d9b2fa956109081fc4b983c4a0803873', '49b65cd46dbafd504515fc17e55f27a75012ab2f67322bf1ad6e4e76ea3e2c4fe2a0', 'c9d188d9651d47b7901b3ee9df0df4d6d31dcc2d2cf61b4e2f0d43ab7f14740374ee488969b4', '9bb45eda794483c063ce596db3e12bd48415301a21a72d7d6387ff1f0566013d0019d0dab889b6a578508987f0159ffe', 'eb79eace2ceaac56f10429b0d17c32f674b231ecedc5217285a2714a17a95b66f55208ab3ad44bdd2515fe', '435bc5244b9662a598dd411bbb52aa66df3d7bfb325dc70f304b62cdc3031b3d66', '41066abe3a6b15ac9ee932878ba875d75491194daace539c6b693bf7814bf314', '521155a25848c1233abdacea46b187dd11adb1834aec1857cf8b38451413746b');
INSERT INTO collaborator (collaborator_id, internal_auth_id, encrypted_profile_picture, skills, birthdate, person_pii_id, created_at) VALUES (9, 9, NULL, 'Graphic Design', '1987-05-04', 100018, '2025-07-31 15:47:08');

-- Original (non-encrypted) data for collaborator:
-- INSERT INTO collaborator (collaborator_id, first_name, last_name, email, phone, address, zip_code, internal_auth_id, skills, profile_picture, birthdate) VALUES
   (10, 'Thomas', 'Roberts', 'thomas.r@example.com', '3300011122', '303 Ocean Dr', '46900', 10, 'Web Development', NULL, '1984-01-11');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100019, '1448119a4dab80ddd8d3e59c7e77dd7203b57045acb2e18ed99be4fe5b44e09fdf4b', 'b785a6fbda948a8fbdec3230b2d669332e390d100549e6fa8fb6fefcc53c4698c61d97', '99567f34d85baed962a8a978984799fba3e635458751b6ec21020322fa8e40a22520183a645a', '76b11747d6953fdd457d02d61e38903d4ac1db90247c494b3ed889ec325bbd2dc9f09fdaa14d627d28299062cc4c1abd', 'acec2485df5f7579fd511699debcbcb81a18e40d883aacc470a25613c8a268776d84b796fbde71e9', '1c14e0185febc8e146e7a0dbf305070404774e6ae62f4951c62b1dc3d7b9d7f408', '7b556dc425981ebd4e02b084576cbf3e0d08c8f857b896b375b30b005045b597', '84db8ca9cdb6bc4b51f00ed6ee424086481417b07674b224af5e427b0482b6c3');
INSERT INTO collaborator (collaborator_id, internal_auth_id, encrypted_profile_picture, skills, birthdate, person_pii_id, created_at) VALUES (10, 10, NULL, 'Web Development', '1984-01-11', 100019, '2025-07-31 15:47:08');


   -- Data for adult_student (10 rows) - Phone numbers adjusted for Mexico
   -- Original (non-encrypted) data for adult_student:
-- INSERT INTO adult_student (adult_student_id, first_name, last_name, email, phone, address, zip_code, customer_auth_id, profile_picture, birthdate) VALUES
   (1, 'Ava', 'Rodriguez', 'ava.r@example.com', '3311111111', '111 Pine St', '44000', 1, NULL, '1998-07-15');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100020, '499f728b91d9b518d2d07be0f824d5847433f6426b87fbf858b74162a86b9d', '05aaa4264617cf6dc6dcf4a1ecce59ad8499666d80b20e8c5a6b68acb197ba74ee3605f813', 'c7f8551d158917f99a1cf33e710570184c4f5ec51394ef9a0cb7a85eb59537d35cf41f5728c8', '4451e5d626b5e77cb7027e2876052c8b5292500a682e9dc762ae69aaa39d7122a01492020a9feb94e36822a710', 'b82373f4f2a1a34abedec58957cc1ff3b75150183c5a7db7590d76197d11397466786de861606c', '29cdec31dfbbb72cb34ddbb672dc18eafb91377c8198f642e88cc4767903adcc77', '72add3591daaa5279f1ec13068449a663d9a6f8e32f9304a8e838cc7ca104065', '669e864bec9bc8d8ba71e3e3558db5180c3a0898600a901295e0a245f7b760ce');
INSERT INTO adult_student (adult_student_id, customer_auth_id, birthdate, encrypted_profile_picture, person_pii_id, created_at) VALUES (1, 1, '1998-07-15', NULL, 100020, '2025-07-31 15:47:08');

-- Original (non-encrypted) data for adult_student:
-- INSERT INTO adult_student (adult_student_id, first_name, last_name, email, phone, address, zip_code, customer_auth_id, profile_picture, birthdate) VALUES
   (2, 'Bryan', 'Garcia', 'bryan.g@example.com', '3322222222', '222 Oak Ave', '44100', 2, NULL, '1997-03-20');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100021, '25bb8838647bb1a7472fa7755c0d6fb1e92f7afa0131b3064fb673e35f0416eedf', '02f89dc73484300f29565cf2d38035b844f5a48a5ee6c22595b16c379e5b8d660228', '4e0cc64094d5d91485c7d9db6ce8b69e223cd597bb9d188cd642311f6cb936a7c4135fc84420', 'c50ff4fb1fbade21bded8b54a1118bca06dd8dfaef6ca53e7a85ef8f5ac4a0e6e769cf7f97d14a3b92ddc0867931c2', '3bb0d4f564861c05859d1216d186c6b9acf553ba7e1aab6b65956e7cb98122981b495ed783f60a', '7233398fce6d4c4618f205cad3b2e9804894409d1e7b7c8b33f870b483707c414b', 'd74f14e69931b7f7a4fef269b7693e9cd1bcb81edd8c8c5de0200b713944e20f', '28f98336927fcacd817c915aecc3f18eb683891d0402a653e13de37133bbafac');
INSERT INTO adult_student (adult_student_id, customer_auth_id, birthdate, encrypted_profile_picture, person_pii_id, created_at) VALUES (2, 2, '1997-03-20', NULL, 100021, '2025-07-31 15:47:08');

-- Original (non-encrypted) data for adult_student:
-- INSERT INTO adult_student (adult_student_id, first_name, last_name, email, phone, address, zip_code, customer_auth_id, profile_picture, birthdate) VALUES
   (3, 'Catherine', 'Lopez', 'catherine.l@example.com', '3333333333', '333 Elm St', '44200', 3, NULL, '1999-12-10');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100022, '274576d3a5cb3a66bf8fb7fc54ea0097fa668b779dc80ca116764e49a7007bbb1020da8d02', '04e293a07d7b0c895d163b8574049e8010600043db25098e868ce9fdeb04b92bf5', '67822d056ec293de98c91e1e71a977ec5e551b1d314e56b1b155c1f6baa909ea5395f7243daf', '69e474236a42435aeea2dadd2703101c30fbf29ef4a0c2dce3645da0e06a57e41f368baf26f3377d421f35b928fdbc64730973', '681973a424ca2b977d3968c27c3d943a422f0e51d9ed189fa08bce7122261bcba27ff002d0f6', 'e257c2eb2e413ec6539ab0745a0e1d1d5a4c96dd88c557612d72b60ce5210ac812', '36ecf9133cf3bb7963d53f30ff300c9f376c7ba12eefa341114563518bea8ec5', 'd9fc21073d16853a2379c67366bb554f81541abc8765da80c43428b78b01b29b');
INSERT INTO adult_student (adult_student_id, customer_auth_id, birthdate, encrypted_profile_picture, person_pii_id, created_at) VALUES (3, 3, '1999-12-10', NULL, 100022, '2025-07-31 15:47:08');

-- Original (non-encrypted) data for adult_student:
-- INSERT INTO adult_student (adult_student_id, first_name, last_name, email, phone, address, zip_code, customer_auth_id, profile_picture, birthdate) VALUES
   (4, 'Daniel', 'Hernandez', 'daniel.h@example.com', '3344444444', '444 Maple Ave', '44300', 4, NULL, '1996-09-05');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100023, '1af5eff180f7ba7693f3c950f551268a973c29f8380155713271ee03921b006d013e', 'ca1ef9708fa4965c1011ad394822b83fc0e5cfb18240f4a443963cbeea571bac509d93134a', '20600607e6b42c5439456882e8e9efb86cb955f7f3ce3969b64587aeac2a4898b01e319ac28d', '5723eb0d2b23ae28eb4bd8d4fd3066e3e29d36487a2cf41f6d7e726c85c2c3b638788a18f27b8ce72114eb1376488805', '4ca0d4b90e334b587e2d6d63c139253c13d1bd84f828bebff629f3ef840d3fde758173b4e3cda73bae', 'dda252a59aeb9745d2163002402c71bcc42ba5789dc3ccb84e54a3b3850f3da621', 'ea4810048716d0782b935719477799e8e88d8226de4450f611059347a217be07', '8ebd73ece3be27cc10b362c906c587b6523748edaeb89c762b3cfee974cbb9dc');
INSERT INTO adult_student (adult_student_id, customer_auth_id, birthdate, encrypted_profile_picture, person_pii_id, created_at) VALUES (4, 4, '1996-09-05', NULL, 100023, '2025-07-31 15:47:08');

-- Original (non-encrypted) data for adult_student:
-- INSERT INTO adult_student (adult_student_id, first_name, last_name, email, phone, address, zip_code, customer_auth_id, profile_picture, birthdate) VALUES
   (5, 'Elizabeth', 'Young', 'elizabeth.y@example.com', '3355555555', '555 Pinecrest Dr', '44400', 5, NULL, '1998-05-01');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100024, '095db57fa00fad0088959f87e72620f1ce21cfe2c4c12dccd9f6606e9ea45a2be14ccf72f3', '7a8b7f2e84df9906bb593feabb19190346870b06b665983c3139838d3d89d4140c', 'eef71f4953a97b0b3f7b1f55c94faed896f915499035d41aec146fb1e30b0dbd180d50fb61bb', 'c1d0e68e12faa4db00d810bf95b5ef7c314efd710656b46c5e1c6d7304396017d2e900b45b2d902afbe4ec78385c494de8638c', 'ed111257e7e61c7e9263c9e093ded3d774150e8e5b171f53700bbbcaa55d34664ca75ab06939ffa12e8f8006', 'd03b4ba5355d820168bf103dcad4132f6516d7c616399d60b3142869a0873c2487', '052d674f9a5fb14b33430c57139214a22d0d7815e5e4ed73b62294b0a16834fc', '120e62113868ca97c9f96c86b8ef34900ad568fce471b8cfe0ba0f7451031bdc');
INSERT INTO adult_student (adult_student_id, customer_auth_id, birthdate, encrypted_profile_picture, person_pii_id, created_at) VALUES (5, 5, '1998-05-01', NULL, 100024, '2025-07-31 15:47:08');

-- Original (non-encrypted) data for adult_student:
-- INSERT INTO adult_student (adult_student_id, first_name, last_name, email, phone, address, zip_code, customer_auth_id, profile_picture, birthdate) VALUES
   (6, 'Gabriel', 'Allen', 'gabriel.a@example.com', '3366666666', '666 Riverview Rd', '44500', 6, NULL, '1997-01-22');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100025, 'dfd3f8db60f65a5ef1e789406dd5212544f828e71d65e8e1f7e2d4d907d6ad036a9dfe', '8fb748c32dcaad782591e10fe3d499f97cb08a5922dfa6a9a58e7ff69e9b62c118', '5453cc68cc5f7bb631c6b5c1b074883c09a1dd20cab2a2219b5d10ad1dc5a4b84ed81e9bd667', '0ed99bead82d345252094642c481b47ee35ef7b1f405b44c3eae98060f6e1b2f8d90296cb258be40121f9beb392d70c1ec', 'ae5e6b5264857c723bb451d5806e280f61bbf963bff8600d8004dce7a7377f2053b1ae0fef048fb6d3c14939', '9e3f84722b7226175d2903e5135b3e335c699818019faa0bc106f20f911741ae90', 'a5eab1ec54b72fe6dac55e197e29471d9b0ef64f167f8b3d87fc5934df4835ff', '7a536efbbb6136bf7fe0d6975c2e59b7a11ebac4d766203b93c4de9dc08825cf');
INSERT INTO adult_student (adult_student_id, customer_auth_id, birthdate, encrypted_profile_picture, person_pii_id, created_at) VALUES (6, 6, '1997-01-22', NULL, 100025, '2025-07-31 15:47:08');

-- Original (non-encrypted) data for adult_student:
-- INSERT INTO adult_student (adult_student_id, first_name, last_name, email, phone, address, zip_code, customer_auth_id, profile_picture, birthdate) VALUES
   (7, 'Hannah', 'Sanchez', 'hannah.s@example.com', '3377777777', '777 Lakeside Ln', '44600', 7, NULL, '1999-09-14');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100026, 'fe929cbf58a4bc4a6b00168ede5377b03bb6180a2caf1ed4bbb823c0753907e46430', 'ad8bb02d9450f97675b9bf447fd2e07c04f9e1c16bcd0343ea76c17d7f45d3b0a79eaa', 'b941fe4eb4329023bb73cbac45e5a3b4aa1077af8c990b8d38b2d095a47be7e1a8ef5ab91522', '5ad350469037b129fdcfd960cb702acf58a5b89c0e1065a4b70400bbc005bb163646c47f46007adf53706413263d7826', '61ae5ec5b0b073fe6dd2e24cab6289bf035fa2de53a8bb682f8605ac37a8673b342175e26236c6c9269866', 'f456a9b575068f626dc01eabd536ea8da0abf448c9584dece42eb192b0093e0108', 'ab3aeee219cc153db9849ea2a6073e3868dc7cad26014b666e40cfea0b2186e9', '81ef87d7e38642d68a76b3f5aca4245e275385c1f6dbde4f7fe610bd5b226536');
INSERT INTO adult_student (adult_student_id, customer_auth_id, birthdate, encrypted_profile_picture, person_pii_id, created_at) VALUES (7, 7, '1999-09-14', NULL, 100026, '2025-07-31 15:47:08');

-- Original (non-encrypted) data for adult_student:
-- INSERT INTO adult_student (adult_student_id, first_name, last_name, email, phone, address, zip_code, customer_auth_id, profile_picture, birthdate) VALUES
   (8, 'Isaac', 'Morris', 'isaac.m@example.com', '3388888888', '888 Forest Hills', '44700', 8, NULL, '1996-04-08');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100027, '9a94084802f6f39549fb47030d1cd5650fbf78cf2c9981e8871cfbfab82ccb9702', '9d9480249d7e36a8af1ec4ece72cd813f889e1e38d1040b8c7f233d4db63bb95dde5', '9a9ffa2b45f53d4191491639019cf1043fc170675bb7bbbadfa8b3a568f4f7a08a48c097be0f', 'fc428df460fb81f2328bb9a345eaeabf2535c9c190dc608a5203105157b2e531db6f97783503b1f25acec50ab2316a', 'c9b1d9a13f3aefc95385439fad2ef0e28312c0ec6ec9cfc96365d1cfe013e4bf38d8483937f7a0e0fbe08aa7', 'c7464cce917540dd7ac5d9515813cbd5df059b6bc8eba3ec1ba9ab0cd824f5e1ad', '149daa10716cf1eba6b36ae239f33bff6bb63c0b8191083054f1e22432c05779', '40c15a475dd55b640f7c9a3c7b4f19c9c660dfd8b4709ef356c60ac417b60a42');
INSERT INTO adult_student (adult_student_id, customer_auth_id, birthdate, encrypted_profile_picture, person_pii_id, created_at) VALUES (8, 8, '1996-04-08', NULL, 100027, '2025-07-31 15:47:08');

-- Original (non-encrypted) data for adult_student:
-- INSERT INTO adult_student (adult_student_id, first_name, last_name, email, phone, address, zip_code, customer_auth_id, profile_picture, birthdate) VALUES
   (9, 'Jasmine', 'Nguyen', 'jasmine.n@example.com', '3399999999', '999 Meadowbrook Dr', '44800', 9, NULL, '1998-11-28');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100028, 'a20650983fcc43dd823c8711da5bd7a4ac24b2d92c12f9b6046a3ae544f6e2d09bb3de', 'aae2d6fd7537b42b7830d1a05556c4cdd684a1139a48531511fb4b31dd40e0f2dabf', '24dd6f873f480f4f90b261e4ec8b8e1e9f58cfc17dbceee79f8477167306960b82f1cea1e456', 'a0db441763b6971374f4e891a2136e7dab42e4f87776275891354e94501fdaf501acb799f56fcdd51d960633415c3c7652', 'e0b3f1dc458037496a30f53a95f16289d36cedcc191e801dfba7d4d9f6755a055b738fd673b27126348287cc04e0', 'df9d853768f4752ef49bf8c28e3fa4284b9ed260f69c1d2464d97194679fe8c312', 'f9ed82236de7ed81b89e4ec42fdca135402514d7d0c60fcb60549690dd49dfce', '6a3c8207b39c0646ae0ba1efc7a61b5c249fad04794b8e2825c35dc23dac6b93');
INSERT INTO adult_student (adult_student_id, customer_auth_id, birthdate, encrypted_profile_picture, person_pii_id, created_at) VALUES (9, 9, '1998-11-28', NULL, 100028, '2025-07-31 15:47:08');

-- Original (non-encrypted) data for adult_student:
-- INSERT INTO adult_student (adult_student_id, first_name, last_name, email, phone, address, zip_code, customer_auth_id, profile_picture, birthdate) VALUES
   (10, 'Kevin', 'Bell', 'kevin.b@example.com', '3300000000', '100 Sunset Ter', '44900', 10, NULL, '1997-08-17');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100029, '6db0ae1dae3be1423ba8572a1c2cfb27630c6557055f4d8aea5a2ee8e7c186251b', 'e201ce293def9511afff638248324a3199aa9ea3d332a979220cf4504a160feb', 'ef8c76ee0265e2898500e83a687de87454cc0c9557ebd3e962b3647f5124a06c2f81d6aa4260', '6bf6c96ce75b45065f1ee8dc121884bb3efa7865efa4933091449f3b773d50178c56dab603ae9d67f701dccb139a3c', '2a0852c24caea722cc7593a15f05204668366e62ea58fd89ef895c3048a20489ebdc00d99b5e2d210364', '766c0af4448411eee6ee72cb59199dc553d758f1f64bb9fb03765d1553000e05f6', '4bbe5ea5a8278fb8f1c2ec94345496a0b43cde085af8e3295f47a0d8a37aa210', 'd150396feb16a33f707aca4003e6fa3f29e6f97bcb0dd976808e99cddd22a008');
INSERT INTO adult_student (adult_student_id, customer_auth_id, birthdate, encrypted_profile_picture, person_pii_id, created_at) VALUES (10, 10, '1997-08-17', NULL, 100029, '2025-07-31 15:47:08');

    -- Data for tutor (10 rows) - Phone numbers adjusted for Mexico
    -- Original (non-encrypted) data for tutor:
-- INSERT INTO tutor (tutor_id, first_name, last_name, email, phone, customer_auth_id, birthdate) VALUES
    (1,'Liam', 'Baker', 'liam.baker@example.com', '3312223333', 1, '1985-01-15');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100040, '4b1ba5a21e0e280126dc93f6b832fb9f4a6fcdb5fe5ea907c3963a6cf620c487', '4b2f5ea575e1d3ea7ebfea96d4b5610179d680f21ef22e7c7c5f37ec2a431c2c30', '66963eda564164451b584ec59719bb635b91e12d57c13f86ebd4e05a6f9f411a94226631d0a8', '8b02f313c2c647c980ff506ea69df9a4ba321953fdb7b3e0a47ed53bc50c61ef0e8a34f71eb28d0c91aee8ef05f64de4ca4f', '640693135f2633ce45f2ac263e70a5e099dc30cfed2ea16c24efbbc4ee', '6c97ad969a1d3f57c157a6c69f3094a7c4beb5859e543c20ac9980c211f947965ea15d33e93a', '2ca5c565b741d93b571dc7a251205399403b9b8e94110df229a37176fd8e725b', 'b4e833098dc02469609cdc89c8b9046faee9dbe96129d550e27aed1df843ac6f');
INSERT INTO tutor (tutor_id, birthdate, customer_auth_id, person_pii_id, created_at) VALUES (1, '1985-01-15', 1, 100040, '2025-07-31 15:47:08');

-- Original (non-encrypted) data for tutor:
-- INSERT INTO tutor (tutor_id, first_name, last_name, email, phone, customer_auth_id, birthdate) VALUES
    (2, 'Olivia', 'Clark', 'olivia.c@example.com', '3323334444', 2, '1990-03-22');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100041, '8c7d190e7d304644318f8936dda7de78fc1dff4e8c8e3e0ad0a7eee3a2cc2cc0b834', '8e4cc2b4204532eb1eba390fa3bb81dc960417c60ade81dbfbd57a868e828c4d2f', 'db5c1aa7fcf80b89b81478a85a3868c218a87892225bda300cbf419f2de0ea6053fbc20d3607', 'a5d69f8d35a5b195a40f3ac15b825689a0f1796e8c7ebea1a52b449b8c6c1750920597f7df7cce36db87d5e419afb49d', 'fc4f96c507b28a6872238e0d14c029da29887e3259896a8295d9c09832', '6df7a782c02e1c76b66282d2eaa4d42e986e914f41cd2a6f92aff6aa6c9bf749883544bbdcce', '8e45d2101ee362db5b6f1208d3d8895ea627338640f5d0235fdff949fa9518c7', '84ba4e105470d893b9e3a9a1f56be8194b0c42df4ece8ed0d490916dc19526d4');
INSERT INTO tutor (tutor_id, birthdate, customer_auth_id, person_pii_id, created_at) VALUES (2, '1990-03-22', 2, 100041, '2025-07-31 15:47:08');

-- Original (non-encrypted) data for tutor:
-- INSERT INTO tutor (tutor_id, first_name, last_name, email, phone, customer_auth_id, birthdate) VALUES
    (3, 'Noah', 'Davis', 'noah.d@example.com', '3334445555', 3, '1978-07-01');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100042, '11db89439e652c1de13bd3e4416db4f992c47931bc36c3bdcef9f37e541d7415', 'ecbfa282ac9273720be6b5b14e8a87b48f39f9457b3da657a0dd73783d63f45d77', '233f2be9f6157c436c7ceb198aed2c0071462b53ca13d2663ed4ea6bb029d20fce93bd477e46', 'd548e624977a07237045857d8fae2e934fc5f45741c4d88092e1bb00c5a0dfcf1a56e3683c2ae253a298e53ad795', 'd7133edcc385a3f0eb5f39e1343edb054df01e739cca591d43fa8895e0', 'a9ea1e9b5eb6d86062ba8eb91af948b1b37761802f0bc54b67234b1a3ded8996d964f725e379', '6bc6af226bfc22231a6ebb66165ca8ef1a8a8ffc4914e9a093833dfc5cf8274c', '09bac6c148190a94599bd0d3accd69f41c09e68b7678cb60121487245501c873');
INSERT INTO tutor (tutor_id, birthdate, customer_auth_id, person_pii_id, created_at) VALUES (3, '1978-07-01', 3, 100042, '2025-07-31 15:47:08');

-- Original (non-encrypted) data for tutor:
-- INSERT INTO tutor (tutor_id, first_name, last_name, email, phone, customer_auth_id, birthdate) VALUES
    (4, 'Emma', 'Evans', 'emma.e@example.com', '3345556666', 4, '1995-09-11');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100043, '86fc5cb19dba3bfecfa8e70a45f1e395e9545539e83f4ffffedff70e1f8ae94e', 'eb870b774dc91ebd984a35608f956398516ce7e2733dab7277a8466917238983f4', '7d8223efd326de2876d27d2b8ac2a66fe0e93d7462aef7558d33738054a521a4336acf74effb', 'c18f5979210a3da16a4cc3ffb08654ce6567ee124a83c9da68c2db961141bfbab3cd1a49c60d4b6a4cc2443ab0c1', '5f4019a756f4ac1d4d9ec10e3d418395163facbf08654e89396f2a4f46', '660f2670e2eaf040d53b806f2abff5fc0acc56871cb683fce0b356901d53157102c431d6e9bc', 'dbd4a9041e6130c5a72d1e9f6144e794ab3bd70d90e2293c90eb7bda3c02c52b', 'f3c177c9276dda78a1a3e6edca69ccb21695884efd609ae242ad3f416e9a1795');
INSERT INTO tutor (tutor_id, birthdate, customer_auth_id, person_pii_id, created_at) VALUES (4, '1995-09-11', 4, 100043, '2025-07-31 15:47:08');

-- Original (non-encrypted) data for tutor:
-- INSERT INTO tutor (tutor_id, first_name, last_name, email, phone, customer_auth_id, birthdate) VALUES
    (5, 'Jackson', 'Foster', 'jackson.f@example.com', '3356667777', 5, '1982-12-05');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100044, '76d4796d6057e9ff72ccb721434c762a57f8f7c580b4258baf8c7ac570fee7196cbc57', '787110c84b0990ecc13397483645fcc826b278c8521ada7f074a2565b777268000cd', '342d1393b7938de39e37b7c5c7af0f0efdda12ed2df90542863a87a033b41d75ee676a480e6f', '8c4e606e53bfb8d574ae178d4adbf1c722b3be4d0c8ff27dc060189af9c9356be816f772eaec2abb18e56d45659d5230cc', '76c29e3dd59d3fabde37ae9788d039ec16272a9cbd445ad6ee94fa0529', '78df5e83db517a51dbf11b5ea8bb43dd4afd9b60dfdbcd64572ffeadb5c05a307e313f88cf7d', '36dd74b29abafc8104fe6cd7dcfc99a369064bedf3ec10ff40641674f06e7a54', '2bf8f5ae3c85dfa0ab96a0f396ac5f10e566a745cb43858450bc9dcf49290530');
INSERT INTO tutor (tutor_id, birthdate, customer_auth_id, person_pii_id, created_at) VALUES (5, '1982-12-05', 5, 100044, '2025-07-31 15:47:08');

-- Original (non-encrypted) data for tutor:
-- INSERT INTO tutor (tutor_id, first_name, last_name, email, phone, customer_auth_id, birthdate) VALUES
    (6, 'Sophia', 'Green', 'sophia.g@example.com', '3367778888', 6, '1988-02-28');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100045, '2de8a5c6c553f99103e0dd47f47eecfb1706602e86045e048c2465ef4de9d5faabcd', 'd80f9a574b20508d8cbb450d6d27c0d593d6635898092d1676bfc6619af3091a12', '3ace3244e99dc5e433de961e55382552c2dc7757178ff5b9c9eeba2628ff595021d75a4b9bf5', '51fde3ebd7d44634db18cd6748fbdb242c29b917008cff3560607b0fce705898720dc55a111b6e1e8189aab458575046', '65262bab5a7419b24ee2e45a1323db2016cfe60d5913aadbad5d1551a8', '9037b096ade2a7dfabcb29916326b05f61a9eb5d4d29bcf69a1eb4f0188fc118f63d6a115250', 'd81a8e7020804baedc1aeeb85873865e80008a1b8a429c457bbce4e80a959282', 'a6c95c0971d0ca4cc3f67edb7dbf41b120b9d974419fdf45e72e7ed8adcff17e');
INSERT INTO tutor (tutor_id, birthdate, customer_auth_id, person_pii_id, created_at) VALUES (6, '1988-02-28', 6, 100045, '2025-07-31 15:47:08');

-- Original (non-encrypted) data for tutor:
-- INSERT INTO tutor (tutor_id, first_name, last_name, email, phone, customer_auth_id, birthdate) VALUES
    (7, 'Aiden', 'Hill', 'aiden.h@example.com', '3378889999', 7, '1975-04-18');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100046, '4a3d0490935868e75027d22cfc53b5772b2cbbf82f116cee78c85941ecb3d89df7', 'a71ca5d38653b7f7906eee80ac33e99d3f75554d4a18a110c851195c235a7bce', '4f9621423c617cab8f99dbdda26d9de148465a90cbbd123826d4988e84d83923c6828ad17751', '5f19b3b4a4b6d26ade462e763d2a751f24c34b396b63a5a00d349a5277d1e6e4cd528907950714324d022a1c150214', '3d63d435bd2b0bbe871e4a1b955e13823023e48c442d19a098f9927c54', 'ea5c6a82379262b473bf4987131a8ec30f14b655ba5316e45b3a56d6d7af5414b7908c159979', 'ce28bb327cfcee25ca43afce313792ae0b0aac7ab81f804097753aaf39d069f4', '9377c4071f2a77f4add65ea6afe2254c5bd82c350252e89ac1e35813ba7044e1');
INSERT INTO tutor (tutor_id, birthdate, customer_auth_id, person_pii_id, created_at) VALUES (7, '1975-04-18', 7, 100046, '2025-07-31 15:47:08');

-- Original (non-encrypted) data for tutor:
-- INSERT INTO tutor (tutor_id, first_name, last_name, email, phone, customer_auth_id, birthdate) VALUES
    (8, 'Ava', 'King', 'ava.k@example.com', '3389990000', 8, '1998-06-30');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100047, '1cab34d3fa9edcda9d8c63451495c56ed1caaed5ab13b70f7025013e333571', '0f5f35f56abce21e23faafbe560c99a648d0f343f584cc6803742dd1f4190fe3', '3459a3d1807de053b373d3dcc48f5c878fda73c7595bf35f3b8d2408ab78285cd11ea5b8f60d', 'a769691992a50be0cad08491e5b54b0e81f770ec8364ef62a13e5b0e5e74da067427d60c9e4e6f70cef7edb8ca', '476bda02f90affc5cfa016d9736a9faadbaba84d3b6f6952f630b635e6', 'edcf909f8273e94fb022b3439835800014821d1c0d2a180224d0f6a75a4ccb524970320d4d12', '8f490d8ecac87fd6e368edebbdd32f1d40adfc6c9d5fc470d84160a730490c4b', '9242700f9e3d08253f69a3660261f63819dd967e95365ef1c1ea1260171539d5');
INSERT INTO tutor (tutor_id, birthdate, customer_auth_id, person_pii_id, created_at) VALUES (8, '1998-06-30', 8, 100047, '2025-07-31 15:47:08');

-- Original (non-encrypted) data for tutor:
-- INSERT INTO tutor (tutor_id, first_name, last_name, email, phone, customer_auth_id, birthdate) VALUES
    (9, 'Lucas', 'Lewis', 'lucas.l@example.com', '3390001111', 9, '1983-10-09');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100048, '06ffc64f3a42a3ec821ace8436676048f160880c6abf0d8a2089ecc14820268479', '9570c119cb3b71aa4ade6d57cc3047b6374e1e407b6f4c3c6931100baaffdb8c0e', '810de41411afdd1343dfb98869f3230e55d720acc878b4aac13008626faf37837b6e219216d1', 'f05b89a46a2f5fc4a633e7dd6e5957442de9f9abf750ef685ef65804a1c8cb32669818204cfc25f64ec98baafe67ec', '910dab527c3c69ace95d2c612ad23433144936240900fb0328f7b4bb77', '7bdddaedaa0f109e9a0212a1109752ec073f364c6c434ded6215acdea77c57c2c0bfdd62b679', '596e9144b1e3d48a9f0607de8f60c4cb40b5719d1aa6783dd68e08e61a4fe683', '734b6c1963c34bc2fe1249569c74083eb8922e346168863954f6eedb4d6a4cf9');
INSERT INTO tutor (tutor_id, birthdate, customer_auth_id, person_pii_id, created_at) VALUES (9, '1983-10-09', 9, 100048, '2025-07-31 15:47:08');

-- Original (non-encrypted) data for tutor:
-- INSERT INTO tutor (tutor_id, first_name, last_name, email, phone, customer_auth_id, birthdate) VALUES
    (10, 'Mia', 'Moore', 'mia.m@example.com', '3301112222', 10, '1991-08-25');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100049, '59752e4de6f7d266585942334b0b92ec37e7fb4f5c1cba6b22f9e1b38b57eb', '2ed146555542323832ffb1eaeceab77cf9a14f4dcd141aa0a10b108b9e07e031dd', 'b2dff7fe998c86fa3d89530f3720c8c82428d94a69d3366b8766f45812169d9a5ea990d549ec', 'bb23af9dbf06478863e67205876358b63088b6a6885602b5d82dbb43b642078f65d359355c529cfd510ea21c70', '92faf97f4b887069ff76361a16bd6c164b640924549e2a88f683a4e4297d', 'f8f6264159c936b6c6d3e8d2137280b3a0c079aa27c3196c423e70c161db1dc4d7bc52b2e42b', '37ee04961ae9a8a3d2c199c42f3d488bb36f32133f35dded5e33f9c373020577', '4349aa2676811c8fb9cddf2ec4e3ab0a5577eda7844f037d9bcdf4f1bfeee3fa');
INSERT INTO tutor (tutor_id, birthdate, customer_auth_id, person_pii_id, created_at) VALUES (10, '1991-08-25', 10, 100049, '2025-07-31 15:47:08');
   -- Data for minor_student (10 rows) - Phone numbers adjusted for Mexico
   -- Original (non-encrypted) data for minor_student:
-- INSERT INTO minor_student (minor_student_id, first_name, last_name, email, phone, address, zip_code, customer_auth_id, tutor_id, profile_picture, birthdate) VALUES
   (1, 'Alice', 'Smith', 'alice.s@example.com', '3312345670', '123 Cherry Ln', '45001', 1, 1, NULL, '2008-02-15');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100030, '44067a2c43250ea57a2324c7d9cc709d0b7ac4ee7cfc9cc53d1f47038d00093039', '750803fc7dd5381f06235a59a1f2f79a42c5ff48c2d1dda8536bcf45a699c839d5', 'a70e56cf68463b2a369f5679ad7f0088bf83e48f8b6b607b4b0b271efbb8bde680491eb10c99', 'e724f452899efb950ac5027adcab7a24a90cf077eb72b700eeb22b447d6abce8b173fa8ca1695d136c5dcdc15116f5', 'a2eb5a8b0502720489ed76dcb890584efe3e7b464a930488f9f0e4db14b85d959dccb0a433ba96f974', 'f0c31ee6a2ab464429837b640844e22a07f973c2d9efcb6456051471b835e7616a', '2976d197a7a6fd16824e6c5462ce847396ceb808316a3fdaa4ef11b39fcf8152', '0b11f4dad50cfb477de2291479621492fe003786660022dc9ad8831e6aeb957f');
INSERT INTO minor_student (minor_student_id, birthdate, encrypted_profile_picture, customer_auth_id, tutor_id, person_pii_id, created_at) VALUES (1, '1', '468ebce7d05dc6d1d784a8bd5a10d6253f4816aaf1fdf498d6a9a7d651', NULL, '2008-02-15', 100030, '2025-07-31 15:47:08');

-- Original (non-encrypted) data for minor_student:
-- INSERT INTO minor_student (minor_student_id, first_name, last_name, email, phone, address, zip_code, customer_auth_id, tutor_id, profile_picture, birthdate) VALUES
   (2, 'Bob', 'Jones', 'bob.j@example.com', '3323456780', '234 Oak Rd', '45002', 2, 2, NULL, '2007-06-20');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100031, 'fa7033c72f1ca394803f2957898392e00323e2489ff9bc0bdb95b7c3a2d718', 'c70d3318c3b47807014bcd61b893b9fc8d7074d33b2d86fb16e50da5b7a5df5321', '511752d3a3eb61d30b76e09d446d92e03d065e60451acae89a806526655496975015b0951bf9', '1dd53a18ffb2e85d136dcae6804ee7bd412f64ed958247b6f267838ab5bac6b2a5b39a096630e1d59ceed2e452', 'ca69d8b1c02d6e6eb750d3f7769ad83069006d781fc7c926592b0be3139241953138704f03c0', '45866f2e0cf3e30488f8d0c4052987efc9504cca9a59b95fadf347215bd5305482', 'd5f8a30a804d7fd3afb6f91c562ad25100f9cb68d883f2d2bef0e382eea41af2', 'a36e50d65a2da695ba385708be795576bd9eb8211095c5bec2a2987b8e8942e7');
INSERT INTO minor_student (minor_student_id, birthdate, encrypted_profile_picture, customer_auth_id, tutor_id, person_pii_id, created_at) VALUES (2, '2', '90f587e648ed0f2d26ccca04f92e2dcd99ff60e0f28581d15dfba9a786', NULL, '2007-06-20', 100031, '2025-07-31 15:47:08');

-- Original (non-encrypted) data for minor_student:
-- INSERT INTO minor_student (minor_student_id, first_name, last_name, email, phone, address, zip_code, customer_auth_id, tutor_id, profile_picture, birthdate) VALUES
   (3, 'Charlie', 'Davis', 'charlie.d@example.com', '3334567890', '345 Pine Ave', '45003', 3, 3, NULL, '2009-10-25');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100032, '9e7b5d000e495ec3f7a066d6503bfad40b79d84a5c7cc797a3cde307164fd9fe337f01', '4a9aaedf884185cbe6b5ec9be4675b3ab40a7b14dee002bdfa5d15d14e02f0a72f', 'cd6429077aff9237f94c289e8b11c450b3f7ecf2ddaa98a6fbd62cc70d566f321682216c9abe', '5706570ad5f538688a294f441a0705c41a2ba07bcba4f81cf84fc9c55b9a0345af018a3cea2656813c57d1218ceb7c4696', '35378003e57243c656971161843c7ed2a41279d673825de6f535f3fc76f3b6f63fb1562367cfc458', '85403447b152124872f9149048aaaba558f0b61c7d24f0b7eb3ecb24033c09d41e', 'ef3bc3fbcfe18d1162992c5be4f80f4074daa2e7b82fd87e392b3b4af336fb6b', 'c5a8e0718f514bc783e13be3a7b9fdc82949baf1dacac50074e7e7ea00b23447');
INSERT INTO minor_student (minor_student_id, birthdate, encrypted_profile_picture, customer_auth_id, tutor_id, person_pii_id, created_at) VALUES (3, '3', '1e8761ddfb1afaecc4d75f8ba802afba1b118034216a4e74dfb89f0241', NULL, '2009-10-25', 100032, '2025-07-31 15:47:08');

-- Original (non-encrypted) data for minor_student:
-- INSERT INTO minor_student (minor_student_id, first_name, last_name, email, phone, address, zip_code, customer_auth_id, tutor_id, profile_picture, birthdate) VALUES
   (4, 'David', 'Wilson', 'david.w@example.com', '3345678901', '456 Elm St', '45004', 4, 4, NULL, '2006-01-30');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100033, 'c8bc66cbd878a4d76d69a485522b8f5ab87a6bfa8ffbb2d33f10160a52194b40af', '4566cf4cdb485e7877786ca03d916708cd769a362f8a71d9dbb0ed596746e98c02b5', 'a52362804f05b7df3a5c6a42d519f2d48265a73222f29ba961aaf3da2aa84da15b137e556d35', '28e9c6b9df4d5de175ab3feb55e3530112fc9faee99e52f04c591072501e2ca2e87a1f9fc9da06b5af921a1ef7afeb', 'f70909b54cbcca34a2753fc41a6e3d5bc473655909ebbc36a7fd98741ce25d1d619e55d1dc98', 'd794202d5cc308b9030161e35dd31e7abb63f1201f70f3effc9d4049bdb1884210', 'e81141afb63b68c3e8da24e3e5b45f27988bf5d1947d263b8879049772af99d6', '594a07fc54ffeab25aa8e039c13b09e915885996e4cb950b62e215a16353cf12');
INSERT INTO minor_student (minor_student_id, birthdate, encrypted_profile_picture, customer_auth_id, tutor_id, person_pii_id, created_at) VALUES (4, '4', '68919378963a4f5d4ffcfff4545893bca240a5ced4414c5a07e1a1ebe9', NULL, '2006-01-30', 100033, '2025-07-31 15:47:08');

-- Original (non-encrypted) data for minor_student:
-- INSERT INTO minor_student (minor_student_id, first_name, last_name, email, phone, address, zip_code, customer_auth_id, tutor_id, profile_picture, birthdate) VALUES
   (5, 'Emily', 'Garcia', 'emily.g@example.com', '3356789012', '567 Maple Ln', '45005', 5, 5, NULL, '2008-05-05');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100034, '059189876f2a65c039bcfc534abb4efc94cca45440edc85659fca4ade26b0b1e5e', 'c5fb8fa2da2cb56713eb0ddc9d8ecfceae64f426d72d438b2925452b0dcfd81c7166', '12e8b1b69170640e0eadbdacd8bab45b7ae0ae14f3578bf2471a4702d864f7a0e183c2334ed4', '27d89cb6de4ac6d2295b3f504d9ae6383dd0c87235713876cfa98fc78e677276cea407a06d57c07dcd0556ac6d727e', 'feffd41dba4f7659a9c856da8f82503eb5f60d70239b0b50f77255e641c97418d8d8064938f50bd3', 'a990db52d36526ca9743c297d370e2c4c8d534d2b7e324f4c9f488948bd962e9ac', '7e3bd67e03fb92acc7c25333c76529874e69e7d5731e04055d5ff157cfc5b235', 'ceb85e959f3aff25af859f75748dcd56da0549f0916839899264fec2ce40c00a');
INSERT INTO minor_student (minor_student_id, birthdate, encrypted_profile_picture, customer_auth_id, tutor_id, person_pii_id, created_at) VALUES (5, '5', '1016219db614cad2484b691a0f71628196929623d070a9c3a3e62e101e', NULL, '2008-05-05', 100034, '2025-07-31 15:47:08');

-- Original (non-encrypted) data for minor_student:
-- INSERT INTO minor_student (minor_student_id, first_name, last_name, email, phone, address, zip_code, customer_auth_id, tutor_id, profile_picture, birthdate) VALUES
   (6, 'Frank', 'Rodriguez', 'frank.r@example.com', '3367890123', '678 Willow Rd', '45006', 6, 6, NULL, '2007-09-10');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100035, '095184c06dff0ba2c3b022dd15d92a080bbcf9a412e25b63460d407de490d293c5', '208269b6bc1139156c6846ebd5f9d2ba6d537fab5bcc5fe46008892be71744d9680acc0fc0', 'ac610ba6418170224fb3071ab7276ea3da14bd96ca47ea8c4943c049dea4239dc6c7954d9af2', 'd831162b54eabb9d5bed033a11abe9e6b2fe64ad7027663cf63a41c2e9d133774b9495332e4f4f3978abb41715bb37', 'cb878478278560276770ce9d4b3d7fc11b56f791d5a077b3a17fadb31814cfb13e2c0765562c85c523', 'fffa2316abe9a4bddc51dd71f5d5533251b6cc8d414fdcaac6e0aa1b1be29b7759', '7e1c69a85d0416b8235b47917a368bf1f1dd217b60cc212105026f7ecb2b7bc5', 'e7bccd1b43d8acb65dba5c9a2b2241fdc11656160fbc927399cc4981cdded977');
INSERT INTO minor_student (minor_student_id, birthdate, encrypted_profile_picture, customer_auth_id, tutor_id, person_pii_id, created_at) VALUES (6, '6', '48815f0be35275b45f588e161e7ee42263bcfc53d8b04f715b37c683c4', NULL, '2007-09-10', 100035, '2025-07-31 15:47:08');

-- Original (non-encrypted) data for minor_student:
-- INSERT INTO minor_student (minor_student_id, first_name, last_name, email, phone, address, zip_code, customer_auth_id, tutor_id, profile_picture, birthdate) VALUES
   (7, 'Grace', 'Martinez', 'grace.m@example.com', '3378901234', '789 Cedar Ave', '45007', 7, 7, NULL, '2009-01-15');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100036, '6f90034e829d46d5de8ad4a0faecf4329d36682a28c476e33e16a3ee58425438de', '0d3f0ea328c1b845b70e273a8737cfe15e4e7007693b3f8aa10c4035e49cc8057b8ceb7a', '9bfa6256d42819b6f705f5fb8b26d6474cc0c2c7cba0f94f0992eec7408076d1301cca86b44a', '9a7808ee6f3a2da0eac31433f8ac8e3e3bc5cb67f6ced99a593f0a629876433a09ccf04fc2f330296c585656a96ecd', '91cd986b5191d771da8ab37266e1558485f61098ff82b9cb55599ce62fa2f142f3c8174143a7ede2b5', '7b62140907405c2cbb5d8a3bd221bd999388bd877178cfee4ab46bda03f96ebccb', '0dd243930f7041585cdfdfc258f241d6a9949b9e54d3ae242dce94aa34a8edec', 'd0ab6ed1b6392484f51d9ad62ba17486aa0fc3abf566c13a35c29fa5ac440d53');
INSERT INTO minor_student (minor_student_id, birthdate, encrypted_profile_picture, customer_auth_id, tutor_id, person_pii_id, created_at) VALUES (7, '7', '70b5680dbcc80ca520fa20074f62e9c0d6beeac70155f53f8dda50027e', NULL, '2009-01-15', 100036, '2025-07-31 15:47:08');

-- Original (non-encrypted) data for minor_student:
-- INSERT INTO minor_student (minor_student_id, first_name, last_name, email, phone, address, zip_code, customer_auth_id, tutor_id, profile_picture, birthdate) VALUES
   (8, 'Henry', 'Anderson', 'henry.a@example.com', '3389012345', '890 Birch Ln', '45008', 8, 8, NULL, '2006-04-20');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100037, '0432db15c91a2fc3aeb3eb6a66eab0c7806d64a1ce4de94fc751de01c7171351d1', '4afa2af1e075a39aa32c9efc3274f4041dea37ff9dfee983e8fd3b7ff761d6e52c91cf14', 'fa0894966e58b4784434e392979adfab3d224b9500c8ca68c09cff75fd08d1435660d1ae74d2', 'a81931d141da6d336125032eeb01a49437f760942ac73ad72fb16b3f6937187a9fe80d8bb50237a387cae44aaaab6d', '428196884298d45b3ef591c17bc46dbce5bde0c59be57695663b9792b44a1eb3ebce4b0a440ae212', 'f6f79dcf164bd39165512c45dd094c861bb7942c547d35b8540eb3160a053ac4e5', '7a7110c012c84c9b2f9038f3b77fbfebb542459bb7d2272cf682e5c9f90f7d0c', '64ed58c26115a221c4ccb58b184ea88ac75ff0e7a9a66e0e86b3bb6956526095');
INSERT INTO minor_student (minor_student_id, birthdate, encrypted_profile_picture, customer_auth_id, tutor_id, person_pii_id, created_at) VALUES (8, '8', '9b8e4488e233d2f9c00e387e314ec1843448745cc6581363c80b3ee26a', NULL, '2006-04-20', 100037, '2025-07-31 15:47:08');

-- Original (non-encrypted) data for minor_student:
-- INSERT INTO minor_student (minor_student_id, first_name, last_name, email, phone, address, zip_code, customer_auth_id, tutor_id, profile_picture, birthdate) VALUES
   (9, 'Ivy', 'Thomas', 'ivy.t@example.com', '3390123456', '901 Hickory Rd', '45009', 9, 9, NULL, '2008-08-25');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100038, '7060a41e49a887ed91eb37310d0ec0e14050382c9bb34360a109a38295da9a', '743bc876f1b25051f2998096973deab1b15943b90fa3e6e40e0c7e46961d10d97f63', '97f528da2e98ffbaa2f31a5fe370bc0696db04f068122d8568682dc99f167c63a251e4852573', 'b315b298d98c40947f3f8d5b9280cbb7284369d60bc5a06e60c49399f0f7ee10e824aa014242111ae9180a1e50', '8d145b37afdf411b2a150be7304e5cb38ec4ab6668a70950be7262ab37995cb29d4627b84912201b485b', 'b454108cc21e9ca79838470d840b25811afd3e4a69732f997851dbcfd51136bf42', '0256dddb44e8a40b7936428015f7803852d3152d88ec33d4128b685c5eb6cd98', '80b37eeeb71acafbbc143830a8231ba228e193897c9400fb5bfb989e93351da6');
INSERT INTO minor_student (minor_student_id, birthdate, encrypted_profile_picture, customer_auth_id, tutor_id, person_pii_id, created_at) VALUES (9, '9', 'd81fc1b1b7f1e4c6ad272096612cde148f981d7124b071717686a957a0', NULL, '2008-08-25', 100038, '2025-07-31 15:47:08');

-- Original (non-encrypted) data for minor_student:
-- INSERT INTO minor_student (minor_student_id, first_name, last_name, email, phone, address, zip_code, customer_auth_id, tutor_id, profile_picture, birthdate) VALUES
   (10, 'Jack', 'Jackson', 'jack.j@example.com', '3301234567', '012 Oak St', '45010', 10, 10, NULL, '2007-12-30');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100039, '7e9d8f19de5382d4b7baa6ccf50dec09b1bf2e6534959e4d1f977866d8d571b9', 'b27373a57c2d8de4bb35ccdce6388f50007eb3e3590cb80c3582b43768fff6360df8c2', 'd0e818e3e119a573c8b16f5cfecdf87e7df7621af3698ffcc150b48a57b4dbe58ef5be01ee7a', '6bb2466eebbe088753d792cbb79ba46484840c37a63c331def88150ae87735fdff72ddbcbc73f2ffe4bb1ffdc401', 'e7c865468c210031c4320d531bc0f6d70ccc082b17682e3afaf05655d18d1102a9a4609d0f87', '9088bf9f3d67b971b531b3539315940b61663912504dfabf3d1dc7c29c6f8b2fa2', 'd11b3b2b3598c2551bece4b316875fcd30cec7c3e49bba28990192b1eca1f8d3', '4af50935a804098d1a4bd09481df05bfe7627ad61a2dd1e12bb9d6b1debf50a0');
INSERT INTO minor_student (minor_student_id, birthdate, encrypted_profile_picture, customer_auth_id, tutor_id, person_pii_id, created_at) VALUES (10, '10', '7b13cca33f8d53d805c703d7f198586bd29485e37348dfe475d946fdb8f5', NULL, '2007-12-30', 100039, '2025-07-31 15:47:08');


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

    INSERT INTO course_event_adult_student_attendees (course_event_id, adult_student_id) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);

    INSERT INTO course_event_minor_student_attendees (course_event_id, minor_student_id) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);

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
