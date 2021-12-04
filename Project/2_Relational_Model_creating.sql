drop table part;
drop table suppliers;
drop table sales;
drop table person;
drop table company;
drop table manufacturer;
drop table vehicles;
drop table produces;
drop table customers;
drop table inventory;
drop table dealers;
drop table options;
drop table models;
drop table brands;
drop table automobile_company;
create table automobile_company(
    id int primary key generated always as identity ,
    name varchar(20) ,
    amount_employees int
);
create table brands(
    name varchar(10) primary key ,
    amount_employees int ,
    company_id int ,
    foreign key (company_id) references automobile_company(id)
);
create table models(
    id int primary key generated always as identity ,
    name varchar(20) ,
    year timestamp,
    body_style varchar(20) ,
    brand_name varchar(20) ,
    foreign key (brand_name) references brands(name)
);
create table options(
    id int primary key generated always as identity ,
    engine varchar(100) ,
    transmission varchar(100) ,
    color varchar(20) ,
    model_id int ,
    foreign key (model_id) references models(id)
);
create table dealers(
    id int primary key generated always as identity ,
    name varchar(100) ,
    location varchar(200)
);
create table inventory(
    id int primary key generated always as identity ,
    location varchar(200) ,
    name varchar(100) ,
    dealer_id int ,
    foreign key (dealer_id) references dealers(id)
);
create table customers(
    id int primary key generated always as identity ,
    address varchar(300) ,
    city varchar(100) ,
    street varchar(200) ,
    phone_number varchar(20) ,
    dealer_id int ,
    foreign key (dealer_id) references dealers(id)
);
create table produces(
    id int primary key generated always as identity ,
    date timestamp
);
create table vehicles(
    VIN varchar(20) primary key ,
    option_id int ,
    inventory_id int ,
    customer_id int ,
    produces_id int ,
    foreign key (option_id) references options(id) ,
    foreign key (inventory_id) references inventory(id) ,
    foreign key (customer_id) references customers(id) ,
    foreign key (produces_id) references produces(id)
);
create table manufacturer(
    id int primary key generated always as identity ,
    name varchar(200) ,
    location varchar(200) ,
    brand_name varchar(20) ,
    VIN varchar(20) ,
    foreign key (VIN) references vehicles(VIN) ,
    foreign key (brand_name) references brands(name)
);
create table company(
    id int primary key generated always as identity ,
    name varchar(200) ,
    customer_id int ,
    foreign key (customer_id) references customers(id)
);
create table person(
    id int primary key generated always as identity ,
    full_name varchar(200) ,
    first_name varchar(100) ,
    last_name varchar(100) ,
    gender varchar(10) ,
    driver_id int ,
    income int ,
    customer_id int ,
    foreign key (customer_id) references customers(id)
);
create table sales(
    VIN varchar(20) ,
    customer_id int ,
    dealer_id int ,
    date timestamp ,
    price double precision
);
create table suppliers(
    id int primary key generated always as identity ,
    name varchar(200) ,
    location varchar(200) ,
    manufacturer_id int ,
    foreign key (manufacturer_id) references manufacturer(id)
);
create table part(
    id int primary key generated always as identity ,
    type varchar(100) ,
    made_date timestamp ,
    supply_date timestamp ,
    supplier_id int ,
    manufacturer_id int ,
    foreign key (manufacturer_id) references manufacturer(id) ,
    foreign key (supplier_id) references suppliers(id)
);
