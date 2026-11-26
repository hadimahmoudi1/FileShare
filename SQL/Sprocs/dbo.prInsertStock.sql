IF EXISTS (SELECT 1 FROM Sys.objects WHERE name = 'prInsertStock')
BEGIN
	DROP PROCEDURE dbo.prInsertStock
END
GO
CREATE PROCEDURE prInsertStock
	@Symbol			varchar(100),
	@Name			varchar(100),
	@ExchangeSymbol	varchar(100)
/**************************************************
File Name:     

Description:   

Assert:        

Comments:      

Input Parameters:        

Returns:        

Test:
SELECT * FROM dbo.Stocks
EXEC dbo.prInsertStock 'Symbol1','Name1','AMEX'
SELECT * FROM dbo.Stocks
DELETE FROM dbo.Stocks
WHERE Symbol = 'Symbol1'


Author(s):Hadi Mahmoudi

Revision History:

[ 0]  Date:		By:		Version:	Action:
[ 1]  7/5/2012	Hadi		1.000		Initial design.

**************************************************/

AS
DECLARE @ExchangeId INT

BEGIN TRY

	SELECT 	
		@ExchangeId = E.ExchangeId
	FROM dbo.Exchanges AS E
	WHERE E.Symbol = @ExchangeSymbol

	INSERT INTO dbo.Stocks
		(	Symbol
           ,Name
           ,Comments
           ,XML
           ,ExchangeId
           ,CreatedDate
           ,ModifiedDate
           ,StatusId
        )

	SELECT
		@Symbol		AS Symbol,
		@Name		AS Name,
		NULL		AS Comments,
		NULL		AS XML,
		@ExchangeId AS ExchangeId,
		GETDATE()	AS CreatedDate,
		GETDATE()	AS ModifiedDate,
		0			AS StatusId	
END TRY
BEGIN CATCH

END CATCH