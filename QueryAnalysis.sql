-- Scenario 1
EXPLAIN SELECT make, model, COUNT(*) AS total_sales
FROM Vehicles v
JOIN Sales s ON v.vin = s.vin
GROUP BY make, model;

-- Scenario 2
explain select * from vehicles v where (make, model) in (('Ford','Explorer'));