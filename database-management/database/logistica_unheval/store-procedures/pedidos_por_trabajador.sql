ALTER   procedure [Ventas].[pedidos_por_trabajador] (
	@fecha_inicio date,
	@fecha_fin date
)
as
	SELECT 
		ed.nombre estado_solicitud,
		a.nombre area_solicitante,
		s.fecha_creacion fecha_solicitud,
		p.nombre trabajador, 
		i.nombre producto_solicitado, 
		sd.cantidad_requerida
	INTO #solicitud_organizacion
	FROM Organizacion.solicitud s 
	JOIN Organizacion.solicitud_detalle sd 
	ON s.nro_solicitud = sd.nro_solicitud 
	JOIN Producto.item i 
	ON sd.id_item = i.id_item 
	JOIN RecursosHumanos.contrato c 
	ON s.id_contrato = c.id_contrato 
	JOIN RecursosHumanos.personal p 
	ON c.id_personal = p.id_personal
	JOIN Organizacion.area a
	ON c.id_area = a.id_area
	JOIN Logistica.estado_documento ed
	on s.id_estado_documento = ed.id_estado_documento

	select
		FORMAT(so.fecha_solicitud, 'yyyy-MM-dd') fecha,
		so.trabajador,
		so.producto_solicitado,
		so.cantidad_requerida
	from #solicitud_organizacion so
	where so.fecha_solicitud between @fecha_inicio and @fecha_fin
	order by so.trabajador, so.fecha_solicitud;


execute Ventas.pedidos_por_trabajador '20180101', '20220101'