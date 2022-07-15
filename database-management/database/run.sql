select 
	a.nombre,
	(
		select 
			p.nombre,
			p.DNI,
			c.fecha_inicio 'contrato.fecha_inicio',
			c.fecha_finalizacion 'contrato.fecha_finalizacion',
			car.nombre 'contrato.cargo.nombre',
			(
				select
					au.resumen,
					au.descripcion
				from RecursosHumanos.autorizacion au
				where au.id_cargo = car.id_cargo
				for json path
			) 'contrato.cargo.autorizaciones'
		from RecursosHumanos.personal p
		join RecursosHumanos.contrato c
		on p.id_personal = c.id_contrato
		join RecursosHumanos.cargo car
		on car.id_cargo = c.id_cargo
		where c.id_area = a.id_area
		for json path
	) trabajadores,
	per.nombre 'encargado.nombre',
	per.DNI 'encargado.dni',
	con.fecha_inicio 'encargado.contrato.fecha_inicio',
	con.fecha_finalizacion 'encargado.contrato.fecha_finalizacion'
from Organizacion.area a
join RecursosHumanos.contrato con
on con.id_area = a.id_area and con.id_cargo = 3
join RecursosHumanos.personal per
on per.id_personal = con.id_personal
for json path

select
	f.nro_factura,
	f.fecha_facturacion,
	p.nombre 'proveedor.nombre',
	(
		select 
			i.nombre,
			i.unidad_medida,
			cast(fd.cantidad_entregada as int) cantidad,
			cast(c.valor_unitario as decimal(10,2)) precio_unitario
		from ventas.factura_detalle fd
		join ventas.cotizacion c
		on fd.id_cotizacion = c.id_cotizacion
		join Producto.item i
		on c.id_item = i.id_item
		where fd.nro_entrada_factura = f.nro_entrada_factura
		for json path
	) productos_facturados
from ventas.factura f
left join ventas.proveedor p
on f.id_proveedor = p.id_proveedor
for json path

select 
	i.nombre,
	i.unidad_medida,
	(
		select
			p.nombre
		from ventas.proveedor p
		join Ventas.cotizacion c
		on p.id_proveedor = c.id_cotizacion
		where i.id_item = c.id_item
		for json auto
	) proveedores,
	(
		select 
			k.fecha, 
			k.detalle movimiento,
			k.valor_unitario,
			k.cantidad_entrada 'entrada.cantidad', 
			k.total_entrada 'entrada.total',
			k.cantidad_salida 'salida.cantidad',
			k.total_salida 'salida.total',
			k.cantidad_saldo 'saldo.cantidad',
			k.total_saldo 'saldo.total'
		from Inventarios.get_kardex(i.id_item) as k
		for json path
	) kardex
from Producto.item i
for json path

select
	p.nombre, 
	(
		select
			i.nombre,
			i.unidad_medida ,
			cast(valor_unitario as decimal(10,2)) precio_unitario, 
			cast(cantidad_disponible as int) cantidad
		from Producto.item i
		join Ventas.cotizacion c
		on c.id_item = i.id_item
		where c.id_proveedor = p.id_proveedor
		for json path
	) productos_ofertados
from ventas.proveedor p
for json path



