Create database DbEcMgt
Use DbEcMgt

-- Customers Table
Create Table Customers 
(
   customer_id int primary key identity(1,1),
   customer_name varchar(100),
   email varchar(100),
   registration_date date
)

-- Products Table
Create Table Products 
(
   product_id int primary key identity(1,1),
   product_name varchar(100),
   category varchar(50),
   price decimal(10, 2)
)

-- Orders Table
Create Table Orders 
(
   order_id int primary key identity(1,1),
   customer_id int,
   product_id int,
   order_date date,
   quantity int,
   FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
   FOREIGN KEY (product_id) REFERENCES Products(product_id)
)