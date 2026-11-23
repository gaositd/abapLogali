CLASS z63fieldymbolinlinedeclaration DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z63fieldymbolinlinedeclaration IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA: vg_employee  TYPE String.
    DATA ti_employees2 TYPE STANDARD TABLE OF zemp.

    ASSIGN vg_employee TO FIELD-SYMBOL(<fs_employee>).

    SELECT FROM zemp
      FIELDS *
    INTO TABLE @DATA(ti_employees).

    out->write( data = vg_employee name = 'Initial value of vg_employee' ).
    out->write( data = <fs_employee> name = 'Initial value of <fs_employee>' ).

    <fs_employee> = 'Daniela Iveth Meraz Silva'.
    out->write( data = vg_employee name = 'Value of vg_employee' ).
    out->write( data = <fs_employee> name = 'Value of <fs_employee>' ).

    out->write( data = ti_employees name = 'Table (Beforte fileds symbols)'  ).
    LOOP AT ti_employees ASSIGNING FIELD-SYMBOL(<fs_ti_employee>).
      <fs_ti_employee>-lastname = 'Gamez Meraz'.
    ENDLOOP.
    out->write( data = ti_employees name = 'Table (After fileds symbols)'  ).
    UNASSIGN: <fs_employee>,
              <fs_ti_employee>.


    ti_employees2 = VALUE #(
      FOR <fs_employees> IN ti_employees
        ( CORRESPONDING #( <fs_employees> ) )
    ).

    out->write( data = ti_employees2 name = 'ti_employees2' ).

  ENDMETHOD.

ENDCLASS.
