CLASS zcl_lab_08_fieldsymbols_alvaro DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_lab_08_fieldsymbols_alvaro IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA: LV_EMPLOYEE TYPE String,
          lv_date     TYPE D.
    DATA: lt_employee TYPE TABLE OF zemp_logali.
    FIELD-SYMBOLS:  <LV_EMPLOYEE> TYPE String,
                    <LS_EMPLOYEE> TYPE zemp_logali.

    ASSIGN LV_EMPLOYEE TO <LV_EMPLOYEE>.
    <lv_employee> = 'Alvaro Gamez Chavez'.

    APPEND INITIAL LINE TO lt_employee ASSIGNING <ls_employee>.
    <ls_employee>-client  = sy-mandt.
    <ls_employee>-mandt   = sy-mandt.
    <ls_employee>-id      = '1'.
    <ls_employee>-email   = 'test@test.com'.
    <ls_employee>-ape1    = 'Gamez'.
    <ls_employee>-ape2    = 'Chavez'.
    <ls_employee>-name    = 'Alvaro'.
    <ls_employee>-fechan  = '19771114'.
    <ls_employee>-fechaa  = cl_abap_context_info=>get_system_date( ).

    UNASSIGN <LV_EMPLOYEE>.

    clear: <LS_EMPLOYEE>.
    <LS_EMPLOYEE> = VALUE #( lt_employee[ 1 ] ).
    <ls_employee>-ape1    = 'Gamez'.
    <ls_employee>-ape2    = 'Meraz'.
    <ls_employee>-name    = 'Ayde Cristina'.
    <ls_employee>-fechan  = '20161224'.

    INSERT <ls_employee> into lt_employee.

    lv_date = <ls_employee>-fechaa.


  ENDMETHOD.

ENDCLASS.
