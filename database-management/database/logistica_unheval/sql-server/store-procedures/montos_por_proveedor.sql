ALTER   procedure [Ventas].[montos_por_proveedor]
as
	select
		p.nombre proveedor,
		CAST(
			SUM(
				c.valor_unitario * ocd.cantidad_solicitada
			) as decimal(10, 2) 
		) monto
	into #tbl_montos_proveedor
	from Ventas.orden_compra_detalle ocd
	join Ventas.cotizacion c
	on ocd.id_cotizacion = c.id_cotizacion
	join Ventas.proveedor p
	on c.id_proveedor = p.id_proveedor
	group by p.nombre;
	
	select 
		mp.proveedor,
		mp.monto
	from #tbl_montos_proveedor mp
	order by mp.monto desc;

execute Ventas.montos_por_proveedor