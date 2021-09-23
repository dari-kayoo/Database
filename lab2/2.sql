CREATE TABLE customers
(
    id integer not null primary key unique,
    full_name varchar(50) not null,
    timestamp timestamp not null,
    delivery_address text not null
);
CREATE TABLE orders(
    code integer not null primary key unique,
    customer_id integer references customers (id),
    total_sum double precision not null check ( total_sum > 0 ),
    is_paid boolean not null
);
CREATE TABLE products(
    id varchar not null primary key,
    name varchar not null unique,
    description text not null,
    price double precision not null check ( price > 0 )
);
CREATE TABLE order_items(
    order_code integer not null references orders(code) unique,
    product_id varchar not null references products(id) unique,
    quantity integer not null check ( quantity > 0 )
);

