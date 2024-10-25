-- Adding Customer Data
Declare @i int = 1
Declare @customer_names Table (name varchar(100))

-- Insert sample customer names
Insert into @customer_names (name) values
('Olivia Smith'), ('Liam Johnson'), ('Emma Williams'), ('Noah Jones'), ('Ava Brown'),
('Sophia Davis'), ('Jackson Miller'), ('Isabella Garcia'), ('Lucas Martinez'), ('Mia Rodriguez'),
('Aiden Hernandez'), ('Amelia Lopez'), ('James Anderson'), ('Harper Thomas'), ('Elijah Taylor'),
('Evelyn Moore'), ('William Jackson'), ('Abigail Martin'), ('Oliver Lee'), ('Ella Perez'),
('Henry Hall'), ('Chloe Young'), ('Alexander Allen'), ('Sofia King'), ('Daniel Wright'),
('Victoria Scott'), ('Matthew Green'), ('Scarlett Adams'), ('Joseph Nelson'), ('Grace Carter'),
('Samuel Mitchell'), ('Aria Perez'), ('David Roberts'), ('Aaliyah Turner'), ('Carter Phillips'),
('Madison Campbell'), ('Gabriel Parker'), ('Luna Evans'), ('Isaiah Edwards'), ('Zoe Edwards'),
('Sebastian Torres'), ('Nora Rivera'), ('Christopher Murphy'), ('Lily Cook'), ('Andrew Cooper'),
('Camila Reed'), ('Thomas Bailey'), ('Riley Bennett'), ('Joseph Morris'), ('Hannah Price')

While @i <= 1000
Begin
    Declare @random_index int = FLOOR(RAND() * (Select COUNT(*) From @customer_names)) -- Calculate a random index
    Declare @customer_name varchar(100)
    Declare @first_name varchar(50)
    Declare @last_name varchar(50)
    Declare @email_format int = FLOOR(RAND() * 6) -- Generate a random number between 0 and 5
    Declare @email varchar(100)

    -- Retrieve a random customer name
    Select @customer_name = name 
    From @customer_names 
    ORDER BY NEWID() OFFSET @random_index ROWS FETCH NEXT 1 ROWS ONLY

    -- Split first and last names
    Set @first_name = LEFT(@customer_name, CHARINDEX(' ', @customer_name) - 1)
    Set @last_name = SUBSTRING(@customer_name, CHARINDEX(' ', @customer_name) + 1, LEN(@customer_name))

    -- Generate email based on different formats
    IF @email_format = 0
        Set @email = CONCAT(LOWER(@first_name), '.', LOWER(@last_name), '@example.com') -- First.Last
    Else IF @email_format = 1
        Set @email = CONCAT(LOWER(@first_name), '_', LOWER(@last_name), '@example.com') -- First_Last
    Else IF @email_format = 2
        Set @email = CONCAT(LOWER(@first_name), '-', LOWER(@last_name), '@example.com') -- First-Last
    Else IF @email_format = 3
        Set @email = CONCAT(LOWER(@first_name), LOWER(@last_name), '@example.com') -- FirstLast
    Else IF @email_format = 4
        Set @email = CONCAT(LOWER(@first_name), '.', LOWER(@last_name), '123@example.com') -- First.Last123
    Else IF @email_format = 5
        Set @email = CONCAT(LOWER(@last_name), '.', LOWER(@first_name), '@example.com') -- Last.First

    -- Check if the customer already exists
    IF NOT EXISTS (SELECT 1 FROM Customers WHERE customer_name = @customer_name)
    Begin
        -- Insert customer data
        Insert into Customers (customer_name, email, registration_date)
        values (
            @customer_name, -- Randomly selected customer name
            @email, -- Email generated in various formats
            DATEADD(DAY, FLOOR(RAND() * 365), '2020-01-01') -- Registration date
        )
    End

    Set @i = @i + 1
End

-- Adding Product Data
Declare @j INT = 1
Declare @category VARCHAR(50)
Declare @product_name VARCHAR(100)

WHILE @j <= 1000
Begin
   -- Select a random category
   Set @category = CASE 
      When @j % 8 = 0 Then 'Electronics'
      When @j % 8 = 1 Then'Books'
      When @j % 8 = 2 Then 'Clothing'
      When @j % 8 = 3 Then 'Home Appliances'
      When @j % 8 = 4 Then 'Toys'
      When @j % 8 = 5 Then 'Sports Equipment'
      When @j % 8 = 6 Then 'Beauty & Health'
      Else 'Groceries'
   End
   
   -- Assign a random product name based on the category
   Set @product_name = CASE @category
      When 'Electronics' Then 'Phone'
      When 'Books' Then 'Novel'
      When 'Clothing' Then 'Shirt'
      When 'Home Appliances' Then 'Fridge'
      When 'Toys' Then 'Lego'
      When 'Sports Equipment' Then 'Ball'
      When 'Beauty & Health' Then 'Cream'
      Else 'Rice'
   End

   Insert into Products (product_name, category, price)
   values (@product_name, @category, FLOOR(RAND() * 1000) + 50)

   Set @j = @j + 1
End

-- Adding Order Data
Declare @k int = 1
Declare @customer_id int
Declare @product_id int
Declare @order_date date
Declare @quantity int

-- Get the maximum customer_id and product_id from the respective tables
Declare @max_customer_id int
Declare @max_product_id int

Select @max_customer_id = MAX(customer_id) From Customers
Select @max_product_id = MAX(product_id) From Products

While @k <= 100000
Begin
   -- Ensure the customer_id and product_id are within valid ranges
   Set @customer_id = FLOOR(RAND() * @max_customer_id) + 1 -- Get a random customer_id
   Set @product_id = FLOOR(RAND() * @max_product_id) + 1  -- Get a random product_id
   Set @order_date = DATEADD(DAY, FLOOR(RAND() * 365), '2023-01-01')
   Set @quantity = FLOOR(RAND() * 10) + 1

   -- Insert the order if the customer_id and product_id are valid
   IF EXISTS (SELECT 1 FROM Customers WHERE customer_id = @customer_id) AND
      EXISTS (SELECT 1 FROM Products WHERE product_id = @product_id)
   Begin
       Insert into Orders (customer_id, product_id, order_date, quantity)
       values (@customer_id, @product_id, @order_date, @quantity)
   End

   Set @k = @k + 1
End