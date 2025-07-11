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
   INSERT INTO employee (employee_id, first_name, last_name, email, phone, address, zip_code, employee_type, internal_auth_id, birthdate) VALUES
(1, '3da75b7889eacb7474465b5a5074a4b2c473236182389e978074999006e39723b4', '72a6140ce3b89dccdcb4765dd8af49ca2d492c964016285b6e0eea93ff6556c5f1387e', '5b194a8c97e4786acb765c3f683ad0f787cdee7347218489cb80423324c62a41bab9c03397c46c3aee28c97c4b0e94', '3c7b79f8de839eaa450c97403e5a0b1c14eaed4a9f1d26e588d8d85b0516ac63938d714977db23aa', '9b4f613171c6acf2e641b442fa985b0e4d8b80a15bacdfe15bef7e327825e021f9af8ddafe8cc4', 'b97a4937280337538182fe2ef25c6b8b6c9b87ae464522206443c4ec250f23c680', 'Full-time', 1, '1990-05-15'),
(2, 'de2ed505f5be08fc87854dee56d428c8dee34945bc610b482eb29063f5e6ca', '0914f5dca838406a95ce26f66bf53b7b9593cf562f6cac4f16105982d5f3066f0785106f', 'df49c96c7af3211ac55bf65afe4c8d9ac3962c5c8e660bb3339de09d2d3bb14d475d0740e9fc5ac5f90093f31e', '7de734521ca35a4eee24dec8326a732c4833c5c0b7262d70fb324cf360de4e6df411dca9c07dd5bf', '6721d6c1dfeac9e3f3aa117118ffe5ea2993b65bca3f7627688e76c1ce6a839478f77d25745463', '368d7bae0870e6b57e099ad680d3a84938966a9f4da32775563b940f29b905cdf2', 'Part-time', 2, '1985-10-20'),
(3, '9b8377fa2d20adc575eca11263bbb45744c6c60c0b3b7acea8b337e67e6dc520e8caf4', 'e96300f94de6f53b7c1efba38b60f140fc7b01ac409ab28696d221e1f04f34db9c', 'ce87969fc9b88d4719572a03ba080aa57e39054ef6f4a581357bfb61bf3a0b4e4d637a509ecdb8182357371ed34ee6999c', '2bb638327fb8f43440258323c64198b952a248030e0084e756db618d256439ca301832ba3213f861', '2a68a8db35a27ff8f41362a9b755d162c8a20355bef0e99ba854dbd376bbfbf12c279fb8cdfef5', '97e592ba04d06a24e310335d4cdabf827fa83b3bea7a8f8c11084f605e1fb8d7e8', 'Contract', 3, '1992-08-01'),
(4, '72054d6ef6b8e1d423665671f05b2aa78233fd6bbe7e5a19e4de3ffd3a0242b887', 'dce255d87e9f0ab98739f4ce14f5af084e1a38b9bf252d35cabc3cd6c81e0bce04', '61a4cde447a91443932c29b74efcd9749bd573caeece2d190b8ff1c0550a136c050105d96f01e224ce8eada7807694', '8419018fb8a280155b073ca41a79ef6247dd2f10aea01e0022e6c1db2dcf60c16492a61625587d86', '9dd1b41c16fa8dcb7f2daa2d560d61d56f0865adb21c2ecda9b046f22c789b1bff254533b014', '836570e887ff92562308d90364e42528614742bcbf8555eb8234ece4235420f91b', 'Full-time', 4, '1988-02-28'),
(5, '9fa649538772dc24d4e71920aa6f912f1f6a924691f6bd5391704a6f6c7e63080b', 'ab8dde3ef653054924e79884f99e2c3697d1508716bd062d70a6dd94db91ee96f9a4', 'fd8d645926e60bf9d895e6d6514ec6538179299888fd15d1c13c14e3dba8a75390a2e592dca96f01ce48a14159fd5f', '7642bc8ed369761e362e11c95c2cb1157c11b615dd594815ffe83fe3c30d5ab86823f28ddefeb7e7', '4f0306bcea509b65932884bc400346e7b1c9a9f44b92895227bb679c2dbea2e99e2c6927b485fa26', '3e36d5626109fb94bc1bc3f9c7e8ccd6765a07f88ec05b5d556061112b80128a21', 'Part-time', 5, '1995-11-10'),
(6, '34b2f812619f3266c34598edb3cd8b3b13b02a3793f4b6df7c8f90aa3c07930d4b', 'b4d00a007770ece6de4de7635be45a274149eaa04296b215df14f9fc2a765af0445b', '4879387d0f9c47e654a1674298c3a4ab8dc67f856e8814040f2bca74e9f3a7c55d6f458863c1e79eb187c274d80192', '1ab09edcee145c53eb39a9a5addbd26c199c2489cbbeaded3da4ba73f40a06103cb5df93d85f654f', '78c407dc0d34af0cedf90f026001a58f4d18a42e8d5e3b06c8f9c597688553eff7cc09697910b605', 'b40bce998c05a7058bf2deda2a1d964a1ab86b6bb7794ad0da9c8ae0abb72f117b', 'Contract', 6, '1991-07-05'),
(7, 'bbc697dde2704cf28cbf3f96a714d0c79c6b04d693b9a25c926e2fbe8603845d40', 'a75972537350ec349171ea62cc0e45192521ac7b47064f25fea24b18cdaad18dff', 'e4f5f87df1e040c539c97071d2159aafd1caee22e86b80524384f9af29e751a097e84a8020e9e725ec08bf27b30051', 'd0c879f356cf991ef0e793232c1a20f87e0cedb9ae6bfc2b9a81d77aaa70aa9ed646e9efb1697930', '2c16a900dffa79d96a51f2ed345eb2b90a3d20fd1bc578b8800f292559507b8c8a8f0c8c3347276097', 'dfe6181db0060fbe26a3d3c9c6e80d01beabc1fc49324abde2e1711f6f92d864a9', 'Full-time', 7, '1987-04-12'),
(8, '3aaea8225f826b021db33b397126fa2b8cdd98aca644489a0474e890b695a1f253', '29010d963a030bb40d96620dd726e27b19bbce037e4ce020e025a60ebf3e30e06d4d', '69a02ec810208227c1e12cc2833d3d40443ffdb7ff12e100896a82d838e6e05c6f4f6188817c7b8eae65b8448d07b2', 'ea6085f0f1f7162614da0fa3a6164a1ed8bb6f6eb1a86b94473d2548ea33c4087056a2d9da73bb46', 'a38934c5fa15e0519c9cb77ba3a5a7a7f3b776d4ea0afb25f88b203ca59f477d02a12040a1be4b76', 'ab35dc783dec4a7163b72824d06ea08def0047c744471d7f79d539b3601adbde45', 'Part-time', 8, '1993-09-22'),
(9, '5bbb590a66afa8e095c1464d7e0e5cb2c7430183ad7919507f5cbcb6a20a97', 'd1af25def3af6810e2677680db66e9dc66ca81e99efaa5888ad8aa9ccb0fd994f7ec48c8', '5448306644ef5e63c5d94e545cd5a36d3b99a5f6e5aca3475c458ee994260d69bd635a6758aafa198dfb7f2154', '1517deda9884d8bb183aaef3ab6976e040b03785bbcae2cd0c3fdd03de249f8c5b8204239d68fef1', 'ebc1952db1d9ff76d91bb35b9fb06a9b72b389dca0043c7277ca0446bb99a616618df726e86c84bd6b68', 'aeca69998b6c030c72bde5d7b8bbec942c9e55b802b933381e19f8b492c57b38c3', 'Contract', 9, '1996-06-30'),
(10, '7780a95266dc42b1e57c74da066441376169afeba186211705d1f4909d42da45', 'c573ec5544a69558d443e9708abf4e64e5d32c16534ce94fc5590e4daf767724510f', '36708c931c40d9a09a2fd8bbc811e569fef2cbaa858f305f60105203f3e3da3cea7570c5a7a7e30949006149c49a', '0413317f911eb2254b6e75b0be2c74e25304b7863f396cade2c22061f329910ec0f64048c2eaefc8', '7663afcaa650776840eb3052356cff5aff4fec8feea754ab242cc85a76c347de516af2b0f90b09932810dae4', '7ee5f61267d11191ee90b00a9dd288e35794ced7e7cec22da6713bbd0958a5a4e2', 'Full-time', 10, '1989-01-18');

   -- Data for collaborator (10 rows)
   INSERT INTO collaborator (collaborator_id, first_name, last_name, email, phone, address, zip_code, internal_auth_id, skills, profile_picture, birthdate) VALUES
(1, '8ae4e5455bed74b3f9a2917fb564496f68879829b93d6bc309b665810e8cbf1f0b', '6ae993349819197f57a4005b6817614142bb1dfa569d7fa0230526ba6178087c4d', '0e3cdf505cb393784e4f89193b87073acddd7f961b1cb7cdad9c90e644ae6c63f2aa74a53f3edf6249041f4121bb17', '57cdce5b862e6b8ef2ec214c257a500ff5b467a3d23eb98fa54d0507e79415eb0036a3f59eba4c6e', '4642e2c89931d2de6e7ac33276bb60eb007465d8c690194a0298a450bd5e72ff26b36abd798ed61cb601cedf', 'a4b7c025e1f0eaa4d7a57839bad98ab24daa09f38203f8e3d01442c5e45c5947ef', 1, '2150f0a17c7de8a6284fee85f24acbc2dcaf86b11459598be60329b3dff54093ac6a721798db540dfd70c22c97', '1ad93b896c17deb0a40611a758e50c127c5bf77bd7b5da761a5b5f0e393b3958', '1980-03-25'),
(2, 'fa84bc32f598636fff9698c40a6d1204922312ec1a7e42f01bb19d83b9900f83', '2ab1c8d63cc675fe9331a83fc8a30fbc06a27532776b29e64522ce1cbc06b621', 'fbe86673ee5f4998e76d213651afa7cca72bbe048fab1529df66668164959bda4fb07167acc7b14c6fd642239f6b', 'e98725750f68d18014096a67897ed74091d2c7411dc6c5127dedcb362a6cfa2b133c69eca14969ce', 'e98afbac7178eafa6b06a713f3d7b95c7fe99b4a5936c73b5c14c7b1349693ac52bc6a0636797095', 'e22bf5267514a3ae4c090c8c10eb40d8c0d9f4cd461b33000bb458a69d00c6dc43', 2, 'fe1bfb1c419e858525aef16c036813d3d0c53c8632c6d9c4d6610af0e7402f10afd46b896c', '38ccd9e6618a127f5372c57b7906fca87f21533fb9faae85abeea63d3cee9e46', '1976-11-08'),
(3, '9a11de669abc8336f65d41c9405369f550f88dd68948650dccb484a906e863', '72961db6ad41bcc956f28d5ca0d56a87163bc48337ad728cd00572900debcf29f2', '0908441b588a4af7133ff658bef472e985320a718a757446baa8f546730e9ecd1510808be34690e4fbb7f179c6', '7138119134f743cff33e96d393db43a0f301f98f43f8577968cd0d01ab1282927f71d5440e36a6d2', 'b2b7bc15e866a0ca00b3b0a010a9744b894ac39405989de91d2cec002de791be9e0669b87c8b4cf9320bc1', '9d2771af8862a6c8d42df75d91d9bd2c8151e8e8069d9cd9eeff433885a6a7c3cd', 3, '48de74ff84c445bd1170bbb53a108ba642e1f6316149e7866b645994959aaa8f3a74ef7f9198e38fc63b2dde625a46218f14', 'f29ac2441fd7c32edb1566443cf464f63e8d54d43912fe643824570f52265eb9', '1983-09-18'),
(4, '95b0006b08591591f0791c17912bbc4e29c0f27d5368b413b179a802105e9431', 'c6004a05abe31543eb0fbcbc48d500b2edd49c1d0a883c274a4f7598d4e8487c', 'c4ef47d04a3ed2cb8e5019c8167fa3ac9b997f39463bd288150d3599370bfac7d8186ebb75d2a56a0129ebf4cbe0', 'd177da0f018a52064e26143add7e92281a6719c7f542e6511224ccf967f5b174ed98e4addd337e65', '9f17789182b20d07ce9d6dce71d40f975de0aba73ace053581a7200d357c9509364fdebfc255e4e378cd', 'f7e3d023dbe71e16c4fd6ab41ca1739ad1bc93e368c9e9bbcc8eca06d5de6b3d89', 4, 'e776b3db7ecef1c1f6212e09cda13a75b565219f80fe49bfd550633199840079827f9e75750cb0', '1a647b2d12c4970e8f29577e80ae0a69fc53440a72d60dab5c5d9af4dfd0beff', '1979-06-12'),
(5, '6d275d316fd62507e899440b317f8d42083de1b5a30e6412726b2c530af24284d295', '113156ab36bf1d66b93d9e377eb1659940665b413aa6411255a5f8f43733805d365d', 'c0f009dab909e585565e390575aa7a259beddb68f41b03fcd5659404cf4ca5d73479072edceedb1fad7fa0e55a85058b', '86f8882324984aed644d64c1008334728a21e7e42f1e664349c7d19a8cebd6b2228c1044ff18ca67', 'b78e5bf082e83abd2449118ed5ba76030543e605de8a6d5c3834a6a58e4dbc83bc285b85ad7ae977e83e', 'bd86cc49b6ffbc242a19474f2ee3ffe63186bbfda45dda23bb390724bfe18d2d88', 5, '125ad89db5f173ab92f9634d5d4e6c4654effeffb83a961789440c77df6477767ecd6a85fa0601aec5aef523', 'c26d8382685e9b4aeec4c00eef5f46823541c2e3707d6d1b64b8406ca522d653', '1985-02-03'),
(6, '53788f1f9a8c5a0cd42bfcff563ee52441524670f3dc4b4c354611aaa3779b53b5', '6da7f4dde4e2803bc504272bafb412f27bf3757a6b25a231dea086febe2a74abce', '40c053528a10b9e4c580cb9d4d1a579fef6739f2144ba9ee523549225c2cdf3efb9a8c20272c775cdec88e813369ce', '84bd160cd8d948c6bd3c0614eef99d0de837f29701a22d40b5cd63b65c49c97060d7478c7670c6d8', '34b17e94b32571330f65ed3208e6e1b32a41846efeb89f0c9be986387d72eaeb2202774ebd035d931a', '8db79bec932d672a706221dab4fc2ab485782d5edbf761c679eaa4c3886b728777', 6, '6fedae90adfeea0d03aa0ab4070b9fb85d49d7e6784c3f7cb15bb8bbf5d051e7b4a541275fd8812a', '3a0c50bf968e04af884ae5ef29d0cf013ab4ecbd936009125dedcd977d05b242', '1981-12-21'),
(7, '0be6edef95806ab0edc4fdff1c923fd20de033115850e26c3ec1b956cca386dc6a', 'f07048433dba2a6cb556e5e8bbb94f7dbceadeeb1a8300bbfbef4e64afc4ebe01e', 'ec412b029068d3c9741357c688f2f03a7f97777033c8341d965e8c5f97c6b6d97f40f1036209fe3cf2d16c76f1b500', '92bbc4d7b25c209d34d6f2981c4b54d4d2b05863f21922730ccf031343f5a4907578fe0e1cb513b0', 'f1f9778a6ca1a58467a0bd1f3471cb3806c6213c2af9345dc591e13a308b4215f4f92f3a5bcf0e15a4', '3d63462ea08f6e9dc3866b4252cd24feaccdad9aa2ed673ef59a6b0b85a8f290d3', 7, '1e4a04d9cccedc68bd95c554595de15c82c664e0643bbf5ff4bb59bc7e56115885', '4c4e73ef5e119002454139d0234141b56e96d8cb559c299222cf67cd0a7915aa', '1986-10-09'),
(8, 'a2f5d0784361c4e4759efc8a4b49669242aa662240eb1416aae069dbba1303b8', '2c8d760bcd04bac1cadbbe56beb3f5f20c79980cc0cb5959c6371cf3c4dc81da98e3', '2b302cc5d0843412bf359191ef698e45ce6c72bd362dc89a9d6d85d0f0bffac295fd8929d884b4ef58a1b8688dcd', '3b6ff9df287094852d7e7a3804862b9989a35f0707782c099936d9eb77cc8b05e2958763bece45da', '36fa494509714e12d3dc315971896f61c730656effa94f32883a9141df471c92d5d177b5a1f881446c493cf511', '55768a2e47d1050a118fbdba3bc21d4647c7b5605e36ce4edf35f40ac53ea3e913', 8, '0517e7ba14a020e87350a95a60ddb61925c7631082c49a586fd04f3c28070eb5b00d', '70d5718e8aebbf2cc0cc86d05ccb992f6d29d320658c48a3af1b206ff40a0880', '1982-08-16'),
(9, 'e4c45c03fbc36de688da19ec1ee582dc5206ddba2959f43e76bf3f00088399674e2e', '24422f532b45df57c8cf826fda78c759131b77cff3d4a12d885a02232224d6620f31', '9c17533fc0fe01d0cc3af2851f033e08a25ec16b5e1d9ccc0f882cee51b47b674ffa2fcd30fc676334e5883b4e80fd84', '7bfedd0025db3cb4be3579723147779cd1f7fe271c4908c7814a4d0f4036c914dbfb227277b76efd', 'ba6ce7b79a98fab9f405df46328ae2a0ec1f57fa4c5b4a56bc63b4e564d1800ff0ad319c243060b914b757', '7abc8cbdb8de693f296e20472bc016a1d1ded449f1935347f1764a822bf1822659', 9, 'bc810016d35af3dcc0ae07be37b9eb2a403a9b877903b35f6e0fc2a0a610121e25a7fcb226ce9a697e25', '95014ed6d81ad9b214e67710b9773b583b8253ebc5b6f48fc6010782243e904b', '1987-05-04'),
(10, 'fd46e3f11fc541d45aa122d9de41027b63d52f9734a3356a2bd2f873aba107454f81', '87d2b9bf3a52f9cc11a0d4f9b0b8ae362783d248ab40e54ac5f8e89e8f3699fb094514', '212e6957933f21240df4c614b86d76b61b1e43a9d429253ceb2ab8886ebf50ec66c45b6938d07f2c6eac42d90acb9400', '87d8b4f5afc5bce5dca75cdb66a951f239e2c885ada8469d7f0f4ede8794ebb841c19e03531f68f7', '0afada88e6a136fd8d7c5510ebc51bfe29e96b46227e322aaf60e11ad8579b71255c5e961877a797', '29682a15a52fab4193e80fee9b6f39f8b9ac9561d0e9189fbfafbc6c2229c8157d', 10, '66311f231f90f9be915f4f63e494a8b2d58ccfc96cf86f848df833daaf23575a09c7b3d4dd51bcc770c345', '981fcc95156a72973614a1ded6184bc53c68819e241f7ee07a9546e91f2a5458', '1984-01-11');

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
(1, '86376361b48ce26ddb461d87c7c32a94b78ee94f56f1a7aa79e24013c638c1', 'bcb1372d0c5b842861f9b8b95e83808db5d0cacd3f1e70059e1b6e4002c6dd13f7608a0fe6', 'b9b3dcd2929bceaa663e2588903666a2b651fb316da9e73b1a1f91954410a90200edfaebbe40a1f6f08a5db990', 'd42c6eab370ef70dc36d99b8edc5f2d3877511aec9c9c340c37eef1d02140e7aba2548254e835a96', '8884c5917ec00d1544614afbf64ab886a3a4dcb13d20959c0e5497036238e6954652960830871e', '598ec069e9888df041001a2fdba82ba6848f6131ef3ede64b87a0f7bff6e1b870e', 1, 'dd601af7b227babd92dd316433c4a1b4ece9014b1cc295ddc020b4527d3928b5', '1998-07-15'),
(2, '417830a15113034f0580af2ca30143e6f1505a1938a19ba0a514f79aab32454afa', 'f0798858388ab8f38644cde21da3798ed7118aff914648c67ea530bfab65b4f1f9bc', 'fc93455d4429ad47692e555a9200b38b0ca2045cae27efb879515531f05ced14b66134547477675b8aed1a6c402eb1', '03fad9bcae411a96ade09ab8a19aabf816694f6fdd3cccfec09f55b1c761c5b7b698f16fe092dd72', 'f712f738425162f108dab2e5ee55bad15b1ede0430322a89461a2a8c02d0d1c96e7f33012fd74a', '86585f368d3a86952bc0577ac10baf50f33fcebf0fbe1349b8f44442c17da0ca71', 2, '41eeff8315af7663636c92de181315828f1df1ba2868158496a0b3987b364e47', '1997-03-20'),
(3, '83041cdcc777a962d0654dcd0b5183c7fe9106b0b3286135c0acff4feb32da88df22e30c01', '070b3c19bc43c61f3040376a4df4643985327f7ec5fa55b030a6423fa159911bb6', 'ded8191910862a4b476a1c4d77e015c7d5143ed7eda71b61861fc588ac5f635a42181655859618cb638182db60702e1e7ac2b7', 'b7221b0ba311bc4f399f5d2edf89317e9b84cbfb6c1bbbf1c44f19f253c1016f01aefd3a9756aa2b', 'e732a679cda4ca88c215ff99e1ec4713d9fc827accb9908761f4db103eb42480d6e03fe969f7', '407e565a3747f8362b6b938f73fb97962f11163642a4040e3b323753e991c80463', 3, '260d8163c557317dfc7bdbeb51713de399bdaec103d767f2c4742803d57b27ea', '1999-12-10'),
(4, '84fabb3b6ee8aac62e683461c64fb4642381ee96ed129336fa95f4d15e9e4a64504c', '43ae302a25f923317d6fd1df66fa9c40cc099ea5be732ec91a2798dbd9daab9874ac899f2a', 'dc18308f86816ba0bc097be95c6437d0416ab00182a66653a5d6b1843e88652002cbe886835e1c26bdd4efd80c7088e5', 'bb5b66505f26af559ad08ded080f73ccaf7827756acc28ee8d4686361ba1689ce1e4a31e8b0c10b7', '8c2ca2524ae328532ab44d47d72ed9a0d7704a649014524df70ed028b7b527ff4daf02422552c523ab', 'e96cb63ff5a345738825c4b640d4bd7ae6dc04d3913f0a4f14681549279ceb7725', 4, '554eb8e670f67b02744f87eee01dbf74d1f4730149fb913b96328e6a5a0b256d', '1996-09-05'),
(5, 'fd6adcec59001ebb9e695704087f70e2509aa9e6d9ab9610f8288911542fccd777002c2e48', '676682e0702bbcb916f13ff7beffb1be2a580f49b065f8357ae4c88cf8fb9b8b2b', 'c470bb9fe82059ad9ccd1f731bfe9e64b70621aeca922bed40c5959b2bb9002162d7041b7cc1a4b130acf5ac936744a904e45e', 'ed5966d95aa3b2321a371deb12d1d54bfed7075ae2d76657106a29a2684fd6f255c79a4ba7b80467', 'e0e0ce909486bdbeee439c5690f1badbf17b7991c00409cfd973342049040faf7168e686d628f1a2df85dbd0', '25dd52ff5cce7728885b53a9c3643a6c1a8b09fd8942dda3555082341b9c102d2c', 5, '0da57220aab9548b3061ae6be0038855d93a8c7c28951fc1e0eb0916f66f35a3', '1998-05-01'),
(6, 'ab8222745851821a65119bbfea3db054af0344b18e5fdf6fe9d7a654e4237cb1538c5b', '4fab71cfaa1940adb0cbab11a254cbd854ff1c75d56f0cfb9c0d3fda3319b1ee4e', '3c853a779cc40d705da16fd156b60626520e84254626a3ebd8662b1dbb327c3bcb603e27fe25d2c57e51a562fe2159263a', 'c9a5f5b1c763bfcde91b88cee1cd31674ce5022375155b7171bd15c989d066fa063bfae460d1ef94', '8fd2a2058881786ff7c6acc51fef8fc28a0a280fe0a43c6ad0ff82ce2952b0fadec172d7c30230de304fc009', '8dcb9161afc21aaa3b28a57fff1829625273666bcdcf5dcda260ac661441c0d90d', 6, '80f4cb7ee68a86e0cb575e5e5167912fcaf095a4a7c5fe0b1564e3916f064db6', '1997-01-22'),
(7, 'e77d94fd03c16b8266d2155894534e4737239c0640ef53ed2d2eaeb1c0b78d14c501', '347b00af70982ec1c03323182f2f9a994e7d4f68af6118ee3274fd0afe45f7993db84b', '54826de0680298b7b730b279acb34260bb6a0a531d197bf1b32812be93dea917de5e7844b7237c1de84c28221176efd3', '1f21acb904a93b9447a195d0f35dd5c1a8b3f3b3ee3299baeaa303df1d6715c36e5d0d978efb6e43', '93d901d77b88fb9c2a3a6d7c1021b28b954c348e5abd6aca46173f65a6a661dc710d4e7c7c44848bc7435f', '8014d7e19ccd4bd2458a481ea1fdfa66e8b3df74b1cf721ae219e635c7128f8277', 7, '1605889fbc4a47d31ecd8aa6c8590a03486d55a6b46f9d7b2c3dcfe8acbaf713', '1999-09-14'),
(8, '7d9e441ab527ce16fba888b1ad3e4395009dd573ad395c4c87ebbcbce4a1c9f2d0', '20dcda2ac8121d6a835a7bb87729429cb9f1d169be631b1dbbac4b7a205fb02f0ebe', '896cfa8d95d48cf0bca1706573b2ce36a243e88cb46c3b8aed95aa4c58916e55620c2311df540a65f0ed163257f16b', '6842d4ff46e81f1a5e8a6a51ae23fbac2d27257a8c3f8bc614d5a9b6bcc340be9e9a1917dd26db3d', '08c3a9b67c2c18b5d1e573ba1e7e29323522ee79dd6d84e8209cd2cd5cceb7c009ee224c171ba8c25b0806e9', '1dbed887ea416cf2de64c39fb95982fb2aedf138ce1f28d45770cc01795d681840', 8, '2de1c3b0513a4b4324a3696a7152669ae0714c848610b48c8b8dff640e918640', '1996-04-08'),
(9, '036ea13f87e135ae702faa6e48cabc04d42b9d8162fa47eae0ff8bf8891bb06c9718a8', 'd27233b8ad253360afcaec7779b1c95432a4c0f5d8143ef4ca0418fd6e4358c2b559', '900ede8d0466d9d727fa8e627727268591e0e06a2a9bc358af62600dd3e9e5c73b206290e4f45a36fb9c5c973d4c333a03', '50c0310cc388c3b5abd7cccc572080fd1bf936e3d3bffc46f473e569e3c48a91ff14873a2ba52484', '67c777b426bbdd4af21a2377b9c8514c54258e6563b5c8e66375f905df9b1a612448dddb82f3ef952915860b5598', 'f23c8576d01fe5e92266aa221d230b0e54779d760a896b61318502a028df9dc946', 9, '7713abf8e2d6e0a848f567f9e9719135d0c4a1751a72cbfacdb6fd502899224d', '1998-11-28'),
(10, 'f03cf4b5c5e0f9e9ea2e433e96d6bdd9b4340188ca6fafaeedfe89124ffafcc071', '65613817d42dd1c1c880336ff16b05c265451a7192977aa0c314090ff426110b', '8a7cf4459187718656dfa37f8821b0c987ed269d0289a12c4364819cff69397d2ef56fb9a2a1d77f1d473939c72b4b', '544cb2b24cf713f582c1cf8337b6937dba520ba5f1fc42cb1683ee3ba98dae81d6b4a45d52f66715', 'a367e433f00e19ef4b9424317d4304d3caeb5dfcdee61208d696be68128fa66da2e72fc0e6c037b123f7', 'cd4cbb520422057a9c14dcbe9dd88f4863711275baf981a5b5f5053d6370e2544e', 10, 'c4b15ae8667e03ea6551d8aebe0271b83b05f31a05140a06ea025fdc50acc0a3', '1997-08-17');

   -- Data for tutor (10 rows)
    INSERT INTO tutor (first_name, last_name, email, phone, customer_auth_id) VALUES
(1, 'a43a92777ac37b82886f80c8d8b3f2d4aa3ce506ac0eee1412f239acc1952f77', 'cbb936181a81b4a9ee3d4f8d83c9e4364841ed8755e8a1a607638f3a95668cc1a4', '6cd92cf2f6f19b0ba1bce6003d4088c90119fe38550fb94bf32a6837d155458db836a64341ff707064b1b7110c7aaaca2d19', '43e40b635103f7afc8d64a90025f9715266e04505d0dfcd7b134f3d0348810edf3181c7a697a4cf6', 1),
(2, 'c1d8d30e3ef124d5366c8d7b51738e6daa1ddd790519336794df3c5ac62ae3411951', '65dbf82d11e23b5e03c964f598c745ed6cc5704b254959650d17cc6f195ea0cf2f', '98414388f3c088fdf519054444fb601950fd4baf539732b73b4361e7aab1853b6ffb603ce2681e3c91c7d41781a0f424', '02747e56031a50636a0490f547cefb086b9a97604a6c38dcb60f473ed2f57aeeb119cda14037c420', 2),
(3, '0f4f839ca63c9c50a5c2df54c9347f578f0821b060a0d71019a969e776d69abb', '8df1b08b58a684d1333540d1469525507248f7bab5dc08d5d6c21591fba4267e0b', '9e498f1fbe7ee8953ef4fe2de6a42d6cae12ccc955895aec0a79b6bf7ac8ec9bcbb8fad536d59ede239d1d826e07', '8775eb7138d09049e0ce55dd71f88323c2852c435c971bc7143e3d1b3b4a5942c2b76a5f2e7da271', 3),
(4, '368a5241574397f83305b764ef92b296658a784b18ebdb5a6e843960f9e0a4fd', 'd46819c31e306a4ced4374dab62accca672cc73786a65d58dde1f069fa55f711e4', '71ebe787e9bb5ebfe2b9d83c6a205eddbeef248058aef4641721039b0589484fc26881a9d6274af94aa153fb6e40', '3f84d5c2620f1569e2b4cdbd215ca1848f27581e2e34be783aa1f86af71618bba59c31e1c1e8bf63', 4),
(5, '56d865c094afcc03e1655883da5dabf49bc68fadc6e394618835c0579849a62a0fdd18', '330392c78915104573ccf1baf52679c0f7e44fd51f8998ab34ea7d388f9048f8fec5', '60ffe7322464b5544c68a22e3ff89a2ba24afd55bd9f2c2ee411ae1c5c52d13bf48319c57027a90670def6f2eaf2099a7d', '74f2d26fdf52f8d867eee332fcc22a8cbeb210e215be5f4baca0c5cf9422dfa6380d956ded30db73', 5),
(6, '2a7a1b552195dac8d8a745dea9a9bbd5006421c96f8a255456d52594f25f7098ead1', '33f15241ed6b7c542705c4b88beed6b7d533cb59770c2ca382caca230a91a29cef', 'cfc79e974f81585d4a66095c4a05e110848727e5b88e2e6748b3d54707c6a59cf9939308416a8d612dcf652bdd36efe6', 'c9da94cec6edc9a2d79952ca14c33d3a5cc00acceff6398bb30cbe31caf51cb0be9da4f76efb765b', 6),
(7, '4a3b8b000d41a50d3e6149e647e40086b00dae77d2575ddc80eff6aac6892799e6', '7e39aa5336df62e2799e808b44932bc6c042d8de97f856aa00fa3cf76fe746b7', '5d5743af85b7323ec44883ec954c7c8a428fce620cb6a876537c16ca1a6fd278cb02a086693d2c92a916ef76bc285b', '406f772cf926d68074df0e2f26d3ef797d0183dfef3d9294f0fef7a947239055c176bd9e02a26ea7', 7),
(8, '33e9e06e4e0b10c7926992a1baca348e42d58d0c096f9495ad8a8f83b4e876', 'e7b2117d3be9022b6f299e31ca9ca8cfe8c60de510043ab0ddecb95f8a97508e', '670e256d0691c65af39e99092f068e1bf655e2fa05300c81fccf1ccd183a11126fb1ead00839f2fb6ea204b535', '3838751db51337509403535c9ab60cad6b8dec1cbe73b4f1350d0b8e9415228956212737c1a9de88', 8),
(9, '0aedd96c0ef0f83a3745cfe5c4c1f108b100992a15a76b8d129887b3c52cea6f4e', '550aaee869c40974a5998e1fc0329a900a565b45654ce807d70d3df51e21528f0f', '518c5ae11bd19ee382e3448c34e23a5d57ec4df46950b2999042c06a194baa67f111142806b7290657ef4fdfd851c9', 'f6f33fab385617dce29908b5df2464de662aaf27a4216f187850ee533b41b31ef251f4737c62dddd', 9),
(10, 'e779884a6cc5a212c47171acb35a22ecf30257dd79a23b714ec2ceedd03388', '849f6884cae351265cb148237af3a409f9f4405698257a8864c2b3e703f49b19d3', '163ba496e71060dc614404d440468f0f38f5662bf51fd0848db4ff6772d6ac26753780b9819aa35116803e3263', 'd266c5eb13c90f106720998458db2f7b06fb1f2dce9f528ea3e3f874ddd8091a8ea1e4c5ca61c273', 10);

   -- Data for minor_student (10 rows)
   INSERT INTO minor_student (minor_student_id, first_name, last_name, email, phone, address, zip_code, customer_auth_id, tutor_id, profile_picture, birthdate) VALUES
(1, 'bf5a7cbf3ec30847ce01c1c15529dffcc95053ffdb006c245797fdbb0a1255df2d', '5ac53a1767c805f937a89e723011fd5995c9f737ae2178ee60f933297263c67881', '75004ccde861f71a66b6b8fb4696cd55971c36409432860026cc6624cd48a8899864a1b593e7a46d866c0885933291', '42a842b862e663d0812dc6e70df903222f6440c8c68f4507f1e8a25d6d14ab33ead477c1c0bf14e1', '36576023b89ace9aebdf33738eff6c36a7143b9f392994e26b0cbe9b5b3e2428f9327402241e40b027', '9fd84037e4ba96c087980e8e2c3882c6a824d6eaed697b53b55427dfabb019abc0', 1, 1, '1d969cbfdef554a6987eb28d07a35600d532317324cbae1c1100a4378b9b0cf6', '2008-02-15'),
(2, 'ded32cfb7e0e0a9e2ec33cb2d301df7da0f059371da80deda633916194a8d0', 'e502e89f6b2c256a57a5627dc452010c1087ed9f9a85689a04549ef07c1a8cf463', '3189798b3f49b02546fda522463a4ebe8066ce7d3164b8429d3b208a4e65cea494332f7c218fb90d984ca565a1', 'aecff5bd8a1561c9c1ffc90ecedcacb8027c94e68ed565e6e7eae0d9c8f860ad9eab7842dd4bc432', '16334d03440505bb34cb784ef7f99f1016970426ffc6b8357f7ccc632d27cd9e2d9139094927', 'b828b885f51b9e79f19efa75768e6ffbfcca26cede565f069b2d7c6e76b9b27fe1', 2, 2, 'c4debc878400b8eb4b83be1653cc77adf97185a50d8f1e6b991b9ba6551ba010', '2007-06-20'),
(3, '7c0e0bcecddf1b93223d733defcaab1bd46f0c62b2b753072fc86a248bb287b0a8a4aa', 'dc88723765a061037adb961f5096bccba3f5bd1e22683d15024494c325f3c9d832', '620cd78c603259374e2ac370868736fe9d4a91ed68b9715983cb0e9039a0368204fa070e9ea1d951c3627907fec8f99c0f', '3b2212613bb4d15fb36b1e8d4e6cf59242628563a3289c4b0f57c3e8df4659171cca0fe7d05931e8', 'd0a9737fc66fe875d65f28848c024d53b1d462c94ddd91c01d8370a763917942c26744512ac6ff4f', '20e9a8df9f9ca9f62dc4a4712094eedb6463b391b7e09d00b93a642d628b71fbba', 3, 3, 'f43bf23c4b9a3cf447b35c32820f650be552d71123ea4fa8102839951bf6c811', '2009-10-25'),
(4, '4de1ef03c6779e997dde5f3aabf75e891ee7cfae6c419859577c5756eb9654c89d', '59b6bfba7f9e1a1d5aec87a32c809a948ad1987e072d83558615ac6e5452994a088d', '9233c7927b526c4ddb48bee8fee8367ce911d1fc7c84c6e6a9caf5b571561c9cb1be256daa64e4aedf3cd3e79e6dea', '817cac352da554b522d070d06333dd87a5361c8b76a4fc8cbd2ffb188ed3ce3a85c54e1a15aa867d', '7f29d0e10e7c6925a77a4bfcbc37dc35143fa016223fc09af153750b45ca648d53f4b01cf5fb', 'd8cf6cfdb1f7f3caa92a409889dc9084febcd8305dc8de7f8c4ca04bacfe612481', 4, 4, '542b2ca8713f42a07304e9bc0e785f17a323c505ce794f21b303bcb1e5a7ef12', '2006-01-30'),
(5, 'e4ae2e18536e00ce00f6be16e73cac8c41c6b3e0e47df1dfc52d904d404e2cd2f4', 'a79d8197d0dea08fcccf59c21e84e4672e9d25a4a5df0e3b02b45ad99fe27a8aaa5d', '030e76df69ed60259f5b20f32bab59b5810f121af2fa554ae47adb27426f8fd48c96763c7624ca6ea666210184498d', 'a31838fee76202f730822bc579b21771fe700a5b56b049615c24c60b0a4a31a8e7e44a92a8d2431d', '6aed3f3c0059fee218b2f66be74098e2727a41d6d9bef6844aaa18438e9c0ac1064231b3fd22971e', 'f0bbea8ea5cc156d0abe6f80daa6f4c76887aa10c6e5fc82080a8c136b0376c4b4', 5, 5, '442ff8fc27290946288248110e3f9849b42157047fc257b1def7a5a33fa56ade', '2008-05-05'),
(6, '5c0b7b3869cfd118ad826de39e19fceabc020b9114975568d898067dcec474f934', '7f355bc65bca5769ffc3dc9e2811d7e0f384942968dc6698b38761715e9da60ebf7fbcd3c3', '46c7d8d1988cd0575e6242248eb5c8a448a8bcd8b92e99e34d4f82c6590f5c158f7e4c7f04d71d6fce3562d6d47d2d', 'cbc3c4fc384d5dad587ea0888a3af88a2ecaf82b12dffea6e5fd4fbce76389a9daebbf7b6d900625', '1044d057f09dc17a04cfd533203c1c116c90eb803f5f9de263e97d3042a6e7705e207a8f489a6a08fe', '2ce3279f7fbb0323c0359fd53e5390ed1871109b2b34ee247ec895e0f8b344fbba', 6, 6, '41933ba2448ca67401d62f0e878a0d01c905d9de7eac6bcd5969fbd0de908578', '2007-09-10'),
(7, '100f2b9d54c44bfc83d1f365ac3db47151055dae085a69a139cc63809c1916625b', '6adf49bcf17a3a32eccab98124ae6c929a860e81a20a2101ca5f30a654357f9fbc3b093e', '5245244934efab88970b606cd1c3af5e9ba2e1abd9eba0cf58bcd51aedc87591a506769f3d17a65c9253a100759a8a', 'c719871a63a82b7d8c15d1ab550c0d4374faebf59e4c2a4e4a8590436d0a20c2e7707368f27df45a', '1ccc9404986bf6bbf03988eaddfa763bdece2eb034a1754eb79c67fdc905b443877ac9a2874bebd527', '126497dca9fd696e741cb995f2c53ba04735fdafe1587abe19b6ca78df653b8c41', 7, 7, '5cc87c925a2b17283943fb1f86044af48ead16586839966cada2054818bbd262', '2009-01-15'),
(8, 'fef4e04f9f8c158be9abea0285e95e1fc54dd1dc7ee0bbe2ea8202825267b2515b', '09ec9fca55052d9a8771413f9a98b8f5bb836da3fcb270a969fca3af9288dfb36867f922', '8e41a8f03077e9dd576f445e9396c155234aa37be46e470ecc8e3b7270e2b8a66a4f7f9eb1c374cd3d675565e12776', '715424ec37f5e72577278ab0e177bc927d1ce04287154743a26decac08ecf0c0b187231334f677be', 'c39c84f88776bb0c352c97c572b2b8ea4e44e3fcb4e95290bef69e120e676b35896898f0e93bc3cf', 'ece5d2d6dfde73696980379e448373b1198ad63aa1907da12fd7a7ee1a38ae9b02', 8, 8, '35653a5f73f74fcaadc3394314210a873af60b568e7564a9d73f85f76cfbbea4', '2006-04-20'),
(9, '327930dee628f35cef80059fc61c6a58ff1636e3af43368dedffaed9f5faec', 'b349411d21e773beaf26d8bc37310256e325e740cce87a5d233924e5722040b8081b', '75ae2f5267423a4cbd43cfcfd6955e3c39ccdb3df8aa3ac2650e2a42cd07be917b6d42765b5f912c86a2bc7c48', '3a8ac4a22c5f68d09fa6cee68a004e27f8aa07e347a32c093dd09a217e00bf3d0b120999e4ad2903', '100655107dc19519260eed77e41fe600fd3e7bd6b02f57849805771e7e4f0e78429b158f221ad73c775b', '89b53a47745a70c7cc2a4744e77913b686a4cc6c00c3e9eae938d344352686077e', 9, 9, '0cb04dbb28854b6d13b72f5e4e65977bfda0ca0ef4d73ba50dc892982d73534d', '2008-08-25'),
(10, 'f016a71ac0d7300c21323b42bf68aac72605c81e71e611ae820dbf17728eae2b', 'b35c70acfe2985ebf61d1a1c844777a00f7f65358b17841ce54df0a87a86b7195f5632', '776e8a7f0aa4f5f1de4af6f4eb44045a0910fa4874ffe647b7600e25c11da0ea02f372f4cc48bf59260576478f01', '0da3dd45eecb71dc0574af2a207f3cc45a00e69df22714de6b4ece6bf91ad7241b3e57c56d5f9e84', 'd7c2400345be611a5289562515a30afdf2638412a100530c3446715ab1db8efa8457682a20e5', 'a96164ee653725cecb65f51a6346b346d164c0a38c889ea7d19ae1633b2bca5aa1', 10, 10, 'd0f8c0d9cec26ac1d0126f52ab6ef4a8854e0d1259e9caa3a07a0e2d8eaf35f4', '2007-12-30');

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
