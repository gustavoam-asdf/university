create or alter procedure Inventarios.kardex_producto (
	@id_item int
)
as
	select
		p.nombre proveedor,
		f.fecha_facturacion,
		f.nro_entrada_factura,
		f.nro_factura,
		i.nombre producto,
		i.id_item,
		c.valor_unitario,
		CAST(fd.cantidad_entregada as int) cantidad_entregada
	into #entradas_producto
	from ventas.factura f
	join ventas.factura_detalle fd
	on f.nro_entrada_factura = fd.nro_entrada_factura
	join ventas.proveedor p
	on f.id_proveedor = p.id_proveedor
	join ventas.cotizacion c
	on fd.id_cotizacion = c.id_cotizacion
	join Producto.item i
	on c.id_item = i.id_item
	where i.id_item = @id_item
	
	select
		s.fecha_salida,
		a.nombre area,
		s.nro_salida,
		p.nombre personal_encargado,
		i.nombre producto,
		i.id_item,
		CAST(sd.cantidad_despachada as int) cantidad_despachada,
		sd.codigo_ubicacion
	into #salidas_producto
	from Inventarios.salida s
	join Inventarios.salida_detalle sd
	on s.nro_salida = sd.nro_salida
	join Producto.item i
	on sd.id_item = i.id_item
	join Organizacion.area a
	on s.id_area = a.id_area
	join RecursosHumanos.personal p
	on sd.id_personal_encargado = p.id_personal
	where i.id_item = @id_item

	select 
		es.fecha,
		es.detalle,
		es.valor_unitario,
		es.cantidad
	into #entrada_salida
	from (
		select
			ep.fecha_facturacion fecha,
			'compra' detalle,
			ep.valor_unitario,
			ep.cantidad_entregada cantidad
		from #entradas_producto ep
		union
		select
			sp.fecha_salida fecha,
			'venta' detalle,
			0 valor_unitario,
			sp.cantidad_despachada cantidad
		from #salidas_producto sp
	) as es
	order by es.fecha

	select top 0
		es.*
	into #kardex
	from (
		select 
			GETDATE() fecha,
			cast('compra' as varchar(30)) detalle,
			cast(0.00 as float) valor_unitario,
			cast(0 as int) cantidad_entrada,
			cast(0.00 as float) total_entrada,
			cast(0 as int) cantidad_salida,
			cast(0.00 as float) total_salida,
			cast(0 as int) cantidad_saldo,
			cast(0.00 as float) total_saldo
		from #entrada_salida
	) as es

	declare @fecha date
	declare @detalle varchar(30)
	declare @valor_unitario float 
	declare @compra_valor_unitario float 
	declare @cantidad int

	declare @cantidad_saldo int = 200
	declare @total_saldo float = 15000

	declare cEntradaSalida cursor local for select
		es.fecha,
		es.detalle,
		es.valor_unitario,
		es.cantidad
	from #entrada_salida es
	order by es.fecha;

	Open cEntradaSalida;
	fetch next from cEntradaSalida into @fecha, @detalle, @valor_unitario, @cantidad;

	while (@@FETCH_STATUS=0)
		begin
	
		if (@detalle like 'compra')
			begin

			set @compra_valor_unitario = @valor_unitario;
			
			insert into #kardex (fecha, detalle, valor_unitario, cantidad_entrada, total_entrada, cantidad_salida, total_salida, cantidad_saldo, total_saldo)
			values (
				@fecha, 
				@detalle, 
				@valor_unitario, 
				@cantidad,
				@valor_unitario * @cantidad, 
				0, 
				0, 
				@cantidad_saldo + @cantidad, 
				@total_saldo + @valor_unitario * @cantidad
			)
			end
		else 
			begin
			
			insert into #kardex (fecha, detalle, valor_unitario, cantidad_entrada, total_entrada, cantidad_salida, total_salida, cantidad_saldo, total_saldo)
			values (
				@fecha, 
				@detalle, 
				@compra_valor_unitario, 
				0,
				0,
				@cantidad,
				@cantidad * @compra_valor_unitario, 
				@cantidad_saldo - @cantidad, 
				@total_saldo - @cantidad * @compra_valor_unitario
			)

			end

			fetch next from cEntradaSalida into @fecha, @detalle, @valor_unitario, @cantidad;

		end

	close cEntradaSalida;

	select 
		k.fecha,
		k.detalle,
		k.valor_unitario,
		k.cantidad_entrada,
		k.total_entrada,
		k.cantidad_salida,
		k.total_salida,
		k.cantidad_saldo,
		k.total_saldo
	from #kardex k;

	deallocate cEntradaSalida;