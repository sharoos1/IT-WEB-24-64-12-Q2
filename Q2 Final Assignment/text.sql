-- Course Table--
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    Name NVARCHAR(100),
    LecturerName NVARCHAR(100)
);
-- Student Table--
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name NVARCHAR(100),
    City NVARCHAR(100),
    CourseID INT,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Insert Course--
INSERT INTO Courses (CourseID, Name, LecturerName)
VALUES 
(1, 'Web Development', 'M.M. Herath'),
(2, 'Graphic Design', 'J.S.V. Piyasena'),
(3, 'Mobile App Development', 'K.K.S. Dias'),
(4, 'Java', 'U.H.S. Perera');

-- Insert Student--
INSERT INTO Students (StudentID, Name, City, CourseID)
VALUES
(1, 'Kasun Gamage', 'Kandy', 2),
(2, 'Daniel Sam', 'Jaffna', 3),
(3, 'Hansi Silva', 'Colombo', 1),
(4, 'Ranidu Heath', 'Matara', 3),
(5, 'Praneeth Wijesinghe', 'Kandy', 4),
(6, 'Nuwani Herath', 'Rathnapura', 1);

-- (A) Get all the information of all Students--
SELECT * FROM Students;

1	Kasun    Gamage	    Kandy	    2
2	Daniel   Sam	    Jaffna	    3
3	Hansi    Silva	    Colombo	    1
4	Ranidu   Heath	    Matara	    3
5	Praneeth Wijesinghe	Kandy	    4
6	Nuwani   Herath	    Rathnapura	1

-- (B) Select student id, name and city from students who are from the ‘kandy’--
SELECT StudentID, Name, City
FROM Students
WHERE City = 'Kandy';

1	Kasun       Gamage	    Kandy
5	Praneeth    Wijesinghe	Kandy

-- (C) Update the City as 'Galle' of the student whose id equals to 4 --
UPDATE Students SET City = 'Galle'WHERE StudentID = 4;

1	Kasun     Gamage	  Kandy	      2
2	Daniel    Sam	      Jaffna	  3
3	Hansi     Silva	      Colombo	  1
4	Ranidu    Heath	      Galle	      3
5	Praneeth  Wijesinghe  Kandy	      4
6	Nuwani    Herath	  Rathnapura  1

-- (D) Get all the information of all students with their course names.--
SELECT Students.StudentID, Students.Name, Students.City, Courses.Name AS CourseName
FROM Students JOIN Courses ON Students.CourseID = Courses.CourseID;

1	Kasun    Gamage	    Kandy	    Graphic Design
2	Daniel   Sam	    Jaffna	    Mobile App Development
3	Hansi    Silva	    Colombo	    Web Development
4	Ranidu   Heath	    Galle	    Mobile App Development
5	Praneeth Wijesinghe	Kandy	    Java
6	Nuwani   Herath	    Rathnapura	Web Development