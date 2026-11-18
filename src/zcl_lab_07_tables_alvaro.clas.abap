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
          END OF ty_flights.
    DATA: mt_employees    TYPE STANDARD TABLE OF ty_employee,
          MT_EMPLOYEES_2  TYPE STANDARD TABLE OF ty_employee,
          MT_SPFL         TYPE STANDARD TABLE OF /dmo/connection,
          LT_FLIGHTS      TYPE STANDARD TABLE OF ty_flights,
          LT_FLIGHTS_INFO TYPE STANDARD TABLE OF ty_flights,
          MT_FLIGHTS_TYPE TYPE STANDARD TABLE OF /dmo/flight,
          MT_AIRLINE.

    DATA: ms_employee   TYPE ty_employee,
          MS_SPFLI      TYPE /dmo/connection,
          MS_SPFLI_2    TYPE /dmo/connection,
          wa_flightInfo TYPE ty_flights.

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
      for wa_flight IN lt_flights (
        VALUE #( base wa_flight
          aircode   = 'CL'
          flightnum = wa_flight-flightnum + 10
          key       = 'COP'
        )
      )
    ).

    out->write( data = lt_flights name = |lt_flights| ).
    out->write( data = lt_flights_info name = |lt_flights_info| ).

  ENDMETHOD.

ENDCLASS.
