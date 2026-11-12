CLASS z45internaltablesbase DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z45internaltablesbase IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    data: ti_seats    TYPE TABLE of /dmo/flight,
          ti_flights  TYPE TABLE of /dmo/flight.

    SELECT FROM /dmo/flight
      FIELDS *
    WHERE currency_code = 'EUR'
    INTO TABLE @ti_flights.

    out->write( data = ti_flights name = 'Initial ti_flights' ).

    ti_seats = value #( BASE ti_flights ( carrier_id      = 'CO'
                                          connection_id   = '000123'
                                          flight_date     = cl_abap_context_info=>get_system_date(  )
                                          price           = '123.34'
                                          currency_code   = 'MXN'
                                          plane_type_id   = 'N123-85'
                                          seats_max       = 200
                                          seats_occupied  = 100
                                        ) ).

*    ti_seats = value #( BASE ti_seats ( LINES OF ti_flights ) ( carrier_id      = 'CO'
*                                          connection_id   = '000123'
*                                          flight_date     = cl_abap_context_info=>get_system_date(  )
*                                          price           = '123.34'
*                                          currency_code   = 'MXN'
*                                          plane_type_id   = 'N123-85'
*                                          seats_max       = 200
*                                          seats_occupied  = 100
*                                        ) ).
    ti_seats = CORRESPONDING #( BASE ( ti_seats ) ti_flights ).

    out->write( data = ti_seats name = 'Seats table' ).

  ENDMETHOD.

ENDCLASS.
