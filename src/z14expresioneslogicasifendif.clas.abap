CLASS z14expresioneslogicasifendif DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z14expresioneslogicasifendif IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA: lv_char  TYPE c LENGTH 1 VALUE 'C',
          lv_num   TYPE i VALUE 3,
          lv_text1 TYPE String VALUE 'ABAP',
          lv_text2 TYPE String VALUE 'Programming',
          lv_text3 TYPE String VALUE 'Classes'.

    IF lv_char EQ 'A'.
      out->write( |Is correct "{ lv_char }"| ).
    ELSEIF lv_char = 'B'.
      out->write( |Is not correct, is "{ lv_char }"| ).
    ELSEIF lv_char = 'C'.
      out->write( |No one value es correct, the value is  = { lv_char } | ).
    ELSE.
      out->write( |Undefined | ).
    ENDIF.

    IF lv_num = 3 OR lv_num EQ 4.
      out->write( |1 The value { lv_num } is in range| ).
    ENDIF.

    IF lv_num GT 3 OR lv_num LT 4.
      out->write( |2 The value { lv_num } is in range| ).
    ENDIF.

    IF lv_num GE 3 AND lv_char EQ 'C'.
      out->write( |3 The value { lv_num } is in range| ).
    ENDIF.

    "If anidado
    IF lv_text1 = 'ABAP'.
      IF lv_text2 EQ 'Programming'.
        IF lv_text3 = 'Classes'.
          out->write( 'Correct' ).
        ELSE.
          out->write( 'Incorrect 3' ).
        ENDIF.
      ELSE.
        out->write( 'Incorrect 2' ).
      ENDIF.
    ELSE.
      out->write( 'Incorrect 1' ).
    ENDIF.

    clear lv_num.
    IF lv_num IS INITIAL.
      out->write( |lv_num value is empty = { lv_num }| ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.
