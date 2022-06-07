
$table = "RecursosHumanos.contrato"
$csvPath = "C:/Users/GUSTAVO/Downloads/$table.csv"

$rows = $(Get-Content $csvPath).Split('\n')
$dataLength = $rows.Length - 1

$headers = $rows[0]
$rowTypes = @(
	"number",
	"number",
	"number",
	"number",
	"date",
	"date"
)
$content = $rows[1..$dataLength]

function typeFormatter {
	param (
		[string] $type,
		[string] $value
	)
	if ($type -eq "number") {
		return $value
	}

	if ($type -eq "string") {
		return "'" + $value + "'"
	}
	
	if ($type -eq "date") {
		return "'" + $value.Replace('-', '') + "'"
	}

}

$values = ""
foreach ($dataRow in $content) {
	$crudeRow = $dataRow.Split(',')
	$row = ""
	for ($i = 0; $i -lt $rowTypes.Length; $i++) {
		$rowType = $rowTypes[$i]
		$crudeValue = $crudeRow[$i]
		$formattedValue = typeFormatter $rowType $crudeValue
		$row = $row + $formattedValue + ","
	}
	$row = $row.TrimEnd(',')
	$values = $values + "	(" + $row + "), " + "`n"
}
$values = $values.Trim().TrimEnd(', ')

$query = "
INSERT INTO $table 
	($headers) 
VALUES 
	$values"
Write-Output $query | clip