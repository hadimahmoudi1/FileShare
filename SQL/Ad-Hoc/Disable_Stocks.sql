SELECT * FROM dbo.Stocks
SELECT * FROM dbo.StockData
SELECT * FROM dbo.Exchanges



SELECT * 
FROM Stocks AS s
LEFT JOIN dbo.StockData sd
	ON s.StockId = sd.StockId
Where s.ExchangeId = 19
AND sd.StockDataId IS NULL
 
UPDATE Stocks
SET StatusId = 1
FROM Stocks AS s
LEFT JOIN dbo.StockData sd
	ON s.StockId = sd.StockId
Where s.ExchangeId = 19 --Nasdaq
AND sd.StockDataId IS NULL
