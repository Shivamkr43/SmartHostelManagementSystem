package com.hostel.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.hostel.dao.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AdminUpdateProfileServlet")
public class AdminUpdateProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = (String) request.getSession().getAttribute("adminName");
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement check = con.prepareStatement(
                "SELECT * FROM admins WHERE username=? AND password=?"
            );
            check.setString(1, username);
            check.setString(2, oldPassword);

            ResultSet rs = check.executeQuery();

            if (rs.next()) {
                PreparedStatement update = con.prepareStatement(
                    "UPDATE admins SET password=? WHERE username=?"
                );
                update.setString(1, newPassword);
                update.setString(2, username);

                update.executeUpdate();

                response.sendRedirect("admin-dashboard.jsp?success=adminProfile");
            } else {
                response.getWriter().println("Old password is incorrect.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println(e);
        }
    }
}