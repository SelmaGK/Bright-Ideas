<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bright Ideas - Login</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #ffe8e8, #ffd1ff, #d4f1f9, #caf5ff);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Poppins', sans-serif;
        }

        .title {
            position: absolute;
            top: 10px;
            font-size: 5rem;
            font-weight: 700;
            text-align: center;
            color: white;
            background: -webkit-linear-gradient(90deg, #ff6a95, #faaf67);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            animation: darkGlow 6s infinite alternate;
        }

        @keyframes darkGlow {
            0% {
                text-shadow: 0 0 10px #d1436d, 0 0 20px #b14460;
            }
            100% {
                text-shadow: 0 0 20px #ff6a95, 0 0 30px #faaf67;
            }
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: flex-start; /* Align items to the top */
            max-width: 1000px;
            width: 100%;
            padding: 20px;
            margin-top: 50px; /* Added margin to push the form down */
        }

        .form-container {
            backdrop-filter: blur(10px);
            background: rgba(255, 255, 255, 0.1);
            padding: 50px; /* Increased padding for larger box */
            border-radius: 20px;
            box-shadow: 0px 8px 32px rgba(0, 0, 0, 0.37);
            color: white;
            transition: 0.3s;
            width: 100%; /* Ensure it takes full width */
            max-width: 400px; /* Set max width */
        }

        .form-container:hover {
            box-shadow: 0px 12px 50px rgba(0, 0, 0, 0.5);
        }

        .form-title {
            text-align: center;
            font-size: 2rem;
            font-weight: bold;
            margin-bottom: 30px;
            color: white;
            animation: fadeInDown 1s;
        }

        .form-group input {
            background: rgba(255, 255, 255, 0.15);
            border: none;
            padding: 10px 20px;
            border-radius: 10px;
            color: white;
            margin-bottom: 20px;
            width: 100%;
        }

        .form-group input:focus {
            outline: none;
            box-shadow: 0px 0px 10px #81d4fa;
        }

        .form-group label {
            color: white;
            font-weight: 500;
        }

        .btn-custom {
            background: linear-gradient(90deg, #ff6a95, #faaf67);
            color: white;
            width: 100%;
            padding: 10px;
            border-radius: 50px;
            font-size: 1rem;
            border: none;
            transition: all 0.3s ease;
        }

        .btn-custom:hover {
            background-color: #81d4fa;
            box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.2);
        }

        .link-text {
            text-align: center;
            display: block;
            margin-top: 10px;
            color: #ffc1d3;
            font-size: 0.875rem;
        }

        @media (max-width: 768px) {
            .container {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>


<div class="title">Share Your BRIGHT IDEAS</div>

<div class="container">
    <!-- Login Form -->
    <div class="form-container login-box">
        <h2 class="form-title">Login</h2>
        <form:form action="/login" method="post" modelAttribute="newLogin">
            <div class="form-group">
                <form:label path="email">Email</form:label>
                <form:input path="email" cssClass="form-control" placeholder="Email" />
                <form:errors path="email" cssClass="text-danger" />
            </div>
            <div class="form-group">
                <form:label path="password">Password</form:label>
                <form:password path="password" cssClass="form-control" placeholder="Password" />
                <form:errors path="password" cssClass="text-danger" />
            </div>
            <button type="submit" class="btn btn-custom">Login</button>
        </form:form>
        <a href="/" class="link-text">Don't have an account? sign up here</a>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
