# GranTourisma AutoHaus - SQL Analytics Project
GranTourisma AutoHaus is a car dealership used to demonstrate real‑world SQL analytics. This project explores sales performance, customer behaviour, product trends, and geographic insights. The project uses various SQL techniques like Joins, WINDOW functions, CASE statements and CTEs to produce clean, reproducible insights.

Note: All data used in this project is fully synthetic and was generated solely for learning and demonstration purposes. No real customer, vehicle, or financial information is included.

# Objective
To use advanced SQL techniques to analyse dealership operations across performance, product trends, customer demographics, geographic markets, and sales over time, providing data‑driven insights that support decision‑making and business optimisation.

# Dataset
Three PostgreSQL tables:
- cars
- customers
- orders

# Business Questions
- How is the dealership performing overall?
- Which vehicles and brands drive the most revenue?
- Who are our customers, and how do they spend?
- Which cities generate the most business?
- How have sales evolved over time?

# SQL Techniques Used
- Window functions
- Aggregations
- CTEs
- Ranking functions
- Date/time functions
- Joins

# Key Insights
## Overall Business Performance
- Total Revenue: 125,714,000
- Total Orders: 1,050
- Total Vehicles Sold: 4,223
- Average Order Value: 119,727.62

Insight:  The dealership operates at a high revenue level with strong average order values, indicating a focus on mid‑to‑high‑end vehicles.

## Product Performance
- Top Brand: Audi (22.1M revenue)
- Top Model by Revenue: Audi A6 (13.45M)
- Top Model by Units Sold: Audi A4 (271 units)
- Most Popular Colours: White (886 sold), Black (832 sold)

Insight: German luxury brands dominate revenue. Audi leads both in volume and value.

## Customer Demographics
- Total Customers: 110
- Largest age-group: Adults (63 customers)
- Highest Revenue-generating age-group: Adults (71.3M)
- Top Spender: Riley Howard (2.64M lifetime value)

Insight: Adults (ages 30–39) are the dealership’s core customer base and highest‑value segment.

## Geographic Sales Analysis
- Top Revenue City: Tulsa (2.64M)
- Most Orders: Aurora (20 orders)
- Top Luxury‑Car Cities: Baltimore, Tulsa, Cincinnati (4 orders each)

Insight: Revenue and order volume don’t always align — Tulsa buys fewer cars but more expensive ones.

## Sales Trend Analysis
- Best Month: October 2023 (12.16M)
- Worst Month: June 2024 (4.83M)
- Best Year: 2023 (71.8M)
- 2024 Revenue: 53.9M

Insight: 2023 shows strong, stable growth. 2024 begins well but declines sharply in Q2.

# Tools Used
- PostgreSQL
- Power BI
- GitHub


