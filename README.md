# Vehicle Sales Data Analysis

## Project Overview
This project develops a database system to analyze the "Vehicle Sales and Market Trends Dataset." The system extracts insights and trends about car sales based on parameters like manufacturing year, location, and vehicle condition. This project integrates database theory and SQL to derive actionable insights and enhance decision-making in the vehicle sales sector.

## Key Features
- Market trend analysis
- Sales pattern forecasting
- Performance metrics tracking
- Predictive modeling capabilities

## Dataset
The dataset includes:
1. **Vehicle Details**: 974 models from 97 manufacturers (1982-2015).
2. **Condition and Mileage**: Vehicle condition ratings (1-49) and odometer readings.
3. **Transaction Information**: Sales prices ($500 to $230,000) and sale dates (01/01/2014 - 21/07/2015).
4. **Market Trends**: Market values (Manheim Market Report) ranging from $25 to $182,000.

Dataset source: [Kaggle](https://www.kaggle.com/datasets/syedanwarafridi/vehicle-sales-data)

## Technical Implementation
This project employs:
- Advanced query optimization techniques
- Efficient data retrieval mechanisms
- Robust data integrity controls
- Scalable storage solutions

## Database Schema
The database contains the following tables:
- **Vehicles**: Information about each vehicle (VIN, year, make, model, etc.).
- **Sales**: Sales data (state, sale date, selling price, etc.).
- **MarketTrends**: Market value (MMR) for vehicles.
- **Condition**: Condition ratings and odometer readings.
- **PriceLog**: Logs for price updates.

### Example Schema
```sql
CREATE TABLE Vehicles (
  vin VARCHAR(20) PRIMARY KEY,
  year INT,
  make VARCHAR(50),
  model VARCHAR(50),
  trim VARCHAR(50),
  body VARCHAR(50),
  transmission VARCHAR(50),
  color VARCHAR(30),
  interior VARCHAR(30)
);

CREATE TABLE Sales (
  id SERIAL PRIMARY KEY,
  vin VARCHAR(20),
  state VARCHAR(20),
  saledate TIMESTAMP,
  sellingprice DECIMAL(10, 2),
  FOREIGN KEY (vin) REFERENCES Vehicles(vin)
);
```

## Data Transformation
The raw dataset required cleaning to remove discrepancies:
- Eliminated NULL and invalid dates.
- Filtered unrealistic selling prices (e.g., below $500).
- Removed records with NULL values in critical fields (e.g., make and model).

## SQL Queries
### Total Sales by Manufacturer
```sql
SELECT make, COUNT(*) AS total_sales, SUM(sellingprice) AS total_revenue
FROM Vehicles v
JOIN Sales s ON v.vin = s.vin
GROUP BY make;
```

### Top 10 Car Manufacturers by Sales
```sql
SELECT make, COUNT(*) AS total_sales, SUM(sellingprice) AS total_revenue
FROM Vehicles v
JOIN Sales s ON v.vin = s.vin
GROUP BY make
ORDER BY total_revenue DESC
LIMIT 10;
```

### Vehicles with the Best Condition-to-Price Ratio
```sql
SELECT v.make, v.model, c.condition_rating, s.sellingprice,
  (c.condition_rating / s.sellingprice) AS condition_price_ratio
FROM Vehicles v
JOIN Sales s ON v.vin = s.vin
JOIN Condition c ON v.vin = c.vin
ORDER BY condition_price_ratio DESC
LIMIT 10;
```

## Team Responsibilities
- **Muhammad Danish Asim**: Data cleaning and DDL/DML statements.
- **Saad Shahrukh Kiyani**: SQL queries and report writing.
- **Naveed Khan Afridi**: ER diagrams and performance profiling.

## Files
- `hello.py`: Data transformation and cleaning script.
- `ddl_schema.sql`: Database schema creation.
- `ddl_indexes.sql`: Indexes for optimization.
- `dml.sql`: Data insertion statements.
- `hello.sql`: SQL queries for analysis.
- Transformed dataset: CSV format.

## Execution Plan and Optimization
The project applies indexing and query optimization techniques to enhance performance.
- **Before Optimization**: Long query execution times.
- **After Optimization**: Improved efficiency using indexes on columns like `vin`, `make`, and `saledate`.

## Advanced Analysis
- Sales trends over time
- Identifying overpriced and underpriced vehicles
- State-wise sales analysis

## Transaction Management
Example:
```sql
START TRANSACTION;
UPDATE Sales SET sellingprice = sellingprice * 1.05
WHERE vin = '5xyktca69fg566472';
INSERT INTO PriceLog (vin, updated_price, update_date)
VALUES ('5xyktca69fg566472', 22575, NOW());
COMMIT;
```

## License
This project is licensed under the [MIT License](LICENSE).

## Contributors
- Muhammad Danish Asim
- Saad Shahrukh Kiyani
- Naveed Khan Afridi
