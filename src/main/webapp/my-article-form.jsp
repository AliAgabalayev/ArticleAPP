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
  </style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="container mt-4">
  <h2 style="text-align: center">My Articles</h2>
  <a href="<%=request.getContextPath()%>/user/article" class="btn btn-info float-start mb-2">Back</a>
  <table>
    <thead>
    <tr>
      <th>Article Title</th>
      <th>Article Content</th>
      <th>Created At</th> <!-- New column header -->
    </tr>
    </thead>
    <tbody>
    <c:forEach var="article" items="${articleList}">
      <tr>
        <td><c:out value="${article.title}"/></td>
        <td><c:out value="${article.article}"/></td>
        <td><c:out value="${article.created_at}" /></td> <!-- New column for Created At -->
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
