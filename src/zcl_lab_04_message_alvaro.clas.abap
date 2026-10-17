CLASS zcl_lab_04_message_alvaro DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_04_message_alvaro IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA: text1 TYPE String.
    DATA: lv_order_status TYPE String VALUE 'Purchase Completed Successfully',
          lv_char_number  TYPE i,
          lv_position     TYPE i,
          lt_split        TYPE TABLE OF String.

    DATA(lv_order_status_aux) = lv_order_status.

    DATA: lv_pattern       TYPE String VALUE '\d{3}-\d{3}-\d{4}',
          lv_patter_email  TYPE String VALUE '\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b',
          lv_phone1        TYPE String VALUE '7292558611',
          lv_phone2        TYPE String VALUE '729-255-8611',
          lv_invalid_email TYPE String VALUE 'gamez@gamez-com',
          lv_valid_email   TYPE String VALUE 'gamez@gamez.com',
          lv_string1 TYPE String VALUE '     Welcome       to loagali academy     ',
          lv_string2 TYPE String.

    text1 = 'Test with text symbols'(001).
    lv_char_number = strlen( lv_order_status ) .

    out->write( |Quantity charanters using STRLEN() function    { lv_char_number }| ).

    lv_char_number = numofchar( lv_order_status ).
    out->write( |Quantity charanters using NUMOFCHAR() function { lv_char_number }| ).

    FIND `exit` IN lv_order_status MATCH OFFSET lv_position.

    IF sy-subrc = 0.
      out->write( |The "exit" word in the variable LV_ORDER_STATUS is in the position { lv_position }| ).
    ELSE.
      out->write( 'not found the word "exit" in the variable LV_ORDER_STATUS' ).
    ENDIF.

    out->write( |All character in upper case (varaible LV_ORDER_STATUS)  { to_upper( lv_order_status ) } | ).
    out->write( |All character in lower case (varaible LV_ORDER_STATUS)  { to_lower( lv_order_status ) } | ).

    SHIFT lv_order_status_aux LEFT BY 9 PLACES.
    out->write( |Move 9 spaces to contain of variable LV_ORDER_STATUS  { lv_order_status } | ).

    SPLIT lv_order_status AT space INTO TABLE lt_split.
    LOOP AT lt_split INTO DATA(lv_split).

      IF lv_split = 'Completed'.
        out->write( |The word in found: { lv_split }| ).
        EXIT.
      ELSE.
        CONTINUE.
      ENDIF.

    ENDLOOP.

    IF NOT contains( val = lv_phone1 pcre = lv_pattern ).
      out->write( |The format is incorrect, using the pattern { lv_pattern } with the phone number { lv_phone1 }| ).
    ENDIF.
    IF contains( val = lv_phone2 pcre = lv_pattern ).
      out->write( |The format is correct, using the pattern { lv_pattern } with the phone number { lv_phone2 }| ).
    ENDIF.

    IF NOT contains( val = lv_invalid_email pcre = lv_patter_email ).
      out->write( |The format is incorrect, using the pattern { lv_patter_email } with the email { lv_invalid_email }| ).
    ENDIF.
    IF contains( val = lv_valid_email pcre = lv_patter_email ).
      out->write( |The format is correct, using the pattern { lv_patter_email } with the email { lv_valid_email }| ).
    ENDIF.

    SELECT FROM /dmo/flight
        FIELDS carrier_id
        INTO TABLE @DATA(lt_itab).

    DATA(lv_string) = concat_lines_of( table = lt_itab sep = '/'  ).

    out->write( lv_string ).


    out->write( '======================' ).
    DATA(num) = 1.
    LOOP AT lt_itab INTO DATA(lv_itab) WHERE carrier_id = 'JL'.
      out->write( lv_itab  ).
    ENDLOOP.

    lv_string2 = lv_string1.
    condense lv_string2.
    out->write( |Variable with out condense { lv_string1 } | ).
    out->write( |Variable with  condense    { lv_string2 } | ).

    lv_string2 = lv_string1.
    condense lv_string2 NO-GAPS.
    out->write( |Variable with condense and with out spaces { lv_string2 } | ).

    lv_string2 = lv_string1.
"    lv_string2 = condense( val = lv_string1 ).
"    lv_string2 = condense( val = lv_string1 from = ` `).
    lv_string2 = condense( val = lv_string1 to = ``).
    out->write( 'Condense as a function' ).
    out->write( |Variable with condense function   { lv_string2 } | ).

  ENDMETHOD.

ENDCLASS.
