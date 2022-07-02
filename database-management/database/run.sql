execute Ventas.pedidos_por_trabajador '20190101', '20220101'
execute Ventas.montos_por_proveedor
execute Inventarios.kardex_producto 1

select id_cotizacion, id_item, valor_unitario, id_proveedor, cantidad_disponible from Ventas.cotizacion
where valor_unitario = (select MIN(valor_unitario) from Ventas.cotizacion
where id_item = 1)

select * from Inventarios.get_kardex(1)
for json path