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
import com.hospital.entity.Doctor;

@WebServlet("/updateDoctor")
public class updateDoctor extends HttpServlet {
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			try{
				String fullname = request.getParameter("fullname");
				String dob = request.getParameter("dob");
				String qualification = request.getParameter("qualification");
				String spec = request.getParameter("spec");
				String email = request.getParameter("email");
				String mobno = request.getParameter("mobno");
				String password = request.getParameter("password");
				
				int id=Integer.parseInt(request.getParameter("id"));
				
				Doctor d=new Doctor(fullname,dob,qualification,spec,email,mobno,password);
				
				DoctorDao dao=new DoctorDao(DbConnect.getConn());
				HttpSession session = request.getSession();
				
				if(dao.updateDoctor(d))
				{
					session.setAttribute("succMsg", "Doctor Updated Successfully");
					response.sendRedirect("admin/view_doctor.jsp");
				}else{
					session.setAttribute("errorMsg", "Something went wrong");
					response.sendRedirect("admin/view_doctor.jsp");
				}
			}catch(Exception e){
				e.printStackTrace();
			}

	}

}
