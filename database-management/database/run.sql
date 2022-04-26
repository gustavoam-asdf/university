SELECT
  a.nombre area,
  i.nombre item,
  sd.cantidad_requerida,
  i.unidad_medida
FROM
  solicitud_detalle sd
  INNER JOIN solicitud s ON s.nro_solicitud = sd.nro_solicitud
  INNER JOIN item i ON i.id_item = sd.id_item
  INNER JOIN area a ON a.id_area = s.id_area
ORDER BY
  a.nombre,
  i.nombre