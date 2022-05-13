$table = "RecursosHumanos.autorizacion"
$query = "SELECT * FROM $table"
$csvDir = "$HOME/Downloads"

$date = Get-Date -Format yyyy_MM_dd_HH_mm_ss

Invoke-Sqlcmd -ServerInstance GUS\SQLEXPRESS -Database logistica_unheval -Query $query | Export-CSV "$csvDir/$($table)_$date.csv"