CLASS z20b3expresioneslogicassloop DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z20b3expresioneslogicassloop IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    TYPES:BEGIN OF lt_num,
            num TYPE i,
          END OF lt_num.
    DATA: it_num TYPE TABLE OF lt_num.
    DATA: lv_sum   TYPE i,
          lv_total TYPE i.

    it_num = VALUE #( ( num = 10 )
                      ( num = 20 )
                      ( num = 30 )
                      ( num = 40 )
                      ( num = 50 )
                    ).

    LOOP AT it_num INTO DATA(lv_num).
      lv_sum += lv_num-num.
      out->write( |Actual data { lv_num-num }| ).
      out->write( |Actual SUM { lv_sum }| ).
    ENDLOOP.

    LOOP AT it_num INTO DATA(lvnum) WHERE num = 30.
      lv_sum += lv_num-num.
      out->write( |Actual data { lv_num-num }| ).
      out->write( |Actual SUM { lv_sum }| ).
    ENDLOOP.

    lv_total = lv_sum.
    out->write( |The total is { lv_total } | ).
  ENDMETHOD.

ENDCLASS.
