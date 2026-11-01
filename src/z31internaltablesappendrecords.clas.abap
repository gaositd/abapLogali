CLASS z31internaltablesappendrecords DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z31internaltablesappendrecords IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA: it_employees  TYPE STANDARD TABLE OF zemploytableagch,
          wa_employees  TYPE zemploytableagch.

    wa_employees-mandt          = sy-mandt.
    wa_employees-id             = 0000.
    wa_employees-first_name     = 'Daniela Iveth'.
    wa_employees-last_name      = 'Meraz Silva'.
    wa_employees-email          = 'dany@danymeraz.com'.
    wa_employees-salary         = 3300.
    wa_employees-currency_code  = 'MXN'.
    wa_employees-phone_number   = '6181586573'.

    APPEND wa_employees to it_employees.
    out->write( data = it_employees name = 'it_employees 1' ).
    APPEND INITIAL LINE TO it_employees.
    out->write( data = it_employees name = 'it_employees 2' ).
    APPEND VALUE #(
     mandt          = sy-mandt
     id             = 5
     first_name     = 'Alvaro'
     last_name      = 'Gamez Chavez'
     email          = 'yo@yo.com'
     salary         = 300
     currency_code  = 'MXN'
     phone_number   = '6181447500'
    ) to it_employees.
    out->write( data = it_employees name = 'it_employees 3' ).

  ENDMETHOD.
ENDCLASS.
