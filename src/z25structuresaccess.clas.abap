CLASS z25structuresaccess DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z25structuresaccess IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    TYPES:BEGIN OF lty_flights,
            flight_date   TYPE /dmo/flight-flight_date,
            price         TYPE /dmo/flight_price,
            currency_code TYPE /dmo/flight-currency_code,
          END OF lty_flights.

    DATA: BEGIN OF ls_flight_info,
            carrier    TYPE /dmo/flight-carrier_id     VALUE 'AA',
            connid     TYPE /dmo/flight-connection_id  VALUE '0018',
            lt_flights TYPE lty_flights,
          END OF ls_flight_info.

    ls_flight_info-carrier = 'XX'.
    ls_flight_info-connid  = '0022'.
    ls_flight_info-lt_flights-currency_code = 'MXN'.
    ls_flight_info-lt_flights-flight_date   = cl_abap_context_info=>get_system_date(  ). "'20261212'.
    ls_flight_info-lt_flights-price         = 10.

    out->write( data = ls_flight_info name = 'Data:' ).
  ENDMETHOD.

ENDCLASS.
