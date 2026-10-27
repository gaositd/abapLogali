CLASS z17expresioneslogicasswitch DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z17expresioneslogicasswitch IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DO 7 TIMES.
      DATA(lv_value) = SWITCH #( sy-index
                                  WHEN 1 THEN |Iteration 1|
                                  WHEN 2 THEN |Iteration 2|
                                  WHEN 3 THEN |Iteration 3|
                                  WHEN 4 THEN |Iteration 4|
                                  WHEN 5 THEN |Iteration 5|
                                  WHEN 6 THEN |Iteration 6|
                                  ELSE        |Iteration greater than 6| ).

      out->write( lv_value ).
    ENDDO.
  ENDMETHOD.

ENDCLASS.
