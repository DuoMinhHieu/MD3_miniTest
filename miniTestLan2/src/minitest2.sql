create database minitestlan2;
use minitestlan2;

CREATE TABLE Address (
                         id INT PRIMARY KEY,
                         address VARCHAR(255)
);
INSERT INTO Address (id, address) VALUES
                                      (444, 'Phu Dien'),
                                      (222, 'Cau Giay'),
                                      (333, 'Ham Nghi'),
                                      (111, 'Tay Ho'),
                                      (555, 'Xuan Thuy');



CREATE TABLE Class (
                       id INT PRIMARY KEY,
                       name VARCHAR(255),
                       language VARCHAR(100),
                       description TEXT
);
INSERT INTO Class (id, name, language, description) VALUES
                                                        (1, 'English', 'English', 'reading and writing'),
                                                        (2, 'Math', 'vietnames', 'calculation data'),
                                                        (3, 'Physics', 'vietnames', 'natural Sciences'),
                                                        (4, 'Information technology', 'vietnames', 'computer data'),
                                                        (5, 'Music class', 'vietnames', 'singing');
DELETE FROM Class WHERE id BETWEEN 10 AND 50;
UPDATE Class SET name = 'Music class' WHERE id = 5;


CREATE TABLE Students (
                          id INT PRIMARY KEY,
                          fullname VARCHAR(255),
                          address_id INT,
                          age INT,
                          phone VARCHAR(20) UNIQUE,
                          classes_id INT,
                          FOREIGN KEY (address_id) REFERENCES Address(id),
                          FOREIGN KEY (classes_id) REFERENCES Class(id)
);
INSERT INTO Students (id, fullname, address_id, age, phone, classes_id) VALUES
                                                                            (1, 'Duong Minh Hieu', 111, 10, '111111111', 1),
                                                                            (2, 'Phan Thanh Thao', 222, 11, '222222222', 2),
                                                                            (3, 'Trinh Luu Khoa', 333, 12, '333333333', 3),
                                                                            (4, 'Nguyen Tat Quan', 444, 13, '444444444', 4),
                                                                            (5, 'Tran Ngoc Duy', 555, 14, '5555555555', 5),
                                                                            (6, 'Le Viet Hung', 111, 15, '666666666', 1),
                                                                            (7, 'Phan Quyet Thang', 222, 16, '777777777', 2),
                                                                            (12, 'Nguyen Dinh Thong', 333, 17, '888888888', 3),
                                                                            (13, 'Nguyen Tuan Anh', 444, 18, '999999999', 4),
                                                                            (10, 'Tran Dinh Loc', 555, 19, '000000000', 5);



CREATE TABLE Course (
                        id INT PRIMARY KEY,
                        name VARCHAR(255),
                        description TEXT
);
INSERT INTO Course (id, name, description) VALUES
                                               (1, 'singing class', 'sing1'),
                                               (2, 'singing class', 'sing2'),
                                               (3, 'singing class', 'sing3'),
                                               (4, 'singing class', 'sing4'),
                                               (5, 'singing class','sing5'),
                                               (6, 'singing class','sing6'),
                                               (7, 'singing class','sing7'),
                                               (8, 'singing class','sing8'),
                                               (9, 'singing class','sing9'),
                                               (10,'singing class','sing10'),
                                               (11,'singing class','sing11'),
                                               (12,'singing class','sing12'),
                                               (13,'singing class','sing13'),
                                               (14,'singing class','sing14'),
                                               (15,'singing class','sing15'),
                                               (16,'singing class','sing16'),
                                               (17,'singing class','sing17'),
                                               (18,'singing class','sing18'),
                                               (19,'singing class','sing19'),
                                               (20,'singing class', 'sing20');


CREATE TABLE Point (
                       id INT PRIMARY KEY,
                       course_id INT,
                       student_id INT,
                       point DECIMAL(5,2),
                       FOREIGN KEY (course_id) REFERENCES Course(id),
                       FOREIGN KEY (student_id) REFERENCES Students(id)
);
INSERT INTO Point (id, course_id, student_id, point) VALUES
                                                         (1, 1, 1, 85.5),
                                                         (2, 1, 2, 92.0),
                                                         (3, 1, 3, 78.3),
                                                         (4, 2, 4, 88.7),
                                                         (5, 2, 5, 95.2),
                                                         (6, 2, 6, 79.8),
                                                         (7, 3, 7, 91.4),
                                                         (8, 3, 12, 84.6),
                                                         (9, 3, 13, 76.9),
                                                         (10, 4, 10, 90.0),
                                                         (11, 4, 1, 87.2),
                                                         (12, 4, 2, 93.5),
                                                         (13, 5, 3, 88.1),
                                                         (14, 5, 4, 94.7),
                                                         (15, 5, 5, 82.4);

SELECT * FROM Point;
SELECT * FROM Class;
SELECT * FROM Students;
SELECT * FROM Course;
SELECT * FROM Address;

SELECT * FROM Students WHERE fullname LIKE 'Nguyen%';
SELECT * FROM Students WHERE fullname LIKE '% Anh';
SELECT * FROM Students WHERE age BETWEEN 18 AND 25;
SELECT * FROM Students WHERE id IN (12, 13);

SELECT c.name AS class_name, COUNT(s.id) AS student_count
FROM Class c
         LEFT JOIN Students s ON c.id = s.classes_id
GROUP BY c.id, c.name;

SELECT (SELECT AVG(point) FROM Point) AS average_point
FROM Course;

SELECT MAX(point) AS max_point FROM Point;

SELECT MIN(point) AS min_point FROM Point;

SELECT UCASE(fullname) AS uppercase_name FROM Students;
SELECT LCASE(fullname) AS uppercase_name FROM Students;