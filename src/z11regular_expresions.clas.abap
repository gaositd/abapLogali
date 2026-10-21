CLASS z11regular_expresions DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z11regular_expresions IMPLEMENTATION.

    METHOD if_oo_adt_classrun~main.
        CONSTANTS: cl_mom TYPE String VALUE 'Daniela Iveth Meraz Silva',
                   cl_dad TYPE String VALUE 'Alvaro Gamez Chavez',
                   cl_weding_date TYPE String VALUE '23 de octubre del 2010 6:00:00PM'.
        DATA: vl_text1 TYPE String,
              vl_text2 TYPE String.

              vl_text1 = replace( val = cl_weding_date pcre = `0{2,4}` with = `*` occ = 0 )."busca el 0 repetido de 2 a 4 veces y lo cambia po *
              out->write( |Original String = { cl_weding_date } replace function and PCRE parameter = { vl_text1 }| ).

              vl_text1 = replace( val = cl_weding_date pcre = `[^e]` with = `*` occ = 0 )."Busca lo que no sea e, sin importar el lugar y las cambiar por *
              out->write( |Original String = { cl_weding_date } replace function and PCRE parameter = { vl_text1 }| ).

              vl_text1 = replace( val = cl_weding_date pcre = `\s` with = `    ` )."Busca espacios y los cambiar por 4 espacios, solo la 1ra ocurrencia
              out->write( |Original String = { cl_weding_date } replace function and PCRE parameter = { vl_text1 }| ).

              vl_text2 = cl_weding_date.
              REPLACE ALL OCCURRENCES OF PCRE `:` IN vl_text2 WITH '+'.
              out->write( |Using the old form { cl_weding_date } change for { vl_text2 }| ).

    ENDMETHOD.

ENDCLASS.
