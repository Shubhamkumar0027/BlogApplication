package com.blogApplication.servlets;


import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blogApplication.entity.BlogPost;
import com.blogApplication.util.DatabaseUtils;

@WebServlet("/search")
public class SearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final int POSTS_PER_PAGE = 5;

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String query = request.getParameter("query");
        String sort = request.getParameter("sort");
        int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
        int offset = (page - 1) * POSTS_PER_PAGE;

        List<BlogPost> posts = new ArrayList<>();
        int totalPosts = 0;

        try (Connection conn = DatabaseUtils.getConnection()) {
            String sql = "SELECT SQL_CALC_FOUND_ROWS * FROM blog_posts WHERE title LIKE ? ";
            if ("title".equals(sort)) {
                sql += "ORDER BY title ";
            } else if ("date".equals(sort)) {
                sql += "ORDER BY created_at DESC ";
            } else {
                sql += "ORDER BY created_at DESC ";
            }
            sql += "LIMIT ? OFFSET ?";

            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, "%" + query + "%");
                stmt.setInt(2, POSTS_PER_PAGE);
                stmt.setInt(3, offset);

                try (ResultSet rs = stmt.executeQuery()) {
                    while (rs.next()) {
                        BlogPost post = new BlogPost();
                        post.setId(rs.getInt("id"));
                        post.setTitle(rs.getString("title"));
                        post.setContent(rs.getString("content"));
                        post.setMediaPath(rs.getString("media_path"));
                        post.setCreatedAt(rs.getTimestamp("created_at"));
                        posts.add(post);
                    }
                }
            }

            try (PreparedStatement stmt = conn.prepareStatement("SELECT FOUND_ROWS()")) {
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        totalPosts = rs.getInt(1);
                    }
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        int pageCount = (int) Math.ceil((double) totalPosts / POSTS_PER_PAGE);

        request.setAttribute("posts", posts);
        request.setAttribute("pageCount", pageCount);
        request.getRequestDispatcher("viewer_dashboard.jsp").forward(request, response);
    }
}
