context core {
  entity GlobalCurrencyFilter {
    key internalId: String;
    currencyCode: String;
  }

  entity MyCurrencyFilters as projection on GlobalCurrencyFilter
    where internalId = 'anonymous';
}

context my.bookshop {
  entity Books {
    key id   : Integer;
    title    : String;
    stock    : Integer;
    price    : Decimal;
    currency : String;

    author   : Association to Authors;
    // conversions: Association to BOOKS_WITH_CONVERSIONS on conversions.ID = id;
  }

  entity Authors {
    key id  : Integer;
    name    : String;

    books   : Association to many Books on books.author = $self;
  }
}

@cds.persistence.exists 
@cds.persistence.calcview 
entity BOOKS_WITH_AUTHORS {
  key ID: Integer  @title: 'ID: ID' ; 
  TITLE: String(5000)  @title: 'TITLE: TITLE' ; 
  STOCK: Integer  @title: 'STOCK: STOCK' ; 
  PRICE: Decimal(34)  @title: 'PRICE: PRICE' ; 
  CURRENCY: String(5000)  @title: 'CURRENCY: CURRENCY' ; 
  NAME: String(5000)  @title: 'NAME: NAME' ; 
}

@cds.persistence.exists 
@cds.persistence.calcview 
entity RANKED_BOOKS {
  key ID: Integer  @title: 'ID: ID' ; 
  key CURRENCY: String(5000)  @title: 'CURRENCY: CURRENCY' ; 
  key TITLE: String(5000)  @title: 'TITLE: TITLE' ; 
  STOCK: Integer  @title: 'STOCK: STOCK' ; 
  PRICE: Decimal(34)  @title: 'PRICE: PRICE' ; 
  RANK: Double  @title: 'RANK: RANK' ;  
}

@cds.persistence.exists 
@cds.persistence.calcview 
entity BOOKS_WITH_CONVERSIONS() {
  key CONVERTED_PRICE_CURRENCY: String(5)  @title: 'CONVERTED_PRICE_CURRENCY_1: CONVERTED_PRICE_CURRENCY_1' ; 
  key TITLE: String(5000)  @title: 'TITLE: TITLE' ; 
  key CURRENCY: String(5000)  @title: 'CURRENCY: CURRENCY' ; 
  key AUTHOR_NAME: String(5000)  @title: 'AUTHOR_NAME: NAME' ; 
  key CONVERTED_PRICE_AND_CURRENCY: String(100)  @title: 'ConvertedPriceAndCurrency: ConvertedPriceAndCurrency' ; 
  ID: Integer  @title: 'ID: ID' ; 
  STOCK: Integer  @title: 'STOCK: STOCK' ; 
  PRICE: Decimal(34)  @title: 'PRICE: PRICE' ; 
  CONVERTED_PRICE: Decimal(34)  @title: 'CONVERTED_PRICE: PRICE_1' ; 
  AUTHOR_ID: Integer  @title: 'AUTHOR_ID: AUTHOR_ID' ; 
}