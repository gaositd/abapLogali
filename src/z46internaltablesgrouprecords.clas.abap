CLASS z46internaltablesgrouprecords DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z46internaltablesgrouprecords IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    SELECT FROM /dmo/flight
      FIELDS *
    ORDER BY currency_code
    into TABLE @DATA(ti_flights).

    DATA: it_members LIKE ti_flights.

*    out->write( data = ti_flights name = 'ti_flights2' ).

    LOOP At ti_flights ASSIGNING FIELD-SYMBOL(<fs_flight>)
*      GROUP BY <fs_flight>-currency_code.
      GROUP BY ( currency_code = <fs_flight>-currency_code
                 plane         = <fs_flight>-plane_type_id ).

      clear it_members.
      LOOP AT GROUP <fs_flight> INTO data(wa_member).
        it_members = VALUE #( base it_members ( wa_member ) ).
      ENDLOOP.

      out->write( data = <fs_flight> name = '<fs_flight>' ).
      out->write( data = it_members name = 'it_members'  ).
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
