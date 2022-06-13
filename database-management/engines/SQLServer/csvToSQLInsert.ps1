$VentasCotizacion = "Ventas.cotizacion"
$OrganizacionSolicitud = "Organizacion.solicitud"
$OrganizacionSolicitud_detalle = "Organizacion.solicitud_detalle"
$VentasOrden_compra = "Ventas.orden_compra"
$VentasOrden_compra_detalle = "Ventas.orden_compra_detalle"
$VentasFactura = "Ventas.factura"
$VentasFactura_detalle = "Ventas.factura_detalle"
$InventariosSalida = "Inventarios.salida"
$InventariosSalida_detalle = "Inventarios.salida_detalle"

function Get-RowTypes ($table) {
	if ($table -eq $VentasCotizacion) {
		return @(
			"number",
			"number",
			"number",
			"number",
			"number"
		)
	}

	if ($table -eq $OrganizacionSolicitud) {
		return @(
			"number",
			"number",
			"number",
			"number",
			"number",
			"date",
			"number"
		)
	}

	if ($table -eq $OrganizacionSolicitud_detalle) {
		return @(
			"number",
			"number",
			"number",
			"number"
		)
	}

	if ($table -eq $VentasOrden_compra) {
		return @(
			"number",
			"number",
			"number",
			"date",
			"date",
			"number",
			"number"
		)
	}

	if ($table -eq $VentasOrden_compra_detalle) {
		return @(
			"number",
			"number",
			"number",
			"number",
			"number",
			"number"
		)
	}
	
	if ($table -eq $VentasFactura) {
		return @(
			"number",
			"number",
			"number",
			"date",
			"string",
			"number",
			"number"
		)
	}

	if ($table -eq $VentasFactura_detalle) {
		return @(
			"number",
			"number",
			"number",
			"number"
		)
	}

	if ($table -eq $InventariosSalida) {
		return @(
			"number",
			"number",
			"date",
			"number"
		)
	}

	if ($table -eq $InventariosSalida_detalle) {
		return @(
			"number",
			"number",
			"number",
			"number",
			"number",
			"string"
		)
	}
	
}

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

function	makeQuery {
	param (
		[string] $table,
		[string] $headers,
		[string[]] $rowTypes,
		[string[]] $content
	)
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
	$query = "SET identity_insert $table ON; `n
	INSERT INTO $table 
		($headers) 
	VALUES 
		$values;
	SET identity_insert $table OFF;"
	return $query
}

$table = $InventariosSalida_detalle
$csvPath = "C:/Users/GUSTAVO/Downloads/$table.csv"

$rows = $(Get-Content $csvPath).Split('\n')
$dataLength = $rows.Length - 1
$headers = $rows[0]
$content = $rows[1..$dataLength]

$rowTypes = Get-RowTypes $table



$query = makeQuery -table $table -headers $headers -rowTypes $rowTypes -content $content

Write-Output $query | clip