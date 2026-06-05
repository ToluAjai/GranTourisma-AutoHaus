# Cars Table
Stores information about each vehicle available in GranTourisma AutoHaus inventory.

| Column Name | Data Type | Description                                 |
| ----------- | --------- | ------------------------------------------- |
| car_id      | INT       | Unique identifier for each car              |
| car_brand   | VARCHAR   | Manufacturer of the car (e.g., BMW, Toyota) |
| car_model   | VARCHAR   | Specific model of the car                   |
| car_color   | VARCHAR   | Colour of the vehicle                       |
| unit_price  | DECIMAL   | Price of a single unit of the car           |

# Customers Table
Contains details about customers who purchase vehicles.

| Column Name | Data Type | Description                         |
| ----------- | --------- | ----------------------------------- |
| customer_id | INT       | Unique identifier for each customer |
| first_name  | VARCHAR   | Customer's first name               |
| last_name   | VARCHAR   | Customer's last name                |
| age         | INT       | Age of the customer                 |
| email       | VARCHAR   | Customer email address              |
| city        | VARCHAR   | City where the customer is located  |

# Orders Table
Records all car purchases made by customers.

| Column Name   | Data Type | Description                            |
| ------------- | --------- | -------------------------------------- |
| order_id      | INT       | Unique identifier for each order       |
| order_date    | DATE      | Date the order was placed              |
| customer_id   | INT       | Links to Customers table               |
| car_id        | INT       | Links to Cars table                    |
| quantity_sold | INT       | Number of cars purchased in the order  |
| sales_amount  | DECIMAL   | Total revenue generated from the order |
