<%--
  Created by IntelliJ IDEA.
  User: stan
  Date: 12/10/2017
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List of books</title>

    <link   type="text/css"
            rel="stylesheet"
            href="${pageContext.request.contextPath}/resources/css/style.css"/>

</head>
<body>

    <div id="wrapper">
        <div id="header">
            <h2>Books on my bookshelf</h2>
        </div>
    </div>



    <div id="content">
        <div id="container">

            <input type="button" value="Add book"
                    onclick="window.location.href='showFormForAdd'; return false"
                    class="add-button"/>
            <input type="button" value="Search"
                    onclick="window.location.href='showFormForSearch'; return false"
                    class="add-button">
            <input type="button" value="Show all"
                    onclick="window.location.href='showAll'; return false"
                    class="add-button">

            <table>
                <tr>

                </tr>
            </table>

            <table>
                <tr>
                    <th>Title</th>
                    <th>Author</th>
                    <th>isbn</th>
                    <th>printYear</th>
                    <th>readAlready</th>
                    <th>Description</th>
                    <th>Action</th>
                </tr>
                <c:forEach var="theBook" items="${books}">

                    <c:url var="updateLink" value="/books/showFormForUpdate">
                        <c:param name="bookId" value="${theBook.id}"/>
                    </c:url>

                    <c:url var="deleteLink" value="/books/delete">
                        <c:param name="bookId" value="${theBook.id}"/>
                    </c:url>

                    <c:url var="readLink" value="/books/read">
                        <c:param name="bookId" value="${theBook.id}"/>
                    </c:url>

                    <tr>
                        <td>${theBook.title}</td>
                        <td>${theBook.author}</td>
                        <td>${theBook.isbn}</td>
                        <td>${theBook.printYear}</td>
                        <td>
                            <c:choose>
                                <c:when test="${theBook.readAlready}">
                                    Read!
                                </c:when>
                                <c:otherwise>
                                    <a href="${readLink}"
                                        onclick="if (!(confirm('Have you read this book?'))) return false">
                                        Yet to read</a>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>${theBook.description}</td>
                        <td>
                            <a href="${updateLink}">Update</a>
                            | <a href="${deleteLink}"
                                onclick="if (!(confirm('Are you sure you want to delete this book'))) return false">
                                Delete</a>
                        </td>
                    </tr>

                </c:forEach>
            </table>

            <!--Pagination block -->

            <c:url var="previousPage" value="/books/list">
                <c:param name="pg" value="${page - 1}"/>
            </c:url>

            <c:url var="nextPage" value="/books/list">
                <c:param name="pg" value="${page + 1}"/>
            </c:url>

            <c:url var="firstPage" value="/books/list">
                <c:param name="pg" value="1"/>
            </c:url>

            <c:url var="last_Page" value="/books/list">
                <c:param name="pg" value="${lastPage}"/>
            </c:url>
            <p>
                <span>...........page ${page} of ${lastPage}</span>
            </p>

           <p>
               <a href="${firstPage}">First page</a>
               |
               <a href="${previousPage}">Previous</a>
               |
               <a href="${nextPage}">Next</a>
               |
               <a href="${last_Page}">Last page</a>
           </p>

        </div>
    </div>


</body>
</html>
