CLASS z38internaltablesmodifyitabs DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z38internaltablesmodifyitabs IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA: it_flights TYPE STANDARD TABLE OF /dmo/flight.
    DATA: wa_flights like LINE OF it_flights.

    SELECT
    FROM /dmo/flight
    FIELDS
      *
    WHERE carrier_id = 'LH'
      INTO TABLE @it_flights.

    SORT it_flights by flight_date.
    out->write( data = it_flights name = |Before modify { cl_abap_context_info=>get_system_date(  ) }| ).

    LOOP AT it_flights into wa_flights.
      if ( wa_flights-flight_date >= '20260818' and wa_flights-flight_date <= '20261231' ).
        wa_flights-flight_date = cl_abap_context_info=>get_system_date(  ).
*        MODIFY it_flights FROM wa_flights INDEX sy-tabix."working
*        MODIFY it_flights FROM wa_flights TRANSPORTING flight_date."working
*        MODIFY it_flights FROM value #(
*          connection_id = '009'
*          carrier_id = 'AYD'
*          plane_type_id = '242-016'
*        ).
        MODIFY it_flights FROM value #(
          connection_id = '009'
          carrier_id = 'AYD'
          plane_type_id = '242-016'
        ) TRANSPORTING connection_id
                       carrier_id
                       plane_type_id.
      ENDIF.
    ENDLOOP.

    out->write( data = it_flights name = 'after modify' ).

  ENDMETHOD.

ENDCLASS.
