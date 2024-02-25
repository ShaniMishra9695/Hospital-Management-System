<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <%@page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Login Page</title>
<%@include file="component/allcss.jsp" %>

</head>
<body>
<%@include file="component/navbar.jsp" %>

<c:if test="${not empty adminObj}">
<c:redirect url="../admin_login.jsp">
</c:redirect>
</c:if>

<style type="text/css">
 .paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0.3);
} 

/* *{
   margin: 0;
   padding: 0;
   box-sizing: border-box;
   font-family: 'Poppins', sans-serif;
}

.card-body{
    position: relative;
    width: 370px;
    height: 450px;
    background: #1c1c1c;
    border-radius: 50px 5px;
    overflow: hidden;
}
.card-body::before{
    content: '';
    position: absolute;
    top: -50%;
    left: -50%;
    width: 370px;
    height: 450px;
    background: linear-gradient(60deg,transparent,#45f3ff,#45f3ff);
    transform-origin: bottom right;
    animation: animate 6s linear infinite;

}
.card-body::after{
    content: '';
    position: absolute;
    top: -50%;
    left: -50%;
    width: 370px;
    height: 450px;
    background: linear-gradient(60deg,transparent,#d9138a,#d9138a);
    transform-origin: bottom right;
    animation: animate 6s linear infinite;
    animation-delay: -3s;
}
@keyframes animate
{
    0%
    {
        transform: rotate(0deg);
    }
    100%
    {
        transform: rotate(360deg);
    }
}

form
{
    position: absolute;
    inset: 2px;
    border-radius: 50px 5px;
    background: #28292d;
    z-index: 10;
    padding: 30px 30px;
    display: flex;
    flex-direction: column;
}

p class
{
 color: #45f3ff;
 font-size: 35px;
 font-weight: 500;
 text-align: center;
}

.inputBox
{
    position: relative;
    width: 300px;
    margin-top: 35px;

}
.inputBox input
{
    position: relative;
    width: 100%;
    padding: 20px 10px 10px;
    background: none;
    outline: none;
    color: #23242a;
    font-size: 1em;
    letter-spacing: 0.05em;
    z-index: 10;
}

/* .inputBox form-label
{
    position: absolute;
    left: 0;
    padding: 20px 10px 10px;
    font-size: 1em;
    color: #8f8f8f;
    pointer-events: none;
    letter-spacing: 0.05em;
    transition: 0.5s;
} */

/* button[type="submit"]
{
    font-size: 20px;
    border: none;
    outline: none;
    background: #45f3ff;
    padding: 5px;
    margin-top: 40px;
    border-radius: 90px;
    font-weight: 600;
    cursor: pointer;
}
input[type="submit"]:active
{
    background: linear-gradient(90deg,#45f3ff,#d9138a);
    opacity: 0.8;
} */
 */</style>

	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">Admin Login</p>

                         <c:if test="${not empty succMsg}">
                        <p class="text-center text-success fs-3">${succMsg}</p>
                        <c:remove var="succMsg" scope="session" />
                        </c:if>
                        
                        <c:if test="${not empty errorMsg}">
                        <p class="text-center text-danger fs-3">${errorMsg}</p>
                        <c:remove var="errorMsg" scope="session" />
                        </c:if>
						<%-- <c:if test="${not empty errorMsg}">
<p class="fs-4 text-center text-danger">${errorMsg}</p>
<c:remove var="errorMsg" scope="session" />
</c:if>
<c:if test="${not empty succMsg}">
<p class="fs-4 text-center text-danger">${succMsg}</p>
<c:remove var="succMsg" scope="session" />
</c:if> --%>

						<form action="adminLogin" method="post">
							<div class="mb-3">
								<label class="form-label">Email Address</label> <input required
									name="email" type="email" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Password</label> <input required
									name="password" type="password" class="form-control">
							</div>

							<button type="submit" class="btn bg-success text-white col-md-12">Login</button>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>