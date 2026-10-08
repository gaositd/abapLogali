CLASS zcl_lab_01_var_alvaro DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_01_var_alvaro IMPLEMENTATION.

    METHOD if_oo_adt_classrun~main.
        DATA: MV_PURCHASE_DATE TYPE D,
              MV_PURCHASE_TIME TYPE T.
        DATA: mv_price TYPE p DECIMALS 1 VALUE '10.5',
              mv_tax TYPE I VALUE 16.
        DATA: vm_increse TYPE decfloat16 VALUE '20.5',
              MV_DISCOUNTS TYPE decfloat34 VALUE '10.5'.
        DATA: mv_type TYPE c LENGTH 10 VALUE 'PC',
              MV_SHIPPING TYPE P DECIMALS 2 VALUE '40.36',
              MV_ID_CODE TYPE N LENGTH 4 VALUE 1110,
              MV_QR_CODE TYPE X LENGTH 5 VALUE 'F5CF'.
        DATA(LV_PRODUCT) = 'PC'.
        DATA(LV_BAR_CODE) = '12121 121211'.

        DATA: MV_PRODUCT TYPE String VALUE 'Laptop',
              MV_BAR_CODE TYPE XString VALUE '12121 121211'.


        CONSTANTS: MC_PURCHASE_DATE TYPE D VALUE '20261007',
                   MC_PURCHASE_TIME TYPE T VALUE '182755',
                   mc_price TYPE p DECIMALS 1 VALUE '10.5',
                   mc_tax TYPE I VALUE 16,
                   mc_increse TYPE decfloat16 VALUE '20.5',
                   MC_DISCOUNTS TYPE decfloat34 VALUE '10.5',
                   mc_type TYPE c LENGTH 10 VALUE 'PC',
                   Mc_SHIPPING TYPE P DECIMALS 2 VALUE '40.36',
                   MC_ID_CODE TYPE N LENGTH 4 VALUE 1110,
                   MC_QR_CODE TYPE X LENGTH 5 VALUE 'F5CF',
                   MC_PRODUCT TYPE String VALUE 'Laptop',
                   MC_BAR_CODE TYPE XString VALUE '12121 121211'.

        TYPES: BEGIN OF My_Customer,
                id TYPE I,
                customer TYPE C LENGTH 15,
                age TYPE I,
               END OF my_customer.

        DATA employees TYPE /DMO/EMPLOYEE_HR.

        DATA v_customer TYPE my_customer.
        v_customer-id = 1.
        v_customer-customer = 'Ayde GaMeraz'.
        v_customer-age = 9.

        employees-client = 100.
        employees-employee = 3."ID
        employees-first_name = 'Ayde Cristina'.
        employees-last_name = 'Gamez Meraz'.
        employees-salary = 3.
        employees-salary_currency = 'MXN'.
        employees-manager = 1."ID de Daniela Iveth Meraz Silva



        MV_PURCHASE_DATE = '20261006'.
        MV_PURCHASE_TIME = '103445'.

        out->write('Variables').
        out->write( |MV_PURCHASE_DATE: { MV_PURCHASE_DATE }| ).
        out->write( |MV_PURCHASE_TIME: { MV_PURCHASE_TIME }| ).
        out->write( |mv_price:         { mv_price }| ).
        out->write( |mv_tax:           { mv_tax }| ).
        out->write( |vm_increse:       { vm_increse }| ).
        out->write( |MV_DISCOUNTS:     { MV_DISCOUNTS }| ).
        out->write( |LV_PRODUCT:       { LV_PRODUCT }| ).
        out->write( |LV_BAR_CODE:      { LV_BAR_CODE }| ).

        out->write( 'Constans' ).
        out->write( |MC_PURCHASE_DATE: { MC_PURCHASE_DATE }| ).
        out->write( |MC_PURCHASE_TIME: { MC_PURCHASE_TIME }| ).
        out->write( |mc_price:         { mc_price }| ).
        out->write( |mc_tax:           { mc_tax }| ).
        out->write( |mc_increse:       { mc_increse }| ).
        out->write( |MC_DISCOUNTS:     { MC_DISCOUNTS }| ).

        out->write( 'Internal table EMPLOYEES' ).
        out->write( |CLIENT:     { employees-client }| ).
        out->write( |ID:         { employees-employee }| ).
        out->write( |First Name: { employees-first_name }| ).
        out->write( |Last Name:  { employees-last_name }| ).
        out->write( |Salary:     { employees-salary }| ).
        out->write( |Currency:   { employees-salary_currency }| ).
        out->write( |Manager:    { employees-manager }| ).

        out->write( 'Types (my_customer) and Structures (v_customer)' ).
        out->write( |ID:         { v_customer-id }| ).
        out->write( |Full Name: { v_customer-customer }| ).
        out->write( |Age:  { v_customer-age }| ).
    ENDMETHOD.

ENDCLASS.
