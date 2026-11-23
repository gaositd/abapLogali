CLASS z66fieldsymbolsreadtrecords DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z66fieldsymbolsreadtrecords IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    SELECT FROM zemp
      FIELDS *
    INTO TABLE @DATA(ti_employees).

    INSERT INITIAL LINE INTO ti_employees ASSIGNING FIELD-SYMBOL(<fs_employee_insert>) INDEX 2.
    <fs_employee_insert> = VALUE #(
      client            = sy-mandt
      id                = '4FC6F27A39DF30E2BFC17180E0B319A2'
      employeeid        = '125'
      firstname         = 'Ayde Cristina'
      lastname          = 'Gamez Meraz'
      department        = 'Pupil'
      designation       = 'Programming'
      email             = 'test@test.com'
      phone             = '1234567890'
      joindate          = cl_abap_context_info=>get_system_date( ) - 20
      dateofbirth       = '19801210'
      gender            = 'Female'
      address           = 'Hilario Moreno #311 Fraccionamiento Real del Naranjal'
      active            = abap_true
      createdby         = 'Gaosxp'
      createdat         = cl_abap_context_info=>get_system_date( )
      lastchangedby     = cl_abap_context_info=>get_system_date( )
      lastchangedat     = cl_abap_context_info=>get_system_date( )
      locallastchanged  = cl_abap_context_info=>get_system_date( )
    ).

    READ TABLE ti_employees ASSIGNING FIELD-SYMBOL(<fs_flight>) INDEX 2."OK
    out->write( data = <fs_flight> name = '<fs_flight> read table'  ).
    clear: <fs_flight>.
    READ TABLE ti_employees ASSIGNING <fs_flight> WITH KEY employeeid = '123'.
    out->write( data = <fs_flight> name = '<fs_flight> read table'  ).
  ENDMETHOD.

ENDCLASS.
