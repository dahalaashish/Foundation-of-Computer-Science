-- ============================================================
-- DATABASE: College Club Membership Management
-- ============================================================

CREATE DATABASE IF NOT EXISTS StudentInfo;
USE StudentInfo;

-- ============================================================
-- SECTION 1: FIRST NORMAL FORM (1NF)
-- ============================================================
-- What 1NF fixes:
--  Each column contains atomic (single) values
-- composite PRIMARY KEY added (StudentID + ClubName)
-- no repeating groups
-- ============================================================

CREATE TABLE StudentClub_1NF (
    StudentID   INT,
    StudentName VARCHAR(100) NOT NULL,
    Email       VARCHAR(100) NOT NULL,
    ClubName    VARCHAR(100) NOT NULL,
    ClubRoom    VARCHAR(50)  NOT NULL,
    ClubMentor  VARCHAR(100) NOT NULL,
    JoinDate    DATE         NOT NULL,
    PRIMARY KEY (StudentID, ClubName)
);

INSERT INTO StudentClub_1NF VALUES
(1, 'Asha',   'asha@email.com',   'Music Club',  'R101', 'Mr. Raman', '2024-01-10'),
(2, 'Bikash', 'bikash@email.com', 'Sports Club', 'R202', 'Ms. Sita',  '2024-01-12'),
(1, 'Asha',   'asha@email.com',   'Sports Club', 'R202', 'Ms. Sita',  '2024-01-15'),
(3, 'Nisha',  'nisha@email.com',  'Music Club',  'R101', 'Mr. Raman', '2024-01-20'),
(4, 'Rohan',  'rohan@email.com',  'Drama Club',  'R303', 'Mr. Kiran', '2024-01-18'),
(5, 'Suman',  'suman@email.com',  'Music Club',  'R101', 'Mr. Raman', '2024-01-22'),
(2, 'Bikash', 'bikash@email.com', 'Drama Club',  'R303', 'Mr. Kiran', '2024-01-25'),
(6, 'Pooja',  'pooja@email.com',  'Sports Club', 'R202', 'Ms. Sita',  '2024-01-27'),
(3, 'Nisha',  'nisha@email.com',  'Coding Club', 'Lab1', 'Mr. Anil',  '2024-01-28'),
(7, 'Aman',   'aman@email.com',   'Coding Club', 'Lab1', 'Mr. Anil',  '2024-01-30');

SELECT * FROM StudentClub_1NF;

-- ============================================================
-- SECTION 2: SECOND NORMAL FORM (2NF)
-- ============================================================
-- What 2NF fixes:
--    Removes partial dependencies from 1NF
--    StudentName, Email moved to Student table
--      (depend only on StudentID)
--    ClubName, ClubRoom, ClubMentor moved to Club table
--      (depend only on ClubID)
--    Membership table tracks only the relationship + JoinDate
--    ClubID introduced as proper integer primary key
--
-- ============================================================

-- 2NF: Student Table
CREATE TABLE Student_2NF (
    StudentID   INT          PRIMARY KEY,
    StudentName VARCHAR(100) NOT NULL,
    Email       VARCHAR(100) NOT NULL UNIQUE
);

INSERT INTO Student_2NF VALUES
(1, 'Asha',   'asha@email.com'),
(2, 'Bikash', 'bikash@email.com'),
(3, 'Nisha',  'nisha@email.com'),
(4, 'Rohan',  'rohan@email.com'),
(5, 'Suman',  'suman@email.com'),
(6, 'Pooja',  'pooja@email.com'),
(7, 'Aman',   'aman@email.com');

-- 2NF: Club Table
CREATE TABLE Club_2NF (
    ClubID     INT          PRIMARY KEY AUTO_INCREMENT,
    ClubName   VARCHAR(100) NOT NULL UNIQUE,
    ClubRoom   VARCHAR(50)  NOT NULL,
    ClubMentor VARCHAR(100) NOT NULL
);

INSERT INTO Club_2NF (ClubName, ClubRoom, ClubMentor) VALUES
('Music Club',  'R101', 'Mr. Raman'),
('Sports Club', 'R202', 'Ms. Sita'),
('Drama Club',  'R303', 'Mr. Kiran'),
('Coding Club', 'Lab1', 'Mr. Anil');

-- 2NF: Membership Table
CREATE TABLE Membership_2NF (
    StudentID INT,
    ClubID    INT,
    JoinDate  DATE NOT NULL,
    PRIMARY KEY (StudentID, ClubID),
    FOREIGN KEY (StudentID) REFERENCES Student_2NF(StudentID),
    FOREIGN KEY (ClubID)    REFERENCES Club_2NF(ClubID)
);

INSERT INTO Membership_2NF VALUES
(1, 1, '2024-01-10'),  -- Asha   → Music Club
(2, 2, '2024-01-12'),  -- Bikash → Sports Club
(1, 2, '2024-01-15'),  -- Asha   → Sports Club
(3, 1, '2024-01-20'),  -- Nisha  → Music Club
(4, 3, '2024-01-18'),  -- Rohan  → Drama Club
(5, 1, '2024-01-22'),  -- Suman  → Music Club
(2, 3, '2024-01-25'),  -- Bikash → Drama Club
(6, 2, '2024-01-27'),  -- Pooja  → Sports Club
(3, 4, '2024-01-28'),  -- Nisha  → Coding Club
(7, 4, '2024-01-30');  -- Aman   → Coding Club

SELECT * FROM Student_2NF;
SELECT * FROM Club_2NF;
SELECT * FROM Membership_2NF;

-- ============================================================
-- SECTION 3: THIRD NORMAL FORM (3NF)
-- ============================================================
-- What 3NF fixes:
--  Every non-key column depends ONLY on the primary key
--  Student details depend only on StudentID
--  Club details depend only on ClubID
--   ClubMentor is a direct attribute of Club
--      (one mentor per club — no transitive dependency)
--    No data repetition across any table
--    Insert, Update, Delete anomalies fully eliminated

-- 3NF: Student Table
CREATE TABLE Student (
    StudentID   INT          PRIMARY KEY,
    StudentName VARCHAR(100) NOT NULL,
    Email       VARCHAR(100) NOT NULL UNIQUE
);

INSERT INTO Student VALUES
(1, 'Asha',   'asha@email.com'),
(2, 'Bikash', 'bikash@email.com'),
(3, 'Nisha',  'nisha@email.com'),
(4, 'Rohan',  'rohan@email.com'),
(5, 'Suman',  'suman@email.com'),
(6, 'Pooja',  'pooja@email.com'),
(7, 'Aman',   'aman@email.com');

-- 3NF: Club Table
CREATE TABLE Club (
    ClubID     INT          PRIMARY KEY AUTO_INCREMENT,
    ClubName   VARCHAR(100) NOT NULL UNIQUE,
    ClubRoom   VARCHAR(50)  NOT NULL,
    ClubMentor VARCHAR(100) NOT NULL
);

INSERT INTO Club (ClubName, ClubRoom, ClubMentor) VALUES
('Music Club',  'R101', 'Mr. Raman'),
('Sports Club', 'R202', 'Ms. Sita'),
('Drama Club',  'R303', 'Mr. Kiran'),
('Coding Club', 'Lab1', 'Mr. Anil');

-- 3NF: Membership Table
CREATE TABLE Membership (
    StudentID INT,
    ClubID    INT,
    JoinDate  DATE NOT NULL,
    PRIMARY KEY (StudentID, ClubID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (ClubID)    REFERENCES Club(ClubID)
);

INSERT INTO Membership VALUES
(1, 1, '2024-01-10'),  
(2, 2, '2024-01-12'),  
(1, 2, '2024-01-15'), 
(3, 1, '2024-01-20'),  
(4, 3, '2024-01-18'),  
(5, 1, '2024-01-22'),  
(2, 3, '2024-01-25'),  
(6, 2, '2024-01-27'),  
(3, 4, '2024-01-28'),  
(7, 4, '2024-01-30');  

SELECT * FROM Student;
SELECT * FROM Club;
SELECT * FROM Membership;

-- ============================================================
-- SECTION 4: JOIN QUERY 
-- Joins all 3NF tables to reproduce the original dataset


SELECT
    s.StudentID,
    s.StudentName,
    s.Email,
    c.ClubName,
    c.ClubRoom,
    c.ClubMentor,
    mb.JoinDate
FROM   Membership mb
JOIN Student s  ON mb.StudentID = s.StudentID
JOIN Club c  ON mb.ClubID = c.ClubID
ORDER BY mb.JoinDate;
