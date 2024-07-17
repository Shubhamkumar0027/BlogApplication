package com.blogApplication.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blogApplication.entity.BlogPost;
import com.blogApplication.util.DatabaseUtils;

@WebServlet("/view_post")
public class ViewPostServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int postId = Integer.parseInt(request.getParameter("id"));
        BlogPost post = null;

        try (Connection conn = DatabaseUtils.getConnection()) {
            String sql = "SELECT * FROM blog_posts WHERE id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, postId);
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        post = new BlogPost();
                        post.setId(rs.getInt("id"));
                        post.setTitle(rs.getString("title"));
                        post.setContent(rs.getString("content"));
                        post.setMediaPath(rs.getString("media_path"));
                        post.setCreatedAt(rs.getTimestamp("created_at"));
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (post != null) {
            request.setAttribute("post", post);
            request.getRequestDispatcher("view_post.jsp").forward(request, response);
        } else {
            response.sendRedirect("viewer_dashboard.jsp");
        }
    }
}
