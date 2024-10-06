# Bright Ideas

## Project Overview
**Bright Ideas** is a social blogging platform where users can log in, share their ideas, and interact with others by liking posts. The platform allows users to see the most liked ideas at the top of the feed and restricts users from deleting ideas posted by others. This project is built with **Java** and **Spring Boot** for the backend, **JSP** and **Bootstrap** for the frontend, and **MySQL** as the database.

---

## Features

### 1. **User Authentication**
   - **Register**:
     - Users can sign up with the following fields:
       - Name
       - Alias
       - Email
       - Password
       - Confirm Password
     - **Validations**:
       - Password must be at least 8 characters long.
       - Name and Alias must be at least 2 characters.
       - Email must be unique.
       - Confirm Password must match the Password.

   - **Login**:
     - Users log in using their email and password.

### 2. **Main Dashboard**
   - After login, users land on the dashboard, greeted by "Hi, [Username]!".
   - Users can submit ideas using a text input and a button labeled **Idea!**.
   - All posted ideas are displayed in a list, sorted by the number of likes (highest first).
   - Users can **like** posts, and the number of likes is displayed for each idea.
   - Users can only delete their own ideas.

### 3. **Like System**
   - Users can click "LIKE" to like an idea.
   - Each like increments the idea's like count by 1.
   - A user can only like the same idea once, and their name will only appear once in the list of users who liked the post.

---

## Tech Stack

### Frontend:
- JSP (JavaServer Pages)
- CSS/Bootstrap for styling

### Backend:
- Java
- Spring Boot (RESTful APIs, Controllers, Services)

### Database:
- MySQL

---

## Setup Instructions

### Prerequisites
Before running the application, ensure you have the following installed:
- Java 8 or higher
- Maven
- MySQL Server
- An IDE like IntelliJ IDEA or Eclipse

### Steps
1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/bright-ideas.git
