using my.bookshop as my from '../db/data-model';
using BOOKS_WITH_AUTHORS from '../db/data-model';

service CatalogService {
    @readonly entity Books as projection on my.Books;
    @readonly entity Authors as projection on my.Authors;
    @readonly entity BooksWithAuthors as projection on BOOKS_WITH_AUTHORS;

    function sleep() returns Boolean;
}
