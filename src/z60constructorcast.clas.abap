CLASS z60constructorcast DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z60constructorcast IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    TYPES:BEGIN OF ty_struc,
            col1 TYPE i,
            col2 TYPE i,
          END OF ty_struc.
    DATA: lr_data TYPE REF TO data.
    DATA: gs_int TYPE ty_struc.

    lr_data     = NEW ty_struc( ).
    gs_int      = CAST ty_struc( lr_data )->*.
    gs_int-col1 = CAST ty_struc( lr_data )->col1.
    gs_int-col2 = CAST ty_struc( lr_data )->col2.

    out->write( data = gs_int name = 'All gs_int' ).
    out->write( data = gs_int-col1 name = 'Column 1 gs_int' ).
    out->write( data = gs_int-col2 name = 'Column 2 gs_int' ).

    CAST ty_struc( lr_data )->* = gs_int.
    out->write( data = gs_int name = 'All gs_int new version' ).

  ENDMETHOD.

ENDCLASS.
