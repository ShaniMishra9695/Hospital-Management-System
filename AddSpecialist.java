package com.hospital.adminServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hospital.dao.SpecialistDao;
import com.hospital.db.DbConnect;
import com.hospital.entity.User;


@WebServlet("/addSpecialist")
public class AddSpecialist extends HttpServlet {
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String specName=request.getParameter("specName");
		
		SpecialistDao dao=new SpecialistDao(DbConnect.getConn());
		boolean f=dao.addSpecialist(specName);
		
		HttpSession session=request.getSession();
		
		if(f){
			session.setAttribute("succMsg", "Specialist Added");
			response.sendRedirect("admin/admin.jsp");
		}else{
			session.setAttribute("errorMsg", "Something went wrong");
			response.sendRedirect("admin_login.jsp");
		}
	}

}
