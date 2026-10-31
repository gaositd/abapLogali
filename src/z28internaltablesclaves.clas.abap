CLASS z28internaltablesclaves DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z28internaltablesclaves IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    "Estas dos son de claraciones de tablas internas estandar
    DATA: lt_flight_stad1 TYPE STANDARD TABLE OF /dmo/flight WITH EMPTY KEY,"con calve vacía
          lt_flight_stad2 TYPE TABLE OF /dmo/flight,
    "Estas son declaraciones de tablas internas ordenadas
          lt_flight_sort1 TYPE SORTED TABLE OF /dmo/flight WITH NON-UNIQUE KEY carrier_id,
          lt_flight_sort2 TYPE SORTED TABLE OF /dmo/flight WITH UNIQUE KEY carrier_id,
    "Esta es declaración de tabla interna hash
          lt_flight_hash TYPE HASHED TABLE OF /dmo/flight WITH UNIQUE KEY carrier_id.

  ENDMETHOD.

ENDCLASS.
