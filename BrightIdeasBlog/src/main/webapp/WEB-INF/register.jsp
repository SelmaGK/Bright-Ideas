<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bright Ideas - Login / Sign Up</title>
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
            background: -webkit-linear-gradient(45deg, #d1436d, #b14460, #7b3e53, #4a6f94);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            animation: darkGlow 5s infinite alternate;
        }

        @keyframes darkGlow {
            0% {
                text-shadow: 0 0 10px #d1436d, 0 0 20px #b14460;
            }
            100% {
                text-shadow: 0 0 20px #7b3e53, 0 0 30px #4a6f94;
            }
        }

        .container {
            display: flex;
            justify-content: center; /* Center horizontally */
            align-items: center;     /* Center vertically */
            height: 100vh;          /* Full height of the viewport */
        }

        .form-container {
            width: 400px;           /* Set a fixed width */
            max-width: 90%;         /* Allow it to be responsive */
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0px 8px 32px rgba(0, 0, 0, 0.37);
            color: white;
            transition: 0.3s;
            backdrop-filter: blur(10px);
            background: rgba(255, 255, 255, 0.1); /* Maintain background */
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

        /* Placeholder for user profile image */
        .avatar {
            display: block;
            margin: 0 auto 10px;
            background-color: rgba(255, 255, 255, 0.2);
            border-radius: 50%;
            width: 100px;
            height: 100px;
            background-image: url('https://placekitten.com/100/100');
            background-size: cover;
            background-position: center;
            border: 3px solid white;
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

        /* Optional: Adjust media query for smaller screens */
        @media (max-width: 480px) {
            .form-container {
                width: 90%; /* Allow for smaller screens */
            }
        }
    </style>
</head>
<body>

<div class="title">Share Your BRIGHT IDEAS</div>

<div class="container">
    <!-- Registration Form -->
    <div class="form-container">
        <h2 class="form-title">Sign Up</h2>
        <form:form action="/" method="post" modelAttribute="newUser">
            <div class="form-group">
                <form:label path="name">Name</form:label>
                <form:input path="name" cssClass="form-control"/>
                <form:errors path="name" cssClass="text-danger"/>
            </div>
            <div class="form-group">
                <form:label path="alias">Alias</form:label>
                <form:input path="alias" cssClass="form-control"/>
                <form:errors path="alias" cssClass="text-danger"/>
            </div>
            <div class="form-group">
                <form:label path="email">E-mail</form:label>
                <form:input path="email" cssClass="form-control" placeholder="E-mail" />
                <form:errors path="email" cssClass="text-danger" />
            </div>
            <div class="form-group">
                <form:label path="password">Password</form:label>
                <form:password path="password" cssClass="form-control" placeholder="Password" />
                <form:errors path="password" cssClass="text-danger" />
            </div>
            <div class="form-group">
                <form:label path="confirm">Confirm Password</form:label>
                <form:password path="confirm" cssClass="form-control" placeholder="Confirm Password" />
                <form:errors path="confirm" cssClass="text-danger" />
            </div>
            <button type="submit" class="btn btn-custom">Create Account</button>
        </form:form>
        <a href="/login" class="link-text">Already have an account? Login here</a>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
