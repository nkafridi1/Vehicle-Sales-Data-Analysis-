-- Transactions
START TRANSACTION;
UPDATE Sales
SET sellingprice = sellingprice * 1.05
WHERE vin = ‘5xyktca69fg566472’;

INSERT INTO "PriceLog" (vin, updated_price, update_date)
VALUES (‘5xyktca69fg566472’, 22575, NOW());

COMMIT;