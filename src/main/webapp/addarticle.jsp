<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Article</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            font-weight: bold;
        }
        input[type="text"],
        textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        textarea {
            resize: vertical;
        }
        button {
            padding: 8px 15px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="container">
    <div class="row">
        <div class="col-3"></div>
        <div class="col-6">
            <div class="card mt-4">
                <div class="card-body">
                    <c:if test="${article != null}">
                    <form action="${pageContext.request.contextPath}/user/article/actions?action=update&id=<c:out value='${article.id}'/>"
                          method="post">
                        </c:if>
                        <c:if test="${article == null}">
                        <form action="${pageContext.request.contextPath}/user/article/actions?action=insert"
                              method="post">
                            </c:if>
                            <caption>
                                <h2>
                                    <c:if test="${article != null}">
                                        Edit Article
                                    </c:if>
                                    <c:if test="${article == null}">
                                        Article Form
                                    </c:if>
                                </h2>
                            </caption>

                            <div class="form-group">
                                <label for="title">Title</label>
                                <input type="text" id="title" name="title" required value="<c:out value='${article.title}'/>">
                            </div>

                            <div class="form-group">
                                <label for="content">Content</label>
                                <textarea id="content" name="article" rows="5" required><c:out value='${article.article}'/></textarea>
                            </div>

                            <br>
                            <div>
                                <button type="submit">Submit</button>
                                <a href="<%=request.getContextPath()%>/user/article" class="btn btn-info mb-2">Back</a>
                            </div>
                        </form>
                </div>
            </div>
        </div>
        <div class="col-3"></div>
    </div>
</div>
</body>
</html>
