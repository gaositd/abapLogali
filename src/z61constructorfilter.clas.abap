CLASS z61constructorfilter DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z61constructorfilter IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    data: ti_fligths TYPE STANDARD TABLE OF /dmo/flight,
          ti_results TYPE STANDARD TABLE OF /dmo/flight,
          ti_filter TYPE SORTED TABLE OF /dmo/flight-carrier_id WITH UNIQUE KEY TABLE_LINE.

    SELECT FROM /dmo/flight
      FIELDS *
    into TABLE @ti_fligths.

    ti_filter = VALUE #( ( 'AA ' ) ( 'LH ' ) ( 'MX ' ) ).
    ti_results = FILTER #(
      ti_fligths in ti_filter
      WHERE carrier_id = table_line
    ).

    out->write( data = ti_fligths name = |ti_fligths, total records = { lines( ti_fligths ) }| ).
    out->write( data = ti_results name = |ti_results, total records = { lines( ti_results ) }| ).
  ENDMETHOD.

ENDCLASS.
