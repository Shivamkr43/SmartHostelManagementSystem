package com.hostel.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.hostel.dao.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DeleteStudentServlet")
public class DeleteStudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String room = request.getParameter("room");

        try {
            Connection con = DBConnection.getConnection();

            if (room != null && !room.equals("null") && !room.trim().equals("")) {
                PreparedStatement ps1 = con.prepareStatement(
                    "UPDATE rooms SET occupied = occupied - 1 WHERE room_number=? AND occupied > 0"
                );
                ps1.setString(1, room);
                ps1.executeUpdate();
            }

            PreparedStatement ps2 = con.prepareStatement(
                "DELETE FROM students WHERE id=?"
            );
            ps2.setInt(1, id);
            ps2.executeUpdate();

            response.sendRedirect("view-students.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println(e);
        }
    }
}