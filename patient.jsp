<%@page import="com.hospital.dao.AppointmentDao"%>
<%@page import="com.hospital.entity.Doctor"%>
<%@page import="com.hospital.entity.User"%>
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
</style>
</head>
<body>
	<c:if test="${empty doctObj}">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>

	<%@include file="navbar.jsp"%>
	<div class="col-md-12">
		<div class="card paint-card">
			<div class="card-body">
				<p class="fs-3 text-center">Patient Details</p>
				<c:if test="${not empty errorMsg}">
					<p class="fs-3 text-center text-danger">${errorMsg}</p>
					<c:remove var="errorMsg" scope="session" />
				</c:if>
				<c:if test="${not empty succMsg}">
					<div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
					<c:remove var="succMsg" scope="session" />
				</c:if>

				<table class="table">
					<thead>
						<tr>
							<th scope="col">Full Name</th>
							<th scope="col">Gender</th>
							<th scope="col">Age</th>
							<th scope="col">Appoint Date</th>
							<th scope="col">Email</th>
							<th scope="col">Mob No</th>
							<th scope="col">Diseases</th>
							<th scope="col">Status</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>

						<%
							Doctor d = (Doctor) session.getAttribute("doctObj");
							AppointmentDao dao = new AppointmentDao(DbConnect.getConn());
							List<Appointment> list = dao.getAllAppointmentByDoctorLogin(d.getId());
							for (Appointment ap : list) {
						%>
						<tr>
							<th><%=ap.getFullName()%></th>
							<td><%=ap.getGender()%></td>
							<td><%=ap.getAge()%></td>
							<td><%=ap.getAppointDate()%></td>
							<td><%=ap.getEmail()%></td>
							<td><%=ap.getPhNo()%></td>
							<td><%=ap.getDiseases()%></td>
							<td><%=ap.getStatus()%></td>
							<td>
								<%
									if ("Pending".equals(ap.getStatus())) {
								%> <a href="comment.jsp?id=<%=ap.getId()%>"
								class="btn btn-success btn-sm">Comment</a> <%
 	} else {
 %> <a href="#" class="btn btn-success btn-sm disabled">Comment</a> <%
 	}
 %>

							</td>
						</tr>
						<%
							}
						%>




					</tbody>
				</table>
			</div>
		</div>
	</div>


</body>
</html>