CLASS z50internaltablesenums DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z50internaltablesenums IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    TYPES: BEGIN OF ENUM tye_colors,
            c_blue,
            c_pink,
            c_red,
            c_black,
          END OF enum tye_colors,
          BEGIN OF ENUM tye_colors2 STRUCTURE ls_type,
            c_green,
            c_purple,
            c_yellow,
            c_cian,
          END OF enum tye_colors2 STRUCTURE ls_type.

    DATA: lve_color  TYPE tye_colors VALUE c_blue,
          lve_color2 TYPE tye_colors2,
          result     TYPE string.

    lve_color2 = ls_type-c_green.

    out->write( lve_color ).
    out->write( lve_color2 ).

    lve_color = c_pink.
    lve_color2 = ls_type-c_purple.
    out->write( lve_color ).
    out->write( lve_color2 ).

    lve_color = c_red.
    lve_color2 = ls_type-c_yellow.
    out->write( lve_color ).
    out->write( lve_color2 ).

    CASE lve_color2.
      WHEN ls_type-c_cian.
        result = 'The color is CIAN'.
      WHEN ls_type-c_yellow.
        result = 'The color is YELLOW'.
      WHEN ls_type-c_purple.
        result = 'The color is PURPLE'.
      WHEN ls_type-c_green.
        result = 'The color is GREEN'.
      WHEN OTHERS.
        result = 'onknown color'.
    ENDCASE.

    out->write( result ).

  ENDMETHOD.

ENDCLASS.
