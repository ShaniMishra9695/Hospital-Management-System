package com.hospital.userServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hospital.dao.AppointmentDao;
import com.hospital.db.DbConnect;
import com.hospital.entity.Appointment;

@WebServlet("/addAppointment")
public class AppointmentServlet extends HttpServlet {
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userId=Integer.parseInt(request.getParameter("userid"));
		String fullname=request.getParameter("fullname");
		String gender=request.getParameter("gender");
		String age=request.getParameter("age");
		String appoint_date=request.getParameter("appoint_date");
		String email=request.getParameter("email");
		String phno=request.getParameter("phno");
		String diseases=request.getParameter("diseases");
		int doctor_id=Integer.parseInt(request.getParameter("doct"));
		String address=request.getParameter("address");
		//String status=request.getParameter("status");
		
		Appointment ap = new Appointment(userId, doctor_id, fullname, gender, age, appoint_date, email, phno, diseases, doctor_id, address, "Pending");
		
		AppointmentDao dao=new AppointmentDao(DbConnect.getConn());
		HttpSession session=request.getSession();
		
		if(dao.addAppointment(ap))
		{
		session.setAttribute("succMsg", "Appointment Successfully");
		response.sendRedirect("user_appointment.jsp");
		}else{
			session.setAttribute("errorMsg", "Something went wrong");
			response.sendRedirect("user_appointment.jsp");
			
		}
	}

}
