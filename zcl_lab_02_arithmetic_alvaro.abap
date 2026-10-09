CLASS zcl_lab_02_arithmetic_alvaro DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_lab_02_arithmetic_alvaro IMPLEMENTATION.
    METHOD if_oo_adt_classrun~main.
        DATA: LV_BASE_RATE TYPE I VALUE 20,
              LV_CORP_AREA_RATE TYPE I  value 10,
              LV_MEDICAL_SERVICE_RATE TYPE I VALUE 15,
              LV_TOTAL_RATE  TYPE I VALUE 2.

        DATA: LV_MAINTENANCE_RATE TYPE I VALUE 30,
              LV_MARGIN_RATE TYPE I VALUE 10.

       DATA: LV_PACKAGE_WEIGHT  TYPE I VALUE 2,
             LV_COST_PER_KG TYPE I VALUE 3,
             LV_MULTI_RATE TYPE I.

       DATA: LV_TOTAL_COST TYPE I VALUE 17,
             LV_DISCOUNT_THRESHOLD TYPE I VALUE 4,
             LV_RESULT TYPE P LENGTH 4 DECIMALS 2,
             LV_REMAINDER TYPE P LENGTH 4 DECIMALS 2.

       DATA: LV_WEIGHT TYPE I VALUE 5,
             LV_EXPO TYPE I,
             LV_SQUARE_ROOT TYPE I.


             lv_total_rate = lv_base_rate + lv_corp_area_rate + lv_medical_service_rate.
             add 5 to lv_total_rate.

             lv_base_rate = lv_maintenance_rate - lv_margin_rate.
             lv_multi_rate = lv_cost_per_kg * lv_package_weight.
             multiply lv_multi_rate by 2.

             out->write( |Base Rate:            { lv_base_rate }| ).
             out->write( |Corp Area Rate:       { lv_corp_area_rate }| ).
             out->write( |Medical Service Rate: { lv_medical_service_rate }| ).
             out->write( |Total Rate:           { lv_total_rate }| ).

             subtract 4 from lv_total_rate.

             out->write( '--------------------------------------' ).
             out->write( |Maintenance Rate:    { lv_corp_area_rate }| ).
             out->write( |Margin Rate:         { lv_medical_service_rate }| ).
             out->write( |Total Rate:          { lv_total_rate }| ).

             out->write( '--------------------------------------' ).
             out->write( |Base Rate:            { lv_base_rate }| ).
             out->write( |Multipy Rate:         { lv_medical_service_rate }| ).

             lv_result = lv_total_cost / lv_discount_threshold.
             out->write( '--------------------------------------' ).
             out->write( |Division| ).
             out->write( |Result:      { lv_result }| ).

             LV_TOTAL_COST = 19.
             LV_REMAINDER = lv_total_cost Mod lv_discount_threshold.
             out->write( '--------------------------------------' ).
             out->write( |Division| ).
             out->write( |Reminder:      { lv_remainder }| ).

             lv_expo = lv_weight ** 2.
             lv_square_root = sqrt( lv_expo ).
             out->write( '--------------------------------------' ).
             out->write( |Exponent| ).
             out->write( |Exponent Result:    { lv_expo }| ).
             out->write( |Square Result:      { lv_expo }| ).


    ENDMETHOD.
ENDCLASS.
