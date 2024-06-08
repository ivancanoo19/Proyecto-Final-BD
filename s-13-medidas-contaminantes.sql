connect BF_PROY_ADMIN/admin
set serveroutput on

create or replace trigger tr_medidas_contaminantes
for insert on vehiculo_contaminante
compound trigger
  -- Guardando los valores que se van a pasar cuando se llame al procedimiento
  type notificacion_type is record (
    vehiculo_contaminante_id vehiculo_contaminante.vehiculo_contaminante_id%type,
    vehiculo_id vehiculo_contaminante.vehiculo_id%type,
    fecha_reporte vehiculo_contaminante.fecha_reporte%type
  );
  type notificacion_list_type is table of notificacion_type;
  notif_list notificacion_list_type := notificacion_list_type();
  before each row is
  begin
    if (:new.contaminante_id = 1 and nvl(:new.medida, 0) >= 0.2) or
       (:new.contaminante_id = 2 and nvl(:new.medida, 0) >= 0.5) or
       (:new.contaminante_id = 3 and nvl(:new.medida, 0) >= 0.8) or
       (:new.contaminante_id = 4 and nvl(:new.medida, 0) >= 0.5) then
      notif_list.extend;
      notif_list(notif_list.count).vehiculo_contaminante_id := :new.vehiculo_contaminante_id;
      notif_list(notif_list.count).vehiculo_id := :new.vehiculo_id;
      notif_list(notif_list.count).fecha_reporte := :new.fecha_reporte;
    end if;
  end before each row;
  after statement is
  begin
    for i in 1..notif_list.count loop 
      p_insertar_notificacion(notif_list(i).vehiculo_contaminante_id, notif_list(i).vehiculo_id, notif_list(i).fecha_reporte);
    end loop;
  end after statement;
end tr_medidas_contaminantes;
/
show errors
