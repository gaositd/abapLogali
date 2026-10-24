CLASS zcl_lab_06_condition_alvaro DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS usingCase
      IMPORTING data_to_evaluation TYPE String
      EXPORTING data_case_return   TYPE String.

    METHODS usingIf
      IMPORTING data_if        TYPE i
      EXPORTING data_if_return TYPE string.

    METHODS usingdo
      IMPORTING lv_times   TYPE i
      EXPORTING lv_counter TYPE i.

    METHODS usingloop
      IMPORTING out TYPE REF TO if_oo_adt_classrun_out.

    METHODS usingtry
      IMPORTING out TYPE REF TO if_oo_adt_classrun_out.

ENDCLASS.

CLASS zcl_lab_06_condition_alvaro IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA: lv_conditional1  TYPE i VALUE 8,
          lv_conditional2  TYPE String VALUE 'SAPOSS',
          lv_counter       TYPE i,
          data_if_return   TYPE String,
          data_case_return TYPE String,
          lv_times         TYPE i VALUE 10,
          lv_string_2      TYPE String,
          lv_time          TYPE t,
          LV_TIME_result   TYPE String.

    lv_time = cl_abap_context_info=>get_system_time(  ).

    usingif(
      EXPORTING data_if     = lv_conditional1
      IMPORTING data_if_return = data_if_return
     ).

    usingcase(
       EXPORTING data_to_evaluation = lv_conditional2
       IMPORTING data_case_return = data_case_return
     ).

    usingdo(
      EXPORTING lv_times   = lv_times
      IMPORTING lv_counter = lv_counter
    ).

    out->write( data_if_return ).
    out->write( data_case_return ).
    out->write( lv_counter ).

    CLEAR lv_counter.
    DO lv_times TIMES.

      lv_counter += 1.
      IF lv_counter = 7.
        EXIT.
      ENDIF.

      CHECK lv_counter <> 7.
      out->write( lv_counter ).

    ENDDO.

    lv_string_2 = SWITCH #( lv_conditional2
      WHEN 'LOGALI'   THEN |SAP Academy|
      WHEN 'SAP'      THEN |Enterprise Software|
      WHEN 'MOVISTAR' THEN |Telephony|
      ELSE 'unknown'
    ).

    LV_TIME_result = COND #(
      WHEN lv_time < '120000' THEN |{ lv_time TIME = ISO }AM|
      WHEN lv_time > '120000' THEN |{ CONV t( lv_time - 12 * 3600 ) TIME = ISO }PM 2.-|
      WHEN lv_time = '120000' THEN |High noon|
      ELSE                         |undefined|
    ).

    out->write( lv_string_2 ).
    out->write( LV_TIME_result ).

    usingloop( out = out ).
    usingtry( out = out ).

  ENDMETHOD.

  METHOD usingif.

    IF data_if = 7.
      data_if_return = |The value = { data_if } is correct|.
    ELSE.
      data_if_return = |The value is incorrect|.
    ENDIF.

  ENDMETHOD.

  METHOD usingcase.

    CASE data_to_evaluation.
      WHEN 'LOGALI'.
        data_case_return = 'Academy'.
      WHEN 'SAP'.
        data_case_return = 'Enterprise Software'.
      WHEN OTHERS.
        data_case_return = 'Unknown'.
    ENDCASE.

  ENDMETHOD.

  METHOD usingdo.

    DO lv_times TIMES.
      lv_counter += 1.
    ENDDO.

  ENDMETHOD.

  METHOD usingloop.

    TYPES: BEGIN OF lt_emp,
             id   TYPE /dmo/carrier_id,
             name TYPE /dmo/carrier_name,
           END OF lt_emp.
    DATA: it_emp  TYPE STANDARD TABLE OF lt_emp,
          it_emp2 TYPE STANDARD TABLE OF lt_emp.

    SELECT
      carrier_id,
      name
    FROM /dmo/carrier
    INTO TABLE @it_emp.

    SELECT
      carrier_id,
      name
    FROM /dmo/carrier
    WHERE carrier_id LIKE 'B%'
    INTO TABLE @it_emp2.

    LOOP AT it_emp INTO DATA(lv_emp).
      out->write( |Airline Name { lv_emp-name } ({ lv_emp-id })| ).
    ENDLOOP.

    CLEAR lv_emp.
    out->write( 'Filtered by "B"' ).
    LOOP AT it_emp2 INTO DATA(lv_emp2).
      out->write( |Airline Name { lv_emp2-name } ({ lv_emp2-id })| ).
    ENDLOOP.

  ENDMETHOD.

  METHOD usingtry.
    DATA: lv_exception TYPE f VALUE 5,
          lv_counter   TYPE i VALUE 5,
          lv_result    TYPE f.

    DO 5 TIMES.
      TRY.

        lv_counter -= 1.
        lv_result = lv_exception / lv_counter.
        out->write( |Counter = { lv_result }| ).

        CATCH cx_sy_zerodivide INTO data(lv_error).
          out->write( 'Error division by zero' ).
          out->write( lv_error->get_longtext(  ) ).
      ENDTRY.

    ENDDO.
  ENDMETHOD.

ENDCLASS.

