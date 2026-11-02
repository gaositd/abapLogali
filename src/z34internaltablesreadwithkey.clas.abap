CLASS z34internaltablesreadwithkey DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z34internaltablesreadwithkey IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA it_flight_sort type SORTED TABLE OF /dmo/airport
      WITH NON-UNIQUE KEY airport_id.

    SELECT FROM /dmo/airport
      FIELDS *
    ORDER BY country DESCENDING
    INTO TABLE @DATA(it_airport).

    out->write( data = it_airport name = 'Entire internal table' ).
    READ TABLE it_airport INTO DATA(wa_airport) WITH KEY country = 'DE'.
    out->write( data = wa_airport name = 'read table with key 1' ).

    data(wa_airport2) = it_airport[ city = 'Berlin' ].
    out->write( data = wa_airport2 name = 'read table with key 2 (new form)' ).

    data(one_field) = it_airport[ country = 'FR' ]-name.
    out->write( data = one_field name = 'Only one field' ).

    SELECT FROM /dmo/airport
      FIELDS *
    ORDER BY country DESCENDING
    INTO TABLE @it_flight_sort.

    out->write( data = it_flight_sort name = 'it_flight_sort' ).
    READ TABLE it_flight_sort into data(wa_flight_sort) WITH table KEY airport_id = 'FRA'.
    out->write( data = wa_flight_sort name = 'wa_flight_sort' ).

    data(wa_flight_sort2) = it_flight_sort[ key primary_key airport_id = 'TXL' ].
    out->write( data = wa_flight_sort2 name = 'wa_flight_sort 3' ).

  ENDMETHOD.

ENDCLASS.
