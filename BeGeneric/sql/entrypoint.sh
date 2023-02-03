sleep 20
echo "wait 20 seconds"
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SA_PASSWORD -i init.sql 
