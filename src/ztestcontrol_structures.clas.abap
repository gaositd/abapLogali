CLASS ztestcontrol_structures DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS ztestcontrol_structures IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA lv_number TYPE i VALUE 3.

    if lv_number eq 0.
    ENDIF.

*    lv_number = 4.
    clear lv_number.
    do 2 TIMES.
*      out->write( lv_number ).
      lv_number = lv_number + 1.
    ENDDO.

    clear lv_number.
    WHILE lv_number LE 10.
    lv_number += 1.
    out->write( sy-index ).
    ENDWHILE.
  ENDMETHOD.
ENDCLASS.
