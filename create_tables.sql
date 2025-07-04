CREATE DATABASE gym_db;
USE gym_db;

CREATE TABLE members (
    member_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    join_date DATE,
    membership_plan VARCHAR(50)
);

CREATE TABLE trainers (
    trainer_id INT PRIMARY KEY,
    name VARCHAR(100),
    specialization VARCHAR(100),
    phone VARCHAR(20)
);

CREATE TABLE attendance (
    attendance_id INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT,
    date DATE,
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);
