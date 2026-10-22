CLASS z13scape DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z13scape IMPLEMENTATION.

    METHOD if_oo_adt_classrun~main.
        CONSTANTS cl_header TYPE String VALUE 'https://'.
        DATA(lv_url) = escape( val = 'Logali ABAP Academy @300' format = cl_abap_format=>e_url_full ).
        DATA(lv_json) = escape( val = 'Logali "ABAP" test json \ Academy @300' format = cl_abap_format=>e_json_string ).
        DATA(lv_template_string) = escape( val = 'String = Special chracters in string templates: |, \, { , } [, ]' format = cl_abap_format=>e_string_tpl ).
        DATA: lv_final_url TYPE string.

        out->write( |String = Logali ABAP Academy @300 tranform as URL\n| ).
        out->write( 'Original String = "Logali ABAP Academy @300"' ).

        lv_url = replace( val = lv_url pcre = `%20` with = '.' occ = 0 ).
        out->write( |First change { lv_url }| ).

        lv_url = replace( val = lv_url pcre = `%40` with = 'com:' occ = 0 ).
        out->write( |Second change { lv_url }| ).

        CONCATENATE cl_header lv_url INTO lv_final_url.
        out->write( |Final change { lv_final_url }| ).

        out->write( || ).
        out->write( |String = Logali ABAP Academy @300 tranform as JSON\n| ).
        out->write( |Final change, JSON { lv_json }| ).

        out->write( || ).
        out->write( lv_template_string ).
        out->write( |Final change, template string { lv_template_string }| ).
    ENDMETHOD.

ENDCLASS.
