CLASS z67fieldsymbolscoercionrecords DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z67fieldsymbolscoercionrecords IMPLEMENTATION.

  method if_oo_adt_classrun~main.
    TYPES: BEGIN OF ty_date,
            year(4)   TYPE n,
            month(2)  TYPE n,
            day(2)    TYPE n,
          END OF ty_date.
    FIELD-SYMBOLS: <fs_date>  TYPE ty_date,
                   <fs_date2> TYPE any,
                   <fs_date3> TYPE n.
    data: vl_string_month TYPE String.

    out->write( 'Casteo o coersion de tipos' ).
    data(vl_loca_date) = cl_abap_context_info=>get_system_date(  ).
    ASSIGN vl_loca_date to <fs_date> CASTING.
    out->write( |The date is (in mexican format) { <fs_date>-day }-{ <fs_date>-month }-{ <fs_date>-year }| ).

    ASSIGN vl_loca_date to <fs_date2> CASTING TYPE ty_date.

    case <fs_date>-month.
      WHEN 1.
        vl_string_month = 'Enero'.
      WHEN 2.
        vl_string_month = 'Febrero'.
      WHEN 3.
        vl_string_month = 'Marzo'.
      WHEN 4.
        vl_string_month = 'Abril'.
      WHEN 5.
        vl_string_month = 'Mayo'.
      WHEN 6.
        vl_string_month = 'Junio'.
      WHEN 7.
        vl_string_month = 'Julio'.
      WHEN 8.
        vl_string_month = 'Agosto'.
      WHEN 9.
        vl_string_month = 'Septiembre'.
      WHEN 10.
        vl_string_month = 'Octubre'.
      WHEN 11.
        vl_string_month = 'Noviembre'.
      WHEN 12.
        vl_string_month = 'Diciembre'.
    ENDCASE.

    out->write( |The date is (in mexican format) { <fs_date>-day } de { vl_string_month } del { <fs_date>-year }| ).
*    out->write( data = <fs_date2> name = <fs_date2> )."error
*    out->write( data = <fs_date2> name = | { <fs_date2>-year  } | )."error
    do.
      ASSIGN COMPONENT sy-index OF STRUCTURE <fs_date2> to <fs_date3>.

      if sy-subrc <> 0.
        EXIT.
      ENDIF.

      out->write( <fs_date3> )."error

    ENDDO.
  ENDMETHOD.

ENDCLASS.
