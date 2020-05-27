<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BrüShr | Developers</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link
	href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700;900&display=swap"
	rel="stylesheet">
<script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js"
	crossorigin="anonymous"></script>
	<link rel="stylesheet" type="text/css" href="resources/styles.css"></link>
</head>
<body>
<%@ include file="navbar.jsp"%>
<br>
	<br>
<div class="container-fluid">
<div class="container">
	<!-- Portfolio Section-->
	<section class="page-section portfolio" id="portfolio">
		<div class="container">
			<!-- Portfolio Section Heading-->
			<h2 class="page-section-heading text-center text-uppercase text-secondary mb-0"><a href="index.do">BrüShr</a></h2>
			<!-- Icon Divider-->
			<div class="divider-custom">
				<div class="divider-custom-line"></div>
				
				<div class="divider-custom-line"></div>
			</div>
			<div class="row">
				<div class="col-sm-12 col-md-6 col-lg-3">
					<!--Card-->
					<div class="card hoverable">

						<!--Card image-->
						<img class="img-fluid"
							src="https://images.unsplash.com/photo-1438557068880-c5f474830377?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1053&q=80"
							alt="cheers">

						<!--Card content-->
						<div class="card-body">
							<!--Title-->
							<h4 class="card-title"><a href="" target="_blank">Darin Thompson</a></h4>
							<!--Text-->
							<p class="card-text">Dignissimmorbi rhoncus sed netus ligula
								conseque netus nulla aliquat id dui fermentumnec.</p>
						</div>

					</div>
					<!--/.Card-->
				</div>
				<div class="col-sm-12 col-md-6 col-lg-3">
					<!--Card-->
					<div class="card hoverable">

						<!--Card image-->
						<img
							src="https://images.unsplash.com/photo-1495399396117-a3763646f854?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80"
							class="img-fluid" alt="cheers">

						<!--Card content-->
						<div class="card-body">
							<!--Title-->
							<h4 class="card-title text-center"><a href="" target="_blank">Michael Degginger</a></h4>
							<!--Text-->
							<p class="card-text">Dignissimmorbi rhoncus sed netus ligula
								conseque netus nulla aliquat id dui fermentumnec.</p>
						</div>

					</div>
					<!--/.Card-->
				</div>
				<div class="col-sm-12 col-md-6 col-lg-3">
					<!--Card-->
					<div class="card hoverable">

						<!--Card image-->
						<img
							src="https://images.unsplash.com/photo-1580397581145-cdb6a35b7d3f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1188&q=80"
							class="img-fluid" alt="cheers">

						<!--Card content-->
						<div class="card-body">
							<!--Title-->
							<h4 class="card-title text-center"><a href="" target="_blank">Vincent Borden</a></h4>
							<!--Text-->
							<p class="card-text">Dignissimmorbi rhoncus sed netus ligula
								conseque netus nulla aliquat id dui fermentumnec.</p>
						</div>

					</div>
					<!--/.Card-->
				</div>
				<div class="col-sm-12 col-md-6 col-lg-3">
					<!--Card-->
					<div class="card hoverable">

						<!--Card image-->
						<img
							src="https://images.unsplash.com/photo-1429962714451-bb934ecdc4ec?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80"
							class="img-fluid" alt="cheers">

						<!--Card content-->
						<div class="card-body">
							<!--Title-->
							<h4 class="card-title text-center"><a href="https://www.linkedin.com/in/yettsy-jo-knapp/" target="_blank">Yettsy Knapp</a></h4>
							<!--Text-->
							<p class="card-text">Java Software Developer.</p>
						</div>

					</div>
					<!--/.Card-->
				</div>
			</div>
		</div>
	</section>
</div>
</div>

	<%@ include file="footer.jsp"%>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>
</body>
</html>