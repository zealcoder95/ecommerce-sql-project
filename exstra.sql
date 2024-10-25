-- Database Performance Optimization: Index Usage
Create index idx_customer_id ON Orders(customer_id)
Create index idx_product_id ON Orders(product_id)

-- Creating a View in the Database
Create view CustomerTotalOrders AS
Select c.customer_name, SUM(o.quantity) AS total_orders
From Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name

-- Stored Procedure: Querying Orders by Date Range
Create PROCEDURE GetOrdersByDateRange (@StartDate DATE, @EndDate DATE)
AS
Begin
   Select o.order_id, c.customer_name, p.product_name, o.order_date, o.quantity
   From Orders o
   JOIN Customers c ON o.customer_id = c.customer_id
   JOIN Products p ON o.product_id = p.product_id
   Where o.order_date BETWEEN @StartDate AND @EndDate
End

EXEC GetOrdersByDateRange '2023-01-01', '2023-12-31'
