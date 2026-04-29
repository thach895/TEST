CREATE DATABASE LibraryManagement;
USE LibraryManagement;

CREATE TABLE Book (
    book_id VARCHAR(10) PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255),
    publish_year INT,
    quantity INT DEFAULT 0
);

CREATE TABLE Reader (
    reader_id VARCHAR(10) PRIMARY KEY,
    fullname VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE,
    phone VARCHAR(20),
    birthday DATE
);

CREATE TABLE Borrow_Card (
    borrow_id VARCHAR(10) PRIMARY KEY,
    borrow_date DATE,
    return_date DATE,
    reader_id VARCHAR(10),
    FOREIGN KEY (reader_id) REFERENCES Reader(reader_id)
);

CREATE TABLE Borrow_Detail (
    borrow_id VARCHAR(10),
    book_id VARCHAR(10),
    book_status VARCHAR(10),
    fee DECIMAL(10,2),
    PRIMARY KEY (borrow_id, book_id),
    FOREIGN KEY (borrow_id) REFERENCES Borrow_Card(borrow_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id)
);

ALTER TABLE Reader
ADD address VARCHAR(255);

ALTER TABLE Book
CHANGE publish_year NamPhatHanh INT;

DROP TABLE Borrow_Detail;
DROP TABLE Borrow_Card;

INSERT INTO Book VALUES
('B001','Tôi thấy hoa vàng trên cỏ xanh','Nguyễn Nhật Ánh',2015,10),
('B002','Mắt biếc','Nguyễn Nhật Ánh',2018,8),
('B003','Lập trình SQL căn bản','Trần Văn B',2020,5),
('B004','Martin Eden','Jack London',2017,6),
('B005','The Call of the Wild','Jack London',2016,7);

INSERT INTO Reader (reader_id, fullname, email, phone, birthday, address) VALUES
('R001','Nguyễn Văn A','a@gmail.com','0123456789','2000-01-01','Hà Nội'),
('R002','Trần Thị B','b@gmail.com','0987654321','2001-02-02','HCM'),
('R003','Lê Văn C',NULL,'0111111111','1999-03-03','Đà Nẵng'),
('R004','Phạm Thị D','d@gmail.com','0222222222','2002-04-04','Huế'),
('R005','Hoàng Văn E','e@gmail.com','0333333333','2003-05-05','Cần Thơ');

INSERT INTO Borrow_Card VALUES
('PM001','2026-04-05','2026-04-15','R001'),
('PM002','2026-04-10','2026-04-20','R002'),
('PM003','2026-03-01','2026-03-10','R003'),
('PM004','2026-04-12','2026-04-22','R004'),
('PM005','2026-02-01','2026-02-10','R005');

INSERT INTO Borrow_Detail VALUES
('PM001','B001','Mới',10000),
('PM001','B003','Cũ',5000),
('PM002','B002','Mới',8000),
('PM003','B004','Cũ',7000),
('PM004','B005','Mới',9000);

UPDATE Book
SET quantity = quantity + 5
WHERE author = 'Nguyễn Nhật Ánh';

DELETE FROM Reader
WHERE email IS NULL;

SELECT *
FROM Book
WHERE NamPhatHanh BETWEEN 2015 AND 2023;

SELECT r.fullname, b.borrow_id
FROM Reader r
JOIN Borrow_Card b ON r.reader_id = b.reader_id
WHERE MONTH(b.borrow_date) = 4
AND YEAR(b.borrow_date) = 2026;

SELECT bk.title
FROM Book bk
JOIN Borrow_Detail bd ON bk.book_id = bd.book_id
WHERE bd.borrow_id = 'PM001';

SELECT r.fullname, r.phone
FROM Reader r
JOIN Borrow_Card bc ON r.reader_id = bc.reader_id
JOIN Borrow_Detail bd ON bc.borrow_id = bd.borrow_id
JOIN Book b ON bd.book_id = b.book_id
WHERE b.title = 'Lập trình SQL căn bản';

SELECT bc.borrow_id, b.title, bd.book_status
FROM Borrow_Card bc
JOIN Borrow_Detail bd ON bc.borrow_id = bd.borrow_id
JOIN Book b ON bd.book_id = b.book_id
WHERE b.author = 'Jack London';

