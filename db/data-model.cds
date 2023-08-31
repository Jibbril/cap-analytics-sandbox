context my.bookshop {
  entity Books {
    key id   : Integer;
    title    : String;
    stock    : Integer;
    price    : Decimal;
    currency : String;
    author   : Association to Authors;
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
key     ID: Integer  @title: 'ID: ID' ; 
        TITLE: String(5000)  @title: 'TITLE: TITLE' ; 
        STOCK: Integer  @title: 'STOCK: STOCK' ; 
        PRICE: Decimal(34)  @title: 'PRICE: PRICE' ; 
        CURRENCY: String(5000)  @title: 'CURRENCY: CURRENCY' ; 
        NAME: String(5000)  @title: 'NAME: NAME' ; 
}