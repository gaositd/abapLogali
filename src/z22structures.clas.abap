CLASS z22structures DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z22structures IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA: ls_flight TYPE /dmo/flight.
    TYPES:BEGIN OF lty_employee,
            name  TYPE string,
            id    TYPE i,
            email TYPE /dmo/email_address,
          END OF lty_employee.
    DATA: BEGIN OF ls_employee,
            name  TYPE string VALUE 'Ayde',
            id    TYPE i,
            email TYPE /dmo/email_address,
          END OF ls_employee.
    DATA: lt_employee TYPE TABLE OF lty_employee. "ITAB
    DATA ls_empl      TYPE lty_employee.          "Structure
    DATA ls_emp2      LIKE ls_employee.
    DATA(lt_inline) = ls_employee.
    DATA(lt_inline2) = VALUE lty_employee(
      name = 'Ayde Crisitina Gamez Meraz'
      id = 1
      email = 'aydecristinagamezmeraz@gmail.com'
    ).

  ENDMETHOD.

ENDCLASS.
