--@Autor(es):       Bueno Hernández Héctor Daniel, Fernández Cano Iván Antonio
--@Fecha creación:  06/06/2024
--@Descripción:     Proyecto final - Trigger para sumar los puntos negativos de los propietarios

connect BF_PROY_ADMIN/admin
set serveroutput on
create or replace trigger tr_puntos_negativos
  after insert
  on infraccion
  for each row
  declare
    v_propietario number;
    v_puntos_totales number;
    v_puntos_neg number;

  begin
    case 
      when inserting then
        select p.propietario_id, p.puntos_neg_totales, i.puntos_asignados 
          into v_propietario, v_puntos_totales, v_puntos_neg
          from propietario p, infraccion i
        where p.propietario_id = i.propietario_id
          and :new.propietario_id = i.propietario_id
          and :new.propietario_id = p.propietario_id;
        --se suman los puntos negativos de la infraccion al total del propietario
        update propietario
        set puntos_neg_totales = v_puntos_totales + v_puntos_neg
        where propietario_id = v_propietario;
    end case;
  end;
  /
  show errors