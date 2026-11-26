/**************************************************
File Name:     

Description:   Loads data for the Exchange table.

Assert:        

Comments:      

Input Parameters:        

Returns:        

Author(s):Hadi Mahmoudi

Revision History:

[ 0]  Date:	By:		Version:	Action:
[ 1]  5/17/2012	Hadi		1.000		Initial design.

**************************************************/
SET NOCOUNT ON

--DELETE FROM [TU].[dbo].[Exchanges]


INSERT INTO [TU].[dbo].[Exchanges]
           ([ExchangeId],[Symbol]	,[Name]						,[Country]			,[Comments]		,[XML]	,[CreatedDate]	,[ModifiedDate]	,[StatusId]	)
    VALUES (1			,'AMEX'		,'American Stock Exchange'	,'USA'		,''				,''		,GETDATE()		,GETDATE()		,0			)
INSERT INTO [TU].[dbo].[Exchanges]
           ([ExchangeId],[Symbol]	,[Name]						,[Country]			,[Comments]		,[XML]	,[CreatedDate]	,[ModifiedDate]	,[StatusId]	)
    VALUES (2			,'AMS'		,'Euronext Amsterdam'		,'Netherland'		,''				,''		,GETDATE()		,GETDATE()		,0			)
INSERT INTO [TU].[dbo].[Exchanges]
           ([ExchangeId],[Symbol]	,[Name]								,[Country]			,[Comments]		,[XML]	,[CreatedDate]	,[ModifiedDate]	,[StatusId]	)
    VALUES (3			,'ASX'		,'Australian Securities Exchange'	,'Australia'		,''				,''		,GETDATE()		,GETDATE()		,0			)
INSERT INTO [TU].[dbo].[Exchanges]
           ([ExchangeId],[Symbol]	,[Name]						,[Country]	,[Comments]		,[XML]	,[CreatedDate]	,[ModifiedDate]	,[StatusId]	)
    VALUES (4			,'BRU'		,'Euronext Brussels'		,''			,''				,''		,GETDATE()		,GETDATE()		,0			)
INSERT INTO [TU].[dbo].[Exchanges]
           ([ExchangeId],[Symbol]	,[Name]						,[Country]	,[Comments]		,[XML]	,[CreatedDate]	,[ModifiedDate]	,[StatusId]	)
    VALUES (5			,'CBOT'		,'Chicago Board of Trade'	,'USA'		,''				,''		,GETDATE()		,GETDATE()		,0			)
INSERT INTO [TU].[dbo].[Exchanges]
           ([ExchangeId],[Symbol]	,[Name]						,[Country]	,[Comments]		,[XML]	,[CreatedDate]	,[ModifiedDate]	,[StatusId]	)
    VALUES (6			,'CFE'		,'Chicago Futures Exchange'	,'USA'		,''				,''		,GETDATE()		,GETDATE()		,0			)
INSERT INTO [TU].[dbo].[Exchanges]
           ([ExchangeId],[Symbol]	,[Name]							,[Country]	,[Comments]		,[XML]	,[CreatedDate]	,[ModifiedDate]	,[StatusId]	)
    VALUES (7			,'CME'		,'Chicago Merchantile Exchange'	,'USA'		,''				,''		,GETDATE()		,GETDATE()		,0			)
INSERT INTO [TU].[dbo].[Exchanges]
           ([ExchangeId],[Symbol]	,[Name]							,[Country]	,[Comments]		,[XML]	,[CreatedDate]	,[ModifiedDate]	,[StatusId]	)
    VALUES (8			,'COMEX'	,'New York Commodity Exchange'	,'USA'		,''				,''		,GETDATE()		,GETDATE()		,0			)
INSERT INTO [TU].[dbo].[Exchanges]
           ([ExchangeId],[Symbol]	,[Name]						,[Country]	,[Comments]		,[XML]	,[CreatedDate]	,[ModifiedDate]	,[StatusId]	)
    VALUES (9			,'EUREX'		,'EUREX Futures Exchange'	,'USA'		,''				,''		,GETDATE()		,GETDATE()		,0			)
INSERT INTO [TU].[dbo].[Exchanges]
           ([ExchangeId],[Symbol]	,[Name]						,[Country]	,[Comments]		,[XML]	,[CreatedDate]	,[ModifiedDate]	,[StatusId]	)
    VALUES (10			,'FOREX'	,'Foreign Exchange'			,'USA'		,''				,''		,GETDATE()		,GETDATE()		,0			)
INSERT INTO [TU].[dbo].[Exchanges]
           ([ExchangeId],[Symbol]	,[Name]						,[Country]	,[Comments]		,[XML]	,[CreatedDate]	,[ModifiedDate]	,[StatusId]	)
    VALUES (11			,'HKEX'		,'Hong Kong Stock Exchange','Hong Kong'	,''				,''		,GETDATE()		,GETDATE()		,0			)
INSERT INTO [TU].[dbo].[Exchanges]
           ([ExchangeId],[Symbol]	,[Name]						,[Country]	,[Comments]		,[XML]	,[CreatedDate]	,[ModifiedDate]	,[StatusId]	)
    VALUES (12			,'INDEX'	,'Global Indices'			,'USA'		,''				,''		,GETDATE()		,GETDATE()		,0			)
INSERT INTO [TU].[dbo].[Exchanges]
           ([ExchangeId],[Symbol]	,[Name]						,[Country]	,[Comments]		,[XML]	,[CreatedDate]	,[ModifiedDate]	,[StatusId]	)
    VALUES (13			,'KCBT'		,'Kansas City Board of Trade','USA'		,''				,''		,GETDATE()		,GETDATE()		,0			)
INSERT INTO [TU].[dbo].[Exchanges]
           ([ExchangeId],[Symbol]	,[Name]						,[Country]	,[Comments]		,[XML]	,[CreatedDate]	,[ModifiedDate]	,[StatusId]	)
    VALUES (14			,'LIFFE'	,'LIFFE Futures and Options','USA'		,''				,''		,GETDATE()		,GETDATE()		,0			)
INSERT INTO [TU].[dbo].[Exchanges]
           ([ExchangeId],[Symbol]	,[Name]						,[Country]	,[Comments]		,[XML]	,[CreatedDate]	,[ModifiedDate]	,[StatusId]	)
    VALUES (15			,'LIS'		,'Euronext Lisbon'			,'USA'		,''				,''		,GETDATE()		,GETDATE()		,0			)
INSERT INTO [TU].[dbo].[Exchanges]
           ([ExchangeId],[Symbol]	,[Name]						,[Country]	,[Comments]		,[XML]	,[CreatedDate]	,[ModifiedDate]	,[StatusId]	)
    VALUES (16			,'LSE'		,'London Stock Exchange'	,'England'	,''				,''		,GETDATE()		,GETDATE()		,0			)
INSERT INTO [TU].[dbo].[Exchanges]
           ([ExchangeId],[Symbol]	,[Name]							,[Country]	,[Comments]		,[XML]	,[CreatedDate]	,[ModifiedDate]	,[StatusId]	)
    VALUES (17			,'MGEX'		,'Minneapolis Grain Exchange'	,'USA'		,''				,''		,GETDATE()		,GETDATE()		,0			)
INSERT INTO [TU].[dbo].[Exchanges]
           ([ExchangeId],[Symbol]	,[Name]						,[Country]	,[Comments]		,[XML]	,[CreatedDate]	,[ModifiedDate]	,[StatusId]	)
    VALUES (18			,'MLSE'		,'Milan Stock Exchange'		,'Italy'	,''				,''		,GETDATE()		,GETDATE()		,0			)
INSERT INTO [TU].[dbo].[Exchanges]
           ([ExchangeId],[Symbol]	,[Name]						,[Country]	,[Comments]		,[XML]	,[CreatedDate]	,[ModifiedDate]	,[StatusId]	)
    VALUES (19			,'NASDAQ'	,'NASDAQ Stock Exchange'	,'USA'		,''				,''		,GETDATE()		,GETDATE()		,0			)
INSERT INTO [TU].[dbo].[Exchanges]
           ([ExchangeId],[Symbol]	,[Name]						,[Country]	,[Comments]		,[XML]	,[CreatedDate]	,[ModifiedDate]	,[StatusId]	)
    VALUES (20			,'NYBOT'	,'New York Board of Trade'	,'USA'		,''				,''		,GETDATE()		,GETDATE()		,0			)
INSERT INTO [TU].[dbo].[Exchanges]
           ([ExchangeId],[Symbol]	,[Name]								,[Country]	,[Comments]		,[XML]	,[CreatedDate]	,[ModifiedDate]	,[StatusId]	)
    VALUES (21			,'NYMEX'	,'New York Merchantile Exchange'	,'USA'		,''				,''		,GETDATE()		,GETDATE()		,0			)
INSERT INTO [TU].[dbo].[Exchanges]
           ([ExchangeId],[Symbol]	,[Name]						,[Country]	,[Comments]		,[XML]	,[CreatedDate]	,[ModifiedDate]	,[StatusId]	)
    VALUES (22			,'NYSE'		,'New York Stock Exchange'	,'USA'		,''				,''		,GETDATE()		,GETDATE()		,0			)
INSERT INTO [TU].[dbo].[Exchanges]
           ([ExchangeId],[Symbol]	,[Name]						,[Country]	,[Comments]		,[XML]	,[CreatedDate]	,[ModifiedDate]	,[StatusId]	)
    VALUES (23			,'NZX'		,'New Zealand Exchange'		,'USA'		,''				,''		,GETDATE()		,GETDATE()		,0			)
INSERT INTO [TU].[dbo].[Exchanges]
           ([ExchangeId],[Symbol]	,[Name]						,[Country]	,[Comments]		,[XML]	,[CreatedDate]	,[ModifiedDate]	,[StatusId]	)
    VALUES (24			,'OPRA'		,'US Options'				,'USA'		,''				,''		,GETDATE()		,GETDATE()		,0			)
INSERT INTO [TU].[dbo].[Exchanges]
           ([ExchangeId],[Symbol]	,[Name]						,[Country]	,[Comments]		,[XML]	,[CreatedDate]	,[ModifiedDate]	,[StatusId]	)
    VALUES (25			,'OTCBB'	,'OTC Bulletin Board'		,'USA'		,''				,''		,GETDATE()		,GETDATE()		,0			)
INSERT INTO [TU].[dbo].[Exchanges]
           ([ExchangeId],[Symbol]	,[Name]						,[Country]	,[Comments]		,[XML]	,[CreatedDate]	,[ModifiedDate]	,[StatusId]	)
    VALUES (26			,'PAR'		,'Euronext Paris'			,'France'	,''				,''		,GETDATE()		,GETDATE()		,0			)
INSERT INTO [TU].[dbo].[Exchanges]
           ([ExchangeId],[Symbol]	,[Name]						,[Country]		,[Comments]		,[XML]	,[CreatedDate]	,[ModifiedDate]	,[StatusId]	)
    VALUES (27			,'SGX'		,'Singapore Stock Exchange'	,'Singapore'	,''				,''		,GETDATE()		,GETDATE()		,0			)
INSERT INTO [TU].[dbo].[Exchanges]
           ([ExchangeId],[Symbol]	,[Name]						,[Country]	,[Comments]		,[XML]	,[CreatedDate]	,[ModifiedDate]	,[StatusId]	)
    VALUES (28			,'TSX'		,'Toronto Stock Exchange'	,'Canada'	,''				,''		,GETDATE()		,GETDATE()		,0			)
INSERT INTO [TU].[dbo].[Exchanges]
           ([ExchangeId],[Symbol]	,[Name]						,[Country]	,[Comments]		,[XML]	,[CreatedDate]	,[ModifiedDate]	,[StatusId]	)
    VALUES (29			,'TSXV'		,'Toronto Venture Exchange'	,'Canada'	,''				,''		,GETDATE()		,GETDATE()		,0			)
INSERT INTO [TU].[dbo].[Exchanges]
           ([ExchangeId],[Symbol]	,[Name]						,[Country]	,[Comments]		,[XML]	,[CreatedDate]	,[ModifiedDate]	,[StatusId]	)
    VALUES (30			,'USMF'		,'Mutual Funds'				,'USA'		,''				,''		,GETDATE()		,GETDATE()		,0			)
INSERT INTO [TU].[dbo].[Exchanges]
           ([ExchangeId],[Symbol]	,[Name]							,[Country]	,[Comments]		,[XML]	,[CreatedDate]	,[ModifiedDate]	,[StatusId]	)
    VALUES (31			,'WCE'		,'Winnipeg Commodity Exchange'	,'USA'		,''				,''		,GETDATE()		,GETDATE()		,0			)

GO
PRINT '[TU].[dbo].[Exchanges] loaded Successfully.'
--SELECT * FROM [dbo].[Exchanges]