CLASS z03strlen_numchar DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z03strlen_numchar IMPLEMENTATION.

    METHOD if_oo_adt_classrun~main.
        CONSTANTS: cl_string TYPE String VALUE 'Alvaro Gamez Chavez   '.
        DATA:lv_lenght TYPE C LENGTH 6.

        lv_lenght = strlen( cl_string ).
        out->write( |1.-strlen = { lv_lenght }| ).

        lv_lenght = strlen( `Alvaro Gamez Chavez   ` ).
        out->write( |2.-strlen = { lv_lenght }| ).

        lv_lenght = numofchar( cl_string ).
        out->write( |3.-numofchar = { lv_lenght }| ).

         lv_lenght = numofchar( `Alvaro Gamez Chavez   ` ).
         out->write( |4.-numofchar = { lv_lenght }| ).

         out->write( |Lower Case.- = { to_lower( val = cl_string ) }| ).
         out->write( |Upper Case.- = { to_upper( val = cl_string ) }| ).
         out->write( |MIX   Case.- = { to_mixed( val = cl_string ) }| ).

    ENDMETHOD.

ENDCLASS.
