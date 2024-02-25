<%@page import="com.hospital.dao.AppointmentDao"%>
<%@page import="com.hospital.entity.Appointment"%>
<%@ page import="java.util.List"%>
<%@page import="com.hospital.db.DbConnect"%>
<%@page import="com.hospital.dao.DoctorDao"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
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

.backImg {
	background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
		url("img/pexels-tom-fisk-1692693.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
</head>
<body>
	<c:if test="${empty doctObj}">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>

	<%@include file="navbar.jsp"%>

	<div class="container-fluid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	<div class="container p-3">
		<div class="row">

			<div class="col-md-6 offset-md-3">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">Patient Comment</p>

                       <c:if test="${not empty errorMsg}">
					<p class="fs-3 text-center text-danger">${errorMsg}</p>
					<c:remove var="errorMsg" scope="session" />
				</c:if>
				<c:if test="${not empty succMsg}">
					<div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
					<c:remove var="succMsg" scope="session" />
				</c:if>
						<%
							int id = Integer.parseInt(request.getParameter("id"));
							AppointmentDao dao = new AppointmentDao(DbConnect.getConn());

							Appointment ap = dao.getAppointmentById(id);
						%>

						<form class="row" action="../updateStatus" method="post">
							<div class="col-md-6">
								<label>Patient Name</label><input type="text" readonly value="<%=ap.getFullName()%>"
									 class="form-control">
							</div>

							<div class="col-md-6">
								 <label>Age</label><input type="text" readonly value="<%=ap.getAge()%>"
									 class="form-control">
							</div>

							<div class="col-md-6">
								<br> <label>Mob No</label><input type="text" readonly value="<%=ap.getPhNo()%>"
									 class="form-control">
							</div>

							<div class="col-md-6">
								<br> <label>Diseases</label><input type="text" readonly value="<%=ap.getDiseases()%>"
									 class="form-control">
							</div>

							<div class="col-md-12">
								<br> <label>Comment</label>
								<textarea required name="comm" row="3" class="form-control"
									cols=""></textarea>
							</div>
							
							<input type="hidden" name="id" value="<%=ap.getId()%>">
							<input type="hidden" name="did" value="<%=ap.getDoctorId()%>">

							<button class="mt-3 btn btn-primary col-md-6 offset-md-3">Submit</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>