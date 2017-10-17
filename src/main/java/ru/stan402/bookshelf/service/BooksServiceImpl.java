package ru.stan402.bookshelf.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.stan402.bookshelf.dao.BooksDAO;
import ru.stan402.bookshelf.entity.Book;
import ru.stan402.bookshelf.util.BookSearch;

import java.util.List;

@Service
public class BooksServiceImpl implements BooksService {

    @Autowired
    private BooksDAO booksDAO;

    @Override
    @Transactional
    public List<Book> getBooks(BookSearch search, int page, int rawsLimit) {
        return booksDAO.getBooks(search, page, rawsLimit);
    }

    @Override
    @Transactional
    public void saveBook(Book book) {
        booksDAO.saveBook(book);
    }

    @Override
    @Transactional
    public Book getBook(int id) {
        return booksDAO.getBook(id);
    }

    @Override
    @Transactional
    public void delete(int id) {
        booksDAO.delete(id);
    }

    @Override
    @Transactional
    public void readBook(int id) {
        booksDAO.readBook(id);
    }

    @Override
    @Transactional
    public int getBookCount(BookSearch theSearch) {
        return booksDAO.getBookCount(theSearch);
    }

}
