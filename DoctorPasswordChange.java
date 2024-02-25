package com.hospital.doctorServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hospital.dao.DoctorDao;
import com.hospital.dao.UserDao;
import com.hospital.db.DbConnect;

@WebServlet("/doctChangePassword")
public class DoctorPasswordChange extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uid = Integer.parseInt(request.getParameter("uid"));
		String oldPassword = request.getParameter("oldPassword");
		String newPassword = request.getParameter("newPassword");

		DoctorDao dao = new DoctorDao(DbConnect.getConn());
		HttpSession session = request.getSession();

		if (dao.checkOldPassword(uid, oldPassword)) {
			
			if (dao.changePassword(uid, newPassword)) {
				session.setAttribute("succMsg", "Password changed Successfully");
				response.sendRedirect("doctor/edit_profile.jsp");
			} else {
				session.setAttribute("errorMsg", "Something went wrong");
				response.sendRedirect("doctor/edit_profile.jsp");
			}
		} else {
			session.setAttribute("errorMsg", "Old Password Incorrect");
			response.sendRedirect("doctor/edit_profile.jsp");
		}
	}

}
