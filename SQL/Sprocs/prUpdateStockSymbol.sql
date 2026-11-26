IF EXISTS (SELECT 1 FROM Sys.objects WHERE name = 'prUpdateStockSymbol')
BEGIN
	DROP PROCEDURE dbo.prUpdateStockSymbol
END
GO
CREATE PROCEDURE prUpdateStockSymbol
	@OldSymbol		VARCHAR(100),
	@NewSymbol		VARCHAR(100)
/**************************************************
Description:   
   Updates the Symbol with @NewSymbol and adds xml info for @OldSymbol.

Test:

EXEC dbo.prUpdateStockSymbol 'AA.P','AA-P'
EXEC dbo.prUpdateStockSymbol 'AA-P','AA.P'

SELECT * FROM Stocks WHERE Symbol IN ('AA.P','AA-P')
--UPDATE Stocks SET XML = NULL WHERE Symbol IN ('AA.P','AA-P')



Author(s):Hadi Mahmoudi

Revision History:

[ 0]  Date:		By:			Version:	Action:
[ 1]  7/5/2012	Hadi		1.000		Initial design.

**************************************************/

AS
UPDATE dbo.Stocks
	SET Symbol = @NewSymbol,
		XML = ISNULL(CAST(XML AS VARCHAR(MAX)),'') + 
			'<SymbolChange ' +
			'ChangeTime="' +  CAST(GETDATE() AS VARCHAR(MAX)) + '" ' +
			'ChangeFrom="' +  @OldSymbol + '" ' + 
			'ChangeTo="' +  @NewSymbol + '" ' +
			'/>',
		ModifiedDate = GETDATE()
		
WHERE
	Symbol = @OldSymbol

