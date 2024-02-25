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
import com.hospital.entity.User;

@WebServlet("/user_register")
public class UserRegister extends HttpServlet {
	
	
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			try{
				String fullName=request.getParameter("fullname");
				String email=request.getParameter("email");
				String password=request.getParameter("password");
				
				User u = new User(fullName, email, password);
				
				UserDao dao = new UserDao(DbConnect.getConn());
				
				HttpSession session=request.getSession();
				
				boolean f=dao.UserRegister(u);
				
				if(f){
					session.setAttribute("sucMsg","Register Successfully");
					response.sendRedirect("signup.jsp");
				}else{
					session.setAttribute("errorMsg","Something went wrong");
					response.sendRedirect("signup.jsp");
				}
			}catch(Exception e){
				e.printStackTrace();
			}
	}

}
