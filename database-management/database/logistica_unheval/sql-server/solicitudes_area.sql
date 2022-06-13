select 
	s.nro_solicitud,
	a.nombre area,
	p.nombre trabajador,
	sd.id_item,
	sd.cantidad_requerida
from Organizacion.solicitud s
join Organizacion.solicitud_detalle sd
on s.nro_solicitud = sd.nro_solicitud
join RecursosHumanos.contrato c
on s.id_contrato = c.id_contrato
join Organizacion.area a
on c.id_area = a.id_area
join RecursosHumanos.personal p
on p.id_personal = c.id_personal
order by a.id_area, sd.id_item