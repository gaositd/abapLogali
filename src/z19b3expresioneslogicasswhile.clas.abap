CLASS z19b3expresioneslogicasswhile DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z19b3expresioneslogicasswhile IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    data(lv_bool) = abap_true.
    data(lv_div) = 0.
    data(lv_num) = 0.
    out->write( 'Start of program' ).

    WHILE lv_num LE 10.
      out->write( |lv_num = { lv_num }| ).
      out->write( |Iteration number = { sy-index }| ).
      lv_num += 1.
    ENDWHILE.

    out->write(  ` ` ).
    WHILE lv_bool.

      IF lv_div = 0.
        out->write( |Current value { lv_div }| ).
      ELSE.
        out->write( |Exit Method { lv_div }| ).
        lv_bool = abap_false.
      ENDIF.

      lv_div += 1.

    ENDWHILE.

    clear lv_num.
    WHILE lv_num LE 10.
      out->write( |lv_num = { lv_num }| ).
      out->write( |Iteration number = { sy-index }| ).

      IF sy-index EQ 9.
        out->write( 'End of bucle' ).
        EXIT.
      ELSE.
        lv_num += 1.
      ENDIF.

    ENDWHILE.

    out->write( 'End of program' ).
  ENDMETHOD.
ENDCLASS.
