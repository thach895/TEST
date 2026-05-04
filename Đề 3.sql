create database MechKeyStore;
use MechKeyStore;

create table Product(
	productId int primary key auto_increment,
    productName varchar(50) not null,
    manufacturer varchar(50),
    price decimal(18,2) not null,
    stock int 
);

create table Customer(
	customerId int primary key auto_increment,
    fullName varchar(50) not null,
    email varchar(50)unique,
    phoneNumber varchar(11) unique,
    address varchar(50)
);

create table Orders(
	orderId int primary key auto_increment,
    orderDay date not null,
    totalPrice decimal 
);

create table Order_Detail(
	orderId int,
    productId int,
    quantity_purchased int,
    The_selling_price_at_the_time_of_purchase decimal(18,2),
    foreign key(orderId) references Orders(orderId),
    foreign key(productId) references Product(productId)
);

alter table Product
add category varchar(50);
drop table Order_Detail;
drop table Orders;

insert into Product(ProductName,manufacturer,price,stock)
values
('IP 17', 'Iphone', 20000000000,5), 
('Samsung galaxy s25', 'Samsung', 21000000000,6), 
('Aula F75', 'Aula', 750000000,15), 
('Máy giặt', 'Toshiba', 200000000000,8), 
('Aula s2022', 'Aula', 800000000,20);

insert into Customer(fullName,email)
values
('Nguyễn Văn A','a@gmail.com'),
('Nguyễn Văn B','b@gmail.com'),
('Nguyễn Văn C',null),
('Nguyễn Văn D','d@gmail.com'),
('Nguyễn Văn E',null);

insert into Orders(orderDay,totalPrice)
values
('2026-6-3',3000000000),
('2026-3-2',3000000000),
('2026-7-5',3000000000),
('2026-7-23',3000000000),
('2026-11-4',3000000000);

insert into Order_Detail
values
(null,null,2,5000000000),
(null,null,5,3000000000),
(null,null,3,6000000000),
(null,null,7,9000000000),
(null,null,9,12000000000);

update Product
set price=price+price*0.1
where manufacturer='Aula';

delete from Customer 
where email is null;

select * from Product
where price >1000000 and price <3000000;

select * from Product
where manufacturer='Aula';

select orderId, totalPrice from Orders
where totalPrice > 5000000;

select * from Product
where stock < 10;





