-- Create tables
CREATE TABLE Authors (
  AuthorID INT PRIMARY KEY,
  AuthorName VARCHAR(100)
);

CREATE TABLE Books (
  BookID INT PRIMARY KEY,
  Title VARCHAR(100),
  AuthorID INT,
  Quantity INT,
  FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

CREATE TABLE Members (
  MemberID INT PRIMARY KEY,
  MemberName VARCHAR(100),
  Email VARCHAR(100)
);

CREATE TABLE BorrowedBooks (
  BorrowID INT PRIMARY KEY,
  BookID INT,
  MemberID INT,
  BorrowDate DATE,
  ReturnDate DATE,
  FOREIGN KEY (BookID) REFERENCES Books(BookID),
  FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

-- Insert sample data
INSERT INTO Authors (AuthorID, AuthorName) VALUES (1, 'John Smith');
INSERT INTO Authors (AuthorID, AuthorName) VALUES (2, 'Jane Doe');

INSERT INTO Books (BookID, Title, AuthorID, Quantity) VALUES (1, 'Book 1', 1, 5);
INSERT INTO Books (BookID, Title, AuthorID, Quantity) VALUES (2, 'Book 2', 2, 3);
INSERT INTO Books (BookID, Title, AuthorID, Quantity) VALUES (3, 'Book 3', 1, 2);

INSERT INTO Members (MemberID, MemberName, Email) VALUES (1, 'Member 1', 'member1@example.com');
INSERT INTO Members (MemberID, MemberName, Email) VALUES (2, 'Member 2', 'member2@example.com');

INSERT INTO BorrowedBooks (BorrowID, BookID, MemberID, BorrowDate, ReturnDate) VALUES (1, 1, 1, '2023-01-01', '2023-01-15');
INSERT INTO BorrowedBooks (BorrowID, BookID, MemberID, BorrowDate, ReturnDate) VALUES (2, 2, 2, '2023-02-01', '2023-02-15');

-- Sample queries

-- Query to get all books
SELECT b.BookID, b.Title, a.AuthorName, b.Quantity
FROM Books b
JOIN Authors a ON b.AuthorID = a.AuthorID;

-- Query to get all borrowed books with member details
SELECT bb.BorrowID, b.Title, m.MemberName, bb.BorrowDate, bb.ReturnDate
FROM BorrowedBooks bb
JOIN Books b ON bb.BookID = b.BookID
JOIN Members m ON bb.MemberID = m.MemberID;

-- Query to borrow a book
INSERT INTO BorrowedBooks (BookID, MemberID, BorrowDate, ReturnDate)
VALUES (3, 1, '2023-03-01', '2023-03-15');

-- Query to update the quantity of a book
UPDATE Books
SET Quantity = Quantity - 1
WHERE BookID = 3;

-- Query to return a book
UPDATE BorrowedBooks
SET ReturnDate = '2023-03-20'
WHERE BorrowID = 3;
