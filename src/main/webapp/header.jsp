<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Article App</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .header {
            background-color: #f0f0f0;
            padding: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header h1 {
            margin: auto;
        }

        .user-info {
            margin-left: 20px; /* Değişiklik burada */
            font-size: 14px;
            display: flex;
            align-items: center; /* Align items vertically */
        }

        .logout-button {
            margin-left: 10px;
        }
    </style>
</head>
<body>
<%
    String username = (String) session.getAttribute("username");
%>
<div class="header">
    <div class="user-info">
        <c:if test="${username != null}">
            <h3><%= username %></h3>
            <a href="<%= request.getContextPath() %>/logout"class="nav-link logout-button">Logout</a>
        </c:if>
    </div>
    <h1>Article App</h1>
</div>
</body>
</html>
