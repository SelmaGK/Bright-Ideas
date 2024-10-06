<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Like Status</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f09433, #e6683c, #dc2743, #cc2366, #bc1888); /* Instagram gradient */
            color: white;
            padding-bottom: 60px; /* Space for footer */
        }

        .navbar {
            background-color: #4267B2; /* Facebook blue */
        }

        .navbar .btn {
            background-color: #FFFC00; /* Snapchat yellow */
            color: black;
            font-weight: bold;
        }

        .content-card {
            background-color: #282828; /* Dark mode */
            color: white;
            margin-top: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: all 0.3s ease;
        }

        .content-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
        }

        .like-table {
            margin-top: 20px;
        }

        .footer {
            position: fixed;
            bottom: 0;
            width: 100%;
            background-color: #343a40;
            color: #ffffff;
            padding: 10px;
            text-align: center;
        }

        .fa-heart {
            color: #ff0054; /* Like button color */
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Top Navigation Links -->
        <nav class="navbar navbar-light">
            <a href="/dashboard" class="btn btn-secondary">Bright Ideas</a>
            <a href="/logout" class="btn btn-danger">Logout</a>
        </nav>

        <!-- Post Content -->
        <div class="card content-card">
            <div class="card-body">
                <h5><a href="/users/${idea.user.id}" style="color: #00f2ea;">${idea.user.alias}</a> says:</h5>
                <p>${idea.content}</p>
            </div>
        </div>

        <!-- People Who Liked the Post -->
        <div class="like-table">
            <h5>People who liked this post:</h5>
            <table class="table table-striped table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>Alias</th>
                        <th>Name</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="user" items="${uniqueLikers}">
                        <tr>
                            <td><a href="/users/${user.id}" style="color: #00f2ea;">${user.alias}</a></td>
                            <td>${user.name}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Footer -->
    <div class="footer">
        <p>&copy; 2024 Bright Ideas. All rights reserved.</p>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>
