# 🛒 AliBaba Data Analysis – SQL

## 📌 Project Overview

This project is a SQL Data Analysis project focused on analyzing product pricing, quantities, categories, shipping cities, payment methods, and sales-related information from the AliBaba dataset.

The project demonstrates practical SQL skills through data exploration, aggregation, data manipulation, table creation, joins, subqueries, views, CASE statements, and Window Functions.

The analysis focuses on answering business-oriented questions and extracting meaningful insights from product data.

---

## 🎯 Project Objectives

The main objectives of this project are to:

- Explore product and customer data
- Identify products by shipping city
- Find the highest-priced products
- Calculate average quantity
- Analyze total quantity by category
- Analyze payment methods
- Identify products with above-average cost prices
- Calculate total special price for Watches
- Apply a 10% cost price increase to Women Apparel
- Analyze products by sale status
- Classify products based on item price
- Rank products within categories
- Calculate running totals
- Compare average special prices across cities and categories

---

## 🛠️ Tools & SQL Skills

- SQL Server
- SELECT
- TOP
- TOP WITH TIES
- DISTINCT
- WHERE
- ORDER BY
- GROUP BY
- HAVING
- JOIN
- CREATE TABLE
- INSERT
- UPDATE
- DELETE
- ALTER TABLE
- CREATE VIEW
- CASE Statements
- Aggregate Functions
- Subqueries
- Correlated Subqueries
- Window Functions
- DENSE_RANK()
- Running Totals
- Data Aggregation
- Data Manipulation
- Business Analysis

---

# 🔍 SQL Analysis

## 📦 Product Exploration

The first analysis retrieves the first 10 rows from the Alibaba dataset to explore the available product and customer information.

The dataset includes fields such as:

- Customer Name
- Shipping City
- Category
- Subcategory
- Product Gender
- Segment
- Class
- Family
- Product Name
- Brand
- Item Price
- Cost Price
- Special Price
- Quantity
- Payment Method
- Sale Flag

---

## 🏙️ Products Shipped from Bangalore

The analysis identifies unique products associated with the shipping city Bangalore.

The query returned 12 products, including:

- Puma Black
- The Overplay Vii White Basketball Shoes
- RB3025 004 Green Sunglasses
- Gold/White Analog Watches
- 9166SI04 Black Analog Watch
- Black Boots
- Street Tuneo Mid Black Sneakers
- Th1790787/D Sport Black/White Chronograph-Mksp
- Reaflex Optimal Yellow Running
- Bpb-1004C Silver/Black Analog Watch
- Embroidered Blue Saree - Mksp
- Navy Blue Georgette Brocade Neck & Dupatta Suit

---

# 💰 Pricing Analysis

## 🏆 Highest-Priced Products

The project uses TOP 5 WITH TIES to identify the products with the highest item prices.

Because several products share the same price, the query returned 8 products.

| Product | Item Price |
|---|---:|
| Eureka Brussels Nest of Tables | 13,500 |
| Street Tuneo Mid Black Sneakers | 13,500 |
| Silver/Silver Analog Watch | 13,500 |
| Puma Sneakers Black | 12,375 |
| Lunarswift+ 4 Black Running Shoes | 12,375 |
| Embroidered Blue Dress Material - Mksp | 12,375 |
| 2641-44 Gold/Silver Analog Watch | 12,375 |

### Key Insight

The highest item price identified in the analysis was 13,500.

---

## 💵 Products Above Average Cost Price

A subquery was used to compare individual product cost prices against the overall average cost price.

The analysis returned products with cost prices ranging from approximately:

3,275.14 to 3,309.01

Examples include:

- 9166SI04 Black Analog Watch — 3,275.14
- Flex 2012 Rn Grey Running Shoes — 3,275.14
- Tycoon 1535Y104 Black/Black Analog Watch — 3,275.14
- Air Visi Pro II Nbk Black Basketball Shoes — 3,296.25
- Embroidered Georgette Multi Saree — 3,296.25
- Knee-Length Brown Boots — 3,296.25
- Ethnic Closet Sarees Green — 3,299.48
- Revolution 2 Msl Grey Running Shoes — 3,299.48
- Mercurial Veloce Fg Blue Football Shoes — 3,299.48
- Embroidered Blue Saree - Mksp — 3,299.48
- CH2573 Black Chronograph Watches — 3,309.01

---

## ⌚ Watches Special Price
The total special price for products in the WATCHES category was:

### 53,415,859

This analysis was performed using SUM() with a category filter.

---

# 📊 Quantity Analysis

## Average Quantity

The calculated average quantity was:

### 1

The analysis used the AVG() aggregate function.

---

## 📈 Total Quantity by Category

| Category | Total Quantity |
|---|---:|
| Furniture | 524 |
| SUNGLASSES | 542 |
| Bags | 591 |
| Women Footwear | 753 |
| Women Apparel | 1,049 |
| Men Footwear | 2,457 |
| Sports Equipment | 3,087 |
| WATCHES | 7,184 |

### Key Insight

WATCHES had the highest total quantity with 7,184, followed by:

- Sports Equipment — 3,087
- Men Footwear — 2,457
- Women Apparel — 1,049

---

# 💳 Payment Method Analysis

A separate Payment_Method table was created and populated with payment methods.

The available payment methods were:

- COD
- Prepaid

A JOIN was then used to connect the payment method table with the main Alibaba dataset.

The resulting analysis displays customer names together with their corresponding payment methods.

Example results include:

| Customer | Payment Method |
|---|---|
| ABHINAV CHATTER | COD |
| AMIT GALPHADE | COD |
| PRABHU NAMBIAPP | Prepaid |
| MALLIKARJUNA H | COD |
| ANUPAM UPADHYAY | Prepaid |
| SITAL DE | COD |
| Abdul Qadir Sha | Prepaid |

---

# 👗 Women Apparel Cost Price Analysis

A SQL View named:

Women10

was created to calculate the cost price after applying a 10% increase to products in the Women Apparel category.

Selected results include:

| Product | Cost Price After 10% Increase |
|---|---:|
| Navy Blue Georgette Brocade Neck & Dupatta Suit | 11,799,000.75 |
| Embroidered Blue Dress Material - Mksp | 1,699,673.38 |
| Blue Sarees | 1,762,513.16 |
| Embroidered Black Saree | 1,737,936.39 |
| Designer Printed Crepe Saree | 3,077,673.79 |
| Ethnic Closet Sarees Green | 1,901,024.20 |
| Embroidered Georgette Multi Saree | 1,725,929.03 |

This demonstrates the use of:

- CREATE VIEW
- Arithmetic calculations
- SUM()
- GROUP BY

---

# 🏷️ Sale Status Analysis

The project examined the Sale_Flag field and removed records where:

Sale_Flag = 'Not on Sale'

This demonstrates practical SQL data manipulation using the DELETE statement.

---

# 🧮 Product Price Classification

A new column named:

Discount_Type

was added to the dataset.

Products were classified based on their item price:

| Item Price | Classification |
|---|---|
| Above 8,000 | High |
| 5,000 – 8,000 | Medium |
| Below 5,000 | Low |

A CASE statement was used to create the classifications.

### Examples from the results:

- 4,999 → Low
- 4,020 → Low
- 5,499 → Medium
- 4,799 → Low
- 5,299 → Medium
- 4,195 → Low

---

# 🏆 Product Ranking by Category

The project uses the SQL Window Function:

DENSE_RANK()

to rank products according to their Special_price within each category.

### Example – Bags Category

| Product | Special Price | Category Rank |
|---|---:|---:|
| Downing Street 04 Black Handbag | 5,995 | 1 |
| Downing Street 04 Black Handbag | 5,499 | 2 |

This demonstrates how Window Functions can be used to rank products within groups.

---

# 📈 Running Total Analysis

A running total of quantity was calculated for each product using:

- SUM() OVER()
- PARTITION BY
- ORDER BY
- ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW

Examples from the SQL results include:

| Product | Quantity | Running Total |
|---|---:|---:|
| 2641-44 Gold/Silver Analog Watch | 1 | 501 |
| Adizero F50 2 M Black Running Shoes | 1 | 360 |
| Bpb-0016-C Rose Gold/White Analog Watch | 1 | 15 |
| Bpb-0016-C Rose Gold/White Analog Watch | 1 | 347 |
| Designer Printed Crepe Saree | 1 | 67 |
| Th1790787/D Sport Black/White Chronograph-Mksp | 1 | 471 |
| Ventilator His Grey Running Shoes | 1 | 491 |
| White/Black Chronograph | 1 | 313 |
| SKINS Navy Blue Tights | 1 | 100 |
| SKINS Navy Blue Tights | 1 | 432 |
| SKINS Navy Blue Tights | 1 | 764 |

---

# 🏙️ City & Category Price Analysis
The project uses a correlated subquery to compare the average special price of each city/category combination against the average special price for its corresponding category.

The overall average special price shown in the analysis was:

### 4,997

Examples returned by the city/category analysis include:

| Shipping City | Category | Average Special Price |
|---|---|---:|
| Pune | Women Footwear | 4,618 |
| Dehradun | Women Footwear | 4,619 |
| Mumbai | Women Footwear | 4,620 |
| Ahmedabad | Women Footwear | 4,626 |
| Hyderabad | Women Footwear | 4,627 |
| Delhi | Women Footwear | 4,636 |
| Ujjain | Women Footwear | 4,636 |
| Indore | Women Footwear | 4,636 |
| Deoria | Women Footwear | 4,636 |
| Udaipur | Women Footwear | 4,636 |
| Chennai | Women Footwear | 4,636 |
| Akola | Women Footwear | 4,636 |

The correlated subquery allows the comparison to be made against the average for the relevant category rather than only against the overall dataset average.

---

# 💡 Key Business Insights

Based on the SQL analysis:

### ⌚ Watches Lead in Quantity

The WATCHES category recorded the highest total quantity at:

7,184 units

This was significantly higher than the other categories in the analysis.

### 💰 High-Value Products

The highest item price identified was:

13,500

Several products shared this highest price, which is why TOP 5 WITH TIES returned more than five records.

### 🛍️ Women Apparel

The Women Apparel analysis showed substantial calculated cost values after applying the 10% increase, with the highest displayed result reaching:

11,799,000.75

### 💳 Payment Methods

The dataset includes two payment methods:

COD and Prepaid

### 📊 Category-Level Analysis

The project demonstrates how SQL aggregation can be used to compare product categories based on total quantity and pricing metrics.

---

# 🔄 Analysis Workflow

`text
Alibaba Dataset
       ↓
Explore Product Data
       ↓
Analyze Shipping Cities
       ↓
Analyze Product Prices
       ↓
Calculate Average Quantity
       ↓
Aggregate Quantity by Category
       ↓
Analyze Payment Methods
       ↓
Use JOINs
       ↓
Use Subqueries
       ↓
Create SQL View
       ↓
Transform Data Using CASE
       ↓
Rank Products Using DENSE_RANK()
       ↓
Calculate Running Totals
       ↓
Compare City & Category Prices
       ↓
Generate Business Insights


---


# 📁 Project Files

### SQL Analysis

AliBaba-SQL-Analysis.sql

Contains the SQL queries used for product exploration, pricing analysis, quantity analysis, payment methods, data manipulation, ranking, running totals, and advanced SQL analysis.

### Analysis Documentation

Alibaba-SQL-Analysis.pdf

Contains the SQL analysis results and screenshots of executed queries.

---

# 🎯 Project Objective

The main objective of this project is to demonstrate practical SQL Data Analysis skills by analyzing product data and answering business-focused questions.

The project demonstrates the ability to:

- Query structured datasets
- Analyze products and categories
- Aggregate data using SQL
- Compare pricing metrics
- Join multiple tables
- Create and modify database structures
- Transform data using CASE statements
- Use subqueries and correlated subqueries
- Apply Window Functions
- Rank products within categories
- Calculate running totals
- Extract business insights from data

---

# 💼 Project Type

AliBaba Data Analysis | SQL | Data Analytics

---

⭐ This project is part of my Data Analyst Portfolio, demonstrating practical SQL skills in data querying, data manipulation, data aggregation, advanced SQL analysis, and business-focused data exploration.
      
