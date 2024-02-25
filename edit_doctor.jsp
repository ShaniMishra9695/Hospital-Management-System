<%@page import="com.hospital.dao.SpecialistDao"%>
<%@page import="com.hospital.entity.Specialist"%>
<%@page import="com.hospital.dao.DoctorDao"%>
<%@page import="com.hospital.db.DbConnect"%>
<%@page import="com.hospital.entity.Doctor"%>
<%@ page import = "java.util.List" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<div class="container-fluid p-3">
		<div class="row">

			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Edit Doctor</p>
						<c:if test="${not empty errorMsg}">
							<p class="fs-3 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						
						<%
						int id=Integer.parseInt(request.getParameter("id"));
						DoctorDao dao2=new DoctorDao(DbConnect.getConn()); 
						//dao2.getDoctorById(id);
						Doctor d=dao2.getDoctorById(id);
						
						%>
						<form action="../updateDoctor" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label><input type="text"
									value="<%=d.getFullName() %>" required name="fullname" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">DOB</label><input type="date" required
									value="<%=d.getDob() %>" name="dob" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Qualification</label><input
									type="text" required name="qualification" value="<%=d.getQualification() %>" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Specialist</label><select name="spec"
									value="<%=d.getSpecialist() %>" required class="form-control">
									<option>---select---</option>
									<!-- <option>Dermatologist</option>
									<option>Dentist</option> -->

									<%
										SpecialistDao dao = new SpecialistDao(DbConnect.getConn());
										List<Specialist> list = dao.getAllSpecialist();
										for (Specialist s : list) {
									%>
									<option><%=s.getSpecialistName()%></option>
									<%
									}
									%>


								</select>
							</div>

							<div class="mb-3">
								<label class="form-label">Email</label><input type="text"
									value="<%=d.getEmail() %>" required name="email" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Mob No</label><input type="text"
									value="<%=d.getMobNo() %>" required name="mobno" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Password</label><input type="password"
									value="<%=d.getPassword() %>" required name="password" class="form-control">
							</div>
							
							<input type="hidden" name="id" value="<%=d.getId() %>">
							
							<button type="submit" class="btn btn-primary col-md-12">Update</button>
							
						</form>
					</div>

				</div>


			</div>

		
		</div>

	</div>
</body>
</html>