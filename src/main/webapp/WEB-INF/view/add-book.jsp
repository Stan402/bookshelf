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
    <title>Edit the book</title>

    <link   type="text/css"
            rel="stylesheet"
            href="${pageContext.request.contextPath}/resources/css/style.css"/>

    <link   type="text/css"
            rel="stylesheet"
            href="${pageContext.request.contextPath}/resources/css/add-book-style.css"/>

    <style>
        .error {color: red}
    </style>

</head>
<body>

    <div id="wrapper">
        <div id="header">
            <h2>Add new book to my bookshelf</h2>
        </div>
    </div>

    <div id="container">
        <h3>Fill the data for new book. Fields marked with asterisk(*) is required.</h3>

        <form:form action="saveBook" modelAttribute="book" method="post">

            <table>
                <tbody>
                    <tr>
                        <td><label>Title(*):</label></td>
                        <td><form:input path="title"/>
                            <form:errors path="title" cssClass="error"/>
                        </td>
                    </tr>
                    <tr>
                        <td><label>Description:</label></td>
                        <td><form:input path="description"/></td>
                    </tr>
                    <tr>
                        <td><label>Author(*):</label></td>
                        <td><form:input path="author"/>
                            <form:errors path="author" cssClass="error"/> </td>
                    </tr>
                    <tr>
                        <td><label>isbn:</label></td>
                        <td><form:input path="isbn"/></td>
                    </tr>
                    <tr>
                        <td><label>Print year:</label></td>
                        <td><form:input path="printYear"/>
                            <form:errors path="printYear" cssClass="error"/>
                        </td>
                    </tr>
                    <tr>
                        <td><label></label></td>
                        <td><input type="submit" value="Save" class="save"/></td>
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
