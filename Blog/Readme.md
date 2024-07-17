# Blog Application

## Overview
This application is a simple blog platform with user registration, login, and role-based access control. Admins can create, update, and delete blog posts, while viewers can browse, search, and view blog posts.

## Technologies Used
- Java Servlets (Backend)
- JSP (Frontend)
- MySQL Database
- BCrypt for password hashing

## Features
1. **User Registration and Login**
   - Users can register with their name, email, password, and role (Admin/Viewer).
   - Passwords are hashed using BCrypt before storage.
   - Login functionality authenticates users and establishes sessions.

2. **Admin Dashboard**
   - Admins can create, update, and delete blog posts.
   - Admins can upload images and videos for posts.
   - Secure handling of media storage.

3. **Viewer Interface**
   - Viewers can browse, search, and sort blog posts.
   - Pagination of search results.
   - Detailed view of individual blog posts.

4. **Security Enhancements**
   - Password hashing with BCrypt.
   - Input validation to prevent SQL injection and XSS attacks.
   - Use of prepared statements for database interactions.

## Setup and Installation

### Prerequisites
- Java Development Kit (JDK)
- Apache Tomcat Server
- MySQL Database
- Maven

### Steps

1. **Clone the Repository**
   ```bash
   git clone <repository-url>
   cd blog-application
