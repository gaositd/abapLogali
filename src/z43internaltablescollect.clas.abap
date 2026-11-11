CLASS z43internaltablescollect DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z43internaltablescollect IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA: BEGIN OF ty_seats,
            carrid TYPE /dmo/flight-carrier_id,
            connid TYPE /dmo/flight-connection_id,
            seats  TYPE /dmo/flight-seats_max,
            price  TYPE /dmo/flight-price,
          END OF ty_seats.

    DATA: it_seatsCollect  LIKE HASHED TABLE OF ty_seats WITH UNIQUE KEY carrid connid,
          it_seatsStandart LIKE STANDARD TABLE OF ty_seats.

    SELECT FROM /dmo/flight
      FIELDS
        carrier_id,
        connection_id,
        seats_max,
        price
    INTO @ty_seats.
      COLLECT ty_seats INTO it_seatsCollect.
      APPEND ty_seats TO it_seatsstandart.
    ENDSELECT.

    IF sy-subrc = 0.
      out->write( data = it_seatsCollect name = |After it_seats filled (currente records = { lines( it_seatsCollect ) })| ).
      out->write( data = it_seatsstandart name = |Standard table it_seatsstandart (current records) { lines( it_seatsstandart ) }| ).
    ENDIF.


  ENDMETHOD.

ENDCLASS.
