CLASS z10pcre_regex DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS Z10PCRE_REGEX IMPLEMENTATION.

    METHOD if_oo_adt_classrun~main.
"PCRE = Perl compatible Regular expressions
        CONSTANTS: lc_regex_email TYPE String VALUE '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                   lc_email       TYPE String VALUE 'alumno@alumno.com'.
        DATA: vl_email TYPE String,
              lv_tetx TYPE String VALUE '123A?*z100004$~€¬AA'.

        find PCRE lc_regex_email in lc_email.

        IF sy-subrc eq 0.
            out->write( |The string { lc_email } is an email| ).
        ELSE.
            out->write( |The string { lc_email } is not an email| ).
        ENDIF.

        REPLACE ALL OCCURRENCES OF PCRE '[^A-Za-z0-9]+' in lv_tetx WITH '#'.
        out->write( |lv_text { lv_tetx }| ).
    ENDMETHOD.

ENDCLASS.
