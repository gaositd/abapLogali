CLASS z27structuresinclude DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z27structuresinclude IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    TYPES:BEGIN OF purchase_order_type,
            order_id   TYPE i,
            order_date TYPE d,
          END OF purchase_order_type,

          BEGIN OF supplier_type,
            supplier_id TYPE i,
            name        TYPE String,
          END OF supplier_type,

          BEGIN OF material_type,
            material_id TYPE i,
            name        TYPE string,
          END OF material_type.

    DATA: ls_material TYPE material_type.

    TYPES: BEGIN OF invoice_type.
             INCLUDE TYPE purchase_order_type AS purchase.
             INCLUDE TYPE supplier_type AS supplier RENAMING WITH SUFFIX _sup.
             INCLUDE STRUCTURE ls_material AS material RENAMING WITH SUFFIX _mat.
    TYPES: END OF invoice_type.

*    DATA: it_various type STANDARD TABLE OF invoice_type.
    DATA: ls_invoice  TYPE invoice_type,
          ls_purchase TYPE purchase_order_type,
          ls_supplier TYPE supplier_type.

    ls_invoice = VALUE #(
      order_id    = 1
      order_date  = '20261029'
      supplier_id_sup = 2
      name_sup = 'Material 1'
      material_id_mat = 3
      name_mat = 'Material Name'
    ).

    out->write( ls_invoice ).
    out->write( |\n| ).

    ls_purchase = VALUE #( order_id = 4 order_date = '20261029' ).
    ls_supplier = VALUE #( supplier_id = 5 name = 'Another supplier name' ).
    ls_material = VALUE #( material_id = 6 name = 'Another materila name' ).

    ls_invoice = VALUE #(
      purchase = ls_purchase "by structure
      supplier = ls_supplier "by structure
      material_id_mat = ls_material-material_id "by structure-field
      name_mat = ls_material-name "by structure-field
    ).

    out->write( ls_invoice ).
  ENDMETHOD.

ENDCLASS.
