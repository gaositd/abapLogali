CLASS z68dimaycprogramfieldsymbols DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z68dimaycprogramfieldsymbols IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    FIELD-SYMBOLS:<fs_employees> TYPE ANY TABLE,
                  <fs_employee>  TYPE any,
                  <fs_data>      TYPE any.
    DATA(wa_employee) = VALUE zemp(
      client            = sy-mandt
      id                = '12837204B4991EDC9FC0675639081656'
      employeeid        = '5'
      firstname         = 'Daniela'
      lastname          = 'Meraz Silva'
      department        = 'Systems'
      designation       = 'Systems'
      email             = 'test@test.com'
      phone             = '526181447500'
      joindate          = cl_abap_context_info=>get_system_date( )
      dateofbirth       = '19801210'
      gender            = 'Female'
      address           = 'Hilario Moreno 311 fraccionamiento Real del Naranjal'
      active            = abap_true
      createdat         = cl_abap_context_info=>get_system_date( )
      createdby         = sy-uname
      lastchangedat     = cl_abap_context_info=>get_system_date( )
      locallastchanged  = cl_abap_context_info=>get_system_date( )
    ).

    SELECT FROM zemp01
      FIELDS *
    into TABLE @data(ti_zemp01).

    ASSIGN wa_employee TO <fs_employee>.
    IF <fs_employee> IS ASSIGNED.

      ASSIGN COMPONENT 'firstname' OF STRUCTURE <fs_employee> to <fs_data>.

      IF <fs_data> IS ASSIGNED.
        <fs_data> = 'Daniela Iveth'.
        UNASSIGN <fs_data>.
      ENDIF.

    ENDIF.

    UNASSIGN <fs_employee>.
    out->write( data = wa_employee ).
    out->write( data = ti_zemp01 ).

    if lines( ti_zemp01 ) GT 0.
      ASSIGN ti_zemp01 to <fs_employees>.

      LOOP AT <fs_employees> ASSIGNING <fs_employee>.

        IF <fs_employee> IS ASSIGNED.
          ASSIGN COMPONENT 'email' OF STRUCTURE <fs_employee> to <fs_data>.

          if <fs_data> IS ASSIGNED.
            <fs_data> = 'test@test.com'.
            UNASSIGN <fs_data>.
          ENDIF.

        ENDIF.

      ENDLOOP.
      out->write( data = ti_zemp01 ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.
