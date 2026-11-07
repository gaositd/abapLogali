CLASS z39internaltablesselect DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z39internaltablesselect IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    TYPES: BEGIN OF ty_flights_fields,
             carrier_id    TYPE /dmo/carrier_id,
             connection_id TYPE /dmo/connection_id,
             flight_date   TYPE /dmo/flight_date,
           END OF ty_flights_fields.
    DATA: it_flights_fields TYPE STANDARD TABLE OF ty_flights_fields.

    SELECT
    FROM /dmo/flight
    FIELDS
      *
    WHERE carrier_id = 'LH'
      INTO TABLE @DATA(it_flights).

    SELECT
      carrier_id,
      connection_id,
      flight_date
    FROM @it_flights AS gt
    INTO TABLE @it_flights_fields.

    out->write( it_flights_fields ).

  ENDMETHOD.

ENDCLASS.
