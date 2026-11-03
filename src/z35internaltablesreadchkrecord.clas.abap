CLASS z35internaltablesreadchkrecord DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z35internaltablesreadchkrecord IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    data: it_airports type STANDARD TABLE OF /dmo/airport.

    select from /dmo/airport
      fields *
    where country like 'M%'
       or country = 'DE'
    ORDER BY country DESCENDING
    into table @it_airports.

    if sy-subrc = 0.
      READ TABLE it_airports WITH KEY airport_id = 'LGA' TRANSPORTING NO FIELDS.
        if sy-subrc = 0.
          out->write( it_airports ).
          RETURN.
        else.
          out->write( 'No found records' ).
        endif.
    else.
    endif.

    select from /dmo/flight
      fields *
    where carrier_id = 'LH'
    into table @data(it_flights).

    if sy-subrc EQ 0.

      if line_exists( it_flights[ carrier_id = 'LH' ] ).
        out->write( it_flights ).
      else.
        out->write( 'No found records into internal table it_flights' ).
      endif.

    endif.

  ENDMETHOD.

ENDCLASS.
