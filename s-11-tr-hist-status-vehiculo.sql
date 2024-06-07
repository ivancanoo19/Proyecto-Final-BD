--@Autor(es):       Bueno Hernández Héctor Daniel, Fernández Cano Iván Antonio
--@Fecha creación:  06/06/2024
--@Descripción:     Proyecto final - Trigger para automatizar registros en historicos


/*
    EN EL TRIGGER DE BEFORE, CHECAR QUE CUANDO SE ACTUALICE STATUS_ID TAMBIEN SE ACTUALICE FECHA
*/
connect BF_PROY_ADMIN/admin
set serveroutput on
create or replace trigger tr_hist_status_vehiculo
after insert or update of status_vehiculo_id
on vehiculo
for each row
  begin
    case
      when inserting then
        insert into hist_status_vehiculo(hist_status_vehiculo_id, fecha_status, status_vehiculo_id, vehiculo_id)
          values(hist_status_vehiculo_seq.nextval, :new.fecha_status, :new.status_vehiculo_id, :new.vehiculo_id);
      when updating('status_vehiculo_id') then
        insert into hist_status_vehiculo(hist_status_vehiculo_id, fecha_status, status_vehiculo_id, vehiculo_id)
          values(hist_status_vehiculo_seq.nextval, :new.fecha_status, :new.status_vehiculo_id, :new.vehiculo_id);
    end case;   
    exception
      when others then
      dbms_output.put_line('Error al insertar vehiculo en historico: ' || sqlerrm);
      raise;
  end;
/
show errors
