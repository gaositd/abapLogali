CLASS z36internaltablesfor DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z36internaltablesfor IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    TYPES:BEGIN OF ty_flights,
            iduser      TYPE /dmo/customer_id,
            aircode     TYPE /dmo/carrier_id,
            flight_num  TYPE /dmo/connection_id,
            key         TYPE land1,
            seat        TYPE /dmo/plane_seats_occupied,
            flight_date TYPE /dmo/flight_date,
          END OF ty_flights.

    DATA: gt_flights_info TYPE TABLE of ty_flights,
          gt_my_flights   TYPE TABLE OF ty_flights.

    gt_my_flights = VALUE #( for i = 1 until i > 10 (
                                iduser      = |{ i } - USER|
                                aircode     = 'MXN'
                                flight_num  = i + 3
                                key         = 'MX'
                                seat        = i + 5
                                flight_date = cl_abap_context_info=>get_system_date( ) + i
                              ) ).

    out->write( data = gt_my_flights name = 'Only FOR' ).

    gt_flights_info = VALUE #( for i = 1 WHILE i <= 10 (
                                iduser      = |{ i } - USER|
                                aircode     = 'MXN'
                                flight_num  = i + 3
                                key         = 'MX'
                                seat        = i + 5
                                flight_date = cl_abap_context_info=>get_system_date( ) + i
                              ) ).
    out->write( data = gt_flights_info name = 'FOR and WHILE' ).

    gt_flights_info = VALUE #( for wa_my_flights IN gt_my_flights
                                WHERE ( aircode = 'MXN' and seat >= 10 ) (
                                iduser      = wa_my_flights-iduser
                                aircode     = wa_my_flights-aircode
                                flight_num  = wa_my_flights-flight_num
                                key         = wa_my_flights-key
                                seat        = wa_my_flights-seat
                                flight_date = wa_my_flights-flight_date
                              ) ).
    out->write( data = gt_flights_info name = 'fill internal table from another internal table, using where clausule' ).



  ENDMETHOD.

ENDCLASS.
