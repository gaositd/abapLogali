CLASS z05overlay DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z05overlay IMPLEMENTATION.
    METHOD if_oo_adt_classrun~main.
    data: lv_company TYPE String VALUE '-------------------------->Gaos Software',
          lv_name TYPE String VALUE 'Ayde Cristina Gamez Meraz                  ',
          lv_string1 TYPE String VALUE 'a.b.c.a.b.c.A',
          lv_string2 TYPE String VALUE 'x.y.z.x.y.z.Z'.

          out->write( 'Case 1 over other places varible1 over variable 1' ).
          out->write( |lv_company before the overlay function { lv_company }| ).
          out->write( |lv_name value { lv_name }| ).
          OVERLAY lv_company WITH lv_name.
          out->write( |lv_company current value { lv_company }| ).

          out->write( 'Case 2 change data in variable 1' ).
          out->write( |lv_string1 before the overlay function { lv_string1 }| ).
          out->write( |lv_string2 value { lv_string2 }| ).
          OVERLAY lv_string1 WITH lv_string2 ONLY 'ab'.
          out->write( |lv_company current value { lv_string1 }| ).

    ENDMETHOD.
ENDCLASS.
