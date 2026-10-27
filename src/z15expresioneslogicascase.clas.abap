CLASS z15expresioneslogicascase DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z15expresioneslogicascase IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA: lv_result TYPE i.
    DATA(lv_client) = cl_abap_random_int=>create( seed = cl_abap_random=>seed( )
                                                  min = 1
                                                  max = 10
                                                )->get_next( ).
    CASE lv_client.
      WHEN 1.
        lv_result = lv_client.
      WHEN 2.
        lv_result = lv_client.
      WHEN 3.
        lv_result = lv_client.
      WHEN 4.
        lv_result = lv_client.
      WHEN 5.
        lv_result = lv_client.
      WHEN OTHERS.
        out->write( |Another client type { lv_client }| ).
    ENDCASE.

    IF lv_result GE 1 AND lv_result LE 5.
      out->write( |The client is { lv_result }| ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.
