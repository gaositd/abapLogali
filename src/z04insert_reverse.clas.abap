CLASS z04insert_reverse DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z04insert_reverse IMPLEMENTATION.

    METHOD if_oo_adt_classrun~main.
        CONSTANTS: cl_string_name TYPE String VALUE 'AydeCristina',
                   cl_string_last TYPE String VALUE 'Gamez Meraz'.

        DATA: vl_string_insert    TYPE String,
              vl_string_reverse   TYPE String.

*        vl_string_insert = insert( val = cl_string_name sub = '-' off = 4 ).
        vl_string_insert = insert( val = cl_string_name sub = ` ` off = 4 ).
        out->write( |Insert { vl_string_insert }| ).

        vl_string_reverse = reverse( cl_string_last ).
        out->write( |Reverse { vl_string_reverse }| ).
    ENDMETHOD.

ENDCLASS.
