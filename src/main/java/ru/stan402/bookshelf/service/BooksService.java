package ru.stan402.bookshelf.service;

import ru.stan402.bookshelf.entity.Book;
import ru.stan402.bookshelf.util.BookSearch;

import java.util.List;

public interface BooksService {

    List<Book> getBooks(BookSearch search, int page, int rawsLimit);

    void saveBook(Book book);

    Book getBook(int id);

    void delete(int id);

    void readBook(int id);

    int getBookCount(BookSearch theSearch);
}
