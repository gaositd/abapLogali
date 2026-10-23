CLASS z16b3expresioneslogicasdoendo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z16b3expresioneslogicasdoendo IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA(lv_num) = 0.

    DO 3 TIMES.
      lv_num += 1.
      out->write( |Current value = { lv_num }| ).
      out->write( |Current value of sy-index = { sy-index }| ).
    ENDDO.

    CLEAR lv_num.
    DO.
      lv_num += 1.
      out->write( |Current value = { lv_num }| ).
      out->write( |Current value of sy-index = { sy-index }| ).

      IF lv_num EQ 3.
        out->write( 'End of bucle' ).
        EXIT.
      ENDIF.

    ENDDO.

    CLEAR lv_num.
    DO.

      lv_num += 1.

      IF lv_num EQ 7.
        out->write( 'End of bucle' ).
        EXIT.
      ELSEIF lv_num EQ 3.
        CONTINUE.
      ELSE.
        out->write( |Current value => { lv_num }| ).
      ENDIF.

    ENDDO.

  ENDMETHOD.

ENDCLASS.
