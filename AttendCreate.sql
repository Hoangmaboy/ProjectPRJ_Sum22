CREATE DATABASE AttendancePrj;

USE AttendancePrj;

CREATE TABLE Class
(
    class_id INT PRIMARY KEY NOT NULL,
    class_name NVARCHAR(255)
);
CREATE TABLE Course
(
    course_id INT PRIMARY KEY NOT NULL,
    course_name NVARCHAR(255),
    total_slot INT,
);

CREATE TABLE Student
(
    student_id VARCHAR(30) PRIMARY KEY NOT NULL,
    student_code NVARCHAR(255),
    student_name NVARCHAR(255),
    class_code INT FOREIGN KEY REFERENCES Class (class_id),
    student_email NVARCHAR(255),
    
);
CREATE TABLE Instructor
(
    instructor_id INT PRIMARY KEY NOT NULL,
    instructor_name NVARCHAR(255),
    instructor_code NVARCHAR(255),
  
);
CREATE TABLE ClassRoom
(
    class_id INT PRIMARY KEY
        FOREIGN KEY REFERENCES Class (class_id),
    student_id VARCHAR(30) FOREIGN KEY REFERENCES Student (student_id)
);
CREATE TABLE Timetable
(
    Timetable_id INT PRIMARY KEY NOT NULL,
    instructor_id INT FOREIGN KEY REFERENCES Instructor (instructor_id),
    course_id INT FOREIGN KEY REFERENCES Course (course_id),
    class_id INT FOREIGN KEY REFERENCES ClassRoom (class_id)
);
CREATE TABLE Slot
(
    slot_id INT PRIMARY KEY NOT NULL,
    slot_name NVARCHAR(255)
);
CREATE TABLE Attended
(
    Timetable_id INT FOREIGN KEY REFERENCES Timetable (Timetable_id),
    [Date_Attend] DATE,
    slot_id INT FOREIGN KEY REFERENCES Slot (slot_id),
    [status] BIT,
    comment NVARCHAR(255)
);