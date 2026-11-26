USE TU
GO


IF EXISTS (SELECT 1 FROM Sys.objects WHERE name = 'prGetActiveStockSymbols')
BEGIN
	DROP PROCEDURE dbo.prGetActiveStockSymbols
END
GO

CREATE PROCEDURE [dbo].[prGetActiveStockSymbols]
	@ExchangeSymbol	VARCHAR(100) = NULL,
	@Country		VARCHAR(100) = NULL,
    @Symbol         VARCHAR(100) = NULL	
/**************************************************
Description:   Returns StockSymbol, ExchangeSymbol, and Country


Assert:			
		
Comments:      

Input Parameters:        

Returns:        

Test:

EXEC prGetActiveStockSymbols 'NASDAQ'
EXEC prGetActiveStockSymbols @Symbol = 'ABCO'

Author(s):Hadi Mahmoudi

Revision History:

[ 0]  Date:		By:			Version:	Action:
[ 1]  7/5/2012	Hadi		1.000		Initial design.

**************************************************/

AS

	--In case code use Empty String.
	IF (@ExchangeSymbol = '')
	BEGIN
		SET @ExchangeSymbol = NULL
	END
	IF (@Country = '')
	BEGIN
		SET @Country = NULL
	END
	IF (@Symbol = '')
	BEGIN
		SET @Symbol = NULL
	END

	SELECT
		S.Symbol        AS 'StockSymbol',
		E.Symbol        AS 'ExchangeSymbol',
		E.Country       AS 'Country',
        MAX(SD.DateId)  AS 'DateID'
	FROM dbo.Stocks AS S
	JOIN dbo.Exchanges AS E
    	ON S.ExchangeId = E.ExchangeId
	LEFT JOIN dbo.StockData AS SD
        ON SD.StockId = S.StockId
    WHERE 
        S.StatusId = 0
	    AND (E.Symbol = @ExchangeSymbol OR @ExchangeSymbol IS NULL)
	    AND (E.Country = @Country OR @Country IS NULL)
        AND (S.Symbol = @Symbol OR @Symbol IS NULL)
    GROUP BY
        S.Symbol,
		E.Symbol,
		E.Country
	ORDER BY S.Symbol 

	
	
	
