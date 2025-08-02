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

   -- Data for employee (10 rows) - Phone numbers adjusted for Mexico
   -- Original (non-encrypted) data for employee:
-- INSERT INTO employee (employee_id, first_name, last_name, email, phone, address, zip_code, employee_type, internal_auth_id, birthdate) VALUES
   (1, 'Alice', 'Johnson', 'alice.j@example.com', '3312345678', '123 Main St', '45000', 'Full-time', 1, '1990-05-15');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100000, 'a5bf56f78a9074ba517e275d9e97714a3a272971a416cdd5596166b6043b0a6bf0', '306c1559bdea7a24144bd217355fd86441b25b5f0cb98d255f536ac11bb945217afa37', '2d995935f790ea0ae24de7fad7188844de67d3def1f3326f1fa10adf6d8c713dcb55c48f8aa3', 'a4f356fdd4bf38bba40c51c2f3f9dfa690a6d7216642b4a43d3091f4b392875d9166cb7c781d575d11c1a7a0300314', '5ba08d8a822e000f2694dd545a2a5a4fff6fb2883f94f4a21e02a12e6a16a37eaac184daedd74d', 'f192e91ab31bd8a3947c7b36e6117cbc59c09aaf483c589cf8bb0cc4f8dca6869a', '62091c05538b25e7b00cdd294780080aee9cd5b3aa352141cb9fd47f3e43702a', 'bdd0098e6e171a5778e2d04ad38bc204e9306ea6573b3c6a4f50ce905ed09d3f');
INSERT INTO employee (employee_id, employee_type, birthdate, internal_auth_id, person_pii_id, created_at) VALUES (1, 'Full-time', '1990-05-15', 1, 100000, '2025-07-31 15:56:52');

-- Original (non-encrypted) data for employee:
-- INSERT INTO employee (employee_id, first_name, last_name, email, phone, address, zip_code, employee_type, internal_auth_id, birthdate) VALUES
   (2, 'Bob', 'Williams', 'bob.w@example.com', '3323456789', '456 Oak Ave', '45100', 'Part-time', 2, '1985-10-20');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100001, '2d206ac77f3f17c464b1628ea412bc4aefc95678dadce02309fa1242763065', '1b1fa676b11ce3ef6a5cd7c7563b86586d6ff6b980c94ce277c3a53a87f71028538a98f3', 'e26c6cb277d9804f769c5a3da7cd060abe7e7a7f0da37620fc83ac1c6451f1524f06603e50b8', 'a3e6bc8bb8d14ff26c749ac35ade43f886f5029d0db231c5685060556b7aff0122b38c84abfc763870b6d2065b', '77fd233cad4a43d2708be4a14d34fd1c562ee270c338958ae47a4a8463704916c8223918e30727', 'e228fd2b9ce3e6ecb062f946299452e803cdbc31df3aa1038004bc1819cbd4212c', '01465b85efb1de1a4d32f458fe37c2880548b7287bb6e6765a05784570024760', '5b315f2353857961c96fd3bf37a34d57fa008ef971c10b86cf398bb11d8205ec');
INSERT INTO employee (employee_id, employee_type, birthdate, internal_auth_id, person_pii_id, created_at) VALUES (2, 'Part-time', '1985-10-20', 2, 100001, '2025-07-31 15:56:52');

-- Original (non-encrypted) data for employee:
-- INSERT INTO employee (employee_id, first_name, last_name, email, phone, address, zip_code, employee_type, internal_auth_id, birthdate) VALUES
   (3, 'Charlie', 'Brown', 'charlie.b@example.com', '3334567890', '789 Pine Ln', '45200', 'Contract', 3, '1992-08-01');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100002, '2ca64e7e0f20b5823bd536fe59ab3d47ad500d4f15264128713c07cd278cf4113ba81a', '1fae057d64da2f33514bee1b73264c09dcbe29abe5fd5560c012fe0ecb66f3bf8e', '90aec965fa4a176980fb2d493387ab6bc118e0a86b7f11ac2335b8455278114e65f0a5629027', 'f630f2bd7b2ec1099e7408f3d626ba0d6e1ca557f60f9867de9c785994fc927d59239148d3dd30f401c0f0322830f5d097', 'f03c7cc8d681cfe3b0d86569d7c4530a87adda6c99cb82acb4e2ea6acfb552974765d507aa71de', '5bdc00706ccdc9ecf40c21ef8def12f5271fe1c0fe9b1ce22349c6fe525cbb983a', 'ef3bc3fbcfe18d1162992c5be4f80f4074daa2e7b82fd87e392b3b4af336fb6b', '0c8fdbeba950c8c54686e176b688453629696727af2285ecb2c51f478e99da68');
INSERT INTO employee (employee_id, employee_type, birthdate, internal_auth_id, person_pii_id, created_at) VALUES (3, 'Contract', '1992-08-01', 3, 100002, '2025-07-31 15:56:52');

-- Original (non-encrypted) data for employee:
-- INSERT INTO employee (employee_id, first_name, last_name, email, phone, address, zip_code, employee_type, internal_auth_id, birthdate) VALUES
   (4, 'David', 'Davis', 'david.d@example.com', '3345678901', '101 Elm St', '45300', 'Full-time', 4, '1988-02-28');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100003, '6994d182eb08d2b380f52474c597f92464161937b54c72691c9e28469624250988', '1e9cdf8d1e9e46f9b5d4e98408d46c64f3401c3157d42e88353652c9c4042d151a', 'a4dc0ecc050100b516d78d31e9a9892bf1939a8598dc1892c2b6675964dda6ab4bda1ae73dc6', 'a9b55d2f37b6f2bd43d769aa39c2db821baab84dd08fbd1cf24f36fbe247f7534657a6a71f64e6a4366821baf330ec', '730e6942a79bfc62c731c7e1d1d2fc51a4b54b335e23affae5432bbfac745c948e35769d2ad8', '8ecb8051b71008bef72625ca32b841875187a67263a7e55553de4b46e7be0ef02d', 'e81141afb63b68c3e8da24e3e5b45f27988bf5d1947d263b8879049772af99d6', '066a54be8e0d5472d7a2d9144a989518eaf0f6e9eac557c3cec1952bd26ef5c3');
INSERT INTO employee (employee_id, employee_type, birthdate, internal_auth_id, person_pii_id, created_at) VALUES (4, 'Full-time', '1988-02-28', 4, 100003, '2025-07-31 15:56:52');

-- Original (non-encrypted) data for employee:
-- INSERT INTO employee (employee_id, first_name, last_name, email, phone, address, zip_code, employee_type, internal_auth_id, birthdate) VALUES
   (5, 'Emily', 'Wilson', 'emily.w@example.com', '3356789012', '202 Maple Dr', '45400', 'Part-time', 5, '1995-11-10');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100004, '44757df92b46c2454c33a1274bcd36bbbc43dccee2e56a97b005d1f21262a1511c', '8720a6b434a1d01bd06b0ad1a33a5ad52212df6a2fe84f4f9beef3671801d4c1e829', '5fe7289dac4e27bc8a2c795dc73f5699bbaaa59842798ceae0ed702dac212f6b3254875ff51e', '93a5367883fd4c2d6906f9ec316dd0ae1af3feec18644c6834a3ffb3e2e318448eb640228e1414181e592af5814ea2', 'f27edd9b37d13834ba0df0db3f2d2a04ee5be3d2156137f2f281b28b2627009dfde3c7938bdbc3e1', '877333591ae20c4dbe4d48aab56308a3acb65b7213f4f0c5494b73468593a021d7', '7e3bd67e03fb92acc7c25333c76529874e69e7d5731e04055d5ff157cfc5b235', 'f805c848ff3a637a4b798c04efbe2d425ad242e14069869dd9cbf9ba80154183');
INSERT INTO employee (employee_id, employee_type, birthdate, internal_auth_id, person_pii_id, created_at) VALUES (5, 'Part-time', '1995-11-10', 5, 100004, '2025-07-31 15:56:52');

-- Original (non-encrypted) data for employee:
-- INSERT INTO employee (employee_id, first_name, last_name, email, phone, address, zip_code, employee_type, internal_auth_id, birthdate) VALUES
   (6, 'Frank', 'Miller', 'frank.m@example.com', '3367890123', '321 Cedar Rd', '45500', 'Contract', 6, '1991-07-05');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100005, '369eac562d6c80ca8d3f6e44215b01167f0f50e9ca4f85502b82c3584acb647d9e', '6d92ce756f6b1882fd42f9a05b6874645859b43cf7842314285f18af2d57fc1d4927', 'b9a03decf600164130b46c159d80c679b64e99dc2dc38d65cc30a75f8391be429eaff2a46634', '07246a70c35bb4485fe2707974c6110c784841d41e5e8223c286013cfba576563c433be7126d06499cd06263a72b3e', '74d40b26c49b144d86d96b0549ef6e97915d898931e08f993c0b3b1bbf52f3ce06c5344ab51fa42e', 'f095f5708a93de80d2ffdf6a64e3c02769098e1674be447af3978fed6e684e963a', '7e1c69a85d0416b8235b47917a368bf1f1dd217b60cc212105026f7ecb2b7bc5', 'f607333a86522140652c7683d51e845bfc9c10a77a4561ea8f9cea4fbb3f8d46');
INSERT INTO employee (employee_id, employee_type, birthdate, internal_auth_id, person_pii_id, created_at) VALUES (6, 'Contract', '1991-07-05', 6, 100005, '2025-07-31 15:56:52');

-- Original (non-encrypted) data for employee:
-- INSERT INTO employee (employee_id, first_name, last_name, email, phone, address, zip_code, employee_type, internal_auth_id, birthdate) VALUES
   (7, 'Grace', 'Moore', 'grace.m@example.com', '3378901234', '654 Willow Ct', '45600', 'Full-time', 7, '1987-04-12');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100006, '031a479b4bb4cc5a0672dbdc567d7db41eed56cb38ba3be030820b844585e188ce', '7e24aa41a56468248067565d6fb4234be701397407b997e3de9a46e2a061a3d1d0', '10f6014bb8c20be8cc972c08fb73d070db6dcf20b286a93258fd2955ccd8b989fe5eb6893877', '0471d1a08949389c9e010f6047c3cab385dc372cc0910fdde429bca357bfd90ea1da395fd67be1ede4b1e5b2cd7f4c', '80d6bccc73f9c303da26d73e1ce1bcaee3212ee548832c406865552a209c4e4570fe8332cc44c8d2da', 'e3037d8cbfa1e71303bb7e2e9bb332b7edb2f142829a55de5d148df9fab5266ae1', '0dd243930f7041585cdfdfc258f241d6a9949b9e54d3ae242dce94aa34a8edec', 'd0ab6ed1b6392484f51d9ad62ba17486aa0fc3abf566c13a35c29fa5ac440d53');
INSERT INTO employee (employee_id, employee_type, birthdate, internal_auth_id, person_pii_id, created_at) VALUES (7, 'Full-time', '1987-04-12', 7, 100006, '2025-07-31 15:56:52');

-- Original (non-encrypted) data for employee:
-- INSERT INTO employee (employee_id, first_name, last_name, email, phone, address, zip_code, employee_type, internal_auth_id, birthdate) VALUES
   (8, 'Henry', 'Taylor', 'henry.t@example.com', '3389012345', '987 Birch St', '45700', 'Part-time', 8, '1993-09-22');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100007, 'edffbad7008af1f29aa663971a80aa1882b9fd45e25434f9880c00859bf0cad86b', '8ffdd47b0b9d35a95dd51472368080170845e1f2148961d5eaa8d69102a188356bf2', '001166a81a34713414bce046ef30896b1e0d76b7c14dd2575eef7a6ad8878e3f1706ba21eac7', '4a78739ec3fbde373cadce753fef167a15381fd55efb2277f36bf0bcfecee96b4ad7e572488340908aea6452d09638', '9c393c54a9d777b5ba51fb382fba0f2b4ec7fd6f9a48fe66a2440560cac8518f0b28589afae7d5d5', '316bda05808248e18256cc83525ee40089ab55f14818937d3503396eabdddbc05a', '7a7110c012c84c9b2f9038f3b77fbfebb542459bb7d2272cf682e5c9f90f7d0c', '520d2c818fd55dbb2cf339e3de979b66098448cd45c05b5bbae50b085e6c62b0');
INSERT INTO employee (employee_id, employee_type, birthdate, internal_auth_id, person_pii_id, created_at) VALUES (8, 'Part-time', '1993-09-22', 8, 100007, '2025-07-31 15:56:52');

-- Original (non-encrypted) data for employee:
-- INSERT INTO employee (employee_id, first_name, last_name, email, phone, address, zip_code, employee_type, internal_auth_id, birthdate) VALUES
   (9, 'Ivy', 'Anderson', 'ivy.a@example.com', '3390123456', '111 Spruce Ave', '45800', 'Contract', 9, '1996-06-30');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100008, '40d08084003766bf68786e6a37bfaf88fd034a5f0bace0e402615cefd2b6bf', '510c58a3e80189a0a7bc09adab09a2b5fe5c8cc0c76b2fc2467f191d11ab30d2451342b3', 'd513ea9437ca4c361a28b076a0e361e5ddc88a3ef02ab57d40c65bb5701f674595cd1c268ae2', '28803e280598e221839c52da21e85dbb5f8f6fe21f291e992c92024950c26c2893d450a4799f81d7235e09fab3', 'd15281cff58b1d67a0430da110db8b14ef268e930c42d5e457dd4d00dc26f7ef5985a982d45cc18d7cda', '0d16e76ea88b3890ead8323f315cc70bc72528290287b800a0eb79af4830d47aaa', '0256dddb44e8a40b7936428015f7803852d3152d88ec33d4128b685c5eb6cd98', '8f8627f0b3962acea3042476c404f1c011d849012f0afd7b20cc37f2ac6bb667');
INSERT INTO employee (employee_id, employee_type, birthdate, internal_auth_id, person_pii_id, created_at) VALUES (9, 'Contract', '1996-06-30', 9, 100008, '2025-07-31 15:56:52');

-- Original (non-encrypted) data for employee:
-- INSERT INTO employee (employee_id, first_name, last_name, email, phone, address, zip_code, employee_type, internal_auth_id, birthdate) VALUES
   (10, 'Jack', 'Thomas', 'jack.t@example.com', '3301234567', '222 Oakwood Blvd', '45900', 'Full-time', 10, '1989-01-18');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100009, '3edd3569e7fa887043da96ac5219367016d7d5a17051c56bd1eddade6420f997', '864b53b3e4a6784d8b1ad7c09bb042a9e9ce547af8ae6fb68583fb0da4355c290ac0', 'e95a1b4ea18e73edd9cd38e1a00454387937c12cd078b673d45c5f717e3953ab25cf79eb99d0', '3a3f9feb216c128ec28230ecfe6400268c339482ba860bdcdf5e85962fc875fe42573d9422ac929f40a515f8398c', '8d1b80967e4f80e64e08a0898d61b5361f066c05198d87087973906f1ec2cdc44795893ffcbe4dbd9d2242b8', '3a1fa68d79b1e099109eec42161101ee3bb62216bd6ba3bdee8f8b9736b8597318', 'd11b3b2b3598c2551bece4b316875fcd30cec7c3e49bba28990192b1eca1f8d3', 'd036d816a6d172dbcda4fb9aaccbadb1568c9be6263dc6d4dad0e0181b985e6f');
INSERT INTO employee (employee_id, employee_type, birthdate, internal_auth_id, person_pii_id, created_at) VALUES (10, 'Full-time', '1989-01-18', 10, 100009, '2025-07-31 15:56:52');

   -- Data for collaborator (10 rows) - Phone numbers adjusted for Mexico
   -- Original (non-encrypted) data for collaborator:
-- INSERT INTO collaborator (collaborator_id, first_name, last_name, email, phone, address, zip_code, internal_auth_id, skills, profile_picture, birthdate) VALUES
   (1, 'Karen', 'White', 'karen.w@example.com', '3311122233', '333 Pinecrest Ln', '46000', 1, 'Painting, Drawing', NULL, '1980-03-25');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100010, '34e8058ab5736d286394831b1aa05bb3b295de7bcb7a81b4f2a3cac60a61d93eb6', '161b0a01461e507cef08202a7ffdac4cd0455480fc71445e442fcd90df6af8f2c8', '71a70bca88a366c4424e67be5379cfd6b2e07371a1ab33fda0baf15539e1817abcf4945b6d32', '68155cb6e24a8f2ce7b7ced17008ff36244b8f0045ff31d8808acb24c56767a758b8fb4542b6502807fee14e795925', '23b9ef763cdcce2c2e2a3b4b117239186ec6b12a881fb791811ac5f82c03e0944e78442d4ca12cb1ef6d1c15', '2740ba424da15e53f3925369f6ac285bed2e990f93c07b5156e92a2294ab7af4e7', 'bc5fc7dfc32af1a860fee4a4ef9f9df79580c86ba5a195a34beb045defbb1453', '08fc623c62f671f10781b447a51b1e4f7732d2f39e9ae766e8bc4c1cb5932f0c');
INSERT INTO collaborator (collaborator_id, internal_auth_id, encrypted_profile_picture, skills, birthdate, person_pii_id, created_at) VALUES (1, 1, NULL, 'Painting, Drawing', '1980-03-25', 100010, '2025-07-31 15:56:52');

-- Original (non-encrypted) data for collaborator:
-- INSERT INTO collaborator (collaborator_id, first_name, last_name, email, phone, address, zip_code, internal_auth_id, skills, profile_picture, birthdate) VALUES
   (2, 'Liam', 'Hall', 'liam.h@example.com', '3322233344', '444 River Rd', '46100', 2, 'Sculpture', NULL, '1976-11-08');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100011, '8b3328c9ff6fe666cac6f33c45bbad74c73b468dcd9f88aac17e37cb9d3cf759', '3a61a053f2e6928879230b0ff588d20f641fd2e2b04565d66f52a1da96ff2742', 'c3c8290487c2e37907cac8c664bdf77a921706392e7a7c3fec3d9616aa09c3e994516603a5ff', 'ebb4d81cf48e257b05cdc3c2e53f3b2d5de27a1dd07777b54da46b1de43d9c6f6bff490b58980a5aeaff615a2d0a', 'c39334a6b4aa050f8c426d027a682dd7dbf834acd29e6390f305b13e2103252ab7f1ddeaefeab187', '3626361297a42b0021e7c42985042e1ddaf26420b31734c4b9b89de6263aafdae6', '5dec969c6f038be070a2de592b11e4e14d445177bc5fc4bae056b8cc17ad4168', '567f803d04984b351c353085bcb63fbb703e4968fde59337a89af07ce4ffc2f9');
INSERT INTO collaborator (collaborator_id, internal_auth_id, encrypted_profile_picture, skills, birthdate, person_pii_id, created_at) VALUES (2, 2, NULL, 'Sculpture', '1976-11-08', 100011, '2025-07-31 15:56:52');

-- Original (non-encrypted) data for collaborator:
-- INSERT INTO collaborator (collaborator_id, first_name, last_name, email, phone, address, zip_code, internal_auth_id, skills, profile_picture, birthdate) VALUES
   (3, 'Mia', 'Young', 'mia.y@example.com', '3333344455', '555 Lakeview Dr', '46200', 3, 'Digital Art, Animation', NULL, '1983-09-18');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100012, '1f3ed734bfa4966f10345e0914f625f022793d166e0febff963cab3f587d15', '554868a7eb04a1b978f33bb1ec9e636925aa6f29fb5ed4e9ad1f99d2137829bb65', '95111264fc79ec73239bf5565bb3b34e7c4d037b45b41594a3a2573199f0799ef7c6138bef0a', 'bf14f4394621a8ad2a7ddf69e2355c83dfec50c15313548d0d72efc2053ebe2e0e8cebbebc9ccf79703a071516', 'e750efdfaa93267fdf751cabcf29329a886fad5b34f844c442d6dd0485a498ea2ab0ac2393d7bb86359f0b', '54cc60450288d752bdbb240aa2614b69ddc594b709e759d452ba444bed8916eb58', 'fcf8daa4b0f45e5539cb40a550500a6908bebc8ae9816a06022a6a166332c7cb', 'bcdc1c8aa2cf0f30a55512e6c10c65b0399c1bdfddcd769bffe1f89d1630d89e');
INSERT INTO collaborator (collaborator_id, internal_auth_id, encrypted_profile_picture, skills, birthdate, person_pii_id, created_at) VALUES (3, 3, NULL, 'Digital Art, Animation', '1983-09-18', 100012, '2025-07-31 15:56:52');

-- Original (non-encrypted) data for collaborator:
-- INSERT INTO collaborator (collaborator_id, first_name, last_name, email, phone, address, zip_code, internal_auth_id, skills, profile_picture, birthdate) VALUES
   (4, 'Noah', 'King', 'noah.k@example.com', '3344455566', '666 Forest Ave', '46300', 4, 'Photography', NULL, '1979-06-12');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100013, 'fd83ccf3fadbf7feaf1548822c44de1ef4b66429d73053e212bdb6ffb5d7f940', 'c012143fce964859ea88ac440bd6d56644519116b4ce010ee414316c05729868', '62e325b99a0451f8b3a1972937f7d72d051f0c7b3f644cb93c446b89a44b0706f493b48b1a2d', '3240d88e46d378794ce343b2b00b50a23a116bf5e851109ad06119829494f87032cba682adb5eeba5c2adaec8fd4', '2b3d07e04232d60a5a0affdb9638e08fea8815995c7780e16a5c43cae176b80ee39b30b132edfc0e8075', '2c3b480c5ea57b24fae778446f5a50514435e749d35a4c99498b20a272ecdf9555', 'a804bd5aa486c984d3a97e8f0a4bcf829c0fcf341d0b48340c06d8be3e4e77f1', 'e56365901f65d85397cc8c2ca4c15f1f8d1712b6d9458ceb84ec67e0a347def2');
INSERT INTO collaborator (collaborator_id, internal_auth_id, encrypted_profile_picture, skills, birthdate, person_pii_id, created_at) VALUES (4, 4, NULL, 'Photography', '1979-06-12', 100013, '2025-07-31 15:56:52');

-- Original (non-encrypted) data for collaborator:
-- INSERT INTO collaborator (collaborator_id, first_name, last_name, email, phone, address, zip_code, internal_auth_id, skills, profile_picture, birthdate) VALUES
   (5, 'Olivia', 'Wright', 'olivia.w@example.com', '3355566677', '777 Hilltop Ct', '46400', 5, 'Creative Writing', NULL, '1985-02-03');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100014, '1cfe4e49dbc0d4c80d1ed578d3db26deffe59583644a031db9595a9197387d26e5b0', '879ea271abf88a72c4f6576d28d6131f925842f21db117898bc886fb9f335776ed5a', '93b6f439fd4fd075a9443439a91a76e54d22924692fe313cf7d171afd7dda947f721aaf52469', '43589803ff69792117ad33a30e1ece5688aa3ad5ab5b8aeaa87e48be81db3c1cf8e239fad92a742c31b7da4d6bf4c25a', 'f217aa47a0b48dbc5269f8dff11f993b7511d33adc48bc44180eeab9b371c8b9d160567e79933706ff49', '2c544d7e35c7adb07371f1dda77994aabdc1b6d5729b91315ffec683518b640529', 'ecaa587f1311c13a2b92499ec833598add0ee5b354c10641e40c49dc18f644b1', 'cd4ac87ab38174b4a7e29348782cb3dcb7225f4049ebdaa42d045c37d671bc01');
INSERT INTO collaborator (collaborator_id, internal_auth_id, encrypted_profile_picture, skills, birthdate, person_pii_id, created_at) VALUES (5, 5, NULL, 'Creative Writing', '1985-02-03', 100014, '2025-07-31 15:56:52');

-- Original (non-encrypted) data for collaborator:
-- INSERT INTO collaborator (collaborator_id, first_name, last_name, email, phone, address, zip_code, internal_auth_id, skills, profile_picture, birthdate) VALUES
   (6, 'Peter', 'Green', 'peter.g@example.com', '3366677788', '888 Meadow Ln', '46500', 6, 'Music Theory', NULL, '1981-12-21');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100015, '3f5de7ca1d786779bded78eb5fbef408a5e402c8bc4ca5f3a0b317b23e5609a4b4', '51f7b900a6dfb344aaa00c0d596979d8100993e1662c7b88b37c8b281fd05224fd', '4deecdff2a3f9acf5e3aeaf98d9b7e19c632ca8ad377ce1bfc5f22a43a0d0e35e8385127e7a1', '1a6838b3dc19dfd205945bf11ef44cd410de305e4d196af0040ac74a147dee486d7fe6114c23211d64367c32f0ac37', '301945a87804dc0f66a5d8d614dbd016bdb36b3d7672da2f4ac441d384fed6b1931dfb9b82085c9428', '909ff91c042d59346ffc6efe9ea771c600b7b7320e749d0eb3f1a54fb898c5bb70', '2a8460d173d8487aa492433f1519554af504f54e1f5dad989d3ffad37311ad61', 'f1765a922cc929ee42cab02112f28288b138bbfeebc40548b4f8be64432bc2e1');
INSERT INTO collaborator (collaborator_id, internal_auth_id, encrypted_profile_picture, skills, birthdate, person_pii_id, created_at) VALUES (6, 6, NULL, 'Music Theory', '1981-12-21', 100015, '2025-07-31 15:56:52');

-- Original (non-encrypted) data for collaborator:
-- INSERT INTO collaborator (collaborator_id, first_name, last_name, email, phone, address, zip_code, internal_auth_id, skills, profile_picture, birthdate) VALUES
   (7, 'Quinn', 'Adams', 'quinn.a@example.com', '3377788899', '999 Valley Rd', '46600', 7, 'Dance', NULL, '1986-10-09');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100016, '6ed74b91de5c2492fea26311b6f1d3ab87d4a466283fc03f6bb60a3757efa2aafa', 'f3c4202099a76ed4b8bc3d7d482cedc052dd630f9f37f311a8153b3e996a320270', 'a338108fb16b0258b4c65d01580399ecebd2c01aadfe138f9da3c76ac48214ed3442012844ef', 'b959b11491fec9b96e87b6dd72818b9ae3a374ec49c756ec93473513b0d42bff24431b2b24bc2ca505de04b4b42c79', 'c66ebe758a2f41d222788d9309d04678998bdbf93f465eabfdb73d50959c7f0b1fc2cb49d03c01e969', '51a6247e85b2fbce00f5ab1e95f24c0eca6429b9e4662437c56731239dbcd446f2', '7d07b189f192a06b58dc58dc17a07d58713fca058fbd07cff4a8fdb1bc1cfea1', '76ce6c668f59df39457f47cd87d6b3079da9162d5c6a609dca1bcfce02bc7031');
INSERT INTO collaborator (collaborator_id, internal_auth_id, encrypted_profile_picture, skills, birthdate, person_pii_id, created_at) VALUES (7, 7, NULL, 'Dance', '1986-10-09', 100016, '2025-07-31 15:56:52');

-- Original (non-encrypted) data for collaborator:
-- INSERT INTO collaborator (collaborator_id, first_name, last_name, email, phone, address, zip_code, internal_auth_id, skills, profile_picture, birthdate) VALUES
   (8, 'Ryan', 'Nelson', 'ryan.n@example.com', '3388899900', '101 Mountain View', '46700', 8, 'Acting', NULL, '1982-08-16');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100017, 'caeb4fe01d721672694fb2dc203d9e91db04f0b0ac48f9662b4255cccf9e3fb4', '227cdd1d0bbd09e03e59ce943002becc6b34019aee31f5a9667eb515e32d68dbc38f', '16d75dd71e54a66c31ccc31c6dcab3ede92da66345ff7ec82db34425e71cbcea3df1be8b92fb', 'b12e523affbac71e0b9eca2f2f85e57ba437bb4a06a0d0a75e72b3f94c78a31e944e70448a4e49158b1bcdb9904b', '45e969a1a079287059b3498b612e2a8daf0337abbccc9e8823e9818c7f7ff040a9d930ba4bb6376a39854289cf', 'db1a4af7e1b52da32c7c625ee7ae54818eae8887ea6c81efb5a0870ed60a400ada', 'd771655fd50b378f50e4525789e3f0dff9c37871ca0f6f7db4cc79dae1d5eb9c', '6b41e082f7d3e2228ac3ee9b5631d4c7fcf1a4a1ba50581722d6b06e6947195c');
INSERT INTO collaborator (collaborator_id, internal_auth_id, encrypted_profile_picture, skills, birthdate, person_pii_id, created_at) VALUES (8, 8, NULL, 'Acting', '1982-08-16', 100017, '2025-07-31 15:56:52');

-- Original (non-encrypted) data for collaborator:
-- INSERT INTO collaborator (collaborator_id, first_name, last_name, email, phone, address, zip_code, internal_auth_id, skills, profile_picture, birthdate) VALUES
   (9, 'Sophia', 'Carter', 'sophia.c@example.com', '3399900011', '202 Sunset Blvd', '46800', 9, 'Graphic Design', NULL, '1987-05-04');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100018, '54f9f79b4bd9d53b52ba31c0180151aaa550a95ec4b11e243f7d545b1e4bf4580b2f', '81ea1c18b9b3f71f96ac0875bfb147d63b3b2444027fc0e42adb50d22b2d9a008593', '8b4fe1d544bad878514e67120b16a16d572d45b6de0cb44f46454f83920eb6e13c595cfd92b2', '5939e01f2ca3bcc4629b338037e8b94aaaf6fca6ba4375947ff4619840ad4f0de3ab03fbc2bb8bd41b2b5d3648c607e5', '947bd289574a21fe0808d42b7a7f3c148af46a0a0d55b88a7f6dab1c5d42c9f8d320604aa569fb1f0faf65', '21721768aee053141760ef523aa5c3c3b1d782ddb94a1edc64ef80e6461a09dc84', '41066abe3a6b15ac9ee932878ba875d75491194daace539c6b693bf7814bf314', '521155a25848c1233abdacea46b187dd11adb1834aec1857cf8b38451413746b');
INSERT INTO collaborator (collaborator_id, internal_auth_id, encrypted_profile_picture, skills, birthdate, person_pii_id, created_at) VALUES (9, 9, NULL, 'Graphic Design', '1987-05-04', 100018, '2025-07-31 15:56:52');

-- Original (non-encrypted) data for collaborator:
-- INSERT INTO collaborator (collaborator_id, first_name, last_name, email, phone, address, zip_code, internal_auth_id, skills, profile_picture, birthdate) VALUES
   (10, 'Thomas', 'Roberts', 'thomas.r@example.com', '3300011122', '303 Ocean Dr', '46900', 10, 'Web Development', NULL, '1984-01-11');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100019, '2d3db2494cdfc5463b197c78da50d59e617044476ba1920b11c1dd9efb6827c1a100', 'f4f4daecb035fa43238446d71c6b342a358a11a1dc0c785ad1b383f21b0ed582386ed7', '9c72b879c82838f02d0dc5dbbe4036073acc302ce9c3a036ddc66a71549e929a9282625c988a', '05dead7f063f7c4dbe243ca2b81095eeb8a3ba2aa64947dd5151b5cea4eb3f8abbccc612d18addde5c837a611593a37c', 'fb796e7f03a5f30dc9c2f9223220ce6598ecbc0329f01d97605bd2307dc8fd2dd3eb2006a6202605', '3d772d356c1c78f1f08279d213ab4565598b3456e2388b7cf66b3f131a19376dc6', '7b556dc425981ebd4e02b084576cbf3e0d08c8f857b896b375b30b005045b597', '84db8ca9cdb6bc4b51f00ed6ee424086481417b07674b224af5e427b0482b6c3');
INSERT INTO collaborator (collaborator_id, internal_auth_id, encrypted_profile_picture, skills, birthdate, person_pii_id, created_at) VALUES (10, 10, NULL, 'Web Development', '1984-01-11', 100019, '2025-07-31 15:56:52');

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

   -- Data for adult_student (10 rows) - Phone numbers adjusted for Mexico
   -- Original (non-encrypted) data for adult_student:
-- INSERT INTO adult_student (adult_student_id, first_name, last_name, email, phone, address, zip_code, customer_auth_id, profile_picture, birthdate) VALUES
   (1, 'Ava', 'Rodriguez', 'ava.r@example.com', '3311111111', '111 Pine St', '44000', 1, NULL, '1998-07-15');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100020, '4fbcc730ff30c80e29a762e31b5b8a0f0f5365098355ac0903b76ec7e7b192', '8a1e44257eaf87516cbb48adf00ad115d8c78cf79606606d0230a999e5dbc27a949ecd6aff', '9ed76fe24619fa3179219db73ed84f5019911e4c1e44da10d0690f12a63410ed7e80a94add22', '040ccf5f9bd583b6f92d747dd49f9b15606cce514bff439eb9c0d916f513799a1783e99ecd56dccc961bb4556a', 'fe75f445969968b9591bc5b60197acd15993248168fadb4dfb06809192f7b99c136bd8e4034b49', '8d6b22e116bea34f0381ef5aa0f4531d96f9c15ab3e3ab5832a252fcde071b49b1', '72add3591daaa5279f1ec13068449a663d9a6f8e32f9304a8e838cc7ca104065', '669e864bec9bc8d8ba71e3e3558db5180c3a0898600a901295e0a245f7b760ce');
INSERT INTO adult_student (adult_student_id, customer_auth_id, birthdate, encrypted_profile_picture, person_pii_id, created_at) VALUES (1, 1, '1998-07-15', NULL, 100020, '2025-07-31 15:56:52');

-- Original (non-encrypted) data for adult_student:
-- INSERT INTO adult_student (adult_student_id, first_name, last_name, email, phone, address, zip_code, customer_auth_id, profile_picture, birthdate) VALUES
   (2, 'Bryan', 'Garcia', 'bryan.g@example.com', '3322222222', '222 Oak Ave', '44100', 2, NULL, '1997-03-20');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100021, '9daf5408cd51e8d3f0e60e87e5a8a2e3343780ee35898e186036fc8faec0e1b069', 'b7c04cd6e096788778a54fec702d5ffd71998bdfc723613d783f69edfa43fb006034', '73fcf7b5a67d14fef08b60a8b08e257bf11aeb4e12247b4d69257fc418287b4447641aeb3e21', 'ba52301e3574b2d25f47bab8ede710b06818e18e484bc3b6b45eb15b3255384ac45d93519f5c7bc260e161e6cf0350', '08e1dd77735e44b154e5e2d7e5c89356146ace9e62868ee0848b61b6e7dd70826da21f338a0843', 'de13a8464d40a6f49010fc22e8cad5141fe85feb3c1137f4855eae7ccbd008c695', 'd74f14e69931b7f7a4fef269b7693e9cd1bcb81edd8c8c5de0200b713944e20f', '28f98336927fcacd817c915aecc3f18eb683891d0402a653e13de37133bbafac');
INSERT INTO adult_student (adult_student_id, customer_auth_id, birthdate, encrypted_profile_picture, person_pii_id, created_at) VALUES (2, 2, '1997-03-20', NULL, 100021, '2025-07-31 15:56:52');

-- Original (non-encrypted) data for adult_student:
-- INSERT INTO adult_student (adult_student_id, first_name, last_name, email, phone, address, zip_code, customer_auth_id, profile_picture, birthdate) VALUES
   (3, 'Catherine', 'Lopez', 'catherine.l@example.com', '3333333333', '333 Elm St', '44200', 3, NULL, '1999-12-10');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100022, '045dab604d2330fb82e223606e16675e0db410e3cf4c31013270377ebeb20249b341225b51', '3603963f952c0361963354f5268ff910460b8c7fb8cbdefb07b291dd0c391e551d', 'dc9ed546c5c46b851ce1342527ddcb300fe87cdecd2e565fb3bfe8a29d4f0c27a0758c8dc4d3', '3845183fb12d08c116e325ad19e9633e510010e0fe44d5ca153a5ea471123d815b34247d6c24f84ab38cb85f292bc5ba665f03', '8009390469e8f62d5c761870e720f12da06bc2c7ae2034915e1f6a87fc82a583e82f562b21f3', '9b5d793d4a0295c3ccf2679c85d00d9dd775b2d2c43fa56b76ad6aac7857fdba09', '36ecf9133cf3bb7963d53f30ff300c9f376c7ba12eefa341114563518bea8ec5', 'd9fc21073d16853a2379c67366bb554f81541abc8765da80c43428b78b01b29b');
INSERT INTO adult_student (adult_student_id, customer_auth_id, birthdate, encrypted_profile_picture, person_pii_id, created_at) VALUES (3, 3, '1999-12-10', NULL, 100022, '2025-07-31 15:56:52');

-- Original (non-encrypted) data for adult_student:
-- INSERT INTO adult_student (adult_student_id, first_name, last_name, email, phone, address, zip_code, customer_auth_id, profile_picture, birthdate) VALUES
   (4, 'Daniel', 'Hernandez', 'daniel.h@example.com', '3344444444', '444 Maple Ave', '44300', 4, NULL, '1996-09-05');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100023, 'd49e88d85736e6887630a563790bff4ef14e72a6997bb6034bae8d76da10d5c51d67', '38a23618392867345a054b49550e7dbfb97cefafeca21f3b4f5fafa6740525b6dd3eaeb7b7', '6c1aedecb734a5596b81de42d51ce292b6c054a1c278e50e3bf1163723314190ed83c3478635', '37d66f22bdd19101fbb42bc02e9dd5e7fce762db49b712629e836c1b3c943a6714356af6a138b1bf50c7fc2a9437b118', '33d973a00735080cd4ff7d00e8f9f0f81968f1d584385fe07eca028c59dc1514360de7b1d5fb2e0ebc', 'd1ead1093f49b8b9b24f5fbcbf10a162c58c1dfd0279c730b5212ac3741a4ab205', 'ea4810048716d0782b935719477799e8e88d8226de4450f611059347a217be07', '8ebd73ece3be27cc10b362c906c587b6523748edaeb89c762b3cfee974cbb9dc');
INSERT INTO adult_student (adult_student_id, customer_auth_id, birthdate, encrypted_profile_picture, person_pii_id, created_at) VALUES (4, 4, '1996-09-05', NULL, 100023, '2025-07-31 15:56:52');

-- Original (non-encrypted) data for adult_student:
-- INSERT INTO adult_student (adult_student_id, first_name, last_name, email, phone, address, zip_code, customer_auth_id, profile_picture, birthdate) VALUES
   (5, 'Elizabeth', 'Young', 'elizabeth.y@example.com', '3355555555', '555 Pinecrest Dr', '44400', 5, NULL, '1998-05-01');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100024, '5ba49de2502013b1081035ff2465cc7bd5802b4ebbb47112ccc3c90a4e110c07e07121ef13', 'a1fc770afd3cf4c7d1c7af1a39f422aebe3a9bd34be189cc166321d45ab141b1a0', '4ea8fb51e772f4b63fe9a1def2dfa965d33b1c7e7f5715bc97aa1078c97888869ab75fc47955', '953b1ff10919be625687eac077bf5618aa75357791723069e02a91b2587ab62a375fef15a93e6799fd611d316e2014010bcab8', '92b29915abb00d8b83d91dc238cbc87de0328af57ed4a106194f2c001b860dac7c24be1b7bc93c54c60f421d', '13a9cb9f8a5e731471c9403bad6e77de12b21dc07d05cf7dbc55706f7c446bbe82', '052d674f9a5fb14b33430c57139214a22d0d7815e5e4ed73b62294b0a16834fc', '120e62113868ca97c9f96c86b8ef34900ad568fce471b8cfe0ba0f7451031bdc');
INSERT INTO adult_student (adult_student_id, customer_auth_id, birthdate, encrypted_profile_picture, person_pii_id, created_at) VALUES (5, 5, '1998-05-01', NULL, 100024, '2025-07-31 15:56:52');

-- Original (non-encrypted) data for adult_student:
-- INSERT INTO adult_student (adult_student_id, first_name, last_name, email, phone, address, zip_code, customer_auth_id, profile_picture, birthdate) VALUES
   (6, 'Gabriel', 'Allen', 'gabriel.a@example.com', '3366666666', '666 Riverview Rd', '44500', 6, NULL, '1997-01-22');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100025, '3631c8fcb9dfaeaa4933029a908f4b36464088a8dc139d43cec11079e012d445a2eaa2', '48a10bd70b678a0746f6ee2f70cff2cf8f200f21288d1394d0a7e82a6bbf821d0a', 'f258d4a8f1bb3cc3c08d6d2a0799f782d7190abeb6c22661ffdfc8fe95013b8b5037b532de37', '124c781f9b9ec2523f3d1ebbbf88fd6f755eb7ace7517561ac4a1d6c007970bab6e58eeb817495ecd339cd8db32fb94fd6', 'bc011a452a11ee0d23cf83d6509ea6b5551dad73ccbf9049ba6d7373ca88a243839b057885db20dbb9a2a6b7', '875f607167c73566122ebdfe8b4afeb6f2c1f5c1f0a0f8c08023cb030c1a6524f8', 'a5eab1ec54b72fe6dac55e197e29471d9b0ef64f167f8b3d87fc5934df4835ff', '7a536efbbb6136bf7fe0d6975c2e59b7a11ebac4d766203b93c4de9dc08825cf');
INSERT INTO adult_student (adult_student_id, customer_auth_id, birthdate, encrypted_profile_picture, person_pii_id, created_at) VALUES (6, 6, '1997-01-22', NULL, 100025, '2025-07-31 15:56:52');

-- Original (non-encrypted) data for adult_student:
-- INSERT INTO adult_student (adult_student_id, first_name, last_name, email, phone, address, zip_code, customer_auth_id, profile_picture, birthdate) VALUES
   (7, 'Hannah', 'Sanchez', 'hannah.s@example.com', '3377777777', '777 Lakeside Ln', '44600', 7, NULL, '1999-09-14');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100026, '36d786290db2050c3d53d1513685c113f1b8499213885f6842ba6059a9219530bab0', '59d54a88e0bf4743ab63576e42ad939610663bd85b79b2dd9a47421bf038751c32854e', '0d6e6e552ca898c14eb27bc059fb65959bfa5ad55ae5eab89b6751a520f41323b0121963f278', '1f3b022bdba5446455672aacf82129508ffb646fe5b100fd5c90ef0a7bbd50bdd3da7b597c9967568a58b69a18ae0115', '3642970d4f450d32160d014a10eb93ffe20f6e3313113d387ab2986bd53f2a4153ed3b7057510e06f305a4', 'ed7fc616672de5dbf8bb8616bc39797540d41def4c5ea0db9d0dfc232c3c6f4c7c', 'ab3aeee219cc153db9849ea2a6073e3868dc7cad26014b666e40cfea0b2186e9', '81ef87d7e38642d68a76b3f5aca4245e275385c1f6dbde4f7fe610bd5b226536');
INSERT INTO adult_student (adult_student_id, customer_auth_id, birthdate, encrypted_profile_picture, person_pii_id, created_at) VALUES (7, 7, '1999-09-14', NULL, 100026, '2025-07-31 15:56:52');

-- Original (non-encrypted) data for adult_student:
-- INSERT INTO adult_student (adult_student_id, first_name, last_name, email, phone, address, zip_code, customer_auth_id, profile_picture, birthdate) VALUES
   (8, 'Isaac', 'Morris', 'isaac.m@example.com', '3388888888', '888 Forest Hills', '44700', 8, NULL, '1996-04-08');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100027, 'f22c3b5f444f06461c37c913e8d0451bf678d36a8fa77ee8a850bba9cd94f9e51e', '30116f40eef11b6cf52fa0a4426a7b840eb6c08db290debb5cc5939e90aee26d4a17', 'bed690181fa15979a7da1dbd8fd75443019c8465129360eeecdc711dafc080a50a4dd4345104', '6c945fbb689a389f4de14114ab5736ea2d17847df445b55632ccc9165f992d64bc9a0ff54f33831eea5bf6a5e1ca46', 'ea4c5226416b1969d9fdfabb72c68eee4e8f0a50a431e283016fa1d24a13afc5a48c0bbeec8559e31064be3c', '02042bb6c49294e36277198437b85fffae2e0d8c22a542083654d20c1dea09613a', '149daa10716cf1eba6b36ae239f33bff6bb63c0b8191083054f1e22432c05779', '40c15a475dd55b640f7c9a3c7b4f19c9c660dfd8b4709ef356c60ac417b60a42');
INSERT INTO adult_student (adult_student_id, customer_auth_id, birthdate, encrypted_profile_picture, person_pii_id, created_at) VALUES (8, 8, '1996-04-08', NULL, 100027, '2025-07-31 15:56:52');

-- Original (non-encrypted) data for adult_student:
-- INSERT INTO adult_student (adult_student_id, first_name, last_name, email, phone, address, zip_code, customer_auth_id, profile_picture, birthdate) VALUES
   (9, 'Jasmine', 'Nguyen', 'jasmine.n@example.com', '3399999999', '999 Meadowbrook Dr', '44800', 9, NULL, '1998-11-28');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100028, '4e5eb3930ae76f5211cbeffb7696ba61f947e798ab9763d951e316eee7563adc238642', 'fc5b9046c430b3924dc39d89f8090fe1aae8447113048f373f2ea8ff866c0f9fe999', '57d969fc6134fc7c4b346003f5ccbebb83ee4a8eef929598ecd6ec41aca4d3c383f72c51d039', '5479e503327cc78596169b51c6cd7652d0d7ed8d94a9b5d50c17d1db3f604c1c30e3ed26e4a5880580c56a722cb43bb3db', '131b43f4a830f5e133c1abf255562c00e4cbd6bfb4ecf739013d35f918db83eab2d706753ec9470379f37f94e9e1', '8d95872d9d068df8cffeedd5e5d3efa5878625cae35c688c56fa09c8c8851ea2a3', 'f9ed82236de7ed81b89e4ec42fdca135402514d7d0c60fcb60549690dd49dfce', '6a3c8207b39c0646ae0ba1efc7a61b5c249fad04794b8e2825c35dc23dac6b93');
INSERT INTO adult_student (adult_student_id, customer_auth_id, birthdate, encrypted_profile_picture, person_pii_id, created_at) VALUES (9, 9, '1998-11-28', NULL, 100028, '2025-07-31 15:56:52');

-- Original (non-encrypted) data for adult_student:
-- INSERT INTO adult_student (adult_student_id, first_name, last_name, email, phone, address, zip_code, customer_auth_id, profile_picture, birthdate) VALUES
   (10, 'Kevin', 'Bell', 'kevin.b@example.com', '3300000000', '100 Sunset Ter', '44900', 10, NULL, '1997-08-17');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100029, '6f1e4d026f547a6fafcc95cfcfd35ac55b569e9c437acc17260c6890510b141f93', 'da18bc444500c481b76e0c976a66cf14df546cb1313efd4cfad35e19c915f341', '0a531b57ba480836d4a01093a6fb7f0c280ca4002be7cd9fe283a2942b50e4cab889975351df', '36caef526d0a7a8b618de6b184b3edea6c55dbe567cfd6f9a40ef456face5040e8af29eb8bc7c0003bce242d9b8aa2', 'c1a1bb342a349a3011539eea82a70c43096ac9744699b9205dde4d9716c03744e18f529a7db4c49213e4', '049a3e98b48ead464919f21858fc81248f09fa412d3dc3394184a7b96f6fce9606', '4bbe5ea5a8278fb8f1c2ec94345496a0b43cde085af8e3295f47a0d8a37aa210', 'd150396feb16a33f707aca4003e6fa3f29e6f97bcb0dd976808e99cddd22a008');
INSERT INTO adult_student (adult_student_id, customer_auth_id, birthdate, encrypted_profile_picture, person_pii_id, created_at) VALUES (10, 10, '1997-08-17', NULL, 100029, '2025-07-31 15:56:52');

    -- Data for tutor (10 rows) - Phone numbers adjusted for Mexico
    -- Original (non-encrypted) data for tutor:
-- INSERT INTO tutor (tutor_id, first_name, last_name, email, phone, customer_auth_id, birthdate) VALUES
    (1,'Liam', 'Baker', 'liam.baker@example.com', '3312223333', 1, '1985-01-15');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100040, 'c1ad862bc261f0363f9f9ed3ddb9a0bb521cdb7c69159a73160c00b3c39155a7', '36ca0a552c285e97b27d221874daa8ce3e22a31be1329226155930e40d7af2da95', '99f276866f774b3d58c14fc6b847df8af2fb46c616494b300d47655aac49d5ebbb86593d428d', '653db8e911766fa04e1546e788ca633e9f9c002b40f34dc127988fe2232d8e1420792d1a493f4f0d88c77cd27ab56254d120', 'bff43b8aafdc7977ca5caa1d98bd3de5de12bc392fc462aec248171f07', '9afda100911f73b8dbf6b28ce54b51eb8af901fbf0f6b4b6a1b54a263c601b6c9abcffb0804d', '2ca5c565b741d93b571dc7a251205399403b9b8e94110df229a37176fd8e725b', 'b4e833098dc02469609cdc89c8b9046faee9dbe96129d550e27aed1df843ac6f');
INSERT INTO tutor (tutor_id, birthdate, customer_auth_id, person_pii_id, created_at) VALUES (1, '1985-01-15', 1, 100040, '2025-07-31 15:56:52');

-- Original (non-encrypted) data for tutor:
-- INSERT INTO tutor (tutor_id, first_name, last_name, email, phone, customer_auth_id, birthdate) VALUES
    (2, 'Olivia', 'Clark', 'olivia.c@example.com', '3323334444', 2, '1990-03-22');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100041, 'b94fae04d0dd143770ad99a488c78d147f25d59dffd93e6e3a6481475af7be476855', 'ed5292846a1f1b4947293e136b2c08e7f817d09bc7ef81a490439f152bf3c54bb7', 'c243d45a51752b8e0a76476f07aa2ae9c22d5c61d9f1c26af7e94e2e896766868db82f265075', 'e508e7fbaab1d54bb3a9d639367b489045244283642e938cd4eea5ded3e077f1b69e95b54fdaed3678398d84846e0b51', '0c2f41010dbc2a6ab54eb10e9f522994074b9afe3f126be651ac0b302e', 'a4b9000ca7faff9ebb27be2bb677a70756d9e1aa7471c654f9203c89b4bf526c696110b59c12', '8e45d2101ee362db5b6f1208d3d8895ea627338640f5d0235fdff949fa9518c7', '84ba4e105470d893b9e3a9a1f56be8194b0c42df4ece8ed0d490916dc19526d4');
INSERT INTO tutor (tutor_id, birthdate, customer_auth_id, person_pii_id, created_at) VALUES (2, '1990-03-22', 2, 100041, '2025-07-31 15:56:52');

-- Original (non-encrypted) data for tutor:
-- INSERT INTO tutor (tutor_id, first_name, last_name, email, phone, customer_auth_id, birthdate) VALUES
    (3, 'Noah', 'Davis', 'noah.d@example.com', '3334445555', 3, '1978-07-01');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100042, '99ebf0f22c42d048093a064f8340cab4999e8e37b55899e69929df7ba4e5e03d', '81c433abf1baf41244956c9a05ff26381aeaa36a487d1d7aed034f516cba2c2b48', 'b2a59ecb06b799029623468a63d4612a1d955eebec7d4cfaeede918502ca5d80e569bc7f624e', '086fe11de43bf10e0d0c89776016a47344b95261ff638cfdc102c51f7466e47be96ce2b988dc9c05993a50baac51', '26c98dedd18468a87432b27bcbeb9872c1b180b50991aedf32223cdc77', 'b2a0ea0d0467c5b845795c64780ae141a3216c885e081422d5715626fbca67fcb551fbeeb144', '6bc6af226bfc22231a6ebb66165ca8ef1a8a8ffc4914e9a093833dfc5cf8274c', '09bac6c148190a94599bd0d3accd69f41c09e68b7678cb60121487245501c873');
INSERT INTO tutor (tutor_id, birthdate, customer_auth_id, person_pii_id, created_at) VALUES (3, '1978-07-01', 3, 100042, '2025-07-31 15:56:52');

-- Original (non-encrypted) data for tutor:
-- INSERT INTO tutor (tutor_id, first_name, last_name, email, phone, customer_auth_id, birthdate) VALUES
    (4, 'Emma', 'Evans', 'emma.e@example.com', '3345556666', 4, '1995-09-11');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100043, 'c7d84126ec5c882ec5792372151462c056984a85482cc24391e4566139f1b14e', 'a9d557a058c2b29ff0184fc62cc7faa0aa4c170b08c683aa126299a01d8b4afa1b', '51318765d0dec0e33217e60aa07e049196d9e12553a63c5a0377c96fcdf030102d67520c20b7', '8f86c3345a727cf7933e44efec75033acf6b08bfc565fbd66c3a1bbd3ae4f1a1b95504ba7b9c0f907168afe1da7b', '2810beab620abc92f33c6dd5f7ca7a23ab6f7f9046165372cf49a3d6f0', '1b2d6d02ae2404f850f39a394f5a256e6e11ac9ee5df503c01a349d8b16b1f146057689fe8dc', 'dbd4a9041e6130c5a72d1e9f6144e794ab3bd70d90e2293c90eb7bda3c02c52b', 'f3c177c9276dda78a1a3e6edca69ccb21695884efd609ae242ad3f416e9a1795');
INSERT INTO tutor (tutor_id, birthdate, customer_auth_id, person_pii_id, created_at) VALUES (4, '1995-09-11', 4, 100043, '2025-07-31 15:56:52');

-- Original (non-encrypted) data for tutor:
-- INSERT INTO tutor (tutor_id, first_name, last_name, email, phone, customer_auth_id, birthdate) VALUES
    (5, 'Jackson', 'Foster', 'jackson.f@example.com', '3356667777', 5, '1982-12-05');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100044, '9c6eca8cdf6e3577dd5fef0068bfd36fffd7e7eba6f6e2ff0160ade1fc41918a426b18', 'a8c84d800ff0ac32cb9569ecb391b7758ec9787d2f6935f758558a64b85ef858b808', '7c4871fece572a6f1c9356fa931145db4d481d55828604c530aac94a61a909a2ebf20889c845', 'dc620c939ddf4c9a978a38447e9b75c91914ac53586c716b001ab0fd49d7415cf5d5f930bc608209b05a46d7961d5820b3', '2ebb107c49d4d6157d9fba6e967b50ec7c46a619570c57a1ae07a1b538', '43861361f9f3f04cb95972e433a01a2d086944c993a3a6149f85ec4275e5105f8606aa52f1cb', '36dd74b29abafc8104fe6cd7dcfc99a369064bedf3ec10ff40641674f06e7a54', '2bf8f5ae3c85dfa0ab96a0f396ac5f10e566a745cb43858450bc9dcf49290530');
INSERT INTO tutor (tutor_id, birthdate, customer_auth_id, person_pii_id, created_at) VALUES (5, '1982-12-05', 5, 100044, '2025-07-31 15:56:52');

-- Original (non-encrypted) data for tutor:
-- INSERT INTO tutor (tutor_id, first_name, last_name, email, phone, customer_auth_id, birthdate) VALUES
    (6, 'Sophia', 'Green', 'sophia.g@example.com', '3367778888', 6, '1988-02-28');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100045, '3de767447506926e5e6cb8014333c091f2e125ee830776c0d881dccd7a66cbc659a4', '08042b6fb5eceb31ed2cb07b3162686c3e2358a6348775d14294eb96e714bbfec5', '9dcab1e8813e03600b99bfb3fc45ac52315fe23cad04fbe671a2cc50c5ccb93b6eee224ffc46', 'e71cc1aa2613100d0f17ec3cc7724c02982c8e33caf0acc4d5721178b2d2dfdedff1e60ddeb2011da3f3c3c30ba8d5df', '75fcdbe63cf63936b02e8e88d9e0c30944d33f3b9a70736bc631070bf3', 'a7859ce7a19cc70504ddb6529b69b5773fe499315b39f510dfce4b542ab0fed389f947a95721', 'd81a8e7020804baedc1aeeb85873865e80008a1b8a429c457bbce4e80a959282', 'a6c95c0971d0ca4cc3f67edb7dbf41b120b9d974419fdf45e72e7ed8adcff17e');
INSERT INTO tutor (tutor_id, birthdate, customer_auth_id, person_pii_id, created_at) VALUES (6, '1988-02-28', 6, 100045, '2025-07-31 15:56:52');

-- Original (non-encrypted) data for tutor:
-- INSERT INTO tutor (tutor_id, first_name, last_name, email, phone, customer_auth_id, birthdate) VALUES
    (7, 'Aiden', 'Hill', 'aiden.h@example.com', '3378889999', 7, '1975-04-18');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100046, 'cc13ae5f5c8b8b2f1c669881059613720b1c00ff33eb6bbb12c73d201c1b900013', '827b2c3715727449f5dcc991ce76ef5d69846c2fa5ee89ce811bd4022dd87642', 'b180efc33eab6261140a9057aac5bce6bdaa7c97589bb18fb15194b07a34f2247cf0cf3bb986', 'cbe80f1d22a82167533706d87269e533d3752c292f62430e337f3451d1149101b38163e040bdffbb597d0173d3e0fb', '9c11e23e40c690040f271e33faba9c31f0828e1e628d2f1efdbde769e5', '75db388dfe3c522625f97d666bd68ac9b0aebda8e40cc8d293fdfc1c049fb252fbd48a1cf7f9', 'ce28bb327cfcee25ca43afce313792ae0b0aac7ab81f804097753aaf39d069f4', '9377c4071f2a77f4add65ea6afe2254c5bd82c350252e89ac1e35813ba7044e1');
INSERT INTO tutor (tutor_id, birthdate, customer_auth_id, person_pii_id, created_at) VALUES (7, '1975-04-18', 7, 100046, '2025-07-31 15:56:52');

-- Original (non-encrypted) data for tutor:
-- INSERT INTO tutor (tutor_id, first_name, last_name, email, phone, customer_auth_id, birthdate) VALUES
    (8, 'Ava', 'King', 'ava.k@example.com', '3389990000', 8, '1998-06-30');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100047, 'cd8eb9ebc484448ad4e837fce9be4bffa72298a5f208d2053e20d31eb15bbf', 'c35578175573f85aa709cd024bd7f03a93f90a6bc240f22b8eeb561053d1a589', 'f53f9557443e81986a7ffd67129551d0c149f7e7c30cbd3d4eeff232fc3899352b44bd127f0d', 'd13bc0c8f162d18c186f8652560a40b69f77e2714c25177e76d4fbcebd8a48dc2ca29e50fc50891c47c89d9037', '90f7aa6aaac3d77131870adb470e3eb538d0b5056091ba82ed82e32222', 'bd0366671698f6d08e675432e54298779a3018ab81f0e58c830f641fa1222b6317bced99ac58', '8f490d8ecac87fd6e368edebbdd32f1d40adfc6c9d5fc470d84160a730490c4b', '9242700f9e3d08253f69a3660261f63819dd967e95365ef1c1ea1260171539d5');
INSERT INTO tutor (tutor_id, birthdate, customer_auth_id, person_pii_id, created_at) VALUES (8, '1998-06-30', 8, 100047, '2025-07-31 15:56:52');

-- Original (non-encrypted) data for tutor:
-- INSERT INTO tutor (tutor_id, first_name, last_name, email, phone, customer_auth_id, birthdate) VALUES
    (9, 'Lucas', 'Lewis', 'lucas.l@example.com', '3390001111', 9, '1983-10-09');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100048, 'a102eb840395f60bc08667bd3bb12f414d896a281997de89d02fcc8c2cda6cbef0', '3e76c20ce85f7ae9609f81d5d095174e12a9dc9d60ee2e74b025275819eea9b073', 'af67bdc105535d40ba0848cc5b22655bcbe9489f4d363891e02706670c9dd9541660cbf85d96', '3ae6b089f7a0b012709542f090c4ed0761ac978a2751a6700cfd0c8159160503c25f72af8e35695708d76d506d03e9', 'd9d58a08deb78d74a2a06b28a7debbe9d466b8ddbb9aeaad731083a3cb', 'bb03d9e1147c5a55e5b17eb1f54e87c8cf6255bb0d83f21140a065743f00b78081c46b8df3de', '596e9144b1e3d48a9f0607de8f60c4cb40b5719d1aa6783dd68e08e61a4fe683', '734b6c1963c34bc2fe1249569c74083eb8922e346168863954f6eedb4d6a4cf9');
INSERT INTO tutor (tutor_id, birthdate, customer_auth_id, person_pii_id, created_at) VALUES (9, '1983-10-09', 9, 100048, '2025-07-31 15:56:52');

-- Original (non-encrypted) data for tutor:
-- INSERT INTO tutor (tutor_id, first_name, last_name, email, phone, customer_auth_id, birthdate) VALUES
    (10, 'Mia', 'Moore', 'mia.m@example.com', '3301112222', 10, '1991-08-25');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100049, '0fa39f5ce0d90270112db097ed027765e73d9972705cf6b9770b9f99c6bc03', '5c96bea2701688c7052c17a3d9d781bacf86163c7b27cbfa082a751d61b79aceef', '6f15566e7ae6850b33ae9cf759e8820ed0ab45f234b7fc93ce1d83e5c8b944580085393e442e', '6180a7a38b5ff6282f461bfd5aea0ac73698048d674dba3044111e45ee049e4e7c5323a9dc7fdfe01a3f0cf595', 'eb6887a260ae182c723123b24665837e8c9a2ffa8e27d0c2b140a2b85d0b', '8b53648d193719b070237a534002841b8da5c0db426a2e6622d7fe464b601aa4edfc8ddad40c', '37ee04961ae9a8a3d2c199c42f3d488bb36f32133f35dded5e33f9c373020577', '4349aa2676811c8fb9cddf2ec4e3ab0a5577eda7844f037d9bcdf4f1bfeee3fa');
INSERT INTO tutor (tutor_id, birthdate, customer_auth_id, person_pii_id, created_at) VALUES (10, '1991-08-25', 10, 100049, '2025-07-31 15:56:52');
   -- Data for minor_student (10 rows) - Phone numbers adjusted for Mexico
   -- Original (non-encrypted) data for minor_student:
-- INSERT INTO minor_student (minor_student_id, first_name, last_name, email, phone, address, zip_code, customer_auth_id, tutor_id, profile_picture, birthdate) VALUES
   (1, 'Alice', 'Smith', 'alice.s@example.com', '3312345670', '123 Cherry Ln', '45001', 1, 1, NULL, '2008-02-15');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100030, 'b67f781a21f78f5a8615c57ede8856470254ba459a2b7e60aab0beada19f207287', '4e44903fa07f62a23e2c3a72b7e1b2de09808cd9a199684d6b8832a3e9dc0fb4ed', '584468ed81d6eda54c7b6fb3971b1a81fd3abf0df24c0fbbc9262850bcfcc28a8236d7a6cf83', '46b9a72f0b7e44082bd3b8dcd5ba6e3be9c0551ce03cc35a8632cd215facf9b8bc009c9d19297871f2da0840d1b4fd', '83249c0181dc4d71bfd5740028ec33997db7f459c0e8c25bc26df459aca8987cb7067fbed7f7a1c4d5', 'c5c3a4e5c41d3b545774a95cca69ced51a3026e9bbc6b533f1685d102d0e8bdb9d', '2976d197a7a6fd16824e6c5462ce847396ceb808316a3fdaa4ef11b39fcf8152', '0b11f4dad50cfb477de2291479621492fe003786660022dc9ad8831e6aeb957f');
INSERT INTO minor_student (minor_student_id, birthdate, encrypted_profile_picture, customer_auth_id, tutor_id, person_pii_id, created_at) VALUES (1, '1', '9aee98047cfaa117c278adf9a3ed2674481cc603fa139043a8a7b80e69', NULL, '2008-02-15', 100030, '2025-07-31 15:56:52');

-- Original (non-encrypted) data for minor_student:
-- INSERT INTO minor_student (minor_student_id, first_name, last_name, email, phone, address, zip_code, customer_auth_id, tutor_id, profile_picture, birthdate) VALUES
   (2, 'Bob', 'Jones', 'bob.j@example.com', '3323456780', '234 Oak Rd', '45002', 2, 2, NULL, '2007-06-20');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100031, '2b2ab1d8d360afde4c181c3f0cf47ec1f609c6b955fd6b07a78d2e52451e21', 'abe48a9576733fe3b7e837acf0a5977b4aa8cfed766642f3a383320693af723d4e', '978441080aa9279a143655988399ab31da7f1560a26885415a3d3712de5dd6ff2b00826605b1', '2dc6d34cf716cc69a3bc3b1d270ac1ee218e4a00bee47a1de64104bb15f733ebe9435189de7a08634a971d05d3', '5570de5ccd4ffabf6954237245803c8249f5df411547dcaa4f40b972e796cafa29ba76813c7b', 'f5ef6ca2ad0f2de29380c11e88754d1bbcb73401b01187d94cc4489d22a77ae261', 'd5f8a30a804d7fd3afb6f91c562ad25100f9cb68d883f2d2bef0e382eea41af2', 'a36e50d65a2da695ba385708be795576bd9eb8211095c5bec2a2987b8e8942e7');
INSERT INTO minor_student (minor_student_id, birthdate, encrypted_profile_picture, customer_auth_id, tutor_id, person_pii_id, created_at) VALUES (2, '2', '329cd3bc2b0f1ded3a59157ac8c49c94bd5f1711edd744a381c9e9cf5a', NULL, '2007-06-20', 100031, '2025-07-31 15:56:52');

-- Original (non-encrypted) data for minor_student:
-- INSERT INTO minor_student (minor_student_id, first_name, last_name, email, phone, address, zip_code, customer_auth_id, tutor_id, profile_picture, birthdate) VALUES
   (3, 'Charlie', 'Davis', 'charlie.d@example.com', '3334567890', '345 Pine Ave', '45003', 3, 3, NULL, '2009-10-25');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100032, '381b166d225d792e804ca85e5415ead4f0cbbff4bd0212a3854da62199f4a74f486c55', '7fcada5d1098eabf956114cc7d3c14e7bf09192ece0fbba131710fdf26ef0a932b', 'a18b3f9b03837b68673a17dbc85344f464a396ea9a04f3cf118ef490b5fde4db38c3a6308919', 'a0fcdc85167e56911c7307039cd429192fcaaeb932119a156eef972ffcb6984f0bb4146fac6968a0773472269d4c487a2b', 'e0245247cc3c885e8c98ea81364d1d58c13d521ebf64aed7cb43eaf8b03ff13d86044f28aff5dfcc', '013852202866d51bde0f435b66c4acda46e5427e1495ae03209575f54bfedb6d80', 'ef3bc3fbcfe18d1162992c5be4f80f4074daa2e7b82fd87e392b3b4af336fb6b', 'c5a8e0718f514bc783e13be3a7b9fdc82949baf1dacac50074e7e7ea00b23447');
INSERT INTO minor_student (minor_student_id, birthdate, encrypted_profile_picture, customer_auth_id, tutor_id, person_pii_id, created_at) VALUES (3, '3', '7361c5268b8319435100347a3f795613c2869b4c3074e34922ee582e9b', NULL, '2009-10-25', 100032, '2025-07-31 15:56:52');

-- Original (non-encrypted) data for minor_student:
-- INSERT INTO minor_student (minor_student_id, first_name, last_name, email, phone, address, zip_code, customer_auth_id, tutor_id, profile_picture, birthdate) VALUES
   (4, 'David', 'Wilson', 'david.w@example.com', '3345678901', '456 Elm St', '45004', 4, 4, NULL, '2006-01-30');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100033, 'b0957ee1ba827d63913e272c45f6ad45ed79a8d5d3348f7748a148ab5c34e9f7df', '5eefe3cff116eb15bca26985a0a8564dce7d61b5295274381eb3c7c450955ade0b11', 'bbe6746bc185d9fd921315979a771018f7fdabed364f5ff57aecdf4be7fe9cdc096b4f1d7478', '6cca353f1b5eef273498cc8e2537671b13cf59abb0860b4d97c7210d86acbf402c970ea499b95a94140a2ba2268b0f', 'd7ed902b4e9a274a14c5f2efe1cf95ec1b5096e40725d83168c326725ca852f0e9114bb41449', 'a2eef08292b813cb3057f1f71ceae1b585b55c0ef5e278ebac1c97e03558b1d329', 'e81141afb63b68c3e8da24e3e5b45f27988bf5d1947d263b8879049772af99d6', '594a07fc54ffeab25aa8e039c13b09e915885996e4cb950b62e215a16353cf12');
INSERT INTO minor_student (minor_student_id, birthdate, encrypted_profile_picture, customer_auth_id, tutor_id, person_pii_id, created_at) VALUES (4, '4', '923a617ada9153f9dd6ee032c749fca8a667ea53573c2258a9f301e9ab', NULL, '2006-01-30', 100033, '2025-07-31 15:56:52');

-- Original (non-encrypted) data for minor_student:
-- INSERT INTO minor_student (minor_student_id, first_name, last_name, email, phone, address, zip_code, customer_auth_id, tutor_id, profile_picture, birthdate) VALUES
   (5, 'Emily', 'Garcia', 'emily.g@example.com', '3356789012', '567 Maple Ln', '45005', 5, 5, NULL, '2008-05-05');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100034, 'd9e8a3737f9896aad6158ca5b168629ade180e512eb994697ebcc1e4063ec73de8', '9e4147a55de762eb5743e2fe5f2dc61fbeb87be831f07d65b3af20d1d8257f972076', '523dc48db3e924ff8ac3834f9a6e40ad38b0b2929b1e97d7250ebaa380d092b6efd044f15586', '06b9519cf02f349f9d0c382429a13d1919b0f45352bf379e3f6fd352c2c684a0559d79e765120a7ab60567a9aeceb6', '5a3335893184dfc8e9da8d90ab9694e85937e89f21414254a513914ef3f8c378769ceab8006f78a4', '80b42c072945871dd28d0c31f9dcfe76e74eb49d4bf0cd48ea5b58f0fbf3cfb104', '7e3bd67e03fb92acc7c25333c76529874e69e7d5731e04055d5ff157cfc5b235', 'ceb85e959f3aff25af859f75748dcd56da0549f0916839899264fec2ce40c00a');
INSERT INTO minor_student (minor_student_id, birthdate, encrypted_profile_picture, customer_auth_id, tutor_id, person_pii_id, created_at) VALUES (5, '5', 'a2492f22481697d03c7fcf93166f9466af7c3a8c1099d250438c483cee', NULL, '2008-05-05', 100034, '2025-07-31 15:56:52');

-- Original (non-encrypted) data for minor_student:
-- INSERT INTO minor_student (minor_student_id, first_name, last_name, email, phone, address, zip_code, customer_auth_id, tutor_id, profile_picture, birthdate) VALUES
   (6, 'Frank', 'Rodriguez', 'frank.r@example.com', '3367890123', '678 Willow Rd', '45006', 6, 6, NULL, '2007-09-10');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100035, 'd610510e877775eb2c521f9d0cf5eab7381857b050740a50de229c55c6a61d2b59', 'a02fde15344e0138593389d03b369f8992a8fb3ad77f6d514097b8112be5ae3e5fc78b60bb', '76a5929f559c3f1f02b32153cafa409da71105e254fe16a715374998a7c635ce702d816095d6', '5b4ac8aeb80058ddd13498a2d80dfd0101b065b628a3db779fa2b4313aca087536ea4e0b6098217548ef8c38717b7f', '7cfaaf52f14061c763fe1f9c0a115262343575fae7a787c9436c7ddb76fa48cdb2eee11e312cfd2a92', '7dd96b9e1dfb6d371beccd7b7e86e0ab8824c7b7a1c040ace4d8bfce6ffa03c50f', '7e1c69a85d0416b8235b47917a368bf1f1dd217b60cc212105026f7ecb2b7bc5', 'e7bccd1b43d8acb65dba5c9a2b2241fdc11656160fbc927399cc4981cdded977');
INSERT INTO minor_student (minor_student_id, birthdate, encrypted_profile_picture, customer_auth_id, tutor_id, person_pii_id, created_at) VALUES (6, '6', 'eb373770f7249ee140cb82a9048f3926448a385a58669f34fab9474cc7', NULL, '2007-09-10', 100035, '2025-07-31 15:56:52');

-- Original (non-encrypted) data for minor_student:
-- INSERT INTO minor_student (minor_student_id, first_name, last_name, email, phone, address, zip_code, customer_auth_id, tutor_id, profile_picture, birthdate) VALUES
   (7, 'Grace', 'Martinez', 'grace.m@example.com', '3378901234', '789 Cedar Ave', '45007', 7, 7, NULL, '2009-01-15');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100036, '20f7b905c4f7767afd03e8438a971af66c908bf217b71441f22b57df42d112521e', 'f8550e19f7002f08bb5edd11a44d72ccd15d90e261ab2c6a80c17fa7ed2ab6316f37e24d', '023fc81ae8a38d8e426f6643d71d08c2a60334fa1b3aff3e37f902f5de86c7802e32b58d4cf9', '741da7731a900755600e5a72765fb2732278b588674ac550d03244c382140f8713838708daa7add18dbf823c357f02', '3a520620d99b65c2a1d5bab077a2aeca888394f875df37335f28fdca4dce1602c59996e6764ffb55a2', 'ae8bd90dad557dc194ae08be9ced9d7eca5c6cb12fc9ef1a7522bd2d35632c6aa4', '0dd243930f7041585cdfdfc258f241d6a9949b9e54d3ae242dce94aa34a8edec', 'd0ab6ed1b6392484f51d9ad62ba17486aa0fc3abf566c13a35c29fa5ac440d53');
INSERT INTO minor_student (minor_student_id, birthdate, encrypted_profile_picture, customer_auth_id, tutor_id, person_pii_id, created_at) VALUES (7, '7', '960ef9fd7c77a667efc9227c2dea533a894ff7c358c71b2946d61d20de', NULL, '2009-01-15', 100036, '2025-07-31 15:56:52');

-- Original (non-encrypted) data for minor_student:
-- INSERT INTO minor_student (minor_student_id, first_name, last_name, email, phone, address, zip_code, customer_auth_id, tutor_id, profile_picture, birthdate) VALUES
   (8, 'Henry', 'Anderson', 'henry.a@example.com', '3389012345', '890 Birch Ln', '45008', 8, 8, NULL, '2006-04-20');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100037, '37d24f3abc27634627c738cd8015faae2609aa1521530bdcdea51af9b7c6e3830d', '0b5ea475ca1f621b36b1f96129d1cd8a44e117ff535091e5716a03cd923e2e70ff8a5fe6', '3f6f806fd62d01eeefefca1a126984a466189ca105a991c5d28e9b397ec9a580a505d6fb12b6', 'af8bdb4672092f6d26d2b91412c59f507c8ea5725c40d54aa88647dbe5cf16663675a05a216aece6af18ed169a1a91', 'd298339e1d49eac2b289ca6bf8d615bbf77410e448eb010a0fe3d74c081c60f09d9ce4849c17bd5d', 'f7e9c8ddceee8e4c767cb37e9d93902583dcae1b01a42829fec2d7e43bfb746233', '7a7110c012c84c9b2f9038f3b77fbfebb542459bb7d2272cf682e5c9f90f7d0c', '64ed58c26115a221c4ccb58b184ea88ac75ff0e7a9a66e0e86b3bb6956526095');
INSERT INTO minor_student (minor_student_id, birthdate, encrypted_profile_picture, customer_auth_id, tutor_id, person_pii_id, created_at) VALUES (8, '8', 'f34c6f196f19a1bc6a8b0bf16855bcdaf1d4e36b09c084382df26200de', NULL, '2006-04-20', 100037, '2025-07-31 15:56:52');

-- Original (non-encrypted) data for minor_student:
-- INSERT INTO minor_student (minor_student_id, first_name, last_name, email, phone, address, zip_code, customer_auth_id, tutor_id, profile_picture, birthdate) VALUES
   (9, 'Ivy', 'Thomas', 'ivy.t@example.com', '3390123456', '901 Hickory Rd', '45009', 9, 9, NULL, '2008-08-25');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100038, 'ac4e99996877847c28f29208bc38cc76447f2a0d11340179220a69064ec4c1', 'c78c7a6efb1012fc25a7ec36c817b537286f047fcf00c2b4b856ddf1691fcebb73db', 'ec798bf4e13258d1675bcf5cb4eea45ca2b1f3948ad0293b7178b9d1d1d3e4d412d098d21239', '4a02b3d4664a5b46433e28530d8bde560ebaaf81a93d903849dd03991f19ea329aae33dbe50ab274fb6a5f5be3', 'e403ef2eaf3d985700f8b164dc313fbdf4e0b91b7230de88f68c0bed19acce63b0407bd1f80c1375f4cb', '64040a0534b190c9e055c1979e990e50cf6d581b7d270afb6ac62e97c74af8d8b0', '0256dddb44e8a40b7936428015f7803852d3152d88ec33d4128b685c5eb6cd98', '80b37eeeb71acafbbc143830a8231ba228e193897c9400fb5bfb989e93351da6');
INSERT INTO minor_student (minor_student_id, birthdate, encrypted_profile_picture, customer_auth_id, tutor_id, person_pii_id, created_at) VALUES (9, '9', 'b082ea9d7eaf950a524f74f34cf282db4c038a8b6d9d336dbdd81092a6', NULL, '2008-08-25', 100038, '2025-07-31 15:56:52');

-- Original (non-encrypted) data for minor_student:
-- INSERT INTO minor_student (minor_student_id, first_name, last_name, email, phone, address, zip_code, customer_auth_id, tutor_id, profile_picture, birthdate) VALUES
   (10, 'Jack', 'Jackson', 'jack.j@example.com', '3301234567', '012 Oak St', '45010', 10, 10, NULL, '2007-12-30');

INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (100039, 'cd1c9fa21b5fdab60363ad0558d59191a54c49e6043a0f14c8a58fede67aae8f', '9f78a80721ae809d25374722ce64ba6c9b51c74017060c0344da7fbe98ea3f3eb33255', '1dcc7a2bf2789d3201716bb3a38fcf6975ff145c486d1b904e161762b9c5d2018f284fd70e6f', '57c379eaad7fb032b723acb19d1c313f510ebed810f7e1eb04c53d46b43ffa38b6fcc2dc06842d989f96cac7a84c', '591e1efa1549c7bed62b0deba780511e22203998caf79835cbb90739f27808985b4944281837', '9132700a1a69f5c25c38501adb11d111484318ecdc1e3b1e6e4e652645ff4729e5', 'd11b3b2b3598c2551bece4b316875fcd30cec7c3e49bba28990192b1eca1f8d3', '4af50935a804098d1a4bd09481df05bfe7627ad61a2dd1e12bb9d6b1debf50a0');
INSERT INTO minor_student (minor_student_id, birthdate, encrypted_profile_picture, customer_auth_id, tutor_id, person_pii_id, created_at) VALUES (10, '10', 'b164cc40690384efe29de63499dd1b84f1d8c18ac90d934631dd33a330c6', NULL, '2007-12-30', 100039, '2025-07-31 15:56:52');

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