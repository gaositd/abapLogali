CLASS z56constructorconv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z56constructorconv IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    TYPES: ty_type TYPE STANDARD TABLE OF i WITH EMPTY KEY.
    DATA: ti_type   TYPE SORTED TABLE OF i WITH NON-UNIQUE DEFAULT KEY.
    DATA: vl_int    TYPE i,
          vl_string TYPE string.

    vl_int = 49.
    vl_string = CONV string( vl_int )."Se puede usar el carcater # en vez de string
    DATA(vl_type) = cl_abap_typedescr=>describe_by_data( vl_int ).
    out->write( |The original data is = { vl_int } type { vl_type->get_relative_name(  ) }| ).
    vl_type = cl_abap_typedescr=>describe_by_data( vl_string ).
    out->write( |The data converted is = { vl_string } type { vl_type->get_relative_name(  ) }| ).

    ti_type = VALUE #(
      ( 45 )
      ( 9 )
      ( 49 )
    ).
    DATA(ti_conv) = CONV ty_type( ti_type ).
    out->write( data = ti_conv name = 'ti_conv' ).
  ENDMETHOD.

ENDCLASS.
