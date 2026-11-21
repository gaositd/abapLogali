CLASS z55constructornew DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA: vg_name TYPE String,
          vg_age  TYPE I.
    METHODS:  m_constructor IMPORTING iv_name TYPE String
                                    iv_age  TYPE i.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z55constructornew IMPLEMENTATION.

  METHOD m_constructor.
    vg_name = iv_name.
    vg_age  = iv_age.
  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.
    DATA: lo_data TYPE REF TO i.
    data(lo_data2) = new String( 'Daniela Iveth Meraz Silva' ).
*    DATA(lo_constructor) = NEW z55constructornew( i = 'Ayde Cristina Gamez Meraz' ).

    lo_data = NEW #( 12345 )."-> este es el selector de objetos, visot en out

    out->write( data = lo_data name = 'lo_data' ).
    out->write( data = lo_data2 name = 'lo_data2' ).

  ENDMETHOD.


ENDCLASS.
