CLASS z33internaltablesreadwithindex DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    interfaces if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z33internaltablesreadwithindex IMPLEMENTATION.

  method if_oo_adt_classrun~main.
    select from /dmo/airport
      fields *
    where country like 'M%'
       or country = 'DE'
    ORDER BY country DESCENDING
    into table @data(it_airport).

    if sy-subrc = 0.
      READ table it_airport into data(wa_airport) index 2.
      out->write( data = wa_airport name = 'Work area' ).
      out->write( data = it_airport name = 'Internal table' ).
    else.
      out->write( 'not found data' ).
    endif.

    clear: it_airport,
           wa_airport.

    select from /dmo/airport
      fields *
    where country like 'M%'
       or country = 'DE'
    ORDER BY country DESCENDING
    into table @it_airport.

    if sy-subrc = 0.
      READ table it_airport into wa_airport index 2 TRANSPORTING airport_id name city.
      out->write( data = wa_airport name = 'Work area 2' ).
      out->write( |\n| ).
      out->write( data = it_airport name = 'Internal table 2' ).
    else.
      out->write( 'not found data' ).
    endif.

    clear: it_airport.

    select from /dmo/airport
      fields *
    where country like 'M%'
       or country = 'DE'
    ORDER BY country DESCENDING
    into table @it_airport.

    if sy-subrc = 0.
      READ table it_airport assigning FIELD-symbol(<fs_airport>) index 4.
      out->write( data = <fs_airport> name = 'fiels symbols fs_airport' ).
      out->write( |\n| ).
      out->write( data = it_airport name = 'Internal table 2' ).
    else.
      out->write( 'not found data' ).
    endif.

    data(ls_data) = it_airport[ 5 ].
    if sy-subrc = 0.
      out->write( data = ls_data name = 'ls_data' ).
      out->write( |\n| ).
      out->write( data = it_airport name = 'Internal table 2' ).
    else.
      out->write( 'not found data' ).
    endif.

    clear ls_data.

    try.
      data(ls_data2) = value #( it_airport[ 20 ] ).
      out->write( data = ls_data2 name = 'ls_data2' ).
    catch CX_SY_ITAB_LINE_NOT_FOUND.
      out->write( 'ITAB LINE NOT FOUND' ).
    ENDTRY.

    clear ls_data2.
    ls_data2 = value #( it_airport[ 20 ] optional ).
    out->write( data = ls_data2 name = 'ls_data2_1' ).

    clear ls_data2.
    ls_data2 = value #( it_airport[ 20 ] DEFAULT it_airport[ 2 ] ).
    out->write( data = ls_data2 name = 'ls_data2_default' ).

  endmethod.

ENDCLASS.
