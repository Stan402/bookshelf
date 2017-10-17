<%--
  Created by IntelliJ IDEA.
  User: stan
  Date: 13/10/2017
  Time: 14:40
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search the books</title>

    <link   type="text/css"
            rel="stylesheet"
            href="${pageContext.request.contextPath}/resources/css/style.css"/>

    <link   type="text/css"
            rel="stylesheet"
            href="${pageContext.request.contextPath}/resources/css/add-book-style.css"/>
</head>
<body>

    <div id="wrapper">
        <div id="header">
            <h2>Search my bookshelf</h2>
        </div>
    </div>

    <div id="container">
        <h3>Add new book</h3>

        <form:form action="searchBook" modelAttribute="search" method="post">

            <table>
                <tbody>
                    <tr>
                        <td><label>Title:</label></td>
                        <td><form:input path="title"/></td>
                    </tr>
                    <tr>
                        <td><label>Author:</label></td>
                        <td><form:input path="author"/></td>
                    </tr>
                    <tr>
                        <td><label>Print year from:</label></td>
                        <td><form:input path="minYear"/></td>
                    </tr>
                    <tr>
                        <td><label>Print year to:</label></td>
                        <td><form:input path="maxYear"/></td>
                    </tr>
                    <tr>
                        <td><label></label></td>
                        <td><input type="submit" value="Search" class="save"/></td>
                    </tr>
                </tbody>
            </table>

        </form:form>


    </div>


    <p>
        <a href="${pageContext.request.contextPath}/books/list">Back to list</a>
    </p>

</body>
</html>
