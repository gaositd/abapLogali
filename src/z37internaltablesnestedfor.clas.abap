CLASS z37internaltablesnestedfor DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    interfaces if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z37internaltablesnestedfor IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    TYPES:BEGIN OF ty_flights,
            aircode      TYPE /dmo/carrier_id,
            flight_num   TYPE /dmo/connection_id,
            flight_price TYPE /dmo/flight_price,
            currency     TYPE /dmo/currency_code,
            flight_date  TYPE /dmo/flight_date,
          END OF ty_flights.

    DATA: it_flights TYPE SORTED TABLE OF ty_flights WITH NON-UNIQUE key flight_price.

    select from /dmo/flight
    FIELDS *
    into TABLE @data(it_flight).

    SELECT FROM /dmo/booking_m
      FIELDS
      carrier_id,
      connection_id,
      flight_price,
      currency_code
    into TABLE @data(it_booking_m).

    it_flights = value #(
      for wa_flight in it_flight WHERE ( carrier_id = 'LH' )
        for wa_booking_m in it_booking_m WHERE ( carrier_id = wa_flight-carrier_id )
          (
            aircode      = wa_flight-carrier_id
            flight_num   = wa_flight-connection_id
            flight_price = wa_booking_m-flight_price
            currency     = wa_booking_m-currency_code
            flight_date  = wa_flight-flight_date
          )
        ).

    out->write( |Total of records { lines( it_flights ) } | ).
    out->write( it_flights ).
  ENDMETHOD.

ENDCLASS.
