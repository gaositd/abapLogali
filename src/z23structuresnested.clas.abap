CLASS z23structuresnested DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z23structuresnested IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    "flat strutures. On primitive data type
    TYPES:BEGIN OF lty_flat,
            name  TYPE string,
            id    TYPE i,
            total TYPE f,
          END OF lty_flat.
    "Nested strunctures, structures into structures
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

         out->write( data = ls_emp_info name = 'Employee Info' ).
  ENDMETHOD.

ENDCLASS.
