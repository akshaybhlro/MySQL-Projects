create database library_db;
use library_db;

#-----------Database Design and Table Creation-----------#

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL
);

CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(200) NOT NULL,
    Author VARCHAR(100) NOT NULL,
    CategoryID INT NOT NULL,
    Stock INT CHECK (Stock >= 0),
    FOREIGN KEY (CategoryID)
        REFERENCES Categories (CategoryID)
);

CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    MemberType ENUM('Student', 'Staff') NOT NULL,
    Phone BIGINT UNIQUE NOT NULL
);

CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Position VARCHAR(100) NOT NULL,
    Phone BIGINT UNIQUE NOT NULL
);

CREATE TABLE Borrowing_Records (
    RecordID INT PRIMARY KEY,
    BookID INT NOT NULL,
    MemberID INT NOT NULL,
    BorrowDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID)
        REFERENCES Books (BookID),
    FOREIGN KEY (MemberID)
        REFERENCES Members (MemberID)
);

#-----------Insert Data-----------#

INSERT INTO Categories VALUES 
(1, 'Fiction'), (2, 'Non-Fiction'), (3, 'Science'), (4, 'Mathematics'), (5, 'History'), 
(6, 'Biographies'), (7, 'Philosophy'), (8, 'Technology'), (9, 'Psychology'), (10, 'Literature'), 
(11, 'Business'), (12, 'Art'), (13, 'Politics'), (14, 'Travel'), (15, 'Cooking'), 
(16, 'Religion'), (17, 'Self-Help'), (18, 'Health'), (19, 'Education'), (20, 'Sports');

INSERT INTO Books VALUES
(1, 'Wings of Fire', 'A.P.J. Abdul Kalam', 6, 10),
(2, 'The Alchemist', 'Paulo Coelho', 1, 8),
(3, 'Sapiens', 'Yuval Noah Harari', 2, 12),
(4, 'Brief History of Time', 'Stephen Hawking', 3, 7),
(5, 'Ramayana', 'Valmiki', 16, 15),
(6, 'The Great Indian Novel', 'Shashi Tharoor', 1, 9),
(7, 'India After Gandhi', 'Ramachandra Guha', 5, 6),
(8, 'Think and Grow Rich', 'Napoleon Hill', 11, 14),
(9, 'The Art of War', 'Sun Tzu', 7, 10),
(10, 'Rich Dad Poor Dad', 'Robert Kiyosaki', 11, 8),
(11, 'The Monk Who Sold His Ferrari', 'Robin Sharma', 17, 11),
(12, 'You Can Win', 'Shiv Khera', 17, 13),
(13, 'Cooking for Beginners', 'Tarla Dalal', 15, 5),
(14, 'The Blue Umbrella', 'Ruskin Bond', 10, 20),
(15, 'A Suitable Boy', 'Vikram Seth', 1, 7),
(16, 'Mahabharata', 'Vyasa', 16, 9),
(17, 'Panchatantra', 'Vishnu Sharma', 10, 8),
(18, 'A Journey to the Center of the Earth', 'Jules Verne', 14, 6),
(19, 'The Secret', 'Rhonda Byrne', 17, 18),
(20, 'Gitanjali', 'Rabindranath Tagore', 10, 10);

INSERT INTO Members VALUES 
(1, 'Aarav Gupta', 'aarav.gupta@example.com', 'Student', '9876543210'), 
(2, 'Riya Sharma', 'riya.sharma@example.com', 'Student', '9876543211'), 
(3, 'Vikram Singh', 'vikram.singh@example.com', 'Staff', '9876543212'), 
(4, 'Ananya Iyer', 'ananya.iyer@example.com', 'Student', '9876543213'), 
(5, 'Rahul Mehta', 'rahul.mehta@example.com', 'Staff', '9876543214'), 
(6, 'Diya Patel', 'diya.patel@example.com', 'Student', '9876543215'), 
(7, 'Arjun Nair', 'arjun.nair@example.com', 'Staff', '9876543216'), 
(8, 'Neha Desai', 'neha.desai@example.com', 'Student', '9876543217'), 
(9, 'Rohan Joshi', 'rohan.joshi@example.com', 'Staff', '9876543218'),
(10, 'Meera Reddy', 'meera.reddy@example.com', 'Student', '9876543219'), 
(11, 'Ishaan Malhotra', 'ishaan.malhotra@example.com', 'Student', '9876543220'), 
(12, 'Tara Kapoor', 'tara.kapoor@example.com', 'Student', '9876543221'), 
(13, 'Aman Choudhary', 'aman.choudhary@example.com', 'Staff', '9876543222'), 
(14, 'Anushka Jain', 'anushka.jain@example.com', 'Student', '9876543223'), 
(15, 'Harsh Bansal', 'harsh.bansal@example.com', 'Staff', '9876543224'), 
(16, 'Priya Saxena', 'priya.saxena@example.com', 'Student', '9876543225'), 
(17, 'Karan Verma', 'karan.verma@example.com', 'Staff', '9876543226'), 
(18, 'Sneha Bhatt', 'sneha.bhatt@example.com', 'Student', '9876543227'), 
(19, 'Ravi Kumar', 'ravi.kumar@example.com', 'Staff', '9876543228'), 
(20, 'Sanjana Deshmukh', 'sanjana.deshmukh@example.com', 'Student', '9876543229');

INSERT INTO Staff VALUES
(1, 'Rajesh Kumar', 'rajesh.kumar@example.com', 'Librarian', '9876543230'), 
(2, 'Sneha Reddy', 'sneha.reddy@example.com', 'Assistant Librarian', '9876543231'), 
(3, 'Amit Sharma', 'amit.sharma@example.com', 'Clerk', '9876543232'), 
(4, 'Pooja Iyer', 'pooja.iyer@example.com', 'Manager', '9876543233'),
(5, 'Rakesh Mehta', 'rakesh.mehta@example.com', 'Data Entry', '9876543234'), 
(6, 'Ishita Desai', 'ishita.desai@example.com', 'Assistant', '9876543235'), 
(7, 'Nikhil Joshi', 'nikhil.joshi@example.com', 'Supervisor', '9876543236'), 
(8, 'Rohit Kapoor', 'rohit.kapoor@example.com', 'Library Assistant', '9876543237'), 
(9, 'Sakshi Verma', 'sakshi.verma@example.com', 'Book Organizer', '9876543238'), 
(10, 'Anil Gupta', 'anil.gupta@example.com', 'Library Technician', '9876543239'), 
(11, 'Komal Bhatt', 'komal.bhatt@example.com', 'Assistant', '9876543240'), 
(12, 'Manoj Choudhary', 'manoj.choudhary@example.com', 'System Administrator', '9876543241'), 
(13, 'Divya Saxena', 'divya.saxena@example.com', 'Event Manager', '9876543242'), 
(14, 'Aakash Jain', 'aakash.jain@example.com', 'Research Assistant', '9876543243'), 
(15, 'Kavya Malhotra', 'kavya.malhotra@example.com', 'Library Cataloger', '9876543244'), 
(16, 'Uday Bansal', 'uday.bansal@example.com', 'Maintenance', '9876543245'), 
(17, 'Naina Bhatt', 'naina.bhatt@example.com', 'Clerk', '9876543246'), 
(18, 'Mohit Kumar', 'mohit.kumar@example.com', 'Coordinator', '9876543247'), 
(19, 'Simran Kapoor', 'simran.kapoor@example.com', 'Supervisor', '9876543248'), 
(20, 'Aditya Desai', 'aditya.desai@example.com', 'Manager', '9876543249');

INSERT INTO Borrowing_Records VALUES
(1, 1, 1, '2024-12-01', '2024-12-15'), 
(2, 2, 2, '2024-12-02', '2024-12-16'), 
(3, 3, 3, '2024-12-03', '2024-12-17'), 
(4, 4, 4, '2024-12-04', '2024-12-18'), 
(5, 5, 5, '2024-12-05', '2024-12-19'), 
(6, 6, 6, '2024-12-06', '2024-12-20'), 
(7, 7, 7, '2024-12-07', '2024-12-21'), 
(8, 8, 8, '2024-12-08', '2024-12-22'), 
(9, 9, 9, '2024-12-09', '2024-12-23'), 
(10, 10, 10, '2024-12-10', '2024-12-24'), 
(11, 11, 11, '2024-12-11', '2024-12-25'), 
(12, 12, 12, '2024-12-12', '2024-12-26'), 
(13, 13, 13, '2024-12-13', '2024-12-27'),
(14, 14, 14, '2024-12-14', '2025-01-02'),
(15, 15, 15, '2024-12-15', '2025-01-03'),
(16, 16, 16, '2024-12-16', '2024-12-30'),
(17, 17, 17, '2024-12-17', '2025-01-06'),
(18, 18, 18, '2024-12-18', '2025-01-01'),
(19, 19, 19, '2024-12-19', '2025-01-07'),
(20, 20, 20, '2024-12-20', '2025-01-04');

truncate table borrowing_records;
#-----------CRUD Operations-----------#

#Books 
INSERT INTO Books VALUES (21, 'New Book', 'Author ABC', 1, 5);
SELECT * FROM Books;
UPDATE Books SET Stock=15 WHERE BookID=1;
DELETE FROM Books WHERE BookID=21;

#Members
INSERT INTO Members VALUES (21, 'New Member', 'new.member@example.com', 'Student', '9999999999');
SELECT * FROM Members;
UPDATE Members SET Phone = '8888888888' WHERE MemberID = 21;
DELETE FROM Members WHERE MemberID = 21;

#Borrowing_Records
INSERT INTO Borrowing_Records VALUES (21, 1, 2, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 15 DAY));
SELECT * FROM Borrowing_Records;
UPDATE Borrowing_Records SET ReturnDate='2025-10-01' WHERE RecordID=21;
DELETE FROM Borrowing_Records WHERE RecordID = 21;

#-----------Borrowing & Returning Books-----------#

#Borrow Book
START TRANSACTION;
UPDATE Books SET Stock = Stock - 1 WHERE BookID=1 AND Stock > 0;
INSERT INTO Borrowing_Records VALUES (22, 1, 5, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 15 DAY));
COMMIT;

#Return Book
START TRANSACTION;
UPDATE Books SET Stock = Stock + 1 WHERE BookID = 1;
UPDATE Borrowing_Records SET ReturnDate = CURDATE() WHERE RecordID = 22;
COMMIT;

#-----------Reports & Insights-----------#

#Most Borrowed Books
SELECT Books.Title, COUNT(borrowing_records.RecordID) AS TimesBorrowed
FROM Borrowing_Records JOIN Books 
ON borrowing_records.BookID = books.BookID
GROUP BY Books.Title
ORDER BY TimesBorrowed DESC;

#Overdue Fine
SELECT 
    m.Name AS MemberName,
    b.Title AS BookTitle,
    r.BorrowDate,
    DATE_ADD(r.BorrowDate, INTERVAL 15 DAY) AS DueDate,
    r.ReturnDate,
    DATEDIFF(r.ReturnDate, DATE_ADD(r.BorrowDate, INTERVAL 15 DAY)) AS DaysOverdue,
    DATEDIFF(r.ReturnDate, DATE_ADD(r.BorrowDate, INTERVAL 15 DAY)) * 5.00 AS FineAmount
FROM Borrowing_Records r
JOIN Members m ON r.MemberID = m.MemberID  
JOIN Books b ON r.BookID = b.BookID
WHERE r.ReturnDate > DATE_ADD(r.BorrowDate, INTERVAL 15 DAY)
ORDER BY DaysOverdue DESC;

#-----------Advanced SQL Features-----------#

#View (Borrowed Books Summary)
CREATE VIEW Borrowed_Books AS
    SELECT 
        r.RecordID, b.Title, m.Name, r.BorrowDate, r.ReturnDate
    FROM
        borrowing_records r
            JOIN
        books b ON r.BookID = b.BookID
            JOIN
        members m ON r.MemberID = m.MemberID;

#Stored Procedure
-- ADD a new book 
DELIMITER //
CREATE PROCEDURE AddBook(IN ID INT, IN Title VARCHAR(200), IN Author VARCHAR(100), IN Cat INT, IN Stock INT)
BEGIN
    INSERT INTO Books VALUES (ID, Title, Author, Cat, Stock);
END //
DELIMITER ;

CALL AddBook(21, 'The Great Gatsby', 'F. Scott Fitzgerald', 2, 15);

-- Update member phone
DELIMITER //
CREATE PROCEDURE UpdateMember (IN mID INT, IN NewPhone bigint)
BEGIN
	UPDATE Members SET Phone = NewPhone WHERE MemberID=mID;
END //
DELIMITER ;

CALL UpdateMember(3,7777777777);

#Triggers
-- Trigger after Borrowing
DELIMITER //
CREATE TRIGGER After_Borrow
AFTER INSERT ON Borrowing_Records
FOR EACH ROW
BEGIN
	UPDATE Books SET Stock = Stock -1 WHERE BookID = New.BookID;
END //
DELIMITER ;

INSERT INTO Borrowing_Records (RecordID, BookID, MemberID, BorrowDate) VALUES
(21, 21, 3, curdate());

-- Trigger after returning
DELIMITER //
CREATE TRIGGER After_Return
AFTER UPDATE ON Borrowing_Records
FOR EACH ROW
BEGIN
	IF New.ReturnDate IS NOT NULL THEN
		UPDATE Books SET Stock = Stock +1 WHERE BookID = New.BookID;
	END IF;
END //
DELIMITER ;

UPDATE Borrowing_Records SET ReturnDate ='2025-09-27' WHERE RecordID=21;

#-----------Questions and Queries-----------#

#Basic Level Questions
#Q1. Show all the books in the library.
SELECT * FROM Books;

#Q2. List all members who are students.
SELECT * FROM Members WHERE MemberType = 'Student';

#Q3. Find all books written by 'Paulo Coelho'.
SELECT * FROM Books WHERE Author = 'Paulo Coelho';

#Q4. Show all categories of books.
SELECT * FROM Categories;

#Q5. Show book titles and stock only.
SELECT Title, Stock from Books;

#Medium Level Questions
#Q6. Find all books with stock less than 10.
SELECT * FROM Books WHERE Stock < 10;

#Q7. Get the borrowing history of member 'Aarav Gupta'.
SELECT 
    m.Name, b.Title, r.Borrowdate, r.Returndate
FROM
    Members m
        JOIN
    Borrowing_Records r ON m.MemberID = r.MemberID
        JOIN
    Books b ON r.BookID = b.BookID
WHERE
    m.Name = 'Aarav Gupta';

#Q8. Count how many books are available in each category.
SELECT 
    CategoryName, COUNT(bookID) AS TotalBooks
FROM
    categories
        JOIN
    books ON categories.CategoryID = books.CategoryID
GROUP BY CategoryName;

#Q9. List members who borrowed books in December 2024.
SELECT 
    m.Name, r.BorrowDate
FROM
    members m
        JOIN
    borrowing_records r ON m.MemberID = r.MemberID
WHERE
    MONTH(BorrowDate) = 12
        AND YEAR(BorrowDate) = 2024;
        
#Q10. Find the top 5 books with the highest stock.
SELECT 
    *
FROM
    books
ORDER BY stock DESC
LIMIT 5;

#Advanced Level Questions
#Q11. Find the most borrowed book.
SELECT 
    b.Title, COUNT(r.RecordID) AS TimesBorrowed
FROM
    Borrowing_Records r
        JOIN
    Books b ON r.BookID = b.BookID
GROUP BY b.Title
ORDER BY TimesBorrowed DESC
LIMIT 1;

#Q12. Show members who have borrowed more than 2 books.
SELECT 
    m.Name, COUNT(r.RecordID) AS BooksBorrowed
FROM
    borrowing_records r
        JOIN
    members m ON m.MemberID = r.MemberID
GROUP BY m.name
HAVING BooksBorrowed >= 2;

#Q13. Find overdue books (ReturnDate < Today).
SELECT 
    m.Name,
    b.title,
    r.BorrowDate,
    r.ReturnDate,
    DATEDIFF(CURDATE(), r.ReturnDate) AS DaysOverdue
FROM
    members m
        JOIN
    borrowing_records r ON m.MemberID = r.MemberID
        JOIN
    books b ON b.BookID = r.BookID
WHERE
    r.ReturnDate < CURDATE();
    
#Q14. Create a report of how many books each member type (Student/Staff) has borrowed.
SELECT 
    m.MemberType, COUNT(r.RecordID) AS TotalBorrowed
FROM
    Borrowing_Records r
        JOIN
    Members m ON r.MemberID = m.MemberID
GROUP BY m.MemberType;

#Q15. Show category with the maximum borrowed books.
SELECT 
    CategoryName, COUNT(RecordID) AS TimesBorrowed
FROM
    Borrowing_Records r
        JOIN
    Books b ON r.BookID = b.BookID
        JOIN
    Categories c ON c.CategoryID = b.CategoryID
GROUP BY CategoryName
ORDER BY TimesBorrowed DESC
LIMIT 1;

















