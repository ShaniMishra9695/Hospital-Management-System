package com.hospital.adminServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hospital.dao.DoctorDao;
import com.hospital.db.DbConnect;

@WebServlet("/deleteDoctor")
public class deleteServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id=Integer.parseInt(request.getParameter("id"));
		
		DoctorDao dao=new DoctorDao(DbConnect.getConn());
		HttpSession session = request.getSession();
		
		if(dao.deleteDoctor(id))
		{
			session.setAttribute("succMsg", "Doctor Delete Successfully");
			response.sendRedirect("admin/view_doctor.jsp");
		}else{
			session.setAttribute("errorMsg", "Something went wrong");
			response.sendRedirect("admin/view_doctor.jsp");
		}
	}

}
