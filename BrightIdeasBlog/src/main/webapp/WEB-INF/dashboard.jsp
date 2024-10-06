<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bright Ideas Dashboard</title>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500&display=swap" rel="stylesheet">
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f09433, #e6683c, #dc2743, #cc2366, #bc1888); /* Instagram gradient */
            color: white;
            padding-bottom: 60px; /* Space for footer */
        }

        /* Header */
        .navbar {
            background-color: #4267B2; /* Facebook blue */
        }

        .navbar .btn {
            background-color: #FFFC00; /* Snapchat yellow */
            color: black;
            font-weight: bold;
        }

        /* Content Cards */
        .content-card {
            background-color: #282828; /* TikTok dark mode */
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

        /* Footer */
        .footer {
            position: fixed;
            bottom: 0;
            width: 100%;
            background-color: #343a40;
            color: #ffffff;
            padding: 10px;
            text-align: center;
        }

        /* Buttons */
        .btn-custom {
            background-color: #ff0054; /* TikTok pink */
            color: white;
            border-radius: 20px;
            padding: 8px 20px;
            transition: background-color 0.3s ease;
        }

        .btn-custom:hover {
            background-color: #00f2ea; /* TikTok cyan */
            color: white;
        }

        .fa-heart {
            color: #ff0054;
        }

        .mt-4 { margin-top: 1.5rem; }
        .text-center { text-align: center; }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <a class="navbar-brand" href="/dashboard">Bright Ideas</a>
        <div class="ml-auto">
            <a href="/logout" class="btn btn-danger">Logout</a>
        </div>
    </nav>

    <div class="container mt-5">
        <h1 class="mt-4">Hello, ${user.alias}!</h1>

        <!-- New Idea Form -->
        <form:form action="/ideas/new" modelAttribute="newIdea" method="post" class="mt-3">
            <div class="form-group">
                <form:input path="content" class="form-control" placeholder="Post something witty here..." />
            </div>
            <button type="submit" class="btn btn-custom">Idea!</button>
        </form:form>

        <!-- Ideas List -->
        <div class="mt-5">
            <h2>Ideas</h2>
            <c:forEach var="idea" items="${ideas}">
                <div class="card content-card">
                    <div class="card-body">
                        <h5 class="card-title">
                            <a href="/users/${idea.user.id}" style="color: #00f2ea;">${idea.user.alias}</a> says:
                        </h5>
                        <p class="card-text">${idea.content}</p>
                        <p class="text-muted">
                            <a href="/bright_ideas/${idea.id}" class="like-count-link">
                                <span class="like-count" id="like-count-${idea.id}">
                                    ${idea.likedUsers.size()}
                                </span> people like this.
                            </a>
                        </p>

                        <!-- Like Button -->
                        <form action="/ideas/${idea.id}/like" method="POST" class="like-form" data-idea-id="${idea.id}">
                            <button type="submit" class="btn btn-custom">
                                <i class="fas fa-heart"></i> Like
                            </button>
                        </form>

                        <!-- Edit and Delete buttons for user's posts -->
                        <c:if test="${idea.user.id == user.id}">
                            <button class="btn btn-warning btn-sm float-right ml-2" onclick="toggleEditForm(${idea.id})">Edit</button>
                            <a href="/ideas/${idea.id}/delete" class="btn btn-danger btn-sm float-right">Delete</a>
                        </c:if>

                        <!-- Edit Form -->
                        <div id="edit-form-${idea.id}" class="edit-form mt-3" style="display: none;">
                            <form action="/ideas/${idea.id}/edit" method="POST" class="edit-form">
                                <div class="form-group">
                                    <input type="text" name="content" class="form-control" value="${idea.content}" required>
                                </div>
                                <button type="submit" class="btn btn-success">Save Changes</button>
                                <button type="button" class="btn btn-secondary" onclick="toggleEditForm(${idea.id})">Cancel</button>
                            </form>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- Footer -->
    <div class="footer">
        <p>&copy; 2024 Bright Ideas. All rights reserved.</p>
    </div>

    <!-- JavaScript for Edit and Like functionality -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script>
 
        function toggleEditForm(ideaId) {
            const form = document.getElementById('edit-form-' + ideaId);
            form.style.display = form.style.display === 'none' ? 'block' : 'none';
        }

        $(document).ready(function() {
            $(document).on('submit', '.like-form', function(event) {
                event.preventDefault(); 

                const form = $(this);
                const url = form.attr('action'); 
                const ideaId = form.data('idea-id'); 

                $.ajax({
                    type: 'POST', 
                    url: url,
                    success: function(response) {
                        const likeCountElement = $('#like-count-' + ideaId);
                        const currentCount = parseInt(likeCountElement.text());
                        likeCountElement.text(currentCount + 1); 
                    },
                    error: function(xhr) {
                        console.error('Error liking the idea:', xhr.responseText); 
                    }
                });
            });

            
            $(document).on('submit', '.edit-form', function(event) {
                event.preventDefault(); 

                const form = $(this); 
                const url = form.attr('action'); 
                const data = form.serialize(); 

                $.ajax({
                    type: 'POST', 
                    url: url, 
                    data: data, 
                    success: function(response) {
                        alert("Idea updated successfully!");
                        location.reload(); 
                    },
                    error: function(xhr) {
                        console.error('Error updating the idea:', xhr.responseText); 
                    }
                });
            });
        });
    </script>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>
