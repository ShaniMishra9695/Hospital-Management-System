package com.hospital.adminServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hospital.entity.User;

@WebServlet("/adminLogin")
public class AdminLogin extends HttpServlet {
	
       
   	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			
			
			HttpSession session=request.getSession();
			
			if("admin@gmail.com".equals(email) && "admin".equals(password)){
				session.setAttribute("adminObj", new User());
				response.sendRedirect("admin/index.jsp");
			}else{
				session.setAttribute("errorMsg", "Invalid email and password ");
				response.sendRedirect("admin_login.jsp");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
