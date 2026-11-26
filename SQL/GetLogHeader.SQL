
/*
SQLLogHeader.SQL by Darbod LLC. WWW.Darbod.COM (All Right Reserved)


Comments:
This T-SQL code dynamically constructs a line of database system 
information for Install logs. These information are:
 1- Server name.
 2- Database name.
 3- Login identification name
 4- User database username
*/


PRINT 
	CONVERT(VARCHAR(25), GETUTCDATE(), 121) 
	+ '   Server: ' + @@ServerName 
	+ '   Database: ' + db_name() 
	+ '   LoginName: ' + SUSER_SNAME()
	+ '   DatabaseUserName: ' + USER_NAME()

