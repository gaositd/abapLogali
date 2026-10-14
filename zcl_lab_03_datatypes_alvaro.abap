CLASS zcl_lab_03_datatypes_alvaro DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_03_datatypes_alvaro IMPLEMENTATION.

    METHOD if_oo_adt_classrun~main.
        DATA: MV_CHAR TYPE c LENGTH 10 VALUE '12345',
              MV_NUM TYPE I,
              MV_FLOAT TYPE f.

        DATA: MV_TRUNC TYPE i,
              MV_ROUND TYPE I.
              
        DATA: MV_DATE_1 TYPE D,
              MV_DATE_2 TYPE D,
              MV_DAYS TYPE I,
              MV_TIME TYPE T.
              
        DATA: MV_TIMESTAMP TYPE utclong.
              
       DATA(online) = 'ABAP'.

        mv_num   = mv_char.
        mv_float = mv_num.
        out->write( |DATA| ).
        out->write( |variable CHAR: { mv_char }| ).
        out->write( |Variable NUM:  { mv_num }| ).
        out->write( |Variable FLOAT { mv_float }| ).
        out->write( |=============================| ).

        mv_float = '123.45'.
        mv_trunc = trunc( mv_float ).
        mv_float = mv_float + '0.5'.
        mv_round = round( val = ( mv_float ) dec = 0 ).
        out->write( |TRUNC & ROUND| ).
        out->write( |Trunc float value: { mv_trunc }| ).
        out->write( |Round float value  { mv_round }| ).
        out->write( |=============================| ).
        
        mv_num = conv i( mv_char ).
        out->write( |Convert forced type| ).
        out->write( |Convert            { mv_num }| ).
        out->write( |=============================| ).
        
        mv_date_1 = cl_abap_context_info=>get_system_date(  ).
        mv_time = cl_abap_context_info=>get_system_time(  ).
        
        mv_date_2 = '20161224'.
        mv_days = mv_date_1 - mv_date_2.
        out->write( |Rest bettween dates| ).
        out->write( |Date 1:               { mv_date_1 }| ).
        out->write( |Date 2:               { mv_date_2 }| ).
        out->write( |Dates between 2 dates:{ mv_days }| ).
        out->write( |Actual time:          { mv_time }| ).
        out->write( |Format date 1         { mv_date_1+6(2) } { mv_date_1+4(2) } { mv_date_1+0(4) }| ).
        out->write( |=============================| ).
        
        mv_timestamp = utclong_current(  ).
        mv_date_2 = cl_abap_context_info=>get_system_date(  ).
        mv_time = cl_abap_context_info=>get_system_time(  ).
        
        mv_date_2 -= 2.
        out->write( |Time Stamp| ).
        out->write( |TimeStamp:  { mv_timestamp }| ).
        out->write( |Date 2:     { mv_date_2 }| ).
        out->write( |System time { mv_time }| ).
        
    ENDMETHOD.

ENDCLASS.
