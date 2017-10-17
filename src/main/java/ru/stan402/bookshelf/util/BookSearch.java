package ru.stan402.bookshelf.util;

import org.springframework.stereotype.Component;

@Component
public class BookSearch {
    private String title;

    private String author;

    private int minYear;

    private int maxYear;

    public BookSearch(){
        title = "";
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public int getMinYear() {
        return minYear;
    }

    public void setMinYear(int minYear) {
        this.minYear = minYear;
    }

    public int getMaxYear() {
        return maxYear;
    }

    public void setMaxYear(int maxYear) {
        this.maxYear = maxYear;
    }

    public String getQueryString(){
        StringBuilder result = new StringBuilder("from Book");
        result.append(" where title LIKE '%").append(title).append("%'");
        if (author != null && !author.equals("")) result.append(" AND author LIKE '%").append(author).append("%'");
        if (minYear > 0) result.append(" AND printYear >= ").append(minYear);
        if (maxYear > 0) result.append(" AND printYear <= ").append(maxYear);
        result.append(" order by author");
        System.out.println(result.toString());

        return result.toString();
    }
    public String getCountString(){
        StringBuilder result = new StringBuilder("SELECT count(*) from Book");
        result.append(" where title LIKE '%").append(title).append("%'");
        if (author != null && !author.equals("")) result.append(" AND author LIKE '%").append(author).append("%'");
        if (minYear > 0) result.append(" AND printYear >= ").append(minYear);
        if (maxYear > 0) result.append(" AND printYear <= ").append(maxYear);


        return result.toString();
    }

    @Override
    public String toString() {
        return "BookSearch{" +
                "title='" + title + '\'' +
                ", author='" + author + '\'' +
                ", minYear=" + minYear +
                ", maxYear=" + maxYear +
                '}';
    }
}
