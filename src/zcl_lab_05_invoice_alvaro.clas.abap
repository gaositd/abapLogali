CLASS zcl_lab_05_invoice_alvaro DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_05_invoice_alvaro IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA: mv_aux1         TYPE String,
          mv_aux2         TYPE String,
          mv_aux3         TYPE String,
          mv_exercise     TYPE n LENGTH 4,
          mv_invoice_no   TYPE n LENGTH 8,
          mv_invoice_code TYPE String,
          mv_lines_of     TYPE String,
          mv_case1        TYPE String,
          mv_case2        TYPE String,
          mv_data         TYPE String VALUE '0001111111;LOGALI GROUP;2026',
          mv_id_customer  TYPE String,
          mv_customer     TYPE String,
          mv_year         TYPE String,
          mv_invoice_num  TYPE String VALUE '2015ABCD',
          mv_response     TYPE String VALUE ' Generating Invoice ',
          mv_count        TYPE i,
          MV_TRANSLATE_INVOICE TYPE String VALUE 'Report the issuance of this invoice',
          mv_pos          TYPE i.

    mv_exercise   = 2026.
    mv_invoice_no = 81726354.

    CONCATENATE mv_exercise mv_invoice_no INTO mv_invoice_code SEPARATED BY '/'.
    SPLIT mv_data AT ';' INTO mv_id_customer mv_customer mv_year.

    mv_case1 = 'Sales invoice with        status in process'.
    mv_case2 = '***ABAP*Cloud***'.

    mv_case1 = condense( val = mv_case1 ).
    mv_case2 = replace( val = mv_case2 sub = '*' with = `` occ = 0 ).

*        mv_aux1 = shift_left( val = mv_invoice_num places = 2 ).
*        mv_aux1 = shift_right( val = mv_aux1 places = 2 ).
    mv_aux1 = shift_left( val = shift_right( val = mv_invoice_num places = 2 ) places = 2 ).
    mv_aux2 = mv_response.

    SELECT
        connection_id,
        plane_type_id
    FROM /dmo/flight
    INTO TABLE @DATA(it_flight)
    UP TO 10 ROWS."no esta la tabla que se menciona en el laboratorio ZEMP_LOGALI

    mv_lines_of = concat_lines_of( table = it_flight sep = ` ` ).

    out->write( |mv_invoice_code = { mv_invoice_code }| ).
    out->write( |mv_lines_of = { mv_lines_of }| ).
    out->write( |mv_case1 = { mv_case1 }| ).
    out->write( |mv_case2 = { mv_case2 }| ).
    out->write( |SPLIT = { mv_id_customer }, { mv_customer }, { mv_year }| ).
    out->write( |Original String { mv_invoice_num }. Delete 2 characters at final string { mv_aux1 }| ).
    out->write( |Original String “ Generating Invoice ” STRLEN() = { strlen( mv_response ) }. NUMOFCHAR() = { numofchar( mv_aux2 ) } | ).
    TRANSLATE mv_translate_invoice TO UPPER CASE.
    out->write( |Translate invoice = { mv_translate_invoice }| ).
    TRANSLATE mv_translate_invoice TO LOWER CASE.
    out->write( |Translate invoice = { mv_translate_invoice }| ).
    out->write( |Insert text invoice = { mv_translate_invoice } to client| ).

  ENDMETHOD.

ENDCLASS.
