<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${user.alias}'s Profile</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500&display=swap" rel="stylesheet">
    
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f09433, #e6683c, #dc2743, #cc2366, #bc1888); /* Instagram gradient */
            color: white;
        }
        .profile-container {
            margin-top: 50px;
            padding: 30px;
            backdrop-filter: blur(10px);
            background: rgba(0, 0, 0, 0.7); /* Darker transparent background */
            border-radius: 20px;
            box-shadow: 0px 8px 32px rgba(0, 0, 0, 0.37);
        }
        .user-details {
            font-size: 18px;
            line-height: 2;
        }
        .horizontal-line {
            border-top: 2px solid #343a40;
            margin: 20px 0;
        }
        .stats {
            font-size: 18px;
        }
        .btn-custom {
            background-color: #ff0054; /* TikTok pink */
            color: white;
            padding: 10px;
            border-radius: 50px;
            font-size: 1rem;
            transition: all 0.3s ease;
        }
        .btn-custom:hover {
            background-color: #00f2ea; /* TikTok cyan */
            box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.2);
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
    </style>
</head>
<body>
    <div class="container profile-container">
        <div class="row">
            <div class="col-md-6">
                <div class="user-details">
                    <p><strong>Name:</strong> ${user.name}</p>
                    <p><strong>Alias:</strong> ${user.alias}</p>
                    <p><strong>Email:</strong> ${user.email}</p>
                </div>
            </div>
        </div>

        <div class="horizontal-line"></div>

        <div class="row">
            <div class="col-md-6 stats">
                <p><strong>Total Number of Posts:</strong> ${totalPosts}</p>
                <p><strong>Total Number of Likes:</strong> ${totalLikes}</p>
            </div>
        </div>

        <div class="mt-4">
            <a href="/dashboard" class="btn btn-custom">Back to Dashboard</a>
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
