CLASS z29internaltablesaddrecords DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z29internaltablesaddrecords IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA: it_employees TYPE STANDARD TABLE OF zemploytableagch,
          wa_employees TYPE zemploytableagch.

    TYPES lty_employees LIKE it_employees.
    DATA(it_employees_online) = VALUE lty_employees(
      ( id = 0000 first_name = 'Daniela Iveth' last_name = 'Meraz Silva' email = 'dany@danymeraz.com' salary = 3300 currency_code = 'MXN' phone_number = '6181586573' mandt = sy-mandt )
      ( id = 0001 first_name = 'Ayde Cristina' last_name = 'Gamez Meraz' email = 'ayde@danymeraz.com' salary = 300 currency_code = 'MXN' phone_number = '6180000000' mandt = sy-mandt )
      ( id = 0002 first_name = 'Alvaro' last_name = 'Gamez Chavez' email = 'yo@danymeraz.com' salary = 330 currency_code = 'MXN' phone_number = '6181447500' mandt = sy-mandt )
    ).

    it_employees = VALUE #(
      ( id = 0003 first_name = 'Mauricio' last_name = 'Gamez Chavez' email = 'bro@danymeraz.com' salary = 300 currency_code = 'MXN' phone_number = '6181637913' mandt = sy-mandt )
      ( id = 0004 first_name = 'Tlally Melissa' last_name = 'Gamez Heredia' email = 'sobrinade@danymeraz.com' salary = 200 currency_code = 'MXN' phone_number = '6180000000' mandt = sy-mandt )
      ( id = 0005 first_name = 'Bolo' last_name = 'Gamez Heredia' email = 'sobrino@danymeraz.com' salary = 200 currency_code = 'MXN' phone_number = '6180000000' mandt = sy-mandt )
    ).

    out->write( it_employees_online ).
    out->write( |\n| ).
    out->write( it_employees ).
  ENDMETHOD.

ENDCLASS.
