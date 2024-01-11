Question 

1. Basic Queries:

1.1 List all customers
Ans  select * from ORG;

1.2 Show all products in the 'Electronics' category
ANS 
SELECT * 
FROM Products
WHERE category = 'Smartphones';

1.3 Find the total number of orders placed.
Ans 
SELECT COUNT(*) AS total_orders
FROM orders;

1.4 Display the details of the most recent order.
Ans
SELECT *
FROM orders
ORDER BY orderDate DESC
LIMIT 1;

2 Joins and Relationships:

2.1 List all products along with the names of the customers who ordered them 
ans
SELECT 
    products.product_id,
    products.product_name,
    customers.customer_name
FROM 
    products
JOIN 
    order_details ON products.product_id = order_details.product_id
JOIN 
    orders ON order_details.order_id = orders.order_id
JOIN 
    customers ON orders.customer_id = customers.customer_id;
    
    2.2 Show orders that include more than one product.
    ANS
    SELECT 
    orders.order_id,
    COUNT(DISTINCT order_details.product_id) AS product_count
FROM 
    orders
JOIN 
    order_details ON orders.order_id = order_details.order_id
GROUP BY 
    orders.order_id
HAVING 
    product_count > 1;

2.3. Find the total sales amount for each customer.
Ans
SELECT
    customers.customer_id,
    customers.customer_name,
    SUM(order_details.quantity * order_details.unit_price) AS total_sales_amount
FROM
    customers
JOIN
    orders ON customers.customer_id = orders.customer_id
JOIN
    order_details ON orders.order_id = order_details.order_id
GROUP BY
    customers.customer_id, customers.customer_name;
    
3. Aggregation and Grouping:

3.1. Calculate the total revenue generated by each product category.
Ans
SELECT
    categories.category_id,
    categories.category_name,
    SUM(order_details.quantity * order_details.unit_price) AS total_revenue
FROM
    categories
JOIN
    products ON categories.category_id = products.category_id
JOIN
    order_details ON products.product_id = order_details.product_id
JOIN
    orders ON order_details.order_id = orders.order_id
GROUP BY
    categories.category_id, categories.category_name;

3.2. Determine the average order value.
Ans
SELECT
    AVG(order_value) AS average_order_value
FROM (
    SELECT
        orders.order_id,
        SUM(order_details.quantity * order_details.unit_price) AS order_value
    FROM
        orders
    JOIN
        order_details ON orders.order_id = order_details.order_id
    GROUP BY
        orders.order_id
) AS order_values;

3.3. Find the month with the highest number of orders.
Ans
SELECT
    EXTRACT(MONTH FROM order_date) AS order_month,
    COUNT(*) AS order_count
FROM
    orders
GROUP BY
    order_month
ORDER BY
    order_count DESC
LIMIT 1;


4. Subqueries and Nested Queries:

4.1. Identify customers who have not placed any orders.
Ans
SELECT
    customers.customer_id,
    customers.customer_name
FROM
    customers
LEFT JOIN
    orders ON customers.customer_id = orders.customer_id
WHERE
    orders.order_id IS NULL;

4.2. Find products that have never been ordered.
ans
SELECT
    products.product_id,
    products.product_name
FROM
    products
LEFT JOIN
    order_details ON products.product_id = order_details.product_id
WHERE
    order_details.order_id IS NULL;


4.3. Show the top 3 best-selling products.
ans
SELECT
    products.product_id,
    products.product_name,
    SUM(order_details.quantity) AS total_quantity_sold
FROM
    products
JOIN
    order_details ON products.product_id = order_details.product_id
GROUP BY
    products.product_id, products.product_name
ORDER BY
    total_quantity_sold DESC
LIMIT 3;


5. Date and Time Functions:

5.1. List orders placed in the last month.
ans
SELECT
    order_id,
    order_date,
    customer_id
FROM
    orders
WHERE
    order_date >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
    AND order_date < CURDATE();

5.2. Determine the oldest customer in terms of membership duration.
ans
SELECT
    customer_id,
    customer_name,
    registration_date,
    DATEDIFF(CURDATE(), registration_date) AS membership_duration
FROM
    customers
ORDER BY
    membership_duration DESC
LIMIT 1;


6. Advanced Queries:

6.1. Rank customers based on their total spending.
ans
SELECT
    customer_id,
    customer_name,
    total_spending,
    RANK() OVER (ORDER BY total_spending DESC) AS spending_rank
FROM (
    SELECT
        c.customer_id,
        c.customer_name,
        COALESCE(SUM(od.quantity * od.unit_price), 0) AS total_spending
    FROM
        customers c
    LEFT JOIN
        orders o ON c.customer_id = o.customer_id
    LEFT JOIN
        order_details od ON o.order_id = od.order_id
    GROUP BY
        c.customer_id, c.customer_name
) AS customer_spending
ORDER BY
    total_spending DESC;


6.2. Identify the most popular product category.
ans
SELECT
    categories.category_id,
    categories.category_name,
    SUM(order_details.quantity) AS total_quantity_sold
FROM
    categories
JOIN
    products ON categories.category_id = products.category_id
JOIN
    order_details ON products.product_id = order_details.product_id
GROUP BY
    categories.category_id, categories.category_name
ORDER BY
    total_quantity_sold DESC
LIMIT 1;


6.3. Calculate the month-over-month growth rate in sales.
ans
WITH MonthlySales AS (
    SELECT
        DATE_FORMAT(order_date, '%Y-%m') AS month,
        SUM(order_details.quantity * order_details.unit_price) AS total_sales
    FROM
        orders
    JOIN
        order_details ON orders.order_id = order_details.order_id
    GROUP BY
        month
)
SELECT
    month,
    total_sales,
    LAG(total_sales) OVER (ORDER BY month) AS previous_month_sales,
    (total_sales - LAG(total_sales) OVER (ORDER BY month)) / LAG(total_sales) OVER (ORDER BY month) * 100 AS growth_rate
FROM
    MonthlySales;


7. Data Manipulation and Updates:

7.1. Add a new customer to the Customers table.
ans
INSERT INTO Customers (customer_name, email, phone)
VALUES ('New Customer', 'newcustomer@example.com', '+1234567890');

7.2. Update the price of a specific product.
UPDATE Products
SET unit_price = 19.99
WHERE product_id = 123; -- Replace 123 with the actual product_id you want to update
