
/*
SetRunTime.SQL by Darbod LLC. WWW.Darbod.COM (All Right Reserved)

This T-SQL code dynamically constructs a line of DOS batch code 
to set the UTC RunTime variable. Constructed UTC time is ISO8601 standard. 
The format of Runtime is Data + “T” + a time up to millisecond accuracy. 
For example:

For Example: SET RunTime = 2006_10_16T19_43_33_727 

UTC time is used to make log files time zone independent.
*/


DECLARE @RunTime	VARCHAR(25)

--ISO8601
SET @RunTime = CONVERT(VARCHAR(25), GETUTCDATE(), 126)
SET @RunTime = REPLACE (@RunTime, ' ', '_')
SET @RunTime = REPLACE (@RunTime, '-', '_')
SET @RunTime = REPLACE (@RunTime, '.', '_')
SET @RunTime = REPLACE (@RunTime, ':', '_')

print  'SET RunTime=' + @RunTime
