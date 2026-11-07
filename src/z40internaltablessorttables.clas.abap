CLASS z40internaltablessorttables DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z40internaltablessorttables IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA: it_flights TYPE STANDARD TABLE OF /dmo/flight.

    SELECT
    FROM /dmo/flight
    FIELDS
      *
    WHERE carrier_id = 'LH'
      INTO TABLE @it_flights.

    SELECT
      carrier_id,
      connection_id,
      flight_date
    FROM @it_flights AS gt
    INTO TABLE @data(it_flights_fields).

    out->write( data = it_flights_fields name = 'Before sorted' ).

    SORT it_flights by flight_date ASCENDING.
    out->write( data = it_flights name = 'After sorted ascending' ).

    SORT it_flights by flight_date DESCENDING.
    out->write( data = it_flights name = 'After sorted descending' ).

    SORT it_flights by carrier_id flight_date DESCENDING.
    out->write( data = it_flights name = 'After sorted descending, use many fields' ).

    SORT it_flights by carrier_id DESCENDING flight_date ASCENDING seats_occupied DESCENDING.
    out->write( data = it_flights name = 'After sorted descending, use many fields ascending and descendig' ).

  ENDMETHOD.

ENDCLASS.
