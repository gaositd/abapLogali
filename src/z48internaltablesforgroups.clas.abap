CLASS z48internaltablesforgroups DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z48internaltablesforgroups IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    SELECT from /dmo/flight
      FIELDS *
    INTo TABLE @DATA(ti_flights).

    TYPES ty_group_keys TYPE STANDARD TABLE OF /dmo/flight-carrier_id WITH EMPTY KEY.

    out->write( VALUE ty_group_keys( for groups gv_group of gs_group in ti_flights
                                      GROUP BY gs_group-carrier_id
                                      DESCENDING
                                      WITHOUT MEMBERS ( gv_group )
                                   )
    ).

    out->write( VALUE ty_group_keys( for groups gv_group of gs_group in ti_flights
                                      GROUP BY gs_group-carrier_id
                                      DESCENDING ( gv_group )
                                   )
    ).

  ENDMETHOD.

ENDCLASS.
