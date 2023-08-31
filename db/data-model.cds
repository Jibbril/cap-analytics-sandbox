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
