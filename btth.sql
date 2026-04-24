-- Hệ thống học trực tuyến
CREATE DATABASE course_online;
USE course_online;
-- Sinh viên (Student) 
CREATE TABLE student(
	student_id int primary key auto_increment,
    fullname varchar(255) not null,
    birthday date,
    email varchar(255) not null unique
);
-- Giảng viên (Teacher)
CREATE TABLE teacher(
	teacher_id int primary key auto_increment,
    fullname varchar(255) not null,
    email varchar(255) not null unique
   -- Một giảng viên có thể dạy nhiều khóa học
);
-- Khóa học (Course)
CREATE TABLE course(
	course_id int primary key auto_increment,
    course_name varchar(100) not null,
    description varchar(255) not null,
    number_of_lesson int not null,
    teacher_id int,
    foreign key(teacher_id) references teacher(teacher_id)
);
-- Đăng ký học (Enrollment)
CREATE TABLE enrollment(
	enrollment_id int primary key auto_increment,
    student_id int, 
    course_id int,
    created_at timestamp default current_timestamp,
    unique(student_id, course_id),
	foreign key(student_id) references student(student_id),
    foreign key(course_id) references course(course_id)
);
-- Kết quả học tập (Score)
CREATE TABLE score(
	score_id int primary key auto_increment,
    student_id int, 
    course_id int,
    middle_score int check(middle_score >= 0 AND middle_score <= 10) not null,
    final_score int check(final_score >= 0 AND final_score <= 10) not null,
	unique(student_id, course_id),
    foreign key(student_id) references student(student_id),
    foreign key(course_id) references course(course_id)
);

-- Phần II
-- thêm sinh viên
INSERT INTO student (fullname, birthday, email) VALUES
('Nguyen Van A', '2000-01-01', 'a@gmail.com'),
('Tran Thi B', '2001-02-02', 'b@gmail.com'),
('Le Van C', '1999-03-03', 'c@gmail.com'),
('Pham Thi D', '2002-04-04', 'd@gmail.com'),
('Hoang Van E', '2000-05-05', 'e@gmail.com');
-- thêm giảng viên
INSERT INTO teacher (fullname, email) VALUES
('Teacher 1', 't1@gmail.com'),
('Teacher 2', 't2@gmail.com'),
('Teacher 3', 't3@gmail.com'),
('Teacher 4', 't4@gmail.com'),
('Teacher 5', 't5@gmail.com');
-- Thêm khóa học
INSERT INTO course (course_name, description, number_of_lesson, teacher_id) VALUES
('SQL Basic', 'Hoc SQL co ban', 10, 1),
('Java Core', 'Lap trinh Java', 12, 2),
('Web Dev', 'HTML CSS JS', 15, 3),
('Python', 'Python co ban', 8, 4),
('Data Structure', 'Cau truc du lieu', 20, 5);
-- đăng ký học
INSERT INTO enrollment (student_id, course_id) VALUES
(1,1),
(1,2),
(2,1),
(3,3),
(4,4),
(5,5);
-- Thêm điểm
INSERT INTO score (student_id, course_id, middle_score, final_score) VALUES
(1,1,8,9),
(1,2,7,8),
(2,1,6,7),
(3,3,9,9),
(4,4,5,6),
(5,5,8,8);

-- Phần III 
-- Cập nhật email sinh viên
UPDATE student
SET email = 'newemail@gmail.com'
WHERE student_id = 1;
-- Cập nhật mô tả khóa học
UPDATE course
SET description = 'SQL nang cao'
WHERE course_id = 1;
-- cập nhật điểm cuối kỳ
UPDATE score
SET final_score = 10
WHERE student_id = 1 AND course_id = 1;
-- Phần IV
-- Xóa điểm trước đó
DELETE FROM score
WHERE student_id = 2 AND course_id = 1;
-- Xóa đăng kí học
DELETE FROM enrollment
WHERE student_id = 2 AND course_id = 1;
-- Phần V 
-- truy vấn danh sách sinh viên
SELECT * FROM student;
-- danh sách giảng viên
SELECT * FROM teacher;
-- danh sách khóa học
SELECT * FROM course;
-- danh sách đăng kí học
SELECT * FROM enrollment;
-- danh sách điểm
SELECT * FROM score;
