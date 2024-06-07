--@Autor(es):       Bueno Hernández Héctor Daniel, Fernández Cano Iván Antonio
--@Fecha creación:  07/06/2024
--@Descripción:     Proyecto final - Función para calcular el seguro de un vehículo particular

connect BF_PROY_ADMIN/admin
set serveroutput on
create or replace function fx_calculo_impuesto(
  bolsas_aire number,
  frenos_abs number,
  tipo_trans number
) return number is
  v_seguro number(5,2);
  v_aux number(5,2);
begin
  v_seguro := 6000;                    --valor inicial del seguro: 6000
  v_aux := bolsas_aire;
  while bolsas_aire > 0 loop
    v_seguro := v_seguro - 250;
    v_aux := v_aux -1;
  end loop;                            --se restan 250 por cada bolsa de aire
  if frenos_abs = 1 then
    v_seguro := v_seguro - 1000;
  end if;                              --si el vehiculo tiene frenos abs, se restan 1000
  if tipo_trans = 2 then
    v_seguro := v_seguro - 1000;       --si el vehiculo tiene transmisión automática, se restan 1000
  end if;
  return v_seguro;
end;
/
show errors 