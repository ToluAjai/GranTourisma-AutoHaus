-- Pillar 1: Overall Business Performance
-- Goal: To discover how the dealership is performing overall


-- Find out the total revenue, total number of orders, total vehicles sold, and average order value
WITH base AS (
    SELECT 
        sales_amount,
        quantity_sold,
        order_id
    FROM orders
)
SELECT
    SUM(sales_amount) AS total_revenue,
    COUNT(order_id) AS total_orders,
    SUM(quantity_sold) AS total_vehicles_sold,
    ROUND(AVG(sales_amount), 2) AS avg_order_value
FROM base;



-- Pillar 2: Product Performance
-- Goal: To discover which vehicles are driving the revenue

-- Which brand generates the most revenue?
SELECT 
car_brand,
SUM(sales_amount) AS revenue_generated
FROM cars c
JOIN orders o
ON c.car_id = o.car_id
GROUP BY 1
ORDER BY revenue_generated DESC; -- Audi made the most money (22122000), followed by Mercedes-Benz (18812000)

-- Car Model full performance
SELECT
    car_brand,
    car_model,
    SUM(sales_amount) AS revenue,
    SUM(quantity_sold) AS units_sold,
    ROUND(AVG(sales_amount), 2) AS avg_order_value,
    RANK() OVER (ORDER BY SUM(sales_amount) DESC) AS revenue_rank,
    RANK() OVER (ORDER BY SUM(quantity_sold) DESC) AS volume_rank
FROM cars c
JOIN orders o USING (car_id)
GROUP BY car_brand, car_model
ORDER BY revenue_rank;

-- Which car colour was purchased the most?
SELECT 
car_color, 
SUM(quantity_sold) AS number_purchased
FROM cars c
JOIN orders o
ON c.car_id = o.car_id
GROUP BY 1
ORDER BY number_purchased DESC; /* White (886) and Black (832) cars were purchased the most,
while Gray and Green cars were purchased the least (213)*/



-- Pillar 3: Customer Demographics
-- Goal: To understand who buys from GranTourisma AutoHaus

-- How many customers do we have? (Break them down into age groups)
SELECT 
 CASE 
 	WHEN age <=29 THEN 'Young Adults'
	WHEN age <=39 THEN 'Adults'
	ELSE 'Older Adults'
END AS age_group, 
COUNT (*) AS number_of_customers
FROM customers
GROUP BY 1; /*We have 63 Adults, 27 Young Adults, and 20 Older Adults(Total of 110 customers).
Youngest age is 23, and the oldest is 50.*/

-- What is the total revenue generated and average spend by each age group?
WITH age_groups AS (
    SELECT 
        c.customer_id,
        CASE 
            WHEN age <= 29 THEN 'Young Adults'
            WHEN age <= 39 THEN 'Adults'
            ELSE 'Older Adults'
        END AS age_group,
        o.sales_amount
    FROM customers c
    JOIN orders o USING (customer_id)
)
SELECT
    age_group,
    SUM(sales_amount) AS total_revenue,
    ROUND(AVG(sales_amount), 2) AS avg_spend
FROM age_groups
GROUP BY age_group
ORDER BY total_revenue DESC;

-- Who are our top 10 biggest spenders?
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(o.order_id) AS orders,
    SUM(o.sales_amount) AS lifetime_value
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY lifetime_value DESC
LIMIT 10; -- Riley Howard (customer_id 46) spent the most money (2636000)



-- Pillar 4: Geographic Sales Analysis
-- Goal: To discover which regions are generating the most business

-- Which city generates the most revenue?
SELECT
city,
SUM(sales_amount) AS revenue
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY city
ORDER BY revenue DESC; /*Most of our money is made from Tulsa (2636000), Glendale and Aurora.
Birmingham and Hialeah generated the least amounts (88000 and 172000, respectively)*/

-- From which city did we get the most orders?
SELECT 
city,
COUNT(order_id) AS number_of_orders
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY 1
ORDER BY number_of_orders DESC; /*The most orders (20) came from Aurora, followed closely by Wichita and New York.
Hialeah and Birmingham ordered the least number of cars*/

-- Which cities had the highest number of orders for the dealership's five most expensive cars?
WITH top_5_expensive_cars AS (
    SELECT car_id, car_model, car_brand, unit_price
    FROM cars
    ORDER BY unit_price DESC
    LIMIT 5
)

SELECT
    c.city,
    COUNT(*) AS expensive_car_orders
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN top_5_expensive_cars t
    ON o.car_id = t.car_id
GROUP BY c.city
ORDER BY expensive_car_orders DESC; -- Baltimore, Tulsa, Cincinnati had 4 orders each (the most)


-- Pillar 5: Sales Trend Analysis
-- Goal: To identify how the business has evolved over time

-- What is the monthly revenue? 
SELECT 
	to_char(order_date, 'Month') AS "Month", 
	EXTRACT('Year' FROM order_date) AS "Year",
	SUM(sales_amount) AS "Revenue Generated"
FROM orders
GROUP BY 1, 2, EXTRACT('Month' FROM order_date)
ORDER BY EXTRACT('Year' FROM order_date),EXTRACT('Month' FROM order_date);

-- How many units do we sell per month? 
SELECT 
	to_char(order_date, 'Month') AS "Month", 
	EXTRACT('Year' FROM order_date) AS "Year",
	SUM(quantity_sold) AS "Number of cars sold"
FROM orders
GROUP BY 1, 2, EXTRACT('Month' FROM order_date)
ORDER BY EXTRACT('Year' FROM order_date),EXTRACT('Month' FROM order_date);

-- Which year did we make the most money?
SELECT 
EXTRACT (YEAR FROM order_date) AS order_year,
SUM(sales_amount) AS revenue_generated
FROM orders
GROUP BY 1
ORDER BY revenue_generated DESC; -- More money was made in 2023 than in 2024
