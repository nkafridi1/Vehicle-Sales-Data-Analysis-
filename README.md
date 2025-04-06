# Vehicle Sales Data Analysis

## Project Overview
This project develops a database system to analyze the "Vehicle Sales and Market Trends Dataset." The system extracts insights and trends about car sales based on parameters like manufacturing year, location, and vehicle condition. This project integrates database theory and SQL to derive actionable insights and enhance decision-making in the vehicle sales sector.

## Key Features
- Market trend analysis
- Sales pattern forecasting
- Performance metrics tracking

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

## Database Schema
The database contains the following tables:
- **Vehicles**: Information about each vehicle (VIN, year, make, model, etc.).
- **Sales**: Sales data (state, sale date, selling price, etc.).
- **MarketTrends**: Market value (MMR) for vehicles.
- **Condition**: Condition ratings and odometer readings.
- **PriceLog**: Logs for price updates.


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

## Contributors
- Muhammad Danish Asim 
- Naveed Khan Afridi
- Saad Shahrukh Kiyani
