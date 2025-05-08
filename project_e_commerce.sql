-- Database Creation
CREATE DATABASE E_commerce_DB;
USE E_commerce_DB;

-- Table Creation
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(255) NOT NULL
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    StockQuantity INT NOT NULL,
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATETIME NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


CREATE TABLE OrderDetails (
    DetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY,
    ProductID INT,
    CustomerID INT,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comment TEXT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Shipping (
    ShippingID INT PRIMARY KEY,
    OrderID INT,
    ShipDate DATETIME,
    DeliveryDate DATETIME,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

CREATE TABLE Discounts (
    DiscountID INT PRIMARY KEY,
    ProductID INT,
    DiscountAmount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Inserting records into the Categories table
INSERT INTO Categories (CategoryID, CategoryName) VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Home & Kitchen'),
(4, 'Books'),
(5, 'Beauty & Personal Care'),
(6, 'Sports & Outdoors');

-- Inserting records into the Products table
INSERT INTO Products (ProductID, Name, Price, StockQuantity, CategoryID)
VALUES
(101, 'Smartphone', 20000.00, 50, 1),   -- Electronics
(102, 'Laptop', 50000.00, 30, 1),        -- Electronics
(103, 'Wireless Headphones', 3000.00, 20, 1),  -- Electronics

(104, 'Men\'s T-Shirt', 599.00, 100, 2),  -- Clothing
(105, 'Women\'s Dress', 1299.00, 50, 2),  -- Clothing
(106, 'Jeans', 1499.00, 70, 2),           -- Clothing

(107, 'Cooking Pan', 899.00, 40, 3),      -- Home & Kitchen
(108, 'Blender', 2499.00, 20, 3),         -- Home & Kitchen
(109, 'Dish Soap', 99.00, 150, 3),        -- Home & Kitchen

(110, 'Fiction Novel', 399.00, 80, 4),    -- Books
(111, 'Cookbook', 499.00, 60, 4),         -- Books
(112, 'Self-Help Book', 299.00, 40, 4),   -- Books

(113, 'Face Wash', 299.00, 100, 5),       -- Beauty & Personal Care
(114, 'Shampoo', 599.00, 80, 5),          -- Beauty & Personal Care
(115, 'Moisturizer', 699.00, 70, 5),      -- Beauty & Personal Care

(116, 'Tennis Racket', 2499.00, 30, 6),   -- Sports & Outdoors
(117, 'Yoga Mat', 999.00, 50, 6),         -- Sports & Outdoors
(118, 'Dumbbells', 1999.00, 40, 6),       -- Sports & Outdoors
(119, "Children's Book"	,199.00, 120, 4),   -- Books
(120, 'Speaker', 2000.00, 7, 1); -- Electronics

-- Inserting records into the Customers table
INSERT INTO Customers (CustomerID, Name, Email)
VALUES
(1, 'Adam Smith', 'adamsmith1@gmail.com'),
(2, 'Eve Johnson', 'evejohnson2@gmail.com'),
(3, 'John Doe', 'johndoe3@gmail.com'),
(4, 'Jane Brown', 'janebrown4@gmail.com'),
(5, 'Michael Davis', 'michaeldavis5@gmail.com'),
(6, 'Sarah Wilson', 'sarahwilson6@gmail.com'),
(7, 'David Miller', 'davidmiller7@gmail.com'),
(8, 'Emily Garcia', 'emilygarcia8@gmail.com'),
(9, 'Daniel Martinez', 'danielmartinez9@gmail.com'),
(10, 'Laura Rodriguez', 'laurarodriguez10@gmail.com'),
(11, 'James Anderson', 'jamesanderson11@gmail.com'),
(12, 'Linda Thomas', 'lindathomas12@gmail.com'),
(13, 'Robert Taylor', 'roberttaylor13@gmail.com'),
(14, 'Patricia Hernandez', 'patriciahernandez14@gmail.com'),
(15, 'Charles Moore', 'charlesmoore15@gmail.com'),
(16, 'Jessica Jackson', 'jessicajackson16@gmail.com'),
(17, 'William White', 'williamwhite17@gmail.com'),
(18, 'Barbara Harris', 'barbaraharris18@gmail.com'),
(19, 'Joseph Martin', 'josephmartin19@gmail.com'),
(20, 'Susan Thompson', 'susanthompson20@gmail.com'),
(21, 'Thomas Garcia', 'thomasgarcia21@gmail.com'),
(22, 'Margaret Martinez', 'margaretmartinez22@gmail.com'),
(23, 'Christopher Robinson', 'christopherrobinson23@gmail.com'),
(24, 'Karen Clark', 'karenclark24@gmail.com'),
(25, 'Daniel Rodriguez', 'danielrodriguez25@gmail.com'),
(26, 'Nancy Lewis', 'nancylewis26@gmail.com'),
(27, 'Matthew Lee', 'matthewlee27@gmail.com'),
(28, 'Lisa Walker', 'lisawalker28@gmail.com'),
(29, 'Mark Hall', 'markhall29@gmail.com'),
(30, 'Kimberly Young', 'kimberlyyoung30@gmail.com'),
(31, 'Steven Allen', 'stevenallen31@gmail.com'),
(32, 'Jessica King', 'jessicaking32@gmail.com'),
(33, 'Paul Wright', 'paulwright33@gmail.com'),
(34, 'Angela Scott', 'angelascott34@gmail.com'),
(35, 'Andrew Green', 'andrewgreen35@gmail.com'),
(36, 'Deborah Adams', 'deborahadams36@gmail.com'),
(37, 'Joshua Baker', 'joshuabaker37@gmail.com'),
(38, 'Laura Gonzalez', 'lauragonzalez38@gmail.com'),
(39, 'Charles Nelson', 'charlesnelson39@gmail.com'),
(40, 'Samantha Carter', 'samanthacarter40@gmail.com'),
(41, 'Kevin Mitchell', 'kevinmitchell41@gmail.com'),
(42, 'Patricia Perez', 'patriciaperez42@gmail.com'),
(43, 'Brian Roberts', 'brianroberts43@gmail.com'),
(44, 'Jessica Turner', 'jessicaturner44@gmail.com'),
(45, 'Edward Phillips', 'edwardphillips45@gmail.com'),
(46, 'Angela Campbell', 'angelacampbell46@gmail.com'),
(47, 'Samuel Parker', 'samuelparker47@gmail.com'),
(48, 'Diana Evans', 'dianaevans48@gmail.com'),
(49, 'Richard Edwards', 'richardedwards49@gmail.com'),
(50, 'Laura Collins', 'lauracollins50@gmail.com'),
(51, 'Charles Stewart', 'charlesstewart51@gmail.com'),
(52, 'Nancy Sanchez', 'nancysanchez52@gmail.com'),
(53, 'Jason Morris', 'jasonmorris53@gmail.com'),
(54, 'Tina Rogers', 'tinarogers54@gmail.com'),
(55, 'Gary Reed', 'garyreed55@gmail.com'),
(56, 'Hannah Cook', 'hannahcook56@gmail.com'),
(57, 'Ryan Morgan', 'ryanmorgan57@gmail.com'),
(58, 'Victoria Bell', 'victoriabell58@gmail.com'),
(59, 'Frank Murphy', 'frankmurphy59@gmail.com'),
(60, 'Megan Cooper', 'megancooper60@gmail.com'),
(61, 'Scott Bailey', 'scottbailey61@gmail.com'),
(62, 'Katherine Rivera', 'katherinerivera62@gmail.com'),
(63, 'Bobby Jenkins', 'bobbyjenkins63@gmail.com'),
(64, 'Diane Powell', 'dianepowell64@gmail.com'),
(65, 'Aaron Long', 'aaronlong65@gmail.com'),
(66, 'Cynthia Patterson', 'cynthiapatterson66@gmail.com'),
(67, 'Henry Hughes', 'henryhughes67@gmail.com'),
(68, 'Rachel Flores', 'rachelflores68@gmail.com'),
(69, 'Gregory Ward', 'gregoryward69@gmail.com'),
(70, 'Shirley Cox', 'shirleycox70@gmail.com'),
(71, 'Roger Diaz', 'rogerdiaz71@gmail.com'),
(72, 'Judy Richardson', 'judyrichardson72@gmail.com'),
(73, 'Philip Wood', 'philipwood73@gmail.com'),
(74, 'Alice Watson', 'alicewatson74@gmail.com'),
(75, 'Jack Brooks', 'jackbrooks75@gmail.com'),
(76, 'Marie Kelly', 'mariekelly76@gmail.com'),
(77, 'Victor Sanders', 'victorsanders77@gmail.com'),
(78, 'Julia Price', 'juliaprice78@gmail.com'),
(79, 'Louis Bennett', 'loubennett79@gmail.com'),
(80, 'Sophie Wood', 'sophiewood80@gmail.com'),
(81, 'Billy Rivera', 'billyrivera81@gmail.com'),
(82, 'Evelyn Ramirez', 'evelynramirez82@gmail.com'),
(83, 'Dennis Bennett', 'dennisbennett83@gmail.com'),
(84, 'Angela Hughes', 'angelahughes84@gmail.com'),
(85, 'Derek Butler', 'derekbutler85@gmail.com'),
(86, 'Carmen Simmons', 'carmensimmons86@gmail.com'),
(87, 'Ralph Foster', 'ralphfoster87@gmail.com'),
(88, 'Fiona Gonzales', 'fionagonzales88@gmail.com'),
(89, 'Clara Warren', 'clarawarren89@gmail.com'),
(90, 'Jesse Knight', 'jesseknight90@gmail.com'),
(91, 'Cynthia Marshall', 'cynthiamarshall91@gmail.com'),
(92, 'Jackie Lane', 'jackielane92@gmail.com'),
(93, 'Ethan Hall', 'ethanhall93@gmail.com'),
(94, 'Alicia James', 'aliciajames94@gmail.com'),
(95, 'Tracy Morgan', 'tracymorgan95@gmail.com'),
(96, 'Chad Reed', 'chadreed96@gmail.com'),
(97, 'Wendy Price', 'wendyprice97@gmail.com'),
(98, 'Lori Ramos', 'loriramos98@gmail.com'),
(99, 'Shawn Foster', 'shawnfoster99@gmail.com'),
(100, 'Gina Torres', 'ginatorres100@gmail.com');
(101, 'john wick', 'johnwick1@gmail.com');
(102, 'Jane Doe', 'janedoe2@gmail.com'),
(103, 'David Lee', 'davidlee3@gmail.com'),
(104, 'Sarah Jones', 'sarahjones4@gmail.com'),
(105, 'Michael Brown', 'michaelbrown5@gmail.com'),
(106, 'Emily Davis', 'emilydavis6@gmail.com'),
(107, 'Daniel White', 'danielwhite7@gmail.com'),
(108, 'Olivia Miller', 'oliviamiller8@gmail.com'),
(109, 'James Wilson', 'jameswilson9@gmail.com');
-- Inserting records into the Orders table
INSERT INTO Orders (OrderID, CustomerID, OrderDate) VALUES
(1001, 1, '2023-01-01 01:00:00'),
(1002, 1, '2023-01-06 12:34:56'),
(1003, 2, '2023-01-11 08:15:30'),
(1004, 3, '2023-01-17 20:45:12'),
(1005, 4, '2023-01-21 19:30:00'),
(1006, 5, '2023-01-27 14:22:33'),

(1007, 6, '2023-02-02 03:45:00'),
(1008, 7, '2023-02-03 11:11:11'),
(1009, 8, '2023-02-16 22:22:22'),
(1010, 9, '2023-02-19 17:17:17'),
(1011, 10, '2023-02-26 09:09:09'),

(1012, 11, '2023-03-03 06:06:06'),
(1013, 12, '2023-03-06 15:15:15'),
(1014, 13, '2023-03-12 21:21:21'),
(1015, 14, '2023-03-18 18:18:18'),
(1016, 15, '2023-03-21 12:12:12'),

(1017, 16, '2023-04-01 02:02:02'),
(1018, 17, '2023-04-06 10:10:10'),
(1019, 18, '2023-04-11 16:16:16'),
(1020, 19, '2023-04-16 23:23:23'),
(1021, 20, '2023-04-28 14:14:14'),

(1022, 21, '2023-05-03 01:01:01'),
(1023, 22, '2023-05-07 11:11:11'),
(1024, 23, '2023-05-11 19:19:19'),
(1025, 24, '2023-05-17 07:07:07'),
(1026, 25, '2023-05-25 20:20:20'),

(1027, 26, '2023-06-02 04:04:04'),
(1028, 27, '2023-06-06 13:13:13'),
(1029, 28, '2023-06-12 22:22:22'),
(1030, 29, '2023-06-18 17:17:17'),
(1031, 30, '2023-06-24 12:12:12'),

(1032, 31, '2023-07-01 03:03:03'),
(1033, 32, '2023-07-09 09:09:09'),
(1034, 33, '2023-07-18 15:15:15'),
(1035, 34, '2023-07-19 21:21:21'),
(1036, 35, '2023-07-27 18:18:18'),

(1037, 36, '2023-08-06 02:02:02'),
(1038, 37, '2023-08-07 10:10:10'),
(1039, 38, '2023-08-12 14:14:14'),
(1040, 39, '2023-08-15 22:22:22'),
(1041, 40, '2023-08-20 19:19:19'),

(1042, 41, '2023-09-03 01:01:01'),
(1043, 42, '2023-09-09 11:11:11'),
(1044, 43, '2023-09-12 15:15:15'),
(1045, 44, '2023-09-17 20:20:20'),
(1046, 45, '2023-09-20 23:23:23'),
(1047, 46, '2023-09-25 14:14:14'),
(1048, 47, '2023-09-28 09:09:09'),

(1049, 48, '2023-10-01 03:03:03'),
(1050, 49, '2023-10-05 10:10:10'),
(1051, 50, '2023-10-10 15:15:15'),
(1052, 51, '2023-10-15 21:21:21'),
(1053, 52, '2023-10-20 18:18:18'),

(1054, 53, '2023-11-02 02:02:02'),
(1055, 54, '2023-11-06 12:12:12'),
(1056, 55, '2023-11-15 16:16:16'),
(1057, 56, '2023-11-18 20:20:20'),
(1058, 57, '2023-11-22 23:23:23'),

(1059, 58, '2023-12-08 01:01:01'),
(1060, 59, '2023-12-09 11:11:11'),
(1061, 60, '2023-12-10 15:15:15'),
(1062, 61, '2023-12-16 20:20:20'),
(1063, 62, '2023-12-26 22:22:22'),

(1064, 63, '2024-01-02 03:03:03'),
(1065, 64, '2024-01-06 09:09:09'),
(1066, 65, '2024-01-10 14:14:14'),
(1067, 66, '2024-01-12 19:19:19'),
(1068, 67, '2024-01-22 23:23:23'),

(1069, 68, '2024-02-01 02:02:02'),
(1070, 69, '2024-02-06 08:08:08'),
(1071, 70, '2024-02-11 13:13:13'),
(1072, 71, '2024-02-16 18:18:18'),
(1073, 72, '2024-02-23 22:22:22'),

(1074, 73, '2024-03-02 01:01:01'),
(1075, 74, '2024-03-05 10:10:10'),
(1076, 75, '2024-03-09 15:15:15'),
(1077, 76, '2024-03-16 20:20:20'),
(1078, 77, '2024-03-22 23:23:23'),

(1079, 78, '2024-04-01 04:04:04'),
(1080, 79, '2024-04-03 09:09:09'),
(1081, 80, '2024-04-11 14:14:14'),
(1082, 81, '2024-04-17 19:19:19'),
(1083, 82, '2024-04-23 23:23:23'),

(1084, 83, '2024-05-02 01:01:01'),
(1085, 84, '2024-05-04 12:12:12'),
(1086, 85, '2024-05-13 16:16:16'),
(1087, 86, '2024-05-17 20:20:20'),
(1088, 87, '2024-05-24 22:22:22'),

(1089, 88, '2024-06-01 03:03:03'),
(1090, 89, '2024-06-06 08:08:08'),
(1091, 90, '2024-06-17 14:14:14'),
(1092, 91, '2024-06-19 19:19:19'),
(1093, 92, '2024-06-23 23:23:23'),
(1094, 93, '2024-07-01 01:01:01'),
(1095, 94, '2024-07-05 12:12:12'),
(1096, 95, '2024-07-10 16:16:16'),

(1097, 96, '2024-07-15 20:20:20'),
(1098, 97, '2024-07-20 22:22:22'),
(1099, 98, '2024-08-02 03:03:03'),
(1100, 99, '2024-08-04 09:09:09'),
(1101, 100, '2024-08-12 14:14:14'),

(1102, 1, '2024-08-17 19:19:19'),
(1103, 2, '2024-08-22 23:23:23'),
(1104, 3, '2024-09-02 01:01:01'),
(1105, 4, '2024-09-04 12:12:12'),
(1106, 5, '2024-09-18 16:16:16'),

(1107, 6, '2024-09-19 20:20:20'),
(1108, 7, '2024-09-28 22:22:22'),
(1109, 8, '2024-10-01 03:03:03'),
(1110, 9, '2024-10-07 08:08:08'),
(1111, 10, '2024-10-14 14:14:14'),

(1112, 11, '2024-10-19 19:19:19'),
(1113, 12, '2024-10-23 23:23:23'),
(1114, 13, '2024-11-02 01:01:01'),
(1115, 14, '2024-11-04 12:12:12'),
(1116, 15, '2024-11-16 16:16:16'),

(1117, 16, '2024-11-19 20:20:20'),
(1118, 17, '2024-11-21 22:22:22'),
(1119, 18, '2024-11-22 03:03:03'),
(1120, 19, '2024-11-25 23:59:59');

INSERT INTO OrderDetails (DetailID, OrderID, ProductID, Quantity) VALUES
(1, 1001, 101, 2),
(2, 1002, 102, 3),
(3, 1003, 103, 5),
(4, 1004, 104, 1),
(5, 1005, 105, 4),
(6, 1006, 106, 2),
(7, 1007, 107, 3),
(8, 1008, 108, 6),
(9, 1009, 109, 1),
(10, 1010, 110, 4),
(11, 1011, 111, 2),
(12, 1012, 112, 5),
(13, 1013, 113, 3),
(14, 1014, 114, 1),
(15, 1015, 115, 4),
(16, 1016, 116, 2),
(17, 1017, 117, 5),
(18, 1018, 118, 3),
(19, 1019, 101, 2),
(20, 1020, 102, 4),

(21, 1021, 103, 5),
(22, 1022, 104, 3),
(23, 1023, 105, 1),
(24, 1024, 106, 2),
(25, 1025, 107, 4),
(26, 1026, 108, 5),
(27, 1027, 109, 2),
(28, 1028, 110, 3),
(29, 1029, 111, 1),
(30, 1030, 112, 4),
(31, 1031, 113, 5),
(32, 1032, 114, 2),
(33, 1033, 115, 3),
(34, 1034, 116, 1),
(35, 1035, 117, 4),
(36, 1036, 118, 5),
(37, 1037, 101, 2),
(38, 1038, 102, 3),
(39, 1039, 103, 4),
(40, 1040, 104, 5),

(41, 1041, 105, 1),
(42, 1042, 106, 2),
(43, 1043, 107, 3),
(44, 1044, 108, 4),
(45, 1045, 109, 5),
(46, 1046, 110, 1),
(47, 1047, 111, 2),
(48, 1048, 112, 3),
(49, 1049, 113, 4),
(50, 1050, 114, 5),
(51, 1051, 115, 1),
(52, 1052, 116, 2),
(53, 1053, 117, 3),
(54, 1054, 118, 4),
(55, 1055, 101, 5),
(56, 1056, 102, 2),
(57, 1057, 103, 3),
(58, 1058, 104, 1),
(59, 1059, 105, 4),
(60, 1060, 106, 5),

(61, 1061, 107, 2),
(62, 1062, 108, 3),
(63, 1063, 109, 1),
(64, 1064, 110, 4),
(65, 1065, 111, 5),
(66, 1066, 112, 2),
(67, 1067, 113, 3),
(68, 1068, 114, 4),
(69, 1069, 115, 1),
(70, 1070, 116, 2),
(71, 1071, 117,2),
(72, 1072, 118, 4),
(73, 1073, 101, 5),
(74, 1074, 102, 2),
(75, 1075, 103, 3),
(76, 1076, 104, 1),
(77, 1077, 105, 4),
(78, 1078, 106, 5),
(79, 1079, 107, 2),
(80, 1080, 108, 3),
(81, 1081, 109, 1),
(82, 1082, 110, 4),
(83, 1083, 111, 5),
(84, 1084, 112, 2),
(85, 1085, 113, 3),
(86, 1086, 114, 4),
(87, 1087, 115, 1),
(88, 1088, 116, 2),
(89, 1089, 117, 3),
(90, 1090, 118, 4),
(91, 1091, 101, 5),
(92, 1092, 102, 2),
(93, 1093, 103, 3),
(94, 1094, 104, 1),
(95, 1095, 105, 4),
(96, 1096, 106, 5),
(97, 1097, 107, 2),
(98, 1098, 108, 3),
(99, 1099, 109, 1),
(100, 1100, 110, 4),
(101, 1101, 111, 5),
(102, 1102, 112, 2),
(103, 1103, 113, 3),
(104, 1104, 114, 4),
(105, 1105, 115, 1),
(106, 1106, 116, 2),
(107, 1107, 117, 3),
(108, 1108, 118, 4),
(109, 1109, 101, 5),
(110, 1110, 102, 2),
(111, 1111, 103, 3),
(112, 1112, 104, 1),
(113, 1113, 105, 4),
(114, 1114, 106, 5),
(115, 1115, 107, 2),
(116, 1116, 108, 3),
(117, 1117, 109, 1),
(118, 1118, 110, 4),
(119, 1119, 111, 5),
(120, 1120, 112, 1);

INSERT INTO Reviews (ReviewID, ProductID, CustomerID, Rating, Comment) VALUES
(1, 101, 1, 5, 'Excellent product! Highly recommend.'),
(2, 102, 1, 4, 'Very good quality, satisfied with my purchase.'),
(3, 103, 2, 3, 'Average product, nothing special.'),
(4, 104, 3, 2, 'Not what I expected, disappointed.'),
(5, 105, 4, 1, 'Terrible experience, will not buy again.'),
(6, 106, 5, 5, 'Absolutely loved it! Will buy again.'),
(7, 107, 6, 4, 'Good value for money.'),
(8, 108, 7, 5, 'Amazing! Exceeded my expectations.'),
(9, 109, 8, 3, 'It’s okay, does the job.'),
(10, 110, 9, 4, 'Pretty good, would recommend.'),
(11, 111, 10, 5, 'Fantastic! Will tell my friends.'),
(12, 112, 11, 2, 'Not worth the price.'),
(13, 113, 12, 4, 'Very nice product, happy with my purchase.'),
(14, 114, 13, 3, 'Decent product, but could be better.'),
(15, 115, 14, 5, 'Loved it! Will buy more.'),
(16, 116, 15, 1, 'Horrible quality, very disappointed.'),
(17, 117, 16, 4, 'Good product, met my expectations.'),
(18, 118, 17, 5, 'Fantastic! Highly recommend.'),
(19, 101, 18, 2, 'Not great, could use improvements.'),
(20, 102, 19, 3, 'Average experience, okay product.'),
(21, 103, 20, 4, 'Good quality, satisfied.'),
(22, 104, 21, 5, 'Excellent purchase, very happy.'),
(23, 105, 22, 1, 'Did not like it at all.'),
(24, 106, 23, 5, 'Best product ever!'),
(25, 107, 24, 4, 'Good product, would buy again.'),
(26, 108, 25, 3, 'It’s okay, not bad.'),
(27, 109, 26, 2, 'Not satisfied, expected better.'),
(28, 110, 27, 4, 'Really good, happy with it.'),
(29, 111, 28, 5, 'Superb quality, highly recommend.'),
(30, 112, 29, 3, 'It’s decent, nothing extraordinary.'),
(31, 113, 30, 4, 'Very good product, satisfied.'),
(32, 114, 31, 2, 'Not worth the money.'),
(33, 115, 32, 5, 'Amazing! Will purchase again.'),
(34, 116, 33, 1, 'Terrible product, do not buy.'),
(35, 117, 34, 4, 'Good quality, met my expectations.'),
(36, 118, 35, 5, 'Fantastic! Highly recommend.'),
(37, 101, 36, 3, 'Average product, okay.'),
(38, 102, 37, 2, 'Not what I expected.'),
(39, 103, 38, 4, 'Good value for money.'),
(40, 104, 39, 5, 'Excellent quality! Highly recommend.'),
(41, 105, 40, 3, 'It’s decent, but nothing extraordinary.'),
(42, 106, 41, 4, 'Very good product, happy with my purchase.'),
(43, 107, 42, 2, 'Not what I expected, could be better.'),
(44, 108, 43, 5, 'Absolutely loved it! Will buy again.'),
(45, 109, 44, 4, 'Good value for money, satisfied.'),
(46, 110, 45, 3, 'Average product, nothing special.'),
(47, 111, 46, 1, 'Disappointed, expected better quality.'),
(48, 112, 47, 5, 'Fantastic! Exceeded my expectations.'),
(49, 113, 48, 4, 'Really good product, would recommend.'),
(50, 114, 49, 1, 'Terrible experience, will not buy again.'),
(51, 115, 50, 5, 'Loved it! Will tell my friends.'),
(52, 116, 51, 3, 'Decent product, could be better.'),
(53, 117, 52, 4, 'Very nice product, happy with my purchase.'),
(54, 118, 53, 2, 'Not worth the price.'),
(55, 101, 54, 4, 'Good quality, satisfied.'),
(56, 102, 55, 5, 'Best product ever!'),
(57, 103, 56, 3, 'Average experience, okay product.'),
(58, 104, 57, 5, 'Fantastic! Highly recommend.'),
(59, 105, 58, 4, 'Really good, happy with it.'),
(60, 106, 59, 2, 'Not what I expected.'),
(61, 107, 60, 5, 'Amazing! Will purchase again.'),
(62, 108, 61, 1, 'Terrible product, do not buy.'),
(63, 109, 62, 4, 'Good quality, met my expectations.'),
(64, 110, 63, 5, 'Fantastic! Highly recommend.'),
(65, 111, 64, 3, 'Average product, okay.'),
(66, 112, 65, 2, 'Not worth the price.'),
(67, 113, 66, 5, 'Absolutely loved it!'),
(68, 114, 67, 1, 'Very disappointed with this product.'),
(69, 115, 68, 5, 'Best purchase I’ve made!'),
(70, 116, 69, 4, 'Really good product, would recommend.'),
(71, 117, 70, 3, 'Decent product, nothing special.'),
(72, 118, 71, 2, 'Not worth the money.'),
(73, 101, 72, 5, 'Amazing! Will buy again.'),
(74, 102, 73, 1, 'Terrible product, do not buy.'),
(75, 103, 74, 4, 'Good quality, met my expectations.'),
(76, 104, 75, 5, 'Fantastic! Highly recommend.'),
(77, 105, 76, 3, 'Average product, okay.'),
(78, 106, 77, 2, 'Not what I expected.'),
(79, 107, 78, 4, 'Good value for money.'),
(80, 108, 79, 5, 'Absolutely loved it!'),
(81, 109, 80, 1, 'Very disappointed with this product.'),
(82, 110, 81, 5, 'Best purchase I’ve made!'),
(83, 111, 82, 4, 'Really good product, would recommend.'),
(84, 112, 83, 3, 'Decent product, nothing special.'),
(85, 113, 84, 2, 'Not worth the price.'),
(86, 114, 85, 5, 'Loved it! Will tell my friends.'),
(87, 115, 86, 4, 'Good quality, satisfied.'),
(88, 116, 87, 3, 'Average experience, okay product.'),
(89, 117, 88, 2, 'Not worth the money.'),
(90, 118, 89, 5, 'Amazing! Will buy again.'),
(91, 101, 90, 1, 'Terrible product, do not buy.'),
(92, 102, 91, 5, 'Fantastic! Highly recommend.'),
(93, 103, 92, 4, 'Really good product, would recommend.'),
(94, 104, 93, 3, 'Decent product, could be better.'),
(95, 105, 94, 2, 'Not satisfied, expected better.'),
(96, 106, 95, 5, 'Best product ever!'),
(97, 107, 96, 4, 'Good value for money, satisfied.'),
(98, 108, 97, 3, 'Average product, nothing special.'),
(99, 109, 98, 1, 'Disappointed, expected better quality.'),
(100, 110, 99, 5, 'Absolutely loved it! Will buy again.'),
(101, 111, 100, 4, 'Very good product, happy with my purchase.'),
(102, 112, 1, 3, 'It’s okay, does the job.'),
(103, 113, 2, 5, 'Fantastic! Highly recommend.'),
(104, 114, 3, 2, 'Not what I expected, disappointed.'),
(105, 115, 4, 4, 'Good quality, satisfied.'),
(106, 116, 5, 1, 'Terrible experience, will not buy again.'),
(107, 117, 6, 5, 'Loved it! Will tell my friends.'),
(108, 118, 7, 4, 'Good product, happy with it.'),
(109, 101, 8, 3, 'Decent product, nothing extraordinary.'),
(110, 102, 9, 2, 'Not worth the price.'),
(111, 103, 10, 5, 'Best product ever!'),
(112, 104, 11, 4, 'Really good, happy with it.'),
(113, 105, 12, 3, 'Average experience, okay product.'),
(114, 106, 13, 5, 'Fantastic! Highly recommend.'),
(115, 107, 14, 2, 'Not what I expected.'),
(116, 108, 15, 4, 'Good quality, met my expectations.'),
(117, 109, 16, 5, 'Absolutely loved it! Will buy again.'),
(118, 110, 17, 3, 'Decent product, could be better.'),
(119, 111, 18, 4, 'Good value for money.'),
(120, 112, 19, 1, 'Terrible product, do not buy.');

INSERT INTO Shipping (ShippingID, OrderID, ShipDate, DeliveryDate) VALUES
(1, 1001, '2023-01-02 02:00:50', '2023-01-03 01:00:00'),
(2, 1002, '2023-01-07 13:30:57', '2023-01-08 12:34:56'),
(3, 1003, '2023-01-12 08:15:30', '2023-01-13 08:15:30'),
(4, 1004, '2023-01-18 21:45:12', '2023-01-19 20:45:12'),
(5, 1005, '2023-01-22 20:30:00', '2023-01-23 19:30:00'),
(6, 1006, '2023-01-28 16:22:33', '2023-01-29 14:22:33'),
(7, 1007, '2023-02-03 03:45:00', '2023-02-04 03:45:00'),
(8, 1008, '2023-02-04 11:11:11', '2023-02-05 11:11:11'),
(9, 1009, '2023-02-17 22:22:22', '2023-02-18 22:22:22'),
(10, 1010, '2023-02-20 17:17:17', '2023-02-21 17:17:17'),
(11, 1011, '2023-02-27 09:09:09', '2023-02-28 09:09:09'),
(12, 1012, '2023-03-04 06:06:06', '2023-03-05 06:06:06'),
(13, 1013, '2023-03-07 15:15:15', '2023-03-08 15:15:15'),
(14, 1014, '2023-03-13 21:21:21', '2023-03-14 21:21:21'),
(15, 1015, '2023-03-19 18:18:18', '2023-03-20 18:18:18'),
(16, 1016, '2023-03-22 12:12:12', '2023-03-23 12:12:12'),
(17, 1017, '2023-04-02 02:02:02', '2023-04-03 02:02:02'),
(18, 1018, '2023-04-07 10:10:10', '2023-04-08 10:10:10'),
(19, 1019, '2023-04-12 16:16:16', '2023-04-13 16:16:16'),
(20, 1020, '2023-04-17 23:23:23', '2023-04-18 23:23:23'),
(21, 1021, '2023-04-29 14:14:14', '2023-04-30 14:14:14'),
(22, 1022, '2023-05-04 01:01:01', '2023-05-05 01:01:01'),
(23, 1023, '2023-05-08 11:11:11', '2023-05-09 11:11:11'),
(24, 1024, '2023-05-12 19:19:19', '2023-05-13 19:19:19'),
(25, 1025, '2023-05-18 07:07:07', '2023-05-19 07:07:07'),
(26, 1026, '2023-05-26 20:20:20', '2023-05-27 20:20:20'),
(27, 1027, '2023-06-03 04:04:04', '2023-06-04 04:04:04'),
(28, 1028, '2023-06-07 13:13:13', '2023-06-08 13:13:13'),
(29, 1029, '2023-06-13 22:22:22', '2023-06-14 22:22:22'),
(30, 1030, '2023-06-19 17:17:17', '2023-06-20 17:17:17'),
(31, 1031, '2023-06-25 12:12:12', '2023-06-26 12:12:12'),
(32, 1032, '2023-07-02 03:03:03', '2023-07-03 03:03:03'),
(33, 1033, '2023-07-10 09:09:09', '2023-07-11 09:09:09'),
(34, 1034, '2023-07-19 15:15:15', '2023-07-20 15:15:15'),
(35, 1035, '2023-07-20 21:21:21', '2023-07-21 21:21:21'),
(36, 1036, '2023-07-28 18:18:18', '2023-07-29 18:18:18'),
(37, 1037, '2023-08-07 02:02:02', '2023-08-08 02:02:02'),
(38, 1038, '2023-08-08 10:10:10', '2023-08-09 10:10:10'),
(39, 1039, '2023-08-13 14:14:14', '2023-08-14 14:14:14'),
(40, 1040, '2023-08-16 22:22:22', '2023-08-17 22:22:22'),
(41, 1041, '2023-08-21 19:19:19', '2023-08-22 19:10:19'),
(42, 1042, '2023-09-04 01:01:01', '2023-09-05 01:01:01'),
(43, 1043, '2023-09-10 11:11:11', '2023-09-11 11:00:11'),
(44, 1044, '2023-09-13 15:15:15', '2023-09-14 15:15:15'),
(45, 1045, '2023-09-18 20:20:20', '2023-09-19 20:20:20'),
(46, 1046, '2023-09-21 23:23:23', '2023-09-22 23:23:23'),
(47, 1047, '2023-09-26 14:14:14', '2023-09-27 14:14:14'),
(48, 1048, '2023-09-29 09:09:09', '2023-09-30 09:09:09'),
(49, 1049, '2023-10-02 03:03:03', '2023-10-03 03:03:03'),
(50, 1050, '2023-10-06 10:10:10', '2023-10-07 10:10:10'),
(51, 1051, '2023-10-11 15:15:15', '2023-10-12 15:15:15'),
(52, 1052, '2023-10-16 21:21:21', '2023-10-17 21:21:21'),
(53, 1053, '2023-10-21 18:18:18', '2023-10-22 18:18:18'),
(54, 1054, '2023-11-03 02:02:02', '2023-11-04 02:02:02'),
(55, 1055, '2023-11-07 12:12:12', '2023-11-08 12:12:12'),
(56, 1056, '2023-11-16 16:16:16', '2023-11-17 16:16:16'),
(57, 1057, '2023-11-19 20:20:20', '2023-11-20 20:20:20'),
(58, 1058, '2023-11-23 23:00:00', '2023-11-24 23:00:50'),
(59, 1059, '2023-12-09 01:01:01', '2023-12-10 01:01:01'),
(60, 1060, '2023-12-10 11:11:11', '2023-12-11 11:11:11'),
(61, 1061, '2023-12-11 15:15:15', '2023-12-12 15:15:15'),
(62, 1062, '2023-12-17 20:20:20', '2023-12-18 20:20:20'),
(63, 1063, '2023-12-27 22:22:22', '2023-12-28 22:22:22'),
(64, 1064, '2024-01-03 03:03:03', '2024-01-04 03:03:03'),
(65, 1065, '2024-01-07 09:09:09', '2024-01-08 09:09:09'),
(66, 1066, '2024-01-11 14:14:14', '2024-01-12 14:14:14'),
(67, 1067, '2024-01-13 19:19:19', '2024-01-14 19:19:19'),
(68, 1068, '2024-01-23 23:23:23', '2024-01-24 23:23:23'),
(69, 1069, '2024-02-02 02:02:02', '2024-02-03 02:02:02'),
(70, 1070, '2024-02-07 08:08:08', '2024-02-08 08:08:08'),
(71, 1071, '2024-02-12 13:13:13', '2024-02-13 13:13:13'),
(72, 1072, '2024-02-17 18:18:18', '2024-02-18 18:18:18'),
(73, 1073, '2024-02-24 22:22:22', '2024-02-25 22:22:22'),
(74, 1074, '2024-03-03 01:01:01', '2024-03-04 01:01:01'),
(75, 1075, '2024-03-06 10:10:10', '2024-03-07 10:10:10'),
(76, 1076, '2024-03-10 15:15:15', '2024-03-11 15:15:15'),
(77, 1077, '2024-03-17 20:20:20', '2024-03-18 20:20:20'),
(78, 1078, '2024-03-23 23:23:23', '2024-03-24 23:23:23'),
(79, 1079, '2024-04-02 04:04:04', '2024-04-03 04:04:04'),
(80, 1080, '2024-04-04 09:09:09', '2024-04-05 09:09:09'),
(81, 1081, '2024-04-12 14:14:14', '2024-04-13 14:14:14'),
(82, 1082, '2024-04-18 19:19:19', '2024-04-19 19:19:19'),
(83, 1083, '2024-04-24 23:23:23', '2024-04-25 23:23:23'),
(84, 1084, '2024-05-03 01:01:01', '2024-05-04 01:01:01'),
(85, 1085, '2024-05-05 12:12:12', '2024-05-06 12:12:12'),
(86, 1086, '2024-05-14 16:16:16', '2024-05-15 16:16:16'),
(87, 1087, '2024-05-18 20:20:20', '2024-05-19 20:20:20'),
(88, 1088, '2024-05-25 22:22:22', '2024-05-26 22:22:22'),
(89, 1089, '2024-06-02 03:03:03', '2024-06-03 03:03:03'),
(90, 1090, '2024-06-07 08:08:08', '2024-06-08 08:08:08'),
(91, 1091, '2024-06-18 14:14:14', '2024-06-19 14:14:14'),
(92, 1092, '2024-06-20 19:19:19', '2024-06-21 19:19:19'),
(93, 1093, '2024-06-24 23:23:23', '2024-06-25 23:23:23'),
(94, 1094, '2024-07-02 01:01:01', '2024-07-03 01:01:01'),
(95, 1095, '2024-07-06 12:12:12', '2024-07-07 12:12:12'),
(96, 1096, '2024-07-11 16:16:16', '2024-07-12 16:16:16'),
(97, 1097, '2024-07-16 20:20:20', '2024-07-17 20:20:20'),
(98, 1098, '2024-07-21 22:22:22', '2024-07-22 22:22:22'),
(99, 1099, '2024-08-03 03:03:03', '2024-08-04 03:03:03'),
(100, 1100, '2024-08-05 09:09:09', '2024-08-06 09:09:09'),
(101, 1101, '2024-08-13 14:14:14', '2024-08-14 14:14:14'),
(102, 1102, '2024-08-18 19:19:19', '2024-08-19 19:19:19'),
(103, 1103, '2024-08-23 23:23:23', '2024-08-24 23:23:23'),
(104, 1104, '2024-09-03 01:01:01', '2024-09-04 01:01:01'),
(105, 1105, '2024-09-05 12:12:12', '2024-09-06 12:12:12'),
(106, 1106, '2024-09-19 16:16:16', '2024-09-20 16:16:16'),
(107, 1107, '2024-09-20 20:20:20', '2024-09-21 20:20:20'),
(108, 1108, '2024-09-29 22:22:22', '2024-09-30 22:22:22'),
(109, 1109, '2024-10-02 03:03:03', '2024-10-03 03:03:03'),
(110, 1110, '2024-10-06 09:09:09', '2024-10-07 09:09:09'),
(111, 1111, '2024-10-11 14:14:14', '2024-10-12 14:14:14'),
(112, 1112, '2024-10-16 19:19:19', '2024-10-17 19:19:19'),
(113, 1113, '2024-10-21 23:23:23', '2024-10-22 23:23:23'),
(114, 1114, '2024-10-26 01:01:01', '2024-10-27 01:01:01'),
(115, 1115, '2024-10-31 12:12:12', '2024-11-01 12:12:12'),
(116, 1116, '2024-11-06 16:16:16', '2024-11-07 16:16:16'),
(117, 1117, '2024-11-11 20:20:20', '2024-11-12 20:20:20'),
(118, 1118, '2024-11-16 23:23:23', '2024-11-17 23:23:23'),
(119, 1119, '2024-11-21 04:04:04', '2024-11-22 04:04:04'),
(120, 1120, '2024-11-26 09:09:09', '2024-11-27 09:09:09');

INSERT INTO Discounts (DiscountID, ProductID, DiscountAmount) VALUES                    
(1, 101, 1500.00),  -- Discount on Smartphone
(2, 102, 5000.00),  -- Discount on Laptop
(3, 104, 100.00),   -- Discount on Men's T-Shirt
(4, 105, 200.00),   -- Discount on Women's Dress
(5, 107, 50.00),    -- Discount on Cooking Pan
(6, 108, 250.00),   -- Discount on Blender
(7, 111, 30.00),   -- Discount on Cookbook
(8, 114, 50.00),   -- Discount on Shampoo
(9, 115, 70.00),   -- Discount on Moisturizer
(10, 116, 300.00),  -- Discount on Tennis Racket
(11, 117, 100.00),  -- Discount on Yoga Mat
(12, 118, 200.00);  -- Discount on Dumbbells 


USE e_commerce_db
--  1. Total number of products in each category
SELECT c.CategoryName, COUNT(p.ProductID) AS TotalProducts
FROM Categories c
LEFT JOIN Products p ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryName;

-- 2. Total sales amount for each product
SELECT p.Name, SUM(od.Quantity * p.Price) AS TotalSales
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.Name;

-- 3. Average rating of each product
SELECT p.Name, AVG(r.Rating) AS AverageRating
FROM Products p
LEFT JOIN Reviews r ON p.ProductID = r.ProductID
GROUP BY p.Name;

-- 4.Top 5 customers by total spending
SELECT c.Name, SUM(od.Quantity * p.Price) AS TotalSpent
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY c.Name
ORDER BY TotalSpent DESC
LIMIT 5;

-- 5. the total revenue generated from all orders
SELECT SUM(od.Quantity * p.Price) AS TotalRevenue
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID;

-- 6. Total number of orders placed by top 5 Customers
SELECT c.Name, COUNT(o.OrderID) AS TotalOrders
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.Name
ORDER BY TotalOrders DESC
LIMIT 5;

-- 7. Products with discounts greater than 200
SELECT p.Name, d.DiscountAmount
FROM Products p
JOIN Discounts d ON p.ProductID = d.ProductID
WHERE d.DiscountAmount > 200;

-- 8. Total quantity of products sold for each category
SELECT c.CategoryName, SUM(od.Quantity) AS TotalQuantitySold
FROM Categories c
JOIN Products p ON c.CategoryID = p.CategoryID
JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY c.CategoryName
ORDER BY TotalQuantitySold DESC;

-- 9.Customers who have purchased more than 1 different products
SELECT c.Name FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY c.CustomerID
HAVING COUNT(DISTINCT od.ProductID) > 1; 

-- 10. Average price of products in each category
SELECT c.CategoryName, AVG(p.Price) AS AveragePrice
FROM Categories c
JOIN Products p ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryName;

-- 11. Total number of reviews for each product
SELECT p.Name, COUNT(r.ReviewID) AS TotalReviews
FROM Products p
LEFT JOIN Reviews r ON p.ProductID = r.ProductID
GROUP BY p.Name;
 
-- 12. Top 5 products by total sales
SELECT p.Name, SUM(od.Quantity) AS TotalSold
FROM Products p
JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY p.Name
ORDER BY TotalSold DESC
LIMIT 5;

-- 13.Total discounts applied to each product
SELECT p.Name, SUM(d.DiscountAmount) AS TotalDiscount
FROM Products p
LEFT JOIN Discounts d ON p.ProductID = d.ProductID
GROUP BY p.Name;

-- 14. How many orders were placed in the last month
SELECT COUNT(*) AS OrdersLastMonth
FROM Orders
WHERE OrderDate >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH);

-- 15. Products with the highest average rating
SELECT p.Name, AVG(r.Rating) AS AverageRating
FROM Products p
JOIN Reviews r ON p.ProductID = r.ProductID
GROUP BY p.Name
ORDER BY AverageRating DESC
LIMIT 5;  

-- 16. Total Revenue Generated in the Last Month
SELECT SUM(od.Quantity * p.Price) AS TotalRevenueLastMonth
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE o.OrderDate >= NOW() - INTERVAL 1 MONTH;

-- 17.Total Revenue by Year
SELECT YEAR(o.OrderDate) AS OrderYear, SUM(od.Quantity * p.Price) AS TotalRevenue
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
JOIN Orders o ON od.OrderID = o.OrderID
GROUP BY YEAR(o.OrderDate)
ORDER BY OrderYear ASC;

-- 18. Total Revenue for Every Month of the Year 2024
SELECT MONTH(o.OrderDate) AS OrderMonth, SUM(od.Quantity * p.Price) AS TotalRevenue
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
JOIN Orders o ON od.OrderID = o.OrderID
WHERE YEAR(o.OrderDate) = 2024
GROUP BY MONTH(o.OrderDate)
ORDER BY TotalRevenue desc;

-- 19. Top 3 categories by total sales
SELECT c.CategoryName, SUM(od.Quantity * p.Price) AS TotalSales
FROM Categories c
JOIN Products p ON c.CategoryID = p.CategoryID
JOIN OrderDetails od ON p.ProductID = od.ProductID
JOIN Orders o ON od.OrderID = o.OrderID
GROUP BY c.CategoryName
ORDER BY TotalSales DESC
LIMIT 3;

-- 20. Total number of products in stock for each category
SELECT c.CategoryName, SUM(p.StockQuantity) AS TotalStock
FROM Categories c
JOIN Products p ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryName;

-- 21. Revenue by Quarter of previous year 2023
SELECT YEAR(o.OrderDate) AS Year, 
    QUARTER(o.OrderDate) AS Quarter, 
    SUM(od.Quantity * p.Price) AS Revenue
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE YEAR(o.OrderDate) = 2023
GROUP BY YEAR(o.OrderDate), QUARTER(o.OrderDate);

-- 22.  Highest Earning Month of 2023
SELECT YEAR(o.OrderDate), MONTH(o.OrderDate) AS Month, SUM(od.Quantity * p.Price) AS Revenue
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE YEAR(o.OrderDate) = 2023
GROUP BY YEAR(o.OrderDate), MONTH(o.OrderDate)
ORDER BY Revenue DESC
LIMIT 1;

-- 23.Total sales on weekends vs weekdays IN YEAR 2023
SELECT CASE 
         WHEN DAYOFWEEK(o.OrderDate) IN (1, 7) THEN 'Weekend'
         ELSE 'Weekday'
       END AS DayType,
       SUM(od.Quantity * p.Price) AS TotalSales
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE YEAR(o.OrderDate) = 2023
GROUP BY DayType;

-- 24. Obtain All Nagative  Reviews (Rating 1 or 2) Given by Customers to Products
SELECT r.ReviewID, r.Comment, r.Rating, p.Name AS product_name, c.Name AS Customer_name 
FROM Reviews r
JOIN Products p ON r.ProductID = p.ProductID
JOIN Customers c ON r.CustomerID = c.CustomerID
WHERE r.Rating <= 2
limit 10;

-- 25. What is the total discount amount applied across all orders
SELECT SUM(d.DiscountAmount) AS TotalDiscount
FROM Discounts d
JOIN Products p ON d.ProductID = p.ProductID
JOIN OrderDetails od ON p.ProductID = od.ProductID;

-- 26. Quarterly sales performance for 2024
SELECT YEAR(o.OrderDate) AS Year, 
    QUARTER(o.OrderDate) AS Quarter, 
    SUM(od.Quantity * p.Price) AS Revenue
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE YEAR(o.OrderDate) = 2024
GROUP BY YEAR(o.OrderDate), QUARTER(o.OrderDate);

-- 27.  Highest Earning Month of 2024
SELECT YEAR(o.OrderDate), MONTH(o.OrderDate) AS Month, SUM(od.Quantity * p.Price) AS Revenue
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE YEAR(o.OrderDate) = 2024
GROUP BY YEAR(o.OrderDate), MONTH(o.OrderDate)
ORDER BY Revenue DESC
LIMIT 1;

-- 28. Identify the Best-Selling Product
SELECT p.Name AS ProductName, SUM(od.Quantity) AS TotalSold
FROM Products p
JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY p.ProductID
ORDER BY TotalSold DESC
LIMIT 1;

-- 29 Total sales on weekends vs weekdays IN YEAR 2024
SELECT CASE 
         WHEN DAYOFWEEK(o.OrderDate) IN (1, 7) THEN 'Weekend'
         ELSE 'Weekday'
       END AS DayType,
       SUM(od.Quantity * p.Price) AS TotalSales
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE YEAR(o.OrderDate) = 2024
GROUP BY DayType;

-- 30. Identify the Least-Selling Product
SELECT p.Name AS ProductName, SUM(od.Quantity) AS TotalSold
FROM Products p
JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY p.ProductID
ORDER BY TotalSold ASC
LIMIT 1;

-- 31. Products without any discounts
SELECT p.Name
FROM Products p
LEFT JOIN Discounts d ON p.ProductID = d.ProductID
WHERE d.DiscountAmount IS NULL;

-- 32. Obtain All Positive Reviews (Rating 4 or 5) Given by Customers to Products
SELECT r.ReviewID, r.Comment, r.Rating, p.Name AS product_name, c.Name AS Customer_name
FROM Reviews r
JOIN Products p ON r.ProductID = p.ProductID
JOIN Customers c ON r.CustomerID = c.CustomerID
WHERE r.Rating >= 4
limit 10;
 
-- 33. Get the Number of Reviews for Each Product 
SELECT p.ProductID, p.Name, COUNT(r.ReviewID) AS ReviewCount
FROM Products p
LEFT JOIN Reviews r ON p.ProductID = r.ProductID
GROUP BY p.ProductID, p.Name;

-- 34. the total number of orders delivered in the first half of the year 2024

SELECT COUNT(o.OrderID) AS TotalOrdersDelivered
FROM Orders o
JOIN Shipping s ON o.OrderID = s.OrderID
WHERE s.DeliveryDate >= '2024-01-01' AND s.DeliveryDate <= '2024-06-30';

-- 35. Get Products with No Reviews
SELECT p.ProductID, p.Name
FROM Products p
LEFT JOIN Reviews r ON p.ProductID = r.ProductID
WHERE r.ReviewID IS NULL;

-- 36. The sales of each category where total sales exceeds 80000
SELECT c.CategoryName, SUM(od.Quantity * p.Price) AS TotalSales
FROM Categories c
JOIN Products p ON c.CategoryID = p.CategoryID
JOIN OrderDetails od ON p.ProductID = od.ProductID
JOIN Orders o ON od.OrderID = o.OrderID
GROUP BY c.CategoryName
having TotalSales > 80000;

-- 37. Get Products with an Average Rating Below 3
SELECT p.ProductID, p.Name, AVG(r.Rating) AS AverageRating
FROM Products p
JOIN Reviews r ON p.ProductID = r.ProductID
GROUP BY p.ProductID, p.Name
HAVING AVG(r.Rating) < 3;

-- 38. Show Product Wise Min, Max, Avg, Count, Sum Orders
SELECT p.ProductID, p.Name,
    MIN(od.Quantity) AS MinOrderQuantity,
    MAX(od.Quantity) AS MaxOrderQuantity,
    AVG(od.Quantity) AS AvgOrderQuantity,
    COUNT(od.DetailID) AS OrderCount,
    SUM(od.Quantity) AS TotalOrdered
FROM Products p
LEFT JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.Name;

-- 39. Find Average Delivery Time from OrderDate to DeliveryDate
SELECT AVG(DATEDIFF(s.DeliveryDate, o.OrderDate)) AS AvgDeliveryTime
FROM Orders o
JOIN Shipping s ON o.OrderID = s.OrderID;

-- 40. Get Total Quantity Sold for Each Product
SELECT p.ProductID, p.Name, SUM(od.Quantity) AS TotalSold
FROM Products p
JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.Name;

-- 41. Get Customers Who Have Not Placed Any Orders
SELECT c.CustomerID, c.Name
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;

-- 42. Get All Orders with Shipping Information
SELECT o.OrderID, o.OrderDate, s.ShipDate, s.DeliveryDate
FROM Orders o
JOIN Shipping s ON o.OrderID = s.OrderID
limit 10;

-- 43. Get the Lowest Rated Product
SELECT p.ProductID, p.Name, AVG(r.Rating) AS AverageRating
FROM Products p
JOIN Reviews r ON p.ProductID = r.ProductID
GROUP BY p.ProductID, p.Name
ORDER BY AverageRating ASC
LIMIT 1;

-- 44. Get All Products with Stock quantity below 10
SELECT p.ProductID, p.Name, p.StockQuantity
FROM Products p
WHERE p.StockQuantity < 10;

-- 45. Get All Orders with More Than 5 Items
SELECT o.OrderID, SUM(od.Quantity) AS TotalItems
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY o.OrderID
HAVING TotalItems > 5;

-- 46. Get All Products That Have Never Been Ordered
SELECT p.ProductID, p.Name
FROM Products p
LEFT JOIN OrderDetails od ON p.ProductID = od.ProductID
WHERE od.DetailID IS NULL;

-- 47. Get All Products with Their Categories and Discounts 
SELECT p.ProductID, p.Name, c.CategoryName, d.DiscountAmount
FROM Products p
JOIN Categories c ON p.CategoryID = c.CategoryID
LEFT JOIN Discounts d ON p.ProductID = d.ProductID
order by d.DiscountAmount DESC
LIMIT 12;

-- 48. Total Revenue for the 4th Quarter of 2024
SELECT SUM(od.Quantity * p.Price) AS 4th_qtr_Revenue
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE QUARTER(o.OrderDate) = 4 AND YEAR(o.OrderDate) = 2024;

-- 49. Get the Most Popular Product Based on Sales Volume
SELECT p.ProductID, p.Name, 
       (SELECT SUM(od.Quantity) 
        FROM OrderDetails od 
        WHERE od.ProductID = p.ProductID) AS TotalSalesVolume
FROM Products p
ORDER BY TotalSalesVolume DESC
LIMIT 3;

-- 50. Deliveries between 6:00 AM and 12:00 PM (Morning Deliveries)
SELECT ShippingId, OrderId, DATE(deliverydate) AS Delivery_date, TIME(deliverydate) AS Delivery_Time
FROM shipping
WHERE HOUR(deliverydate) >= 6 AND HOUR(deliverydate) < 12
order by Delivery_date
limit 10;