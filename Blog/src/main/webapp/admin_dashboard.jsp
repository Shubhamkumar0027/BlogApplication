<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String role = (String) session.getAttribute("role");
    if (role == null || !role.equals("Admin")) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" type="text/css" href="css/admin.css">
</head>
<body>
    <h2>Admin Dashboard</h2>
    <a href="create_post.jsp">Create New Post</a>
    <h3>Blog Posts</h3>
    <table border="1">
        <tr>
            <th>Title</th>
            <th>Content</th>
            <th>Media</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="post" items="${posts}">
            <tr>
                <td>${post.title}</td>
                <td>${post.content}</td>
                <td><c:if test="${not empty post.media_path}"><a href="${post.media_path}">View Media</a></c:if></td>
                <td>
                    <a href="edit_post.jsp?id=${post.id}">Edit</a> |
                    <a href="delete_post?id=${post.id}" onclick="return confirm('Are you sure?')">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
