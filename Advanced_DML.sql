-- Sales Trends Over Time:
SELECT TO_CHAR(saledate, 'YYYY-MM') AS sale_month, 
       COUNT(*) AS sales_count, 
       SUM(sellingprice) AS total_revenue
FROM Sales
GROUP BY TO_CHAR(saledate, 'YYYY-MM')
ORDER BY sale_month;

-- Vehicles with High Market Value vs. Selling Price:
SELECT v.make, v.model, mt.mmr, s.sellingprice, (mt.mmr - s.sellingprice) AS price_difference
FROM Vehicles v
JOIN Sales s ON v.vin = s.vin
JOIN MarketTrends mt ON v.vin = mt.vin
WHERE (mt.mmr - s.sellingprice) > 5000
ORDER BY price_difference DESC;

-- Finding Vehicles with Above-Average Selling Price (First 10 records)
SELECT v.make, v.model, s.sellingprice
FROM Vehicles v
JOIN Sales s ON v.vin = s.vin
WHERE s.sellingprice > (
    SELECT AVG(sellingprice)
    FROM Sales
) limit 10;

-- Top 5 Most Sold Vehicle Models in Each State:
SELECT state, make, model, total_sales
FROM (
    SELECT s.state, v.make, v.model, COUNT(*) AS total_sales,
           RANK() OVER (PARTITION BY s.state ORDER BY COUNT(*) DESC) AS rank
    FROM Sales s
    JOIN Vehicles v ON s.vin = v.vin
    GROUP BY s.state, v.make, v.model
) ranked_sales
WHERE rank <= 5;
-- In Michigan:
SELECT state, make, model, total_sales
FROM (
    SELECT s.state, v.make, v.model, COUNT(*) AS total_sales,
           RANK() OVER (PARTITION BY s.state ORDER BY COUNT(*) DESC) AS rank
    FROM Sales s
    JOIN Vehicles v ON s.vin = v.vin
    GROUP BY s.state, v.make, v.model
) ranked_sales
WHERE rank <= 5 and state = 'mi';
