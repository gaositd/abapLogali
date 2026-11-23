CLASS z62field_symbolsconcept DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z62field_symbolsconcept IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    data: vg_employee TYPE String.
    FIELD-SYMBOLS: <fs_employee> TYPE string,
                   <fs_ti_employee> TYPE zemp.

    ASSIGN vg_employee to <fs_employee>.

    SELECT FROM zemp
      FIELDS *
    into TABLE @data(ti_employees).

    out->write( data = vg_employee name = 'Initial value of vg_employee' ).
    out->write( data = <fs_employee> name = 'Initial value of <fs_employee>' ).

    <fs_employee> = 'Daniela Iveth Meraz Silva'.
    out->write( data = vg_employee name = 'Value of vg_employee' ).
    out->write( data = <fs_employee> name = 'Value of <fs_employee>' ).

    out->write( data = ti_employees name = 'Table (Beforte fileds symbols)'  ).
        LOOP AT ti_employees ASSIGNING <fs_ti_employee>.
      <fs_ti_employee>-lastname = 'Gamez Meraz'.
    ENDLOOP.
    out->write( data = ti_employees name = 'Table (After fileds symbols)'  ).
    UNASSIGN: <fs_employee>,
              <fs_ti_employee>.
  ENDMETHOD.

ENDCLASS.
