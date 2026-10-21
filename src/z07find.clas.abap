CLASS z07find DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z07find IMPLEMENTATION.

    METHOD if_oo_adt_classrun~main.

        CONSTANTS: lc_name       TYPE String VALUE 'Ayde Cristina Gamez Meraz',
                   lc_birth_date TYPE String VALUE 'Diciembre, 16 del 2016',
                   lc_mother     TYPE String VALUE 'Daniela Iveth Meraz Silva',
                   lc_father     TYPE String VALUE 'Alvaro Gamez Chavez',
                   lc_regex      TYPE String VALUE '[0-9]'.
        DATA: lv_find            TYPE String,
              lv_pos             TYPE sy-fdpos.

        lv_find = lc_name.
        out->write( |Original String = { lv_find }| ).
        out->write( |find_any_of function| ).

        lv_pos = find_any_of( val = lc_name sub = 'Cr' ).
        out->write( |lv_pos before to apply sy-fdpos { lv_pos }| ).
        lv_pos = sy-fdpos + 1.
        out->write( |lv_pos after to apply sy-fdpos { lv_pos }| ).

        lv_pos = find_any_of( val = lc_name sub = 'Zb' ).
        out->write( |lv_pos with patron error 1 { lv_pos }| ).

        lv_find = find( val = lc_birth_date pcre = lc_regex  ).
        out->write( |lv_find using find and regex { lv_find }| ).

       FIND ALL OCCURRENCES OF 'e' in lc_birth_date MATCH COUNT lv_find.
       out->write( |find any character into the string variable (FIND ALL OCCURRENCES) { lv_find }| ).

       lv_find = count( val = lc_birth_date sub = '1' ).
       out->write( |find any character into the string variable (COUNT) { lv_find }| ).


    ENDMETHOD.

ENDCLASS.
