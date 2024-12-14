-- Total Sales By Car Makers
SELECT make, COUNT(*) AS total_sales, SUM(sellingprice) AS total_revenue
FROM Vehicles v
JOIN Sales s ON v.vin = s.vin
GROUP BY make;

-- Top 10 Car Manufacturers by Sales:
SELECT make, COUNT(*) AS total_sales, SUM(sellingprice) AS total_revenue
FROM Vehicles v
JOIN Sales s ON v.vin = s.vin
GROUP BY make
ORDER BY total_revenue desc limit 10;

-- Total Sales by Make and Model:
SELECT make, model, COUNT(*) AS total_sales, SUM(sellingprice) AS total_revenue
FROM Vehicles v
JOIN Sales s ON v.vin = s.vin
GROUP BY make, model;


-- Top 10 Selling Cars by Make and Model
SELECT make, model, COUNT(*) AS total_sales, SUM(sellingprice) AS total_revenue
FROM Vehicles v
JOIN Sales s ON v.vin = s.vin
GROUP BY make, model
ORDER BY total_revenue DESC LIMIT 10;

-- Top 5 Selling Cars by States
SELECT state, COUNT(*) AS total_sales, SUM(sellingprice) AS total_revenue
FROM Sales
GROUP BY state
ORDER BY total_revenue DESC
LIMIT 5;

-- Vehicles with the Best Condition-to-Price Ratio:
SELECT v.make, v.model, c.condition_rating, s.sellingprice, (c.condition_rating / s.sellingprice) AS condition_price_ratio
FROM Vehicles v
JOIN Sales s ON v.vin = s.vin
JOIN Condition c ON v.vin = c.vin
ORDER BY condition_price_ratio DESC
LIMIT 10;

