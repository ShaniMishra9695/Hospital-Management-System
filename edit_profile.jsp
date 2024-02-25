<%@page import="com.hospital.entity.Specialist"%>
<%@page import="com.hospital.dao.DoctorDao"%>
<%@page import="com.hospital.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="com.hospital.db.DbConnect"%>
<%@page import="com.hospital.dao.SpecialistDao"%>
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

	<div class="container p-4">
		<div class="row">


			<div class="col-md-4">
				<div class="card paint-card">
					<p class="text-center fs-3">Change Password</p>
					<c:if test="${not empty errorMsg }">
						<p class="fs-4 text-center text-danger">${errorMsg }</p>
						<c:remove var="errorMsg" scope="session" />
					</c:if>

					<c:if test="${not empty succMsg }">
						<p class="fs-4 text-center text-danger">${succMsg }</p>
						<c:remove var="succMsg" scope="session" />
					</c:if>
					<div class="card-body">
						<form action="../doctChangePassword" method="post">
							<div class="mb-3">
								<label>Enter New Password</label><input type="text"
									name="newPassword" class="form-control" required>
							</div>

							<div class="mb-3">
								<label>Enter Old Password</label><input type="text"
									name="oldPassword" class="form-control" required>
							</div>
							<input type="hidden" value="${doctObj.id }" name="uid">
							<button class="btn btn-success col-md-12">Change
								Password</button>
						</form>
					</div>
				</div>
			</div>

			<div class="col-md-5 offset-md-2">
				<div class="card paint-card">
					<p class="text-center fs-3">Edit Profile</p>
					<c:if test="${not empty errorMsgd }">
						<p class="fs-4 text-center text-danger">${errorMsgd }</p>
						<c:remove var="errorMsgd" scope="session" />
					</c:if>

					<c:if test="${not empty succMsgd }">
						<p class="fs-4 text-center text-danger">${succMsgd }</p>
						<c:remove var="succMsgd" scope="session" />
					</c:if>
					<div class="card-body">
						<form action="../doctorUpdateProfile" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label><input type="text"
									value="${doctObj.fullName }" required name="fullname"
									class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">DOB</label><input type="date" required
									value="${doctObj.dob }" name="dob" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Qualification</label><input
									type="text" required name="qualification" class="form-control"
									value="${doctObj.qualification }">
							</div>

							<div class="mb-3">
								<label class="form-label">Specialist</label><select name="spec"
									required class="form-control">
									<option>${doctObj.specialist }</option>
									

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
									value="${doctObj.email }" readonly required name="email"
									class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Mob No</label><input type="text"
									value="${doctObj.mobNo }" required name="mobno"
									class="form-control">
							</div>

							<input type="hidden" name="id " value="${doctObj.id }">

							<button type="submit" class="btn btn-primary">Update</button>
						</form>


					</div>

				</div>

			</div>
		</div>
	</div>

</body>
</html>