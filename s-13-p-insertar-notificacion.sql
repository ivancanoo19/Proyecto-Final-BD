connect BF_PROY_ADMIN/admin
set serveroutput on
create or replace procedure p_insertar_notificacion(
  p_vehiculo_contaminante_id in number, p_vehiculo_id in number, p_fecha_reporte in date
) is
v_num_notificacion notificacion.num_notificacion%type;
v_status_vehiculo_id number;
begin
  select nvl(max(n.num_notificacion), 0) into v_num_notificacion
  from notificacion n
  where n.vehiculo_contaminante_id in(
    select vc.vehiculo_contaminante_id
    from vehiculo_contaminante vc
    where vc.vehiculo_id = p_vehiculo_id
      --
  );
  select status_vehiculo_id into v_status_vehiculo_id
    from vehiculo
    where vehiculo_id = p_vehiculo_id;
  dbms_output.put_line('IMPRIMIENDO num_notificacion: ' || v_num_notificacion);
  dbms_output.put_line('IMPRIMIENDO status vehiculo: ' || v_status_vehiculo_id);
  if v_num_notificacion = 0 or (v_num_notificacion = 3 and v_status_vehiculo_id = 1) then
    v_num_notificacion := 1;
    insert into notificacion(notificacion_id, num_notificacion, fecha_envio, vehiculo_contaminante_id)
      values(notificacion_seq.nextval, v_num_notificacion, p_fecha_reporte, p_vehiculo_contaminante_id);
    update vehiculo
    set status_vehiculo_id = 4
    where vehiculo_id = p_vehiculo_id;
  elsif v_num_notificacion = 3 and v_status_vehiculo_id != 5 then
    update vehiculo
    set status_vehiculo_id = 5
    where vehiculo_id = p_vehiculo_id;
  else
    -- Aqui entramos siempre que el vehiculo ya tenga notificaciones señaladas
    v_num_notificacion := v_num_notificacion + 1;
    insert into notificacion(notificacion_id, num_notificacion, fecha_envio, vehiculo_contaminante_id)
      values(notificacion_seq.nextval, v_num_notificacion, p_fecha_reporte, p_vehiculo_contaminante_id);
  end if;
end;
/
show errors
