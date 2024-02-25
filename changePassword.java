package com.hospital.userServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hospital.dao.UserDao;
import com.hospital.db.DbConnect;

@WebServlet("/userChangePassword")
public class changePassword extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int uid = Integer.parseInt(request.getParameter("uid"));
		String oldPassword = request.getParameter("oldPassword");
		String newPassword = request.getParameter("newPassword");

		UserDao dao = new UserDao(DbConnect.getConn());
		HttpSession session = request.getSession();

		if (dao.checkOldPassword(uid, oldPassword)) {
			
			if (dao.changePassword(uid, newPassword)) {
				session.setAttribute("succMsg", "Password changed Successfully");
				response.sendRedirect("change_password.jsp");
			} else {
				session.setAttribute("errorMsg", "Something went wrong");
				response.sendRedirect("change_password.jsp");
			}
		} else {
			session.setAttribute("errorMsg", "Old Password Incorrect");
			response.sendRedirect("change_password.jsp");
		}
	}

}
