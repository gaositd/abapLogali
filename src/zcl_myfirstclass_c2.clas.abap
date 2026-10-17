CLASS zcl_myfirstclass_c2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_myfirstclass_c2 IMPLEMENTATION.

    METHOD if_oo_adt_classrun~main.
    "Variables String"
        " Declaracion de variables
        DATA string_var TYPE String  VALUE 'This is a string variable'.
        "Tipo I entero de 4 bits
        DATA int_var TYPE I VALUE 202061006.
        "Tipo fecha 8 bits
        DATA date_var TYPE D VALUE '202061006'.
        "Tipo flotante 2 decimales
        DATA float_var TYPE P DECIMALS 2 VALUE '2020610.10'.
        "tipo char (incompleto) de 8 caracteres
        DATA char_var TYPE c LENGTH 8 value 'DIMSACGM'.

        CONSTANTS const TYPE String VALUE 'This is a constant, the value cannot change'.
        "const = '123'.
        out->write( 'This is my first abap class' ).
        out->write( |String var:  { string_var }| ).
        out->write( |Integer var: { int_var }| ).
        out->write( |Date var:    { date_var }| ).
        out->write( |Float var:   { float_var }| ).
        out->write( |Char var:    { char_var }| ).
        out->write( |Constant:    { const }| ).
    ENDMETHOD.
ENDCLASS.
