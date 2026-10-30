CLASS z26structuresdeletedata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z26structuresdeletedata IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    select single
    from /dmo/flight
      fields *
    where carrier_id = 'LH'
    into @data(ls_flight).

    out->write( data = ls_flight name = 'Flight data' ).
    clear ls_flight-client.
    out->write( data = ls_flight name = 'Flight data' ).
    clear ls_flight.
    out->write( data = ls_flight name = 'Flight data' ).

  ENDMETHOD.

ENDCLASS.
