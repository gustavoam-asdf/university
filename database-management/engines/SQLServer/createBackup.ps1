$backupDir = "$HOME\desktop\all\github.com\university\database-management\database\logistica_unheval\sql-server\backup"
$database = "logistica_unheval"
$date = Get-Date -Format yyyy_MM_dd_HH_mm_ss

sqlcmd -Q "BACKUP DATABASE $database TO DISK='$("$backupDir\$($database)_$($date).bak")'" -S GUS\SQLEXPRESS

Write-Host "Backup was created successfully in $backupDir"