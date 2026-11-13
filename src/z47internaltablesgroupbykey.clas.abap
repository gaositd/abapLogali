CLASS z47internaltablesgroupbykey DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z47internaltablesgroupbykey IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    SELECT FROM /dmo/flight
      FIELDS *
    ORDER BY currency_code
    INTO TABLE @DATA(ti_flights).

    DATA: it_members LIKE ti_flights.

    LOOP AT ti_flights ASSIGNING FIELD-SYMBOL(<fs_flight>)
      GROUP BY ( currency_code = <fs_flight>-currency_code
                 plane         = <fs_flight>-plane_type_id )
      INTO DATA(wa_key)  .

      CLEAR it_members.
      LOOP AT GROUP wa_key INTO DATA(wa_member).
        it_members = VALUE #( BASE it_members ( wa_member ) ).
      ENDLOOP.

      out->write( data = wa_key name = 'wa_key' ).

    ENDLOOP.

    out->write( |\n| ).
    LOOP AT ti_flights INTO DATA(wa_flight)
      GROUP BY ( airline = wa_flight-carrier_id
                 plane   = wa_flight-plane_type_id
                 index   = GROUP INDEX
                 size    = GROUP SIZE ) WITHOUT MEMBERS INTO DATA(wa_key2).
      out->write( data = wa_key2 name = 'wa_key2' ).
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
