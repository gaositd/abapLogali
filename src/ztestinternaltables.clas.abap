CLASS ztestinternaltables DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_aDT_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS ztestinternaltables IMPLEMENTATION.

  METHOD if_oo_aDT_classrun~main.
    TYPES:BEGIN OF ty_employee,
            id     TYPE I,
            email  TYPE /dmo/email_address,
            ape1   TYPE String,
            ape2   TYPE String,
            name   TYPE String,
            fechan TYPE D,
            fechaa TYPE D,
          END OF ty_employee.
    DATA: mt_employees    TYPE STANDARD TABLE OF ty_employee,
          MT_EMPLOYEES_2  TYPE STANDARD TABLE OF ty_employee.
    DATA: ms_employee TYPE ty_employee.

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

    out->write(
      data = mt_employees
      name = 'ms_employee 1'
    ).

    out->write(
      data = mt_employees
      name = 'ms_employee 1'
    ).

    out->write(
      data = mt_employees_2
      name = 'ms_employee_2'
    ).

  ENDMETHOD.

ENDCLASS.

