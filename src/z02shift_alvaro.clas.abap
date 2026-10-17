CLASS z02shift_alvaro DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z02shift_alvaro IMPLEMENTATION.

    METHOD if_oo_adt_classrun~main.

        CONSTANTS: gc_initial(10) TYPE c VALUE '    ABC123'.
        DATA: gv_initial TYPE String VALUE gc_initial.

        out->write( |Initial value1 { gv_initial }| ).
*
*        SHIFT gv_initial.
*        out->write( |Actual Value { gv_initial } | ).
*
*        gv_initial = gc_initial.
*        SHIFT gv_initial by 8 PLACES.
*        out->write( |Actual Value 2 { gv_initial } | ).
*
*        gv_initial = gc_initial.
*        SHIFT gv_initial by 8 PLACES RIGHT.
*        out->write( |Actual Value 3 { gv_initial } | ).
*
*        gv_initial = gc_initial.
*        SHIFT gv_initial by 8 PLACES LEFT.
*        out->write( |Actual Value 4 { gv_initial } | ).
*
*        gv_initial = gc_initial.
*        SHIFT gv_initial RIGHT DELETING TRAILING '123'.
*        out->write( |Actual Value 5 { gv_initial } | ).
*
*        gv_initial = gc_initial.
*        SHIFT gv_initial LEFT DELETING LEADING ` `.
*        out->write( |Actual Value 6 { gv_initial } | ).
        out->write( 'SHIF as a Function (LEFT & RIGHT)' ).
        gv_initial = shift_left( val = gc_initial places = 2 ).
        out->write( |Initial value2 { gv_initial }| ).

        gv_initial = shift_right( val = gc_initial places = 2 ).
        out->write( |Initial value3 { gv_initial }| ).

        gv_initial = shift_right( val = gc_initial  circular = 2 ).
        out->write( |Initial value4 { gv_initial }| ).

        gv_initial = shift_left( val = gc_initial  circular = 6 ).
        out->write( |Initial value5 { gv_initial }| ).

        gv_initial = shift_right( val = gc_initial sub = '123' ).
        out->write( |Initial value6 { gv_initial }| ).

        gv_initial = shift_left( val = gc_initial ).
        out->write( |Initial value7 { gv_initial }| ).

    ENDMETHOD.

ENDCLASS.
