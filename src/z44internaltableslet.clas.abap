CLASS z44internaltableslet DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z44internaltableslet IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    data: totalRows TYPE i VALUE 0.

    SELECT FROM /dmo/flight
      FIELDS *
    WHERE currency_code = 'EUR'
    INTO TABLE @DATA(ti_flight).

    SELECT FROM /dmo/booking_m
      FIELDS *
    FOR ALL ENTRIES IN @ti_flight
    WHERE carrier_id = @ti_flight-carrier_id
    INTO TABLE @DATA(ti_booking_m).
*    UP TO 50 ROWS.

    LOOP AT ti_flight INTO DATA(wa_flight).

      DATA(lv_flights) = CONV string( LET lv_airline = ti_booking_m[ carrier_id = wa_flight-carrier_id ]-travel_id
                                          lv_carrid  = ti_booking_m[ carrier_id = wa_flight-carrier_id ]-carrier_id
                                          lv_price   = ti_flight[ carrier_id = wa_flight-carrier_id
                                                                  connection_id = wa_flight-connection_id ]-price
                                       IN |{ lv_carrid }/Airline name: { lv_airline }/ price: { lv_price }| ).
      if ( sy-subrc = 0 ).
        totalrows += 1.
        out->write( data = lv_flights ).
      ENDIF.

    ENDLOOP.
    out->write( data = totalrows name = '\nTotal rows' ).
  ENDMETHOD.

ENDCLASS.
