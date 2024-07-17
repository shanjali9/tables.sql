--Primary Keys can't be emplty or duplicated 
create table customer_shanj(
    customer_id SERIAL primary key,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    address VARCHAR(150),
    billing_info VARCHAR(150)
);

--SELLER table creation 
create table seller_shanj(
    seller_id SERIAL primary key,
    brand_name VARCHAR(150),
    contact_number VARCHAR(15),
    address VARCHAR(150)
);

--Inventory table creation 
create table inventory_shanj(
    upc SERIAL primary key, 
    product_amount INTEGER
);

--Order table creation 
create table order_shanj(
    order_id SERIAL primary key, 
    order_date DATE default CURRENT_DATE,
    sub_total NUMERIC(8,2),
    total_cost NUMERIC(10,2),
    upc INTEGER not null, --not null means this can't be empty
    foreign KEY(upc) references inventory_shanj(upc)
);

--Product Table Creation 
create table product_shanj(
    item_id SERIAL primary key, 
    amount NUMERIC(5,2),
    prod_name VARCHAR(100),
    seller_id INTEGER not null, 
    upc INTEGER not null, 
    foreign KEY(seller_id) references seller_shanj(seller_id),
    foreign KEY(upc) references inventory_shanj(upc)
 );
    
--Cart table creation 
create table cart_shanj(
    cart_id SERIAL primary key, 
    customer_id INTEGER not null, 
    order_Id INTEGER not null, 
    foreign KEY(customer_id) references customer_shanj(customer_id),
    foreign key(order_id) references order_shanj(order_id)
);

