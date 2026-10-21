CLASS z08replace DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z08replace IMPLEMENTATION.

    METHOD if_oo_adt_classrun~main.
           CONSTANTS: lc_replace TYPE String VALUE 'Alvaro-Gamez-Chavez'.

           data: lv_replace TYPE String VALUE 'Alvaro-Gamez-Chavez',
                 lv_sign    TYPE String VALUE '-'.

           out->write( |Original String = { lv_replace } the spaces will be repalce with { lv_sign }| ).

           REPLACE lv_sign WITH '/' INTO lv_replace.
           out->write( |new value = { lv_replace }| ).

           lv_replace = lc_replace.
           REPLACE ALL OCCURRENCES OF lv_sign IN lv_replace WITH '/'.
           out->write( |new value = { lv_replace }| ).

           lv_replace = lc_replace.
           out->write( '\nReplace Function replace only' ).
           lv_replace = replace( val = lv_replace sub = lv_sign with = '/' ).
           out->write( |new value = { lv_replace }| ).

           lv_replace = lc_replace.
           out->write( '\nReplace Function with OCC parameter' ).
           lv_replace = replace( val = lv_replace sub = lv_sign with = '/' occ = 0 ).
           out->write( |new value = { lv_replace }| ).

           lv_replace = lc_replace.
           out->write( '\nReplace Function with out sub parameter abd with off parameter' ).
           lv_replace = replace( val = lv_replace with = '#' off = 5 len = 5 ).
           out->write( |new value = { lv_replace }| ).

    ENDMETHOD.

ENDCLASS.
