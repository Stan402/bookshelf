package ru.stan402.bookshelf.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import ru.stan402.bookshelf.entity.Book;
import ru.stan402.bookshelf.util.BookSearch;

import java.util.List;

@Repository
public class BooksDAOImpl implements BooksDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Book> getBooks(BookSearch search, int page, int rawsLimit) {

        Session session = sessionFactory.getCurrentSession();

        Query query = session.createQuery(search.getQueryString());
        query.setFirstResult((page - 1) * rawsLimit);
        query.setMaxResults(rawsLimit);
        List<Book> result = query.getResultList();

        return result;
    }

    @Override
    public void saveBook(Book book) {

        Session session = sessionFactory.getCurrentSession();

        session.saveOrUpdate(book);
    }

    @Override
    public Book getBook(int id) {

        Session session = sessionFactory.getCurrentSession();

        Book book = session.get(Book.class, id);

        return book;
    }

    @Override
    public void delete(int id) {
        Session session = sessionFactory.getCurrentSession();

        Query query = session.createQuery("delete from Book where id=:bookId");
        query.setParameter("bookId", id);
        query.executeUpdate();
    }

    @Override
    public void readBook(int id) {

        Session session = sessionFactory.getCurrentSession();

        Query query = session.createQuery("update Book set readAlready=true where id=:bookId");
        query.setParameter("bookId", id);
        query.executeUpdate();
    }

    @Override
    public int getBookCount(BookSearch theSearch) {

        Session session = sessionFactory.getCurrentSession();

        Query query = session.createQuery(theSearch.getCountString());

        return ((Long) query.uniqueResult()).intValue();
    }


}
