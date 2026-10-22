CLASS zteststring DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zteststring IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA: lv_char   TYPE c LENGTH 10 VALUE '     CLOUD',
          lv_result TYPE  string VALUE '1234567890',
          lv_string TYPE String VALUE 'ABAP CLOUD',
          lv_position TYPE i,
          lv_char2 TYPE c LENGTH 10 VALUE '      ABCD'.
      lv_position = find_any_of( val = lv_string sub = 'OU' ).
      lv_string = '1#2#3#4'.
      SHIFT lv_char LEFT DELETING LEADING space.
*     SHIFT lv_char LEFT DELETING LEADING abap_false.
     out->write( lv_char2 ).
*    out->write( |Result = { substring( val = lv_result off = 2 len = 3 ) }| ).
    out->write( lv_position ).
    REPLACE ALL OCCURRENCES OF '#' IN lv_string WITH '-'.
    out->write( lv_string ).

  ENDMETHOD.
ENDCLASS.
