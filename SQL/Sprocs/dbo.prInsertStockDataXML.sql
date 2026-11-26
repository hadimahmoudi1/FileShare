USE TU
GO
IF EXISTS (SELECT 1 FROM Sys.objects WHERE name = 'prInsertStockDataXML')
BEGIN
	DROP PROCEDURE dbo.prInsertStockDataXML
END
GO
SET QUOTED_IDENTIFIER ON   --This is needed for Update Statment. OtherWise error: INSERT/UPDATE failed because the following SET options have incorrect settings: ‘QUOTED_IDENTIFIER’
GO
CREATE PROCEDURE prInsertStockDataXML
	@StockData	XML,
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

EXEC dbo.prInsertStockDataXML 
    '<Root>
        <StockData><Symbol>AA-P</Symbol><DateId>19000101</DateId><TimeId>-1</TimeId><Open>85.50</Open><High>85.50</High><Low>85.50</Low><Close>85.50</Close><Volume>200</Volume><AdjClose>79.08</AdjClose><Comments>prInsertStockDataXML Test.</Comments></StockData>
        <StockData><Symbol>AA-P</Symbol><DateId>19000102</DateId><TimeId>-1</TimeId><Open>85.45</Open><High>85.45</High><Low>85.45</Low><Close>85.45</Close><Volume>100</Volume><AdjClose>79.04</AdjClose><Comments>prInsertStockDataXML Test.</Comments></StockData>
        <StockData><Symbol>AA-P</Symbol><DateId>19000103</DateId><TimeId>-1</TimeId><Open>85.40</Open><High>85.45</High><Low>85.40</Low><Close>85.45</Close><Volume>200</Volume><AdjClose>79.04</AdjClose><Comments>prInsertStockDataXML Test.</Comments></StockData>
        <StockData><Symbol>AA.-P</Symbol><DateId>19000104</DateId><TimeId>-1</TimeId><Open>85.50</Open><High>85.50</High><Low>85.50</Low><Close>85.50</Close><Volume>500</Volume><AdjClose>79.08</AdjClose><Comments>prInsertStockDataXML Test.</Comments></StockData>
    </Root>'


SELECT * FROM dbo.StockData
WHERE TimeId = -1 AND Comments = 'prInsertStockDataXML Test.'


DELETE FROM dbo.StockData
WHERE TimeId = -1 AND Comments = 'prInsertStockDataXML Test.'

----------------------------------  Debug Block ----------------------------------------
DECLARE @StockData XML
SET @StockData = 
    '<Root>
        <StockData><Symbol>AA-P</Symbol><DateId>19000101</DateId><TimeId>-1</TimeId><Open>85.50</Open><High>85.50</High><Low>85.50</Low><Close>85.50</Close><Volume>200</Volume><AdjClose>79.08</AdjClose><Comments>prInsertStockDataXML Test.</Comments></StockData>
        <StockData><Symbol>AA-P</Symbol><DateId>19000102</DateId><TimeId>-1</TimeId><Open>85.45</Open><High>85.45</High><Low>85.45</Low><Close>85.45</Close><Volume>100</Volume><AdjClose>79.04</AdjClose><Comments>prInsertStockDataXML Test.</Comments></StockData>
        <StockData><Symbol>AA-P</Symbol><DateId>19000103</DateId><TimeId>-1</TimeId><Open>85.40</Open><High>85.45</High><Low>85.40</Low><Close>85.45</Close><Volume>200</Volume><AdjClose>79.04</AdjClose><Comments>prInsertStockDataXML Test.</Comments></StockData>
        <StockData><Symbol>AA-P</Symbol><DateId>19000104</DateId><TimeId>-1</TimeId><Open>85.50</Open><High>85.50</High><Low>85.50</Low><Close>85.50</Close><Volume>500</Volume><AdjClose>79.08</AdjClose><Comments>prInsertStockDataXML Test.</Comments></StockData>
    </Root>'
SELECT
		S.StockId,
		A.B.value('(Symbol)[1]', 'VARCHAR(100)' )	Symbol,
        A.B.value('(DateId)[1]', 'int' )			DateId,
        A.B.value('(TimeId)[1]', 'int' )			TimeId,
        A.B.value('(Open)[1]', 'decimal(9,2)' )		[Open],
        A.B.value('(High)[1]', 'decimal(9,2)' )		High,
        A.B.value('(Low)[1]', 'decimal(9,2)' )		Low,
        A.B.value('(Close)[1]', 'decimal(9,2)' )	[Close],
        A.B.value('(Volume)[1]', 'int' )			Volume,
        A.B.value('(AdjClose)[1]', 'decimal(9,2)' )	AdjClose,
  		A.B.value('(Comments)[1]', 'VARCHAR(100)' )	Comments
FROM    @StockData.nodes('/Root/StockData') A(B)
INNER JOIN dbo.Stocks AS S
	ON S.Symbol = A.B.value('(Symbol)[1]', 'VARCHAR(100)' )

------------------------------------------------------------------------------------------
Author(s):Hadi Mahmoudi

Revision History:

[ 0]  Date:		By:			Version:	Action:
[ 1]  7/5/2012	Hadi		1.000		Initial design.

**************************************************/

AS
    --Validate if Symbols are all existing in dbo.Stocks table.
    IF EXISTS   (
                    SELECT
		                S.StockId,
		                A.B.value('(Symbol)[1]', 'VARCHAR(100)' )	Symbol,
                        A.B.value('(DateId)[1]', 'int' )			DateId,
                        A.B.value('(TimeId)[1]', 'int' )			TimeId,
                        A.B.value('(Open)[1]', 'decimal(9,2)' )		[Open],
                        A.B.value('(High)[1]', 'decimal(9,2)' )		High,
                        A.B.value('(Low)[1]', 'decimal(9,2)' )		Low,
                        A.B.value('(Close)[1]', 'decimal(9,2)' )	[Close],
                        A.B.value('(Volume)[1]', 'int' )			Volume,
                        A.B.value('(AdjClose)[1]', 'decimal(9,2)' )	AdjClose,
  	    	            A.B.value('(Comments)[1]', 'VARCHAR(100)' )	Comments
                    FROM    @StockData.nodes('/Root/StockData') A(B)
                    LEFT JOIN dbo.Stocks AS S
	                    ON S.Symbol = A.B.value('(Symbol)[1]', 'VARCHAR(100)' )
                    WHERE S.StockId IS NULL
                )
    BEGIN
        --THROW works on SQL 2012 and after.
        --THROW 51000, 'At least One of the Symbols in the XML (@StockData) does not exisits in dbo.Stocks table.', 1;
        RAISERROR('At least One of the Symbols in the XML (@StockData) does not exisits in dbo.Stocks table.', 16,1);

    END

    MERGE dbo.StockData AS T
    USING (
    SELECT
		    S.StockId,
		    A.B.value('(Symbol)[1]', 'VARCHAR(100)' )	Symbol,
            A.B.value('(DateId)[1]', 'int' )			DateId,
            A.B.value('(TimeId)[1]', 'int' )			TimeId,
            A.B.value('(Open)[1]', 'decimal(9,2)' )		[Open],
            A.B.value('(High)[1]', 'decimal(9,2)' )		High,
            A.B.value('(Low)[1]', 'decimal(9,2)' )		Low,
            A.B.value('(Close)[1]', 'decimal(9,2)' )	[Close],
            A.B.value('(Volume)[1]', 'int' )			Volume,
            A.B.value('(AdjClose)[1]', 'decimal(9,2)' )	AdjClose,
  	    	A.B.value('(Comments)[1]', 'VARCHAR(100)' )	Comments
    FROM    @StockData.nodes('/Root/StockData') A(B)
    INNER JOIN dbo.Stocks AS S
	    ON S.Symbol = A.B.value('(Symbol)[1]', 'VARCHAR(100)' )
    ) AS S
        ON  
                T.StockID = S.StockId
            AND T.DateId = S.DateId
            AND T.TimeId = S.TimeId
    --WHEN MATCHED THEN --No Match Block at this time.
        --UPDATE SET Name = source.Name
	WHEN NOT MATCHED THEN	
		INSERT 
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
	    VALUES (
			StockId,
			DateId,
            TimeId,
			[Open],
			High,
			Low,
			[Close],
			Volume,
			AdjClose,
			COALESCE(Comments,@Comments),  -- XML Comments overides Procedure parameters.
			GETDATE(),
			GETDATE(),
			@StatusId
           );



	--SELECT * FROM StockData