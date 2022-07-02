ALTER    procedure [Inventarios].[kardex_producto] (
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
			'entrada' detalle,
			ep.valor_unitario,
			ep.cantidad_entregada cantidad
		from #entradas_producto ep
		union
		select
			sp.fecha_salida fecha,
			'salida' detalle,
			0 valor_unitario,
			sp.cantidad_despachada cantidad
		from #salidas_producto sp
	) as es
	order by es.fecha

	declare @kardex table (
		fecha datetime not null,
		detalle varchar(30) not null,
		valor_unitario decimal(10,2) not null,
		cantidad_entrada int not null,
		total_entrada decimal(10,2) not null,
		cantidad_salida int not null,
		total_salida decimal(10,2) not null,
		cantidad_saldo int not null,
		total_saldo decimal(10,2) not null 
	)

	declare @fecha date
	declare @detalle varchar(30)
	declare @valor_unitario float 
	declare @cantidad int

	declare cEntradaSalida cursor local for select
		es.fecha,
		es.detalle,
		es.valor_unitario,
		es.cantidad
	from #entrada_salida es
	order by es.fecha;

	Open cEntradaSalida;

	fetch next from cEntradaSalida into @fecha, @detalle, @valor_unitario, @cantidad;

	declare @valor_unitario_promedio float 
	declare @cantidad_saldo int = 200
	declare @total_saldo float = @cantidad_saldo * @valor_unitario

	insert into @kardex (
		fecha, 
		detalle, 
		valor_unitario, 
		cantidad_entrada, 
		total_entrada, 
		cantidad_salida, 
		total_salida, 
		cantidad_saldo, 
		total_saldo
	) values (
		DATEDIFF(day, 1, @fecha), 
		'saldo', 
		@valor_unitario,
		0,
		0, 
		0, 
		0, 
		@cantidad_saldo,
		@total_saldo
	)

	while (@@FETCH_STATUS=0)
		begin

		declare @cantidad_entrada int
		declare @cantidad_salida int

	
		if (@detalle like 'entrada')
			begin

			set @cantidad_entrada = @cantidad
			set @cantidad_salida = 0

			set @valor_unitario_promedio = 
				(
					@valor_unitario * @cantidad_entrada + @total_saldo
				)/(
					@cantidad_saldo + @cantidad_entrada
				)

			set @cantidad_saldo += @cantidad_entrada
			
			end
		else 
			begin
			
			set @cantidad_entrada = 0
			set @cantidad_salida = @cantidad
			set @cantidad_saldo -= @cantidad_salida
			set @valor_unitario = @valor_unitario_promedio

			end

		set @total_saldo = @cantidad_saldo * @valor_unitario_promedio

		insert into @kardex (fecha, detalle, valor_unitario, cantidad_entrada, total_entrada, cantidad_salida, total_salida, cantidad_saldo, total_saldo)
		values (
			@fecha, 
			@detalle, 
			@valor_unitario, 
			@cantidad_entrada,
			@valor_unitario_promedio * @cantidad_entrada, 
			@cantidad_salida,
			@valor_unitario_promedio * @cantidad_salida, 
			@cantidad_saldo, 
			@total_saldo
		)

		fetch next from cEntradaSalida into 
			@fecha, @detalle, @valor_unitario, @cantidad;

		end

	close cEntradaSalida;
	deallocate cEntradaSalida;

	return (select 
		FORMAT(k.fecha, 'yyyy-MM-dd') fecha,
		k.detalle,
		k.valor_unitario,
		k.cantidad_entrada,
		k.total_entrada,
		k.cantidad_salida,
		k.total_salida,
		k.cantidad_saldo,
		k.total_saldo
	from @kardex k);


execute Inventarios.kardex_producto 1