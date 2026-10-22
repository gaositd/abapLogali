CLASS z12string_repeats DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z12string_repeats IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    CONSTANTS: cl_wife TYPE String VALUE ` Daniela Iveth Meraz Silva`.
    DATA(vl_repeat) = repeat( val = cl_wife occ = 3 ).

    out->write( |The original String is { cl_wife }, the new string is { vl_repeat } | ).

    out->write( |My wife is { repeat( val = cl_wife occ = 2 ) } | ).

    "out->write( |My wife is { repeat( val = cl_wife occ = -2 ) } | )."Error no admite parámetros negativos

    try.
        out->write( |My wife is { repeat( val = cl_wife occ = -2 ) } | )."Error no admite parámetros negativos
    CATCH cx_sy_strg_par_val.
        out->write( |Occ parameter invalid| ).
    ENDTRY.

  ENDMETHOD.

ENDCLASS.
