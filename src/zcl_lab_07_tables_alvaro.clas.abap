CLASS zcl_lab_07_tables_alvaro DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_lab_07_tables_alvaro IMPLEMENTATION.

  METHOD if_oo_aDT_classrun~main.
    TYPES:BEGIN OF ty_employee,
            id     TYPE I,
            email  TYPE /dmo/email_address,
            ape1   TYPE String,
            ape2   TYPE String,
            name   TYPE String,
            fechan TYPE D,
            fechaa TYPE D,
          END OF ty_employee,
          BEGIN OF ty_flights,
            idUser      TYPE C LENGTH 40,
            airCode     TYPE /dmo/carrier_id,
            flightNum   TYPE /dmo/connection_id,
            key         TYPE land1,
            seat        TYPE /dmo/plane_seats_occupied,
            flightDate  TYPE /dmo/flight_date,
          END OF ty_flights,
          BEGIN OF ty_seats,
            carrier_id    TYPE /dmo/carrier_id,
            connection_id TYPE /dmo/connection_id,
            seats         TYPE /dmo/plane_seats_occupied,
            bookings      TYPE /dmo/flight_price,
          END OF ty_seats.
    DATA: mt_employees    TYPE STANDARD TABLE OF ty_employee,
          MT_EMPLOYEES_2  TYPE STANDARD TABLE OF ty_employee,
          MT_SPFL         TYPE STANDARD TABLE OF /dmo/connection,
          LT_FLIGHTS      TYPE STANDARD TABLE OF ty_flights,
          LT_FLIGHTS_INFO TYPE STANDARD TABLE OF ty_flights,
          MT_FLIGHTS_TYPE TYPE STANDARD TABLE OF /dmo/flight,
          MT_AIRLINE      TYPE STANDARD TABLE OF /dmo/connection,
          MT_AIRLINE2     TYPE STANDARD TABLE OF /dmo/connection,
          LT_FINAL        TYPE SORTED TABLE OF ty_flights WITH NON-UNIQUE KEY aircode,
          lt_seats        TYPE HASHED TABLE OF ty_seats WITH UNIQUE KEY carrier_id connection_id,
          lt_seats2       TYPE STANDARD TABLE OF ty_seats,
          LT_FLIGHTS_BASE TYPE STANDARD TABLE OF /dmo/flight.

    DATA: ms_employee   TYPE ty_employee,
          MS_SPFLI      TYPE /dmo/connection,
          MS_SPFLI_2    TYPE /dmo/connection,
          wa_flightInfo TYPE ty_flights,
          wa_seats      type ty_seats,
          wa_flight     TYPE /dmo/flight.

    DATA: num TYPE i.

    mt_employees = VALUE #(
      (
        id      = 1
        email   = 'test@tes.com'
        ape1    = 'Gamez'
        ape2    = 'Meraz'
        name    = 'Ayde Cristina'
        fechaa  = '20161224'
        fechan  = '20261117'
      )
    ).

    ms_employee-id      = 2.
    ms_employee-email   = 'test@test.com'.
    ms_employee-ape1    = 'Meraz'.
    ms_employee-ape2    = 'Silva'.
    ms_employee-name    = 'Daniela Iveth'.
    ms_employee-fechan  = '19801210'.
    ms_employee-fechaa  = '20261117'.
    APPEND ms_employee to mt_employees.

    ms_employee-id      = 3.
    ms_employee-email   = 'test@test.com'.
    ms_employee-ape1    = 'Gamez'.
    ms_employee-ape2    = 'Chavez'.
    ms_employee-name    = 'Alvaro'.
    ms_employee-fechan  = '19771114'.
    ms_employee-fechaa  = '20261117'.
    INSERT ms_employee into TABLE mt_employees.

    ms_employee-id      = 4.
    ms_employee-email   = 'test@test.com'.
    ms_employee-ape1    = 'Gamez'.
    ms_employee-ape2    = 'Chavez'.
    ms_employee-name    = 'Mauricio'.
    ms_employee-fechan  = '19790222'.
    ms_employee-fechaa  = '20261117'.
    APPEND ms_employee to mt_employees_2.

    APPEND VALUE #(
      id      = 4
      email   = 'test@test.com'
      ape1    = 'Gamez'
      ape2    = 'Heredia'
      name    = 'Tlally Melissa'
      fechan  = '20100612'
      fechaa  = '20261117'
    ) to mt_employees_2.

    APPEND LINES OF mt_employees FROM 2 to 3 to mt_employees_2.

    SELECT FROM /dmo/connection
      FIELDS *
    WHERE carrier_id = 'LH'
    into TABLE @mt_spfl.

    ms_spfli = VALUE #( mt_spfl[
      carrier_id    = 'LH'
      connection_id = '0400'
    ] ).
    "MOVE-CORRESPONDING ms_spfli to ms_spfli_2.
    ms_spfli_2 = CORRESPONDING #( ms_spfli ).

    SELECT FROM /dmo/flight
      FIELDS *
    Into TABLE @MT_FLIGHTS_TYPE.

    if sy-subrc = 0.
      SELECT from /dmo/connection
        FIELDS *
      FOR ALL ENTRIES IN @mt_flights_type
      WHERE carrier_id    = @mt_flights_type-carrier_id
        AND connection_id = @mt_flights_type-connection_id
      into TABLE @mt_airline.
    ENDIF.

    Select FROM /dmo/flight
      FIELDS
        carrier_id,
        connection_id,
        seats_occupied,
        price
    into TABLE @lt_seats2.

    Select
      *
    FROM @mt_airline as mt
    WHERE airport_from_id = 'FRA'
    into TABLE @MT_AIRLINE2.
    SORT MT_AIRLINE2 BY connection_id DESCENDING.

    lt_final = VALUE #(
      for wa_FLIGHTS_TYPE IN MT_FLIGHTS_TYPE
        WHERE ( carrier_id = 'SQ' )
          FOR wa_airline1 in mt_airline
            WHERE (
              carrier_id    = wa_flights_type-carrier_id AND
              connection_id = wa_flights_type-connection_id
            )
          ( idUser      = wa_airline1-client
            airCode     = wa_airline1-carrier_id
            flightNum   = wa_airline1-connection_id
            key         = 'MXN'
            seat        = wa_flights_type-seats_occupied
            flightDate  = wa_flights_type-flight_date
          )
    ).

    out->write( data = mt_employees name = 'ms_employee 1' ).
    out->write( data = mt_employees name = 'ms_employee 1' ).
    out->write( data = mt_employees_2 name = 'ms_employee_2' ).
    out->write( data = mt_employees_2 name = 'ms_employee_2' ).
    out->write( data = mt_spfl name = |(mt_spfl) total of records = ms_employee_2 { lines( mt_spfl ) } | ).
    out->write( data = ms_spfli_2 name = 'ms_spfli2' ).

    ms_spfli = ( mt_spfl[ 1 ] ).
    out->write( data = ms_spfli name = |Read table with index to mt_spfli | ).

    READ TABLE mt_spfl
    INTO ms_spfli
    WITH KEY airport_to_id = 'FRA'.
    out->write( data = ms_spfli name = |Read table to mt_spfli | ).

    READ TABLE mt_spfl
    INTO ms_spfli
    WHERE connection_id >= '0406' and
          connection_id <= '0407'.
    if sy-subrc = 0.
      out->write( data = ms_spfli name = |check information to mt_spfli | ).
    ELSE.
      out->write( | no found data | ).
    ENDIF.

    clear: ms_spfli.
    data(vl_index) = line_index( mt_spfl[ connection_id = '400' ]  ).
    if sy-subrc = 0.
      out->write( data = vl_index name = |get index to mt_spfli | ).
    ELSE.
      out->write( | no found data | ).
    ENDIF.

    clear: ms_spfli_2.
    out->write( 'ms_spfli_2 KM' ).
    LOOP AT mt_spfl INTO ms_spfli_2
      WHERE distance_unit = 'KM'.
      out->write( ms_spfli_2 ).
    ENDLOOP.

    lt_flights = VALUE #(
      for i = 1 UNTIL i > 16 (
        idUser      = |1234-{ i }-Ayde_Cristina_GaMeraz|
        airCode     = 'MX'
        flightNum   = '000' + i
        key         = 'MXN'
        seat        = 0 + i
        flightDate  = cl_abap_context_info=>get_system_date( ) + i
      )
    ).

    lt_flights_info = VALUE #(
      for wa_flightX IN lt_flights (
        VALUE #( base wa_flightX
          aircode   = 'CL'
          flightnum = wa_flightX-flightnum + 10
          key       = 'COP'
        )
      )
    ).

    out->write( data = lt_flights name = |lt_flights| ).
    out->write( data = lt_flights_info name = |lt_flights_info| ).
    out->write( data = lt_final name = |lt_final| ).
    out->write( data = MT_AIRLINE2 name = 'MT_AIRLINE2' ).

*    LOOP AT mt_spfl ASSIGNING FIELD-SYMBOL(<fs_spfli>).
*      <fs_spfli>-arrival_time = '130000'.
*    ENDLOOP.
    LOOP AT mt_spfl into ms_spfli.
      ms_spfli-arrival_time = '120000'.
      MODIFY mt_spfl FROM ms_spfli.
    ENDLOOP.
    out->write( data = mt_spfl name = 'mt_spfl' ).

    DELETE mt_spfl WHERE airport_to_id = 'FRA'.
    out->write( data = mt_spfl name = 'mt_spfl' ).

    LOOP AT mt_flights_type into data(wa_flights_type2)
      WHERE seats_max = 140.
      wa_seats-carrier_id     = wa_flights_type2-carrier_id.
      wa_seats-connection_id  = wa_flights_type2-connection_id.
      wa_seats-seats          = wa_flights_type2-seats_max.
      wa_seats-bookings       = wa_flights_type2-price.
      COLLECT wa_seats INTO lt_seats.
    ENDLOOP.
    out->write( data = lt_seats name = 'seats 1' ).

    clear: lt_seats,
           wa_seats.
    LOOP AT lt_seats2 into wa_seats.
      COLLECT wa_seats into lt_seats.
    ENDLOOP.
    out->write( data = lt_seats name = 'seats 2' ).

    CLEAR: MT_FLIGHTS_TYPE.
    SELECT from /dmo/flight
      FIELDS *
    into TABLE @MT_FLIGHTS_TYPE.

    SELECT FROM /dmo/carrier
      FIELDS *
    into TABLE @data(mt_scarr).

    data(lv_variable) = cond String(
      LET lv_price      = VALUE #( mt_flights_type[ 1 ]-price )
          lv_carrierID  = VALUE #( mt_scarr[ 1 ]-carrier_id )
      IN
        when lv_carrierID is not initial and lv_price is not initial then | { lv_carrierID }-${ lv_price }|
        else
          'Error data'
    ).
    out->write( data = lv_variable name = 'lv_variable' ).

     LT_FLIGHTS_BASE = VALUE #( BASE LT_FLIGHTS_BASE ( lines of mt_flights_type ) ).
    out->write( data = LT_FLIGHTS_BASE name = 'LT_FLIGHTS_BASE' ).

    LOOP AT mt_spfl INTO ms_spfli
      GROUP BY ms_spfli-airport_from_id
      INTO data(vl_grupo).

      data(vl_airport_from_id) = ''.

      LOOP AT GROUP vl_grupo INTO data(grupo).
        vl_airport_from_id = grupo.
      ENDLOOP.
      out->write( data = vl_airport_from_id name = 'vl_airport_from_id' ).
    ENDLOOP.

    LOOP AT mt_spfl INTO ms_spfli
      GROUP BY (
        airport_from_id = ms_spfli-airport_from_id
        airport_to_id   = ms_spfli-airport_to_id
      )
      INTO data(lv_llave_compuesta).

      data(llave) = ''.

      LOOP AT GROUP lv_llave_compuesta INTO data(llave_compuesta).
        llave = |{ llave_compuesta-airport_from_id } ==>> { llave_compuesta-airport_to_id }|.
      ENDLOOP.
        out->write( data = llave name = 'llave' ).

      ENDLOOP.

  ENDMETHOD.

ENDCLASS.
