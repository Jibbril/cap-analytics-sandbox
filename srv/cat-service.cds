using my.bookshop as my from '../db/data-model';
using core from '../db/data-model';
using {BOOKS_WITH_AUTHORS, RANKED_BOOKS, BOOKS_WITH_CONVERSIONS} from '../db/data-model';

service CatalogService {
    @readonly entity Books as projection on my.Books {
        *,
        calculations: Association to BooksWithConversions on calculations.ID = id,
    };
    @readonly entity Authors as projection on my.Authors;
    @readonly entity BooksWithAuthors as projection on BOOKS_WITH_AUTHORS;
    @readonly entity RankedBooks as projection on RANKED_BOOKS;
    @readonly entity BooksWithConversions as projection on BOOKS_WITH_CONVERSIONS;

    @readonly entity GlobalCurrencyFilter as projection on core.GlobalCurrencyFilter;

    function sleep() returns Boolean;
    action setCurrencyFilter(currency: String);
}
