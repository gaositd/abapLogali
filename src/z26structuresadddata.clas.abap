CLASS z26structuresadddata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z26structuresadddata IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA:BEGIN OF ls_emp_info,
           BEGIN OF info_emp,
             id         TYPE i VALUE 1,
             first_name TYPE String VALUE 'Ayde Cristina',
             last_name  TYPE String VALUE 'Gamez Meraz|',
           END OF info_emp,
           BEGIN OF address_info,
             city       TYPE String VALUE 'Durango',
             street     TYPE String VALUE 'Hilario Moreno|',
             country_id TYPE i VALUE 52,
           END OF address_info,
           BEGIN OF position_emp,
             department TYPE String VALUE 'IT',
             salary     TYPE p DECIMALS 2 VALUE '54.45',
           END OF position_emp,
         END OF ls_emp_info.

    TYPES:BEGIN OF lty_flights,
            flight_date   TYPE /dmo/flight-flight_date,
            price         TYPE /dmo/flight_price,
            currency_code TYPE /dmo/flight-currency_code,
          END OF lty_flights.

    DATA: BEGIN OF ls_flight_info,
            carrier    TYPE /dmo/flight-carrier_id     VALUE 'AA',
            connid     TYPE /dmo/flight-connection_id  VALUE '0018',
            lt_flights TYPE TABLE OF lty_flights WITH EMPTY KEY,
          END OF ls_flight_info.

    DATA(ls_flight2) = value lty_flights(
      flight_date   = '19801210'
      price         = '300'
      currency_code = 'MXN'
    ).

    ls_emp_info = VALUE #(
      info_emp  = VALUE #(
        id      = 2
        first_name = 'Daniela Iveth'
        last_name  = 'Meraz Silva'
      )
      address_info = VALUE #(
        city = 5
        street = 'Hilario Moreno'
        country_id = 52
      )
      position_emp = VALUE #(
        department = 'Teachers'
        salary     = 20
      )
    ).

    ls_flight_info = VALUE #(
      carrier = 'MX'
      connid  = '004'
      lt_flights = VALUE #(
        (
          flight_date = '19771114'
          currency_code = 'MXN'
          price = '3'
        )
      )
    ).

    out->write( data = ls_emp_info name = 'Employee information' ).
    out->write( |\n| ).
    out->write( data = ls_flight_info name = 'Flight Information' ).
    out->write( |\n| ).
    out->write( data = ls_flight2 name = 'Otra tabla' ).
  ENDMETHOD.

ENDCLASS.
