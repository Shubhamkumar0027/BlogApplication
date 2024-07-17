<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>
    <link rel="stylesheet" type="text/css" href="css/register.css">
    
</head>
<body>
    <h2>User Registration</h2>
    <form action="register" method="post">
        Name: <input type="text" name="name" required><br>
        Email: <input type="email" name="email" required><br>
        Password: <input type="password" name="password" required><br>
        Role: 
        <select name="role">
            <option value="Admin">Admin</option>
            <option value="Viewer">Viewer</option>
        </select><br>
        <input type="submit" value="register">
        
    </form>
     <p>Already have an account? <a href="login.jsp">Log in here</a>.</p>
</body>
</html>
