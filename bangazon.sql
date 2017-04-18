--delete content
delete from programsEmployee;
delete from productOrder;
delete from employee;
delete from trainingProgram;
delete from productType;
delete from customer;
delete from order;
delete from product;
delete from paymentTypes;
delete from computer;
delete from department;

--drop tables if exist
drop table if exists programsEmployee;
drop table if exists productOrder;
drop table if exists employee;
drop table if exists trainingProgram;
drop table if exists productType;
drop table if exists customer;
drop table if exists order;
drop table if exists product;
drop table if exists paymentTypes;
drop table if exists computer;
drop table if exists department;

--create tables
create table employee (
  employeeID integer not null primary key autoincrement,
  employeeFirstName text not null,
  employeeLastName text not null,
  employeeTitle text not null,
  departmentID integer not null,
  foreign key (departmentID) references department(departmentID)
);

create table department (
    departmentID integer not null primary key autoincrement,
    budget integer not null
);

insert into department values (
	null,
	1000
);

create table trainingProgram (
    trainingProgramID integer not null primary key autoincrement,
    startDate integer not null,
    endDate integer not null,
    maxAttendees integer not null
);

create table programsEmployee (
    trainingProgramName text not null,
	employeeID integer not null, 
	trainingProgramID integer not null,
    foreign key (employeeID) references employee(employeeID),
    foreign key (trainingProgramID) references trainingProgram(trainingProgramID)
);

create table computer (
    computerID integer not null primary key autoincrement,
    purchaseDate integer not null,
    decomissionedDate integer not null,
	employeeID integer not null,
    foreign key (employeeID) references employee(employeeID)
);

create table product (
    productID integer not null primary key autoincrement,
    productName text not null,
    price integer not null,
    description text not null,
	productTypeID integer not null,
	customerID integer not null,
    foreign key (productTypeID) references productType(productTypeID),
    foreign key (customerID) references customer(customerID)
);

create table productType (
    productTypeID integer not null primary key autoincrement,
    productTypeName text not null
);

create table customer (
    customerID integer not null primary key autoincrement,
    customerFirstName text not null,
    customerLastName text not null,
    active text not null,
    custometerSince integer not null
);

create table customerOrder (
    orderID integer not null primary key autoincrement,
	customerID integer not null,
	paymentTypeID integer not null,
    foreign key (customerID) references customer(customerID),
    foreign key (paymentTypeID) references paymentTypes(paymentTypeID)
);

create table productOrder (
    productOrderID integer not null primary key autoincrement,
	productID integer not null,
    foreign key (productID) references product(productID)
);


create table paymentType (
    paymentTypeID integer not null primary key autoincrement,
    accountNumber integer not null,
	customerID integer not null,
    foreign key (customerID) references customer(customerID)
);






