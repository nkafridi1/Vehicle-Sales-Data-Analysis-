-- Creating the Vehicles table
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

-- Creating the Sales table
CREATE TABLE Sales (
    id SERIAL PRIMARY KEY,
    vin VARCHAR(20),
    state VARCHAR(20),
    saledate TIMESTAMP,
    sellingprice DECIMAL(10, 2),
    FOREIGN KEY (vin) REFERENCES Vehicles(vin)
);

-- Creating the Market Trends table
CREATE TABLE MarketTrends (
    id SERIAL PRIMARY KEY,
    vin VARCHAR(20),
    mmr DECIMAL(10, 2),
    FOREIGN KEY (vin) REFERENCES Vehicles(vin)
);

-- Creating the Condition table
CREATE TABLE Condition (
    id SERIAL PRIMARY KEY,
    vin VARCHAR(20),
    condition_rating DECIMAL(5, 2),
    odometer DECIMAL(10, 2),
    FOREIGN KEY (vin) REFERENCES Vehicles(vin)
);

-- Creating the PriceLog table
CREATE TABLE PriceLog (
    id SERIAL PRIMARY KEY,
    vin VARCHAR(20),
    updated_price DECIMAL(10, 2),
    update_date TIMESTAMP,
    FOREIGN KEY (vin) REFERENCES Vehicles(vin)
);
