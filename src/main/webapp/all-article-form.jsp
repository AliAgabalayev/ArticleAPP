<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <title>My Articles</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f8f9fa;
    }
    .container {
      max-width: 1200px;
      margin: 0 auto;
      padding: 20px;
      background-color: #fff;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
      border-radius: 8px;
    }
    h2 {
      text-align: center;
      color: #343a40;
    }
    .btn {
      display: inline-block;
      padding: 8px 12px;
      border: none;
      background-color: #007bff;
      color: #fff;
      text-align: center;
      cursor: pointer;
      border-radius: 4px;
      transition: background-color 0.3s ease;
    }
    .btn-info {
      background-color: #17a2b8;
    }
    .btn-warning {
      background-color: #ffc107;
    }
    .btn-danger {
      background-color: #dc3545;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      border: 1px solid #dee2e6;
      margin-top: 20px;
    }
    th, td {
      border: 1px solid #dee2e6;
      padding: 12px;
      text-align: left;
    }
    th {
      background-color: #343a40;
      color: #fff;
    }
    tr:nth-child(even) {
      background-color: #f2f2f2;
    }
    tr:hover {
      background-color: #e2e6ea;
    }
    .float-start {
      float: left;
    }
    .mb-2 {
      margin-bottom: 0.5rem;
    }
    .table-bordered {
      border-collapse: collapse;
      border: 1px solid #dee2e6;
      width: 100%;
    }
    .table-bordered th, .table-bordered td {
      border: 1px solid #dee2e6;
      padding: 0.75rem;
      vertical-align: top;
    }
  </style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="container mt-4">
  <h2 style="text-align: center">All Articles</h2>
  <a href="<%=request.getContextPath()%>/user/article" class="btn btn-info float-start mb-2">Back</a>
  <table class="table-bordered">
    <thead>
    <tr>
      <th style="background-color: black">Article Title</th>
      <th style="background-color: black">Article Content</th>
      <th style="background-color: #0056b3">Author</th>
      <th style="background-color: #0056b3">Created At</th>
      <th style="background-color: orangered">Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="article" items="${allArticleList}">
      <tr>
        <td><c:out value="${article.title}" /></td>
        <td><c:out value="${article.article}" /></td>
        <td style="background-color: black; color: cyan"><c:out value="${article.username}" /></td>
        <td><c:out value="${article.createdAt}" /></td>
        <td>
          <c:choose>
            <c:when test="${article.username eq sessionScope.username}">
              <a href="<%=request.getContextPath()%>/user/article/actions?action=edit&id=<c:out value='${article.id}'/>" class="btn btn-warning">Edit</a>
              <a href="<%=request.getContextPath()%>/user/article/actions?action=delete&id=<c:out value='${article.id}'/>" class="btn btn-danger">Delete</a>
            </c:when>
          </c:choose>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
  <br> <br>
</div>
</body>
</html>
