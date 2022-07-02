CREATE OR ALTER FUNCTION [Inventarios].[get_kardex]
(
	@id_item int
)
RETURNS 
	@kardex table (
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
AS
BEGIN
	declare @entradas_salidas table (
		fecha datetime,
		detalle varchar(20),
		valor_unitario float,
		cantidad float
	)

	insert into @entradas_salidas
	select
		f.fecha_facturacion fecha,
		'entrada' detalle,
		c.valor_unitario valor_unitario,
		CAST(fd.cantidad_entregada as int) cantidad
	from ventas.factura f
	join ventas.factura_detalle fd
	on f.nro_entrada_factura = fd.nro_entrada_factura
	join ventas.cotizacion c
	on fd.id_cotizacion = c.id_cotizacion
	where c.id_item = @id_item
	union
	select
		s.fecha_salida fecha,
		'salida' detalle,
		0 valor_unitario,
		CAST(sd.cantidad_despachada as int) cantidad
	from Inventarios.salida s
	join Inventarios.salida_detalle sd
	on s.nro_salida = sd.nro_salida
	where sd.id_item = @id_item
	order by fecha

	declare @fecha date
	declare @detalle varchar(30)
	declare @valor_unitario float 
	declare @cantidad int

	declare cEntradaSalida cursor local for select
		es.fecha,
		es.detalle,
		es.valor_unitario,
		es.cantidad
	from @entradas_salidas es
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

	RETURN 
END
GO