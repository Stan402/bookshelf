package ru.stan402.bookshelf.dao;

import ru.stan402.bookshelf.entity.Book;
import ru.stan402.bookshelf.util.BookSearch;

import java.util.List;

public interface BooksDAO {

    List<Book> getBooks(BookSearch search, int page, int rawsLimit);

    void saveBook(Book book);

    Book getBook(int id);

    void delete(int id);

    void readBook(int id);

    int getBookCount(BookSearch theSearch);
}
