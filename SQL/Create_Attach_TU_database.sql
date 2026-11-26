--First Copy TU.mdf and TU.ldf to sql server data folder OR Added the Administrators Group to the file security permissions with full control for the Data file.
IF NOT EXISTS (SELECT * FROM sys.databases WHERE NAME = 'TU')
BEGIN
	CREATE DATABASE TU 
    ON (FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TU.mdf'),
    (FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TU_log.ldf')
    FOR ATTACH;
-- CREATE DATABASE TU 
--    ON (FILENAME = 'C:\TU\TU.mdf'),
--    (FILENAME = 'C:\TU\TU_log.ldf')
--    FOR ATTACH;
END
ELSE
BEGIN
	PRINT 'Database TU already exists.'
END

--TEST
USE TU
GO
SELECT TOP 1000 * FROM [dbo].[StockData]

/*
--To DETACH
USE master;
GO
EXEC sp_detach_db @dbname = N'TU';
GO
*/
