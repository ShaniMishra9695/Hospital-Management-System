package com.hospital.doctorServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hospital.dao.AppointmentDao;
import com.hospital.db.DbConnect;

@WebServlet("/updateStatus")
public class UpdateStatus extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{
			int id=Integer.parseInt(request.getParameter("id"));
			int did=Integer.parseInt(request.getParameter("did"));
			String comm=request.getParameter("comm");
			
			AppointmentDao dao=new AppointmentDao(DbConnect.getConn());
			
			HttpSession session=request.getSession();
			
			if(dao.updateCommentStatus(id, did, comm))
			{
				session.setAttribute("succMsg", "Comment Updated");
				response.sendRedirect("doctor/patient.jsp");
			}else{
				session.setAttribute("errorMsg", "Something went wrong");
				response.sendRedirect("doctor/patient.jsp");

			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
