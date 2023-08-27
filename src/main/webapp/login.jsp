<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Login Form</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f0f0f0;
    }

    .full-screen {
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .container {
      text-align: center;
      background-color: #fff;
      padding: 20px;
      border-radius: 5px;
      box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
      width: 100%;
      max-width: 400px; /* Adjust as needed */
    }

    .form-group {
      margin-bottom: 15px;
      display: flex;
      flex-direction: column;
      align-items: flex-start;
    }

    .label {
      margin-bottom: 5px;
      font-weight: bold;
    }

    .input {
      padding: 8px;
      width: 100%;
      border: 1px solid #ccc;
      border-radius: 4px;
    }

    .button {
      padding: 10px 20px;
      font-size: 16px;
      text-align: center;
      text-decoration: none;
      border-radius: 4px;
      border: none;
      cursor: pointer;
      background-color: #007bff;
      color: #fff;
      transition: background-color 0.3s ease;
    }

    .button:hover {
      background-color: #0056b3;
    }
  </style>
</head>
<body>
<%@ include file="header.jsp"%>
<div class="full-screen">
  <h4 style="text-align: center; color: red">${loginError}</h4>
  <div class="container">
    <h2>Login Form</h2>
    <form action="<%=request.getContextPath()%>/login" method="post">
      <div class="form-group">
        <label class="label" for="username">Username:</label>
        <input class="input" type="text" id="username" name="username" required>
      </div>
      <div class="form-group">
        <label class="label" for="password">Password:</label>
        <input class="input" type="password" id="password" name="password" required>
      </div>
      <button type="submit" class="button">Login</button>
    </form>
  </div>
</div>
<%@ include file="footer.jsp"%>
</body>
</html>
