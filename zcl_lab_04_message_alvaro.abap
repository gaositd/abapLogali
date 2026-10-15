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
        DATA: LV_ORDER_STATUS TYPE String VALUE 'Purchase Completed Successfully',
              LV_CHAR_NUMBER TYPE I,
              lv_position TYPE I,
              lt_split TYPE TABLE OF String.

        DATA(LV_ORDER_STATUS_AUX) = lv_order_status.

        DATA: LV_PATTERN TYPE String VALUE '\d{3}-\d{3}-\d{4}',
              lv_patter_email TYPE String VALUE '\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b',
              LV_PHONE1 TYPE String VALUE '7292558611',
              LV_PHONE2 TYPE String VALUE '729-255-8611',
              lv_invalid_email TYPE String VALUE 'gamez@gamez-com',
              lv_valid_email TYPE String VALUE 'gamez@gamez.com'.

        text1 = 'Test with text symbols'(001).
        lv_char_number = strlen( lv_order_status ) .

        out->write( |Quantity charanters using STRLEN() function    { lv_char_number }| ).

        lv_char_number = numofchar( lv_order_status ).
        out->write( |Quantity charanters using NUMOFCHAR() function { lv_char_number }| ).

        find `exit` IN lv_order_status MATCH OFFSET lv_position.

        if sy-subrc = 0.
            out->write( |The "exit" word in the variable LV_ORDER_STATUS is in the position { lv_position }| ).
        else.
            out->write( 'not found the word "exit" in the variable LV_ORDER_STATUS' ).
        endif.

        out->write( |All character in upper case (varaible LV_ORDER_STATUS)  { to_upper( lv_order_status ) } | ).
        out->write( |All character in lower case (varaible LV_ORDER_STATUS)  { to_lower( lv_order_status ) } | ).

        shift LV_ORDER_STATUS_AUX LEFT by 9 PLACES.
        out->write( |Move 9 spaces to contain of variable LV_ORDER_STATUS  { lv_order_status } | ).

        split lv_order_status at space INTO TABLE lt_split.
        LOOP AT lt_split INTO data(lv_split).

            IF lv_split = 'Completed'.
                out->write( |The word in found: { lv_split }| ).
                exit.
            ELSE.
                CONTINUE.
            ENDIF.

        ENDLOOP.

        if NOT contains( val = lv_phone1 pcre = LV_PATTERN ).
            out->write( |The format is incorrect, using the pattern { lv_pattern } with the phone number { lv_phone1 }| ).
        ENDIF.
        if contains( val = lv_phone2 pcre = LV_PATTERN ).
            out->write( |The format is correct, using the pattern { lv_pattern } with the phone number { lv_phone2 }| ).
        ENDIF.

        if NOT contains( val = lv_invalid_email pcre = lv_patter_email ).
            out->write( |The format is incorrect, using the pattern { lv_patter_email } with the email { lv_invalid_email }| ).
        ENDIF.
        if contains( val = lv_valid_email pcre = lv_patter_email ).
            out->write( |The format is correct, using the pattern { lv_patter_email } with the email { lv_valid_email }| ).
        ENDIF.

    ENDMETHOD.

ENDCLASS.
