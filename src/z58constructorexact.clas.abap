CLASS z58constructorexact DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z58constructorexact IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA: vl_int_value  TYPE i VALUE 32767,
          vl_int2_value TYPE int2,
          vl_int3_value TYPE i,
          vl_text_value TYPE String VALUE '123.45'.

          try.
            vl_int2_value = EXACT int2( vl_int_value )."OK
            vl_int3_value = EXACT i( vl_text_value ). "Error
            out->write( data = vl_int2_value name = 'vl_int2_value' ).
            out->write( data = vl_text_value name = 'vl_int3_value' ).

          CATCH cx_sy_conversion_error INTO DATA(vl_error).
            out->write( |Error convertion { vl_error->get_text(  ) }| ).
          endtry.
  ENDMETHOD.

ENDCLASS.
