<%@ page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <title>Article APP</title>
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

    .article {
      margin-top: 20px;
      border: 1px solid #dee2e6;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
      background-color: #fff;
    }

    .article-title {
      font-size: 20px;
      font-weight: bold;
      color: #343a40;
    }

    .article-content {
      margin-top: 10px;
      color: #6c757d;
    }

    th.orangered {
      background-color: orangered;
    }
  </style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<div class="container">
  <h2>Article List</h2>
  <div class="text-right">
    <a href="<%=request.getContextPath()%>/user/article/actions?action=viewMyArticles" class="btn btn-info">My articles</a>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <a href="<%=request.getContextPath()%>/user/article/actions?action=viewAllArticles" class="btn btn-info">All article</a>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <a href="<%=request.getContextPath()%>/user/article/actions?action=new" class="btn btn-warning">Add article</a>
  </div>
  <br>
  <c:forEach var="article" items="${articles}">
    <div class="article">
      <div class="article-title">${article.title}</div>
      <div class="article-content">${article.article}</div>
      <div class="text-right mt-2">
        <c:choose>
          <c:when test="${article.username eq sessionScope.username}">
            <a href="<%=request.getContextPath()%>/user/article/actions?action=edit&id=${article.id}" class="btn btn-warning">Edit</a>
            <a href="<%=request.getContextPath()%>/user/article/actions?action=delete&id=${article.id}" class="btn btn-danger">Delete</a>
          </c:when>
          <c:otherwise>
            <!-- Display something else if the user doesn't have permission -->
          </c:otherwise>
        </c:choose>
      </div>
    </div>
  </c:forEach>

</div>

</body>
</html>
