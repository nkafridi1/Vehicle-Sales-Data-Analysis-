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

-- Finding States with Total Revenue Greater Than the National Average
SELECT state, SUM(sellingprice) AS total_revenue
FROM Sales
GROUP BY state
HAVING SUM(sellingprice) > (
    SELECT AVG(total_revenue)
    FROM (
        SELECT state, SUM(sellingprice) AS total_revenue
        FROM Sales
        GROUP BY state
    ) state_revenues
);

-- Identify Vehicles with Significant Price Deviations from MMR
SELECT 
    v.make, 
    v.model, 
    mt.mmr AS market_value, 
    s.sellingprice AS actual_price, 
    ROUND(((s.sellingprice - mt.mmr) / mt.mmr) * 100, 2) AS price_deviation_percentage,
    CASE 
        WHEN s.sellingprice > mt.mmr * 1.2 THEN 'Overpriced'
        WHEN s.sellingprice < mt.mmr * 0.8 THEN 'Underpriced'
        ELSE 'Fairly Priced'
    END AS price_category
FROM 
    Vehicles v
JOIN 
    Sales s ON v.vin = s.vin
JOIN 
    MarketTrends mt ON v.vin = mt.vin
WHERE 
    ABS(s.sellingprice - mt.mmr) >= (mt.mmr * 0.2) and model != 'NaN' and make != 'NaN'
ORDER BY 
    price_deviation_percentage DESC;