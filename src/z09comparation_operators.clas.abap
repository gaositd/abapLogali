CLASS z09comparation_operators DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z09comparation_operators IMPLEMENTATION.

    METHOD if_oo_adt_classrun~main.
        DATA: lv_match TYPE abap_boolean,
              lv_text  TYPE String VALUE 'This is an example tex for SAP_ABAP programming'.

        if ( lv_text CP '*sap#_*' ).
            lv_match = abap_true.
            out->write( |The text contain the pattern SAP { lv_match }| ).
        ELSE.
            lv_match = abap_false.
            out->write( |The text contain the pattern SAP { lv_match }| ).

        ENDIF.

        IF ( lv_text NP '*g' ).
            lv_match = abap_true.
            out->write( |The text contain the pattern "g" { lv_match }| ).
        ELSE.
            lv_match = abap_false.
            out->write( |The text not contain the pattern "g" { lv_match }| ).
        ENDIF.
    ENDMETHOD.

ENDCLASS.
