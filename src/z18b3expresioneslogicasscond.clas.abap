CLASS z18b3expresioneslogicasscond DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z18b3expresioneslogicasscond IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA(vl_get_time) = cl_abap_context_info=>get_system_time(  ).
    data(lv_time) = cond #( WHEN vl_get_time < '120000' THEN |{ vl_get_time TIME = ISO }AM|
                            WHEN vl_get_time > '120000' THEN |{ conv t( vl_get_time - 12 * 3600 ) TIME = ISO }PM|
                            WHEN vl_get_time = '120000' THEN |High noon|
                            ELSE                             |undefined|
                          ).
    out->write( lv_time ).

  ENDMETHOD.

ENDCLASS.
