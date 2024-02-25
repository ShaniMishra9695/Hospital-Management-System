package com.hospital.doctorServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hospital.dao.DoctorDao;
import com.hospital.db.DbConnect;
import com.hospital.entity.Doctor;

@WebServlet("/doctorUpdateProfile")
public class EditProfile extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		try{
			String fullname = request.getParameter("fullname");
			String dob = request.getParameter("dob");
			String qualification = request.getParameter("qualification");
			String spec = request.getParameter("spec");
			String email = request.getParameter("email");
			String mobno = request.getParameter("mobno");
			
			
			int id=Integer.parseInt(request.getParameter("id"));
			
			Doctor d=new Doctor(id,fullname,dob,qualification,spec,email,mobno,"");
			
			DoctorDao dao=new DoctorDao(DbConnect.getConn());
			HttpSession session = request.getSession();
			
			if(dao.editDoctorProfile(d))
			{
				Doctor updateDoctor=dao.getDoctorById(id);
				session.setAttribute("succMsgd", "Doctor Updated Successfully");
				session.setAttribute("doctObj", updateDoctor);
				response.sendRedirect("doctor/edit_profile.jsp");
			}else{
				session.setAttribute("errorMsgd", "Something went wrong");
				response.sendRedirect("doctor/edit_profile.jsp");
			}
		}catch(Exception e){
			e.printStackTrace();
		}

	}

}
