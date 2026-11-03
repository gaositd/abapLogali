CLASS z35internaltables_loo_pat DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z35internaltables_loo_pat IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA: contador TYPE i VALUE 0.

    DATA: ti_flights TYPE STANDARD TABLE OF /dmo/flight.
    DATA: wa_flights TYPE /dmo/flight.

    SELECT FROM /dmo/flight
      FIELDS *
    INTO TABLE @ti_flights.

    out->write( 'Show all records using a work area' ).

    LOOP AT ti_flights INTO wa_flights.
      out->write( data = wa_flights  name = |form 1| ).
    ENDLOOP.

    out->write( |\n| ).
    LOOP AT ti_flights INTO DATA(wa_flights2).
      out->write( wa_flights ).
    ENDLOOP.

    out->write( |\n| ).
    LOOP AT ti_flights INTO wa_flights WHERE plane_type_id = '747-400'.
      out->write( wa_flights ).
    ENDLOOP.

    out->write( |\nsalto de línea| ).
    LOOP AT ti_flights INTO wa_flights
      WHERE plane_type_id = '747-400'
        AND currency_code = 'EUR'.
      out->write( wa_flights ).
    ENDLOOP.

    out->write( |\nfields symbols| ).
    LOOP AT ti_flights ASSIGNING FIELD-SYMBOL(<fs_flight>)
      WHERE plane_type_id = '747-400'
        AND currency_code = 'EUR'.
      contador += 1.
      <fs_flight>-client = contador.
      out->write( <fs_flight> ).
    ENDLOOP.

  ENDMETHOD.
  .
ENDCLASS.
