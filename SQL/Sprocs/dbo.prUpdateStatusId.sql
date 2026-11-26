IF EXISTS (SELECT 1 FROM Sys.objects WHERE name = 'prUpdateStatusId')
BEGIN
	DROP PROCEDURE dbo.prUpdateStatusId
END
GO
CREATE PROCEDURE prUpdateStatusId
	@TableName		varchar(100),
	@PKName			varchar(100),
	@PKValue		varchar(100),
	@StatusId		varchar(100)
/**************************************************
Description:   

Test:
SELECT * FROM Stocks
WHERE symbol like '%.%'

select top 2 CAST(symbol,name as XML) 
FROM Stocks

EXEC prUpdateStatusId 'Stocks', 'Stockid', '1','1'
EXEC prUpdateStatusId 'Stocks', 'Stockid', '1','0'

Author(s):Hadi Mahmoudi
Revision History:
[ 0]  Date:		By:		Version:	Action:
[ 1]  7/5/2012	Hadi		1.000		Initial design.
**************************************************/

AS
DECLARE @SQL VARCHAR(1000)

BEGIN TRY
	SET @SQL = 'UPDATE ' + @TableName + ' 
					SET StatusID = ' + @StatusId + ' 
				WHERE ' + @PKName + ' = ' + @PKValue
	--PRINT @SQL
	EXEC(@SQL)
END TRY
BEGIN CATCH

END CATCH