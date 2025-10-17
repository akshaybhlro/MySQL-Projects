# Project Title: Library Management System (LMS)
Project Duration: 1 Month

## Project Overview:
The Library Management System (LMS) is a MySQL-based project that manages library data such as books, members, staff, and borrowing records.
It uses relational database concepts, DML/DDL operations, and advanced SQL features like views, stored procedures, triggers, and transactions for better data integrity and automation.

## Key Features:
#### 1. Database Design:
•	A normalized schema for efficient data storage and retrieval.
<br>
•	Tables created for Books, Members, Staff, Borrowing_Records, and Categories.
#### 2. Data Integrity:
•	Constraints: PRIMARY KEY, FOREIGN KEY, CHECK, and UNIQUE.
<br>
•	Triggers ensure automatic updates (like stock decrement when a book is borrowed).
#### 3. CRUD Operations:
•	Full Create, Read, Update, Delete functionality for:
	Books,
	Members,
	Borrowing_Records
#### 4. Advanced SQL:
•	Stored Procedures for adding/updating data.
<br>
•	Views for simplified reporting.
<br>
•	Transactions with COMMIT and ROLLBACK for consistency.
<br>
•	Analytical reports like Most Borrowed Books and Overdue Fines.

## Stored Procedures:
-- Add a new book
<br>
CALL AddBook(ID, Title, Author, CategoryID, Stock);

-- Update member phone
<br>
CALL UpdateMember(MemberID, NewPhone);

## Views:
-- Borrowed Books Summary
<br>
SELECT * FROM Borrowed_Books;

## Triggers:
-- After Borrow
<br>
DELIMITER //
<br>
CREATE TRIGGER After_Borrow
<br>
AFTER INSERT ON Borrowing_Records
<br>
FOR EACH ROW
<br>
BEGIN
<br>
    UPDATE Books SET Stock = Stock - 1 WHERE BookID = NEW.BookID;
<br>
END //
<br>
DELIMITER ;

-- After Return
<br>
DELIMITER //
<br>
CREATE TRIGGER After_Return
<br>
AFTER UPDATE ON Borrowing_Records
<br>
FOR EACH ROW
<br>
BEGIN
<br>
    IF NEW.ReturnDate IS NOT NULL THEN
	<br>
        UPDATE Books SET Stock = Stock + 1 WHERE BookID = NEW.BookID;
		<br>
    END IF;
	<br>
END //
<br>
DELIMITER ;

## Flow of Queries:
1. A Book is Borrowed:<br>
‣ The Borrowing_Records table is updated via the stored procedure.<br>
‣ ReturnDate is set to NULL.<br>
‣ A trigger automatically decrements book stock.<br>
2. A Book is Returned:<br>
‣ The Borrowing_Records table updates automatically.<br>
‣ The trigger increases the book stock count.<br>
‣ If overdue (>14 days), the fine amount is calculated.<br>
3. Transactions:<br>
‣ COMMIT and ROLLBACK ensure consistent operations and rollback in case of errors.<br>

## EER Diagram:
<img width="975" height="584" alt="image" src="https://github.com/user-attachments/assets/c8481519-0489-45ef-8252-20e701383375" />




