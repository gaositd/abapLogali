CLASS z49internaltablesranges DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z49internaltablesranges IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    TYPES ty_price TYPE RANGE OF /dmo/flight_price.
    DATA(ti_price) = VALUE ty_price(
      ( sign    = 'I'
       option  = 'BT'
       low     = '100'
       high    = '1000' )
    ).

    SELECT FROM /dmo/flight
      FIELDS *
    WHERE price IN @ti_price
    into table @data(ti_flights).
    SORT ti_flights by price DESCENDING.

    out->write( data = ti_price name =  'ti_price' ).
    out->write( data = ti_flights name =  'ti_flights' ).
  ENDMETHOD.

ENDCLASS.
