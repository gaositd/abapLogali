CLASS z53constructor_value DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z53constructor_value IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA:BEGIN OF ti_empData,
            empName   TYPE /dmo/first_name,
              begin of address,
                street  TYPE /dmo/street,
                number  TYPE i,
              END OF address,
         END OF ti_empData.
    data(ti_msg) = VALUE string_table(
      ( `Hola` )
      ( `Ayde Cristina Gamez Meraz` )
    ).
    ti_empdata = VALUE #(
      empname = 'Empresa Familiar'
      address = VALUE #(
        street  = 'Hilario Moreno, Fraccionamiento Real del Naranjal'
        number  = 311
      )
    ).
    out->write( data = ti_msg name = 'ti_msg' ).

    ti_msg = VALUE #( )."Vacia el contenido de la tabla interna
    out->write( data = ti_msg name = 'ti_msg' ).
    out->write( data = ti_empdata name = 'ti_empdata' ).
  ENDMETHOD.

ENDCLASS.
