--@Autor(es):       Bueno Hernández Héctor Daniel, Fernández Cano Iván Antonio
--@Fecha creación:  06/06/2024
--@Descripción:     Proyecto final - Trigger para automatizar registros en historicos

connect BF_PROY_ADMIN/admin
set serveroutput on
create or replace trigger tr_hist_propietarios
before update of propietario_id
on vehiculo
for each row
  begin
    case
      when updating('propietario_id') then
        if :old.fecha_fin is null then
          raise_application_error(-20001, '
            Error al actualizar propietario. El vehiculo seleccionado aun tiene un propeitario vigente, propietario_id: ' || :old.propietario_id);
        else
          insert into hist_propietarios(hist_propietarios_id, fecha_inicio, fecha_fin, vehiculo_id, propietario_id)
            values(hist_propietarios_seq.nextval, :old.fecha_inicio, :old.fecha_fin, :old.vehiculo_id, :old.propietario_id);
        end if;
    end case;   
  end;
/
show errors


create or replace trigger tr_hist_propietarios2
after insert
on vehiculo
for each row
  begin
    if :new.fecha_fin is not null then
      insert into hist_propietarios(hist_propietarios_id, fecha_inicio, fecha_fin, vehiculo_id, propietario_id)
        values(hist_propietarios_seq.nextval, :new.fecha_inicio, :new.fecha_fin, :new.vehiculo_id, :new.propietario_id);
    end if;
  end;
/
show errors