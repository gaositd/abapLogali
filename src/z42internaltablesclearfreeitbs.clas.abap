CLASS z42internaltablesclearfreeitbs DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z42internaltablesclearfreeitbs IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA: it_airport TYPE STANDARD TABLE OF /dmo/airport,
          wa_airport TYPE /dmo/airport.

    select from /dmo/airport
      FIELDS *
    WHERE (
            country = 'DE' or
            country = 'MX' or
            country = 'JP'
          )
    into table @it_airport.

    if sy-subrc = 0.
      out->write( data = it_airport name = |Before it_airport (currente records = { lines( it_airport ) })| ).
*      CLear it_airport.
*      FREE it_airport.
      it_airport = VALUE #( ).
      out->write( data = it_airport name = |After it_airport (currente records = { lines( it_airport ) })| ).
    ENDIF.


  ENDMETHOD.

ENDCLASS.
