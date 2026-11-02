CLASS z32internaltablescorrespondig DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    interfaces if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z32internaltablescorrespondig IMPLEMENTATION.

  method if_oo_adt_classrun~main.
    types: BEGIN OF lty_flights,
            carrier_id    TYPE /dmo/carrier_id,
            connection_id TYPE /dmo/connection_id,
            flight_date   type /dmo/flight_date,
            currency_code TYPE waers,
           end of lty_flights.

    data: gt_my_flights  type standard TABLE of lty_flights,"tabla interna (matriz)
          gwa_my_flights type lty_flights."área de trabajo (vector)

    types: BEGIN OF lty_diferents_names,
            carrier       TYPE /dmo/carrier_id,
            connection    TYPE /dmo/connection_id,
            flight_date   type /dmo/flight_date,
            currency_code TYPE waers,
           end of lty_diferents_names.

    data: gt_my_flights_others_names  type standard TABLE of lty_diferents_names,"tabla interna (matriz)
          gwa_my_flights_others_names type lty_diferents_names."área de trabajo (vector)

    select from /dmo/flight
      fields *
    where currency_code = 'EUR'
    into table @data(gt_flights).

    "MOVE-CORRESPONDING gt_flights to gt_my_flights.
    gt_my_flights  = corresponding #( gt_flights ).

    out->write( data = gt_flights name = 'gt_flights 1' ).
    out->write( |\n| ).
    out->write( data = gt_my_flights name = 'gt_my_flights 1' ).

    clear gt_flights.

    select from /dmo/flight
      fields *
    where currency_code = 'JPY'
    into table @gt_flights.
    "MOVE-CORRESPONDING gt_flights to gt_my_flights KEEPING TARGET LINES.
    gt_my_flights  = corresponding #( base ( gt_my_flights ) gt_flights ).

    out->write( data = gt_flights name = 'gt_flights 2' ).
    out->write( |\n| ).
    out->write( data = gt_my_flights name = 'gt_my_flights 2' ).

    clear gt_flights.

    select from /dmo/flight
      fields *
    where currency_code = 'SGD'
    into table @gt_flights.

    gt_my_flights_others_names  = corresponding #(
      base ( gt_my_flights )
      gt_flights
        MAPPING
          carrier       = carrier_id
          connection    = connection_id
          currency_code = currency_code
      ).

    out->write( data = gt_my_flights_others_names name = 'gt_my_flights 3' ).

  endmethod.

ENDCLASS.
