CLASS z55constructorexcepduplicates DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z55constructorexcepduplicates IMPLEMENTATION.

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
          ti_persons2   TYPE SORTED TABLE OF ty_person WITH UNIQUE KEY name,
          ti_clients    TYPE STANDARD TABLE of ty_person WITH EMPTY KEY.

    DATA: wa_empoyee  TYPE ty_employee, "las areas de trabajo no se usaran para este ejercicio
          wa_person   TYPE ty_person.

    ti_clients = VALUE #(
      (
        name  = 'Alvaro Gamez Chavez'
        age   = 49
      )
      (
        name  = 'Ayde Cristina Gamez Meraz'
        age   = 9
      )
    ).

    ti_persons = CORRESPONDING #( ti_clients EXCEPT age ).
    out->write( data = ti_persons name = 'ti_persons' ).

    ti_persons = VALUE #(
      (
        name  = 'Alvaro Gamez Chavez'
        age   = 49
      )
      (
        name  = 'Daniela Iveth Meraz Silva'
        age   = 45
      )
      (
        name  = 'Ayde Cristina Gamez Meraz'
        age   = 9
      )
      (
        name  = 'Alvaro Gamez Chavez'
        age   = 49
      )
      (
        name  = 'Mauricio Gamez Chavez'
        age   = 47
      )
      (
        name  = 'José Maria Gamez Heredia'
        age   = 12
      )
      (
        name  = 'Tlally Melissa Gamez Heredia'
        age   = 16
      )
    ).

    ti_persons2 = CORRESPONDING #(
      ti_persons DISCARDING DUPLICATES
    ).
    out->write( data = ti_persons name = 'ti_persons original table' ).
    out->write( data = ti_persons2 name = 'ti_persons2 descarting duplicates' ).

  ENDMETHOD.

ENDCLASS.
