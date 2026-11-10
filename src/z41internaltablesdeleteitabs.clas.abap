CLASS z41internaltablesdeleteitabs DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z41internaltablesdeleteitabs IMPLEMENTATION.

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

      LOOP AT it_airport INTO wa_airport.

        if wa_airport-airport_id = 'TXL' or wa_airport-airport_id = 'THF'.
*          DELETE it_airport WHERE airport_id = wa_airport-airport_id."<<==It's ok
          DELETE TABLE it_airport FROM wa_airport.
        ENDIF.

      ENDLOOP.

      out->write( data = it_airport name = |After airport (current records = { lines( it_airport ) } )| ).

*      Delete with index
      DELETE it_airport INDEX 2.
      out->write( data = it_airport name = |After airport (current records = { lines( it_airport ) } )| ).

*    Delete with range index
      DELETE it_airport FROM 2 to 3.
      out->write( data = it_airport name = |After airport (current records = { lines( it_airport ) } )| ).

*    Delete with where
      DELETE it_airport WHERE airport_id = 'HIJ'.
*      DELETE it_airport WHERE city is INITIAL."work
      out->write( data = it_airport name = |After airport (current records = { lines( it_airport ) } )| ).

*    Delete dajacents duplicates
      DELETE ADJACENT DUPLICATES FROM it_airport COMPARING country.
      out->write( data = it_airport name = |After airport (current records = { lines( it_airport ) } )| ).

    ENDIF.

  ENDMETHOD.

ENDCLASS.
