<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home Page</title>
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

        .button {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            text-align: center;
            text-decoration: none;
            border-radius: 4px;
            border: none;
            cursor: pointer;
            margin: 5px;
            transition: background-color 0.3s ease;
        }

        .button-primary {
            background-color: #007bff;
            color: #fff;
        }

        .button-success {
            background-color: #28a745;
            color: #fff;
        }
    </style>
</head>
<body>
<%@ include file="header.jsp"%>
<div class="full-screen">
    <div class="container">
        <h2>Welcome to Article App</h2>
        <div class="mt-4">
            <a href="login.jsp" class="button button-primary">Login</a>
            <a href="registration.jsp" class="button button-success">Sign Up</a>
        </div>
    </div>
</div>
<%@ include file="footer.jsp"%>
</body>
</html>
