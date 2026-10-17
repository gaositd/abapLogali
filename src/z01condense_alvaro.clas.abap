CLASS z01condense_alvaro DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z01condense_alvaro IMPLEMENTATION.

    METHOD if_oo_adt_classrun~main.
        Data: lv_string1 TYPE String VALUE 'Logali-Group-SAP-Academi',
              lv_string2 TYPE String,
              lv_num     TYPE I VALUE 0.
        SPLIT lv_string1 AT '-' into DATA(lv_data1)
                                     DATA(lv_data2)
                                     DATA(lv_data3)
                                     DATA(lv_data4).
       out->write( |Variable| ).
       out->write( |lv_data1 { lv_data1 }| ).
       out->write( |lv_data2 { lv_data2 }| ).
       out->write( |lv_data3 { lv_data3 }| ).
       out->write( |lv_data4 { lv_data4 }| ).

       out->write( |Iternal Table| ).
       SPLIT lv_string1 AT '-' INTO TABLE DATA(lt_itab).
       LOOP AT lt_itab INTO DATA(lv_itab).
       lv_num = lv_num + 1.
        out->write( |{ lv_num }.- { lv_itab }| ).
       ENDLOOP.

       out->write( |Segment| ).
       lv_string2 = segment( val = lv_string1 index = 5 sep = '-' ).
       out->write( lv_string2 ).


    ENDMETHOD.

ENDCLASS.
