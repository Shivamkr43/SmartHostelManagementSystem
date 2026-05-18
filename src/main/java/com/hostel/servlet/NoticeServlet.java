package com.hostel.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.hostel.dao.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/NoticeServlet")
public class NoticeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String title = request.getParameter("title");
        String message = request.getParameter("message");

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO notices(title, message) VALUES (?, ?)"
            );

            ps.setString(1, title);
            ps.setString(2, message);

            ps.executeUpdate();

            response.sendRedirect("admin-dashboard.jsp?success=notice");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println(e);
        }
    }
}