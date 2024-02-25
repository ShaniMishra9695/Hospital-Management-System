<%@page import="com.hospital.db.DbConnect"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Index Page</title>
<%@include file="component/allcss.jsp"%>
</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<%-- <% Connection conn=DbConnect.getConn();
 out.print(conn);
%> --%>
	<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0.3);
}
</style>

	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="img/pexels-tom-fisk-1692693.jpg" class="d-block w-100"
					alt="..." height="800px">
			</div>
			<div class="carousel-item">
				<img src="img/pexels-thirdman-7659690.jpg" class="d-block w-100"
					alt="..." height="800px">
			</div>
			<div class="carousel-item">
				<img src="img/pexels-shvets-production-8413299.jpg"
					class="d-block w-100" alt="..." height="800px">
			</div>

			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>


		<div class="container p-3">
			<div class="card paint-card">
				<div class="card-body">
					<p class="text-center fs-2">Key Features of our Hospital</p>
                 </div>
             </div>
					<div class="row">
						<p class="col-md-8 p-5">
						<div class="row">
							<div class="col-md-6">
								<div class="card paint-card">
									<div class="card-body">
										<p class="fs-5">100% Safety</p>
										<p></p>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="card paint-card">
									<div class="card-body">
										<p class="fs-5">Clean Environment</p>
										<p></p>
									</div>
								</div>
							</div>
							<div class="col-md-6 mt-2">
								<div class="card paint-card">
									<div class="card-body">
										<p class="fs-5">Friendly Doctors</p>
										<p></p>
									</div>
								</div>
							</div>
							<div class="col-md-6 mt-2">
								<div class="card paint-card">
									<div class="card-body">
										<p class="fs-5">Medical Research</p>
										<p></p>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-4">
						<img alt="" src="img/pexels-zakir-rushanly-11661531(1).jpg">
					</div>

				</div>

				<hr>

				<div class="container p-2">
					<p class="text-center fs-2">Our Team</p>
					<div class="row">
						<div class="col-md-3">
							<div class="card paint-card">
								<div class="card-body text-center">
									<img src="img/pexels-cottonbro-studio-5867730.jpg"
										width="250px" height="300px">
									<p class="fw-bold fs-5">Shiva Kumar</p>
									<p class="fs-7">CEO & Chairman</p>
								</div>
							</div>
						</div>

						<div class="col-md-3">
							<div class="card paint-card">
								<div class="card-body text-center">
									<img src="img/pexels-cottonbro-studio-7583382.jpg"
										width="250px" height="300px">
									<p class="fw-bold fs-5">Dr.Samuani Simi</p>
									<p class="fs-7">(Chief Doctor)</p>
								</div>
							</div>
						</div>

						<div class="col-md-3">
							<div class="card paint-card">
								<div class="card-body text-center">
									<img src="img/pexels-thirdman-5327864.jpg" width="250px"
										height="300px">
									<p class="fw-bold fs-5">Dr.Niuise Paule</p>
									<p class="fs-7">(Chief Doctor)</p>
								</div>
							</div>
						</div>

						<div class="col-md-3">
							<div class="card paint-card">
								<div class="card-body text-center">
									<img src="img/pexels-tima-miroshnichenko-5407206.jpg"
										width="250px" height="300px">
									<p class="fw-bold fs-5">Dr.miroshnichenko</p>
									<p class="fs-7">(Chief Doctor)</p>
								</div>
							</div>
						</div>
					</div>
				</div>

				<%@include file="component/footer.jsp"%>
</body>
</html>