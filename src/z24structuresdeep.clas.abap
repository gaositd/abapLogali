CLASS z24structuresdeep DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z24structuresdeep IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    TYPES:BEGIN OF lty_flights,
            flight_date   TYPE /dmo/flight-flight_date,
            price         TYPE /dmo/flight_price,
            currency_code TYPE /dmo/flight-currency_code,
          END OF lty_flights.

    DATA: BEGIN OF ls_flight_info,
            carrier TYPE /dmo/flight-carrier_id     VALUE 'AA',
            connid  TYPE /dmo/flight-connection_id  VALUE '0018',
            lt_flights TYPE TABLE OF lty_flights WITH EMPTY KEY,
          END OF ls_flight_info.

    SELECT
      *
    FROM /dmo/flight
    WHERE carrier_id = 'JL'
    INTO CORRESPONDING FIELDS OF TABLE @ls_flight_info-lt_flights.

    out->write( data = ls_flight_info name = 'NO se' ).

  ENDMETHOD.

ENDCLASS.
