CLASS zcl_lab_09_structure_alvaro DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_lab_09_structure_alvaro IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
  TYPES: BEGIN OF ty_flights,
          idUser     TYPE C LENGTH 40,
          airCode    TYPE /dmo/carrier_id,
          fligthNum  TYPE /dmo/connection_id,
          key        TYPE land1,
          seat       TYPE /dmo/plane_seats_occupied,
          fligthDate TYPE /dmo/flight_legacy-FlightDate,
         END OF ty_flights,
         BEGIN OF ty_air_lines,
          carrid      TYPE /dmo/carrier_id,
          connid      TYPE /dmo/connection_id,
          countryFrom TYPE land1,
          cityFrom    TYPE /dmo/airport_id,
          countryTo   TYPE land1,
         END OF ty_air_lines.
    DATA: it_fligths TYPE STANDARD TABLE OF ty_flights.

  ENDMETHOD.
ENDCLASS.
