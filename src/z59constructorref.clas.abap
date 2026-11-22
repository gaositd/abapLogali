CLASS z59constructorref DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z59constructorref IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    data: ti_flight TYPE TABLE OF /dmo/flight WITH EMPTY KEY.

    ti_flight = VALUE #(
      (
        client         = 100
        carrier_id     = 'MX'
        connection_id  = 1101
        currency_code  = 'MXN'
        flight_date    = cl_abap_context_info=>get_system_date( )
        plane_type_id  = 'AF-1234'
        price          = 200
        seats_max      = 100
        seats_occupied = 20
      )
      (
        client         = 100
        carrier_id     = 'MX'
        connection_id  = 1102
        currency_code  = 'MXN'
        flight_date    = cl_abap_context_info=>get_system_date( )
        plane_type_id  = 'XX-1234'
        price          = 400
        seats_max      = 600
        seats_occupied = 50
      )
      (
        client         = 100
        carrier_id     = 'CO'
        connection_id  = 1101
        currency_code  = 'COP'
        flight_date    = cl_abap_context_info=>get_system_date( )
        plane_type_id  = 'AF-1234'
        price          = 200
        seats_max      = 100
        seats_occupied = 20
      )
      (
        client         = 100
        carrier_id     = 'PE'
        connection_id  = 1103
        currency_code  = 'USD'
        flight_date    = cl_abap_context_info=>get_system_date( )
        plane_type_id  = 'PE-1234'
        price          = 150
        seats_max      = 80
        seats_occupied = 20
      )
    ).

    DATA: vl_int_value  TYPE i VALUE 100,
          vl_ref_int    TYPE REF TO i.
    DATA(vl_flight)  = ref #( ti_flight[ 2 ] ).

    vl_ref_int = ref #( vl_int_value ).
    out->write( data = vl_int_value name = 'Original vl_int_value' ).
    out->write( data = vl_ref_int->* name = | Variable referenced vl_ref_int ({ vl_ref_int->* } ) | ).
    vl_ref_int->* += 5.
    out->write( data = vl_int_value name = 'Actual value of vl_int_value' ).
    out->write( data = vl_ref_int name = | Actual value of vl_ref_int ({ vl_ref_int->* } ) | ).
    out->write( data = vl_flight->* name = 'ti_flight' ).
    vl_flight->seats_occupied = 151.
    out->write( data = vl_flight->* name = 'ti_flight modified on the seats max occupied field' ).

    clear: vl_flight.
    try.
      vl_flight = ref #( ti_flight[ 14 ] )."this record do not exist
      out->write( data = vl_flight->* name = 'ti_flight, with de fake index' ).
    CATCH CX_SY_ITAB_LINE_NOT_FOUND INTO data(vl_error).
      out->write( | Error => { vl_error->get_text( ) } | ).
    ENDTRY.

    clear: vl_error.
    try.
      DATA(vl_flight2) = ref #( ti_flight[ 2 ] ).
      vl_flight2 = ref #( ti_flight[ 8 ] OPTIONAL )."this record do not exist, but is used OPTIONAL
      out->write( data = vl_flight2 name = 'vl_flight2, with de fake index' ).
    CATCH CX_SY_ITAB_LINE_NOT_FOUND INTO vl_error.
      out->write( | Error => { vl_error->get_text( ) } | ).
    ENDTRY.

  ENDMETHOD.

ENDCLASS.
