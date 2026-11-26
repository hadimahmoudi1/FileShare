IF EXISTS (SELECT 1 FROM Sys.objects WHERE NAME = 'vStockData')
BEGIN
    DROP VIEW dbo.vStockData
END
GO
CREATE VIEW dbo.vStockData
AS 
    SELECT
        S.Symbol,
        S.Name,
        SD.StockDataId,
        SD.StockId,
        SD.DateId,
        SD.TimeId,
        SD.[Open],
        SD.High,
        SD.Low,
        SD.[Close],
        SD.Volume,
        SD.AdjClose,
        SD.Comments,
        SD.[XML],
        SD.CreatedDate,
        SD.ModifiedDate,
        SD.StatusId
    FROM Stocks AS S
    INNER JOIN StockData AS SD
    ON S.StockId = SD.StockId
