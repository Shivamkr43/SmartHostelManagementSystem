package com.hostel.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.hostel.dao.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AllotRoomServlet")
public class AllotRoomServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String studentEmail = request.getParameter("studentEmail");
        String roomNumber = request.getParameter("roomNumber");

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps1 = con.prepareStatement(
                "UPDATE students SET room_number=? WHERE email=?"
            );
            ps1.setString(1, roomNumber);
            ps1.setString(2, studentEmail);
            ps1.executeUpdate();

            PreparedStatement ps2 = con.prepareStatement(
                "UPDATE rooms SET occupied = occupied + 1 WHERE room_number=?"
            );
            ps2.setString(1, roomNumber);
            ps2.executeUpdate();

            response.sendRedirect("admin-dashboard.jsp?success=room");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println(e);
        }
    }
}