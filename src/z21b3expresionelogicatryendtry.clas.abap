CLASS z21b3expresionelogicatryendtry DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z21b3expresionelogicatryendtry IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA: lv_num1 TYPE i VALUE 10,
          lv_num2 TYPE i VALUE 0,
          lv_res  TYPE f.

*    lv_res = lv_num1 / lv_num2.
    try.
     lv_res = lv_num1 / lv_num2.
    CATCH cx_sy_zerodivide INTO DATA(vl_error).
      out->write( |Division by zero, please check values | ).
      out->write( vl_error ).
    ENDTRY.


    out->write( lv_res ).

  ENDMETHOD.

ENDCLASS.
