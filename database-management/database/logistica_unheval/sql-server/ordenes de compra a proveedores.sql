select 
	oc.nro_orden,
	p.nombre proveedor,
	i.nombre producto,
	c.valor_unitario precio,
	ocd.cantidad_solicitada,
	c.valor_unitario * ocd.cantidad_solicitada monto
from Ventas.orden_compra oc
join Ventas.orden_compra_detalle ocd
on oc.nro_orden = ocd.nro_orden
join Ventas.cotizacion c 
on ocd.id_cotizacion = c.id_cotizacion
join Ventas.proveedor p
on c.id_proveedor = p.id_proveedor
join Producto.item i
on c.id_item = i.id_item