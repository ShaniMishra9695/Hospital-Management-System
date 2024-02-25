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
import com.hospital.entity.Doctor;
import com.hospital.entity.User;

@WebServlet("/doctorLogin")
public class DoctorLogin extends HttpServlet {
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			
			
			HttpSession session=request.getSession();
			
			DoctorDao dao=new DoctorDao(DbConnect.getConn());
			Doctor doctor=dao.login(email, password);
			
			if(doctor !=null){
				session.setAttribute("doctObj", doctor);
				response.sendRedirect("doctor/index.jsp");
			}else{
				session.setAttribute("errorMsg", "Invalid email and password ");
				response.sendRedirect("doctor_login.jsp");
			}

	}

}
