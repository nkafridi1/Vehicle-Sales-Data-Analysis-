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
