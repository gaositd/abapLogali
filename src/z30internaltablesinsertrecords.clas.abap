CLASS z30internaltablesinsertrecords DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    interfaces if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z30internaltablesinsertrecords IMPLEMENTATION.

  method if_oo_adt_classrun~main.
    DATA: it_employees  TYPE STANDARD TABLE OF zemploytableagch,
          wa_employees  TYPE zemploytableagch,
          it_employees2 LIKE it_employees.

    wa_employees-mandt          = sy-mandt.
    wa_employees-id             = 0000.
    wa_employees-first_name     = 'Daniela Iveth'.
    wa_employees-last_name      = 'Meraz Silva'.
    wa_employees-email          = 'dany@danymeraz.com'.
    wa_employees-salary         = 3300.
    wa_employees-currency_code  = 'MXN'.
    wa_employees-phone_number   = '6181586573'.

    INSERT wa_employees into table it_employees.
*    out->write( it_employees ).
*    out->write( |\n| ).
    INSERT VALUE #(
      id = 0002
      first_name = 'Ayde Cristina'
      last_name = 'Gamez Meraz'
      email = 'ayde@danymeraz.com'
      salary = 300
      currency_code = 'MXN'
      phone_number  = '6180000000'
      mandt         = sy-mandt
    ) INTO TABLE it_employees .
    INSERT INITIAL LINE INTO table it_employees.

    INSERT VALUE #(
      id = 0003
      first_name = 'Ayde Cristina'
      last_name = 'Gamez Meraz'
      email = 'ayde@danymeraz.com'
      salary = 300
      currency_code = 'MXN'
      phone_number  = '6181111111'
      mandt         = sy-mandt
    ) INTO it_employees INDEX 2.

    INSERT LINES OF it_employees INTO TABLE it_employees2.

    out->write( data = it_employees name = 'it_employees' ).
    out->write( |\n| ).
    out->write( data = it_employees2 name = 'it_employees 2' ).

    INSERT LINES OF it_employees TO 1 INTO TABLE it_employees2.
    out->write( |\n| ).
    out->write( data = it_employees2 name = 'it_employees 2 - ' ).

    INSERT LINES OF it_employees from 2 TO 3 INTO TABLE it_employees2.
    out->write( |\n| ).
    out->write( data = it_employees2 name = 'it_employees 2 - ' ).
  endmethod.

ENDCLASS.
