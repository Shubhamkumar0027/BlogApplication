<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>${post.title}</title>
    <link rel="stylesheet" type="text/css" href="css/view_post.css">
</head>
<body>
    <h2>${post.title}</h2>
    <p>${post.content}</p>
    <c:if test="${not empty post.media_path}">
        <c:choose>
            <c:when test="${post.media_path.endsWith('.jpg') || post.media_path.endsWith('.png')}">
                <img src="${post.media_path}" alt="Image">
            </c:when>
            <c:otherwise>
                <video controls>
                    <source src="${post.media_path}">
                </video>
            </c:otherwise>
        </c:choose>
    </c:if>
    <a href="viewer_dashboard.jsp">Back to Posts</a>
</body>
</html>
