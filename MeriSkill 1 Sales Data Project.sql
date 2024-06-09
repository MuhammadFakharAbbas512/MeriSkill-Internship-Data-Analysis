-- PROJECT TITLE: Sales Data Analysis

-- Sales Trend over TIME

-- Monthly Trend
SELECT
    MONTH(order_date) AS Month,
    COUNT(DISTINCT Order_ID) AS Sales
FROM sales_data
WHERE order_date < '2020-01-01'
GROUP BY Month;

-- Quarterly Trend
SELECT
    QUARTER(order_date) AS Quarter,
    COUNT(DISTINCT Order_ID) AS Sales
FROM sales_data
WHERE order_date < '2020-01-01'
GROUP BY QUARTER(order_date);



-- Sales Trend over PRODUCT

-- Product Sales
SELECT
    Product AS Product_Category,
    COUNT(DISTINCT order_id) AS Sales
FROM sales_data
WHERE order_date < '2020-01-01'
GROUP BY Product_Category
ORDER BY Sales DESC;

-- Product Revenue
SELECT
    Product AS Product_Category,
    SUM(Sales) AS Revenue
FROM sales_data
WHERE order_date < '2020-01-01'
GROUP BY Product_Category
ORDER BY Revenue DESC;

-- Quantity Ordered by Product
SELECT
    Product,
    SUM(quantity_ordered) AS Quantity_Ordered
FROM sales_data
GROUP BY Product
ORDER BY Quantity_Ordered DESC;

-- Revenue and Profit Margin
SELECT
    SUM(Sales) AS Revenue,
    SUM(Sales - price_each) AS Profit_Margin
FROM sales_data
WHERE order_date < '2020-01-01';




-- Sales Trend by LOCATION

-- Revenue by City

SELECT
    City,
    SUM(Sales) AS Revenue
FROM sales_data
GROUP BY City
ORDER BY Revenue DESC;
