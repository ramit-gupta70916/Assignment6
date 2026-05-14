CREATE TABLE Student (
    rn INT PRIMARY KEY,
    name VARCHAR(50),
    address VARCHAR(100),
    marks INT,
    dob DATE,
    batch_code INT
);

CREATE TABLE Batch (
    batch_code INT PRIMARY KEY,
    name VARCHAR(50),
    duration VARCHAR(20),
    description VARCHAR(100),
    trainer_id INT
);

CREATE TABLE Fees (
    fee_id INT AUTO_INCREMENT PRIMARY KEY,
    rn INT,
    fees_paid INT,
    date_paid DATE,
    FOREIGN KEY (rn) REFERENCES Student(rn)
);

CREATE TABLE Trainer (
    trainer_id INT PRIMARY KEY,
    trainer_name VARCHAR(50),
    address VARCHAR(100),
    qualification VARCHAR(50),
    experience INT,
    domain VARCHAR(50)
);

ALTER TABLE Student
ADD FOREIGN KEY (batch_code) REFERENCES Batch(batch_code);

ALTER TABLE Batch
ADD FOREIGN KEY (trainer_id) REFERENCES Trainer(trainer_id);

-- Trainer
INSERT INTO Trainer VALUES
(1, 'Swayam Sir', 'Delhi', 'MCA', 10, 'Java'),
(2, 'Amit Sir', 'Noida', 'B.Tech', 8, 'Python');

-- Batch
INSERT INTO Batch VALUES
(101, 'Java Batch', '3 Months', 'Core Java', 1),
(102, 'Python Batch', '2 Months', 'Python Basics', 2);

-- Student
INSERT INTO Student VALUES
(1, 'Rahul', 'Delhi', 80, '2000-05-10', 101),
(2, 'Yash', 'Noida', 75, '2001-03-15', 102);

-- Fees
INSERT INTO Fees(rn, fees_paid, date_paid) VALUES
(1, 20000, '2024-01-10'),
(2, 15000, '2024-02-15');

--Q1
SELECT 
s.name AS student_name,
s.address,
b.batch_code,
b.name AS batch_name,
t.trainer_name,
b.duration
FROM Student s
JOIN Batch b ON s.batch_code = b.batch_code
JOIN Trainer t ON b.trainer_id = t.trainer_id;

--Q2
SELECT 
s.name AS student_name,
f.fees_paid,
f.date_paid
FROM Student s
JOIN Fees f ON s.rn = f.rn;

--Q3
SELECT 
b.batch_code,
b.name AS batch_name,
t.trainer_name,
t.domain,
t.experience
FROM Batch b
JOIN Trainer t ON b.trainer_id = t.trainer_id;

