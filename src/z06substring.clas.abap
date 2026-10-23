CLASS z06substring DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z06substring IMPLEMENTATION.

    METHOD if_oo_adt_classrun~main.
    DATA: vl_string1 TYPE String VALUE 'Ayde Cristina Gamez Meraz',
          vl_string2 TYPE String.

    out->write( |Get subStrig from a String variable { vl_string1 }| ).

    vl_string2 = substring( val = vl_string1 off = 5 len = 14 ).
    out->write( |Substring2 off parameter = { vl_string2 }| ).

    vl_string2 = substring_after( val = vl_string1 sub = 'Ga' len = 9 ).
    out->write( |Substring2 sub parameter with substring_after = { vl_string2 }| ).

    vl_string2 = substring_before( val = vl_string1 sub = 'Ga' len = 9 ).
    out->write( |Substring2 sub parameter with substring_before = { vl_string2 }| ).

    vl_string2 = substring_to( val = vl_string1 sub = 'Ga' len = 12 ).
    out->write( |Substring2 sub parameter with substring_to = { vl_string2 }| ).

    vl_string2 = substring_to( val = vl_string1 sub = 'Ga' ).
    out->write( |Substring2 sub parameter with substring_to = { vl_string2 }| ).



    ENDMETHOD.

ENDCLASS.
