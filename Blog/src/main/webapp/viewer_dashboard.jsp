<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Viewer Dashboard</title>
    <link rel="stylesheet" type="text/css" href="css/viewer_dashboard.css">
</head>
<body>
    <h2>Blog Posts</h2>
    <form action="search" method="get">
        Search: <input type="text" name="query">
        <input type="submit" value="Search">
    </form>
    <h3>Posts</h3>
    <table border="1">
        <tr>
            <th><a href="?sort=title">Title</a></th>
            <th><a href="?sort=date">Date</a></th>
        </tr>
        <c:forEach var="post" items="${posts}">
            <tr>
                <td><a href="view_post?id=${post.id}">${post.title}</a></td>
                <td>${post.created_at}</td>
            </tr>
        </c:forEach>
    </table>
    <c:if test="${pageCount > 1}">
        <div>
            <c:forEach var="i" begin="1" end="${pageCount}">
                <a href="?page=${i}">${i}</a>
            </c:forEach>
        </div>
    </c:if>
</body>
</html>
