CLASS z64fieldsymbolsaddrecords DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z64fieldsymbolsaddrecords IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    SELECT FROM zemp
      FIELDS *
    INTO TABLE @DATA(ti_employees).

    APPEND INITIAL LINE TO ti_employees ASSIGNING FIELD-SYMBOL(<fs_employee_append>).
    <fs_employee_append> = VALUE #(
      client            = sy-mandt
      id                = '4FC6F27A39DF30E2BFC17180E0B319A2'
      employeeid        = 124
      firstname         = 'Daniela Iveth'
      lastname          = 'Meraz Silva'
      department        = 'Teachers'
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
    out->write( data = ti_employees name = 'ti_employees ADD'  ).
  ENDMETHOD.

ENDCLASS.
