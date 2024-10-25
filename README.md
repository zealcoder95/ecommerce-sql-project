# E-Commerce Management Database Project

## Project Description
This project aims to develop a comprehensive database management system for modern e-commerce platforms. The database includes essential components such as customer information, product data, and order management, enabling data analysis and reporting using SQL. The project encompasses various important SQL features, including database design, data insertion, indexing, views, and stored procedures.

## Project Components

### 1. **Database Structure**
- **Customers Table:** Designed to store customer information, with each customer identified by a unique `customer_id`.
- **Products Table:** Contains product information, with each product identified by a unique `product_id`.
- **Orders Table:** Tracks customer orders, storing order details with `order_id`, `customer_id`, and `product_id`.

### 2. **Data Insertion**
The project is structured to insert 1,000 customer and product records along with 100,000 order records. The sample customer names and product categories are enriched with random email formats.

### 3. **Performance Optimization**
To enhance database performance, indexes have been created on `customer_id` and `product_id` for orders. This ensures that queries execute more quickly.

### 4. **Views and Stored Procedures**
- **View:** A view named `CustomerTotalOrders` has been created to display customer names along with their total order amounts.
- **Stored Procedure:** A stored procedure named `GetOrdersByDateRange` has been developed to query orders within a specific date range.

## Usage Guide
1. **Create the Database:** Use the SQL commands found in the project files to create the database and add tables.
2. **Load Data:** Insert the sample customer and product records.
3. **Run Queries:** Perform data analysis using the created stored procedure and views to query order data.

## Project Files
SQL files and additional datasets related to the project are available in the [Project Files](link_here) section.

## Contact
Feel free to reach out to me with any questions or feedback. I welcome contributions related to this project!
