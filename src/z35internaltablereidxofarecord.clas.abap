CLASS z35internaltablereidxofarecord DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z35internaltablereidxofarecord IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    select from /dmo/flight
      fields *
    into table @data(it_flights).

    if sy-subrc = 0.
      READ TABLE it_flights WITH KEY plane_type_id = '747-400' TRANSPORTING NO FIELDS.
      DATA(lv_tabix) = sy-tabix.
      if sy-subrc = 0.
      out->write( it_flights ).
        out->write( |Record found in the position { lv_tabix }| ).
      else.
        out->write( |No ecord found in the internal table it_flights.| ).
      endif.

    ENDIF.

    data(lv_index) =  line_index( it_flights[ plane_type_id = 'A320-200' ] ).
      if sy-subrc = 0.
        out->write( |Record found in the position { lv_index }| ).
      else.
        out->write( |No ecord found in the internal table it_flights.| ).
      ENDIF.

    data(total_records) = lines( it_flights ).
    out->write( |The internal table it_flights have { total_records } records| ).
  ENDMETHOD.
ENDCLASS.
