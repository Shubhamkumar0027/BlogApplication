<!DOCTYPE html>
<html>
<head>
    <title>Create Post</title>
    <link rel="stylesheet" type="text/css" href="css/create_post.css">
</head>
<body>
    <h2>Create New Post</h2>
    <form action="create_post" method="post" enctype="multipart/form-data">
        Title: <input type="text" name="title" required><br>
        Content: <textarea name="content" required></textarea><br>
        Media: <input type="file" name="media"><br>
        <input type="submit" value="Create Post">
    </form>
</body>
</html>
