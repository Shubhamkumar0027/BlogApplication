<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Post</title>
     <link rel="stylesheet" type="text/css" href="css/edit_post.css">
</head>
<body>
    <h2>Edit Post</h2>
    <form action="edit_post" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${post.id}">
        Title: <input type="text" name="title" value="${post.title}" required><br>
        Content: <textarea name="content" required>${post.content}</textarea><br>
        Media: <input type="file" name="media"><br>
        <input type="submit" value="Update Post">
    </form>
</body>
</html>
