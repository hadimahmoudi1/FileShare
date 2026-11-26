IF EXISTS (SELECT 1 FROM Sys.objects WHERE name = 'prInsertStockData')
BEGIN
	DROP PROCEDURE dbo.prInsertStockData
END
GO
CREATE PROCEDURE prInsertStockData
	@Symbol		VARCHAR(100),
	@DateId		INT,
	@TimeId		INT,
	@Open		DECIMAL(9, 2),
	@High		DECIMAL(9, 2),
	@Low		DECIMAL(9, 2),
	@Close		DECIMAL(9, 2),
	@Volume		INT,
	@AdjClose	DECIMAL(9, 2),
	@Comments	VARCHAR(2000) = NULL,
	@StatusId	INT = 0
/**************************************************
File Name:     

Description:   

Assert:			TimeId of -1 means that the data is based on day result only. 

Comments:      

Input Parameters:        

Returns:        

Test:

EXEC dbo.prInsertStockData 'MSFT',19121205,-1,100,101,102,103,104,105,'No Comments'
SELECT * FROM dbo.StockData
WHERE DateID = 20120504


--DELETE FROM dbo.StockData
--WHERE TimeId = -1 AND DateId = 19121205 AND Comments = 'No Comments'

Author(s):Hadi Mahmoudi

Revision History:

[ 0]  Date:		By:			Version:	Action:
[ 1]  7/5/2012	Hadi		1.000		Initial design.

**************************************************/

AS
	DECLARE @StockId INT

	--First Find the Symbol
	SELECT @StockId = StockId FROM dbo.Stocks WHERE Symbol = @Symbol
	
	IF (
			(@StockId IS NOT NULL) AND
			(NOT EXISTS(SELECT 1 FROM dbo.StockData WHERE @StockId = StockId AND @DateId = DateId)) --For Uniqe Constriant.
		)
	BEGIN
		INSERT INTO dbo.StockData
			(	
				StockId,
				DateId,
				TimeId,
				[Open],
				High,
				Low,
				[Close],
				Volume,
				AdjClose,
				Comments,
				CreatedDate,
				ModifiedDate,
				StatusId
			)
		SELECT
			@StockId	AS StockId,
			@DateId		AS DateId,
			@TimeId		AS TimeId,
			@Open		AS [Open],
			@High		AS High,
			@Low		AS Low,
			@Close		AS [Close],
			@Volume		AS Volume,
			@AdjClose	AS AdjClose,
			@Comments	AS Comments,
			GETDATE()	AS CreatedDate,
			GETDATE()	AS ModifiedDate,
			@StatusId	AS StatusId
	END
	ELSE
	BEGIN
		RAISERROR (N'Symbol is not found or record is duplicated. (StockID,DateID)',10, 1);
	END