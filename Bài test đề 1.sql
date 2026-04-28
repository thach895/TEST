create database SalesManagement;
use SalesManagement;

create table Products(
	productId int primary key auto_increment,
    productName varchar(50) unique,
    manufacturer varchar(50) not null,
    price decimal(10,2),
    stock int
);

create table Customers(
	customerID int primary key auto_increment,
    customersName varchar(50) not null,
    email varchar(50) not null unique,
    phone varchar(11) not null unique,
    address varchar(50) 
);

create table Orders(
	orderId int primary key auto_increment,
    orderDate datetime default current_timestamp,
    totalAmount decimal(10,2),
    customerID int,
    foreign key (customerID) references Customers(customerID)
);

create table OrderDetails(
	orderId int,
    productId int,
    quantity int,
    priceAtPurchase decimal(10,2),
    primary key (orderId, productId),
    foreign key (orderId) references Orders(orderId),
    foreign key (productId) references Products(productId)
);

alter table Orders
add note text;

alter table Products
change manufacturer nhaSanXuat varchar(50) not null;

drop table OrderDetails;
drop table Orders;

insert into Products(productName, nhaSanXuat, price, stock) values
('MacBook Air M2','Apple',25000000,10),
('iPhone 15','Apple',20000000,15),
('Dell XPS 13','Dell',22000000,8),
('HP Pavilion','HP',15000000,12),
('Asus ROG','Asus',30000000,5);

insert into Customers(customersName, email, phone, address) values
('Nguyen Van A','a@gmail.com','0901','HCM'),
('Tran Van B','b@gmail.com','0902','HN'),
('Le Van C','c@gmail.com','0903','DN'),
('Pham Van D','d@gmail.com','0904','HCM'),
('Hoang Van E','e@gmail.com','0905','CT');

insert into Orders(customerID, totalAmount) values
(1,45000000),
(3,22000000),
(4,15000000),
(1,20000000),
(3,30000000);

insert into OrderDetails values
(1,1,1,25000000),
(1,2,1,20000000),
(2,3,1,22000000),
(3,4,1,15000000),
(4,2,1,20000000);

update Products
set price = price * 1.1
where nhaSanXuat = 'Apple';

alter table Customers
modify phone varchar(11);

delete from Customers
where phone is null;

select *
from Products
where price between 10000000 and 20000000;

select productName
from Products
where productId in (
    select productId
    from OrderDetails
    where orderId = 1
);

select *
from Customers
where customerID in (
    select customerID
    from Orders
    where orderId in (
        select orderId
        from OrderDetails
        where productId = (
            select productId
            from Products
            where productName = 'MacBook Air M2'
        )
    )
);