CLASS z52constructorcorrebasemap DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z52constructorcorrebasemap IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    TYPES: BEGIN OF ty_employee,
            empName TYPE String,
            empAge  TYPE i,
           END OF ty_employee,
           BEGIN OF ty_person,
            name  TYPE String,
            age   TYPE i,
           END OF ty_person.
    DATA: ti_employees  TYPE STANDARD TABLE OF ty_employee,
          ti_persons    TYPE STANDARD TABLE OF ty_person,
          ti_clients    TYPE STANDARD TABLE of ty_person WITH EMPTY KEY.

    DATA: wa_empoyee  TYPE ty_employee, "las areas de trabajo no se usaran para este ejercicio
          wa_person   TYPE ty_person.

    ti_employees = VALUE #( ( empname = 'Daniela Ivent Meraz Silva' empage = 45 ) ).
    out->write( data = ti_employees name = 'ti_employees' ).

    ti_persons = CORRESPONDING #( ti_employees MAPPING name = empname age = empage ).
    out->write( data = ti_persons name = 'ti_persons' ).

    ti_clients = CORRESPONDING #( ti_persons ).
    ti_clients = CORRESPONDING #( base ( ti_clients ) ti_persons ).
    out->write( data  = ti_clients name = 'ti_clients' ).
  ENDMETHOD.

ENDCLASS.
