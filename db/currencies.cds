namespace currencies;

// using bydMetadata from './byd-metadata';

entity TCURR {
    key KURST : String(4); // Exchange Rate Type
    key FCURR : String(5); // From currency
    key TCURR : String(5); // To-currency
    key GDATU : String(8); // Date As of Which the Exchange Rate Is Effective (Inverted)
    MANDT : String(3) default '000'; // Client;
    UKURS : Decimal(9, 5); // Exchange Rate
    FFACT : Decimal(9, 0); // Ratio for the "From" Currency Units
    TFACT : Decimal(9, 0); // Ratio for the "To" Currency Units
};

entity TCURF {
    MANDT: String(3); // Client
    KURST: String(4); // Exchange Rate Type
    FCURR: String(5000); // From currency
    TCURR: String(5000); // To-currency
    GDATU: String(8); // Date from which the entry is valid (Inverted) - fixed value 1900-01-01
    FFACT: String(1); // Ratio for the "From" Currency Units
    TFACT: String(1); // Ratio for the "To" Currency Unit
    ABWCT: String(1); // Alternative exchange rate type
    ABWGA: String(1); // Date from which the alternative exchange rate type is valid
};

// define view TCURF as select from bydMetadata.Currency as f join bydMetadata.Currency as t on f.Code != t.Code cross join TCURV {
//     '000' as MANDT, // Client
//     KURST, // Exchange Rate Type
//     f.Code as FCURR, // From currency
//     t.Code as TCURR, // To-currency
//     '80999898' as GDATU, // Date from which the entry is valid (Inverted) - fixed value 1900-01-01
//     '1' as FFACT, // Ratio for the "From" Currency Units
//     '1' as TFACT, // Ratio for the "To" Currency Unit
//     ''  as ABWCT, // Alternative exchange rate type
//     ''  as ABWGA // Date from which the alternative exchange rate type is valid
// };

entity TCURV {
    key KURST : String(4); // Exchange Rate Type
    MANDT : String(3) default '000'; // Client;
    XINVR : String(1); // Indicator: Calculation allowed with inverted exchange rate ?
    BWAER : String(5); // Reference currency for currency translation
    XBWRL : String(1); // Ind.: Base curr. is "from" curr. in the exchange rate table
    GKUZU : String(4); // Exch. rate type of av. rate used to determine buying rate
    BKUZU : String(4); // Exch.rate type of av. rate used to determine selling rate
    XFIXD : String(1); // Indicator: Exchange rate type uses fixed exchange rates
    XEURO : String(1); // Indicator: Exchange rate type uses special translation model
}

// Quotations

entity TCURN {
    key FCURR    : String(5); // From currency
    key TCURR    : String(5); // To-currency
    key GDATU    : String(8); // Date As of Which the Exchange Rate Is Effective (Inverted)
    MANDT    : String(3) default '000'; // Client;
    NOTATION : String(1); // Quotation type for currency translation
}

// Decimal places in currencies

entity TCURX {
    key CURRKEY : String(5); // Currency Key
    CURRDEC : Integer; // Number of decimal places
}