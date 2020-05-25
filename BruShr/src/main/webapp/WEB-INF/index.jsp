<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BrüShr | Beer Recipes</title>
<link rel="stylesheet"
	href=" https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
</head>
<body>
	<!-- Navigation -->
	<p>${sessionScope.user}</p>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="index.do">BrüShr</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<c:if test="${sessionScope.user == null }">
						<li><a class="btn btn-primary" href="login.do">Sign In</a></li>
						<li><a class="btn btn-success" href="createAccount.do">Create
								Account</a></li>
					</c:if>
					<li class="nav-item active"><a class="nav-link" href="#">Home |
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item active"><a class="nav-link"
						href="BeersByNameOrDescription.do"> Search Beer Recipe |</a></li>
					<li class="nav-item active"><a class="nav-link"
						href="about.do"> ABOUT</a></li>
					<c:if test="${sessionScope.user != null }">
						<li class="nav-item"><a class="nav-link" href="addBeer.do">Add
								Beer Recipe</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">My
								Account</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="updateProfile.do">Update
									Profile</a> <a class="dropdown-item" href="logout.do">Sign Out</a>
							</div></li>
					</c:if>
				</ul>
				<ul>
					<c:if test="${sessionScope.user != null }">
						<li><a class="btn btn-success" href="logout.do">Sign Out</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>


	<!-- Page Content -->
	<div class="container-fluid">
		<div class="container">
			<div id="carouselExampleIndicators" class="carousel slide my-4"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
				</ol>
				<div class="carousel-inner" role="listbox">
					<div class="carousel-item active">
						<img class="d-block img-fluid"
							src="https://images.unsplash.com/photo-1523567830207-96731740fa71?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1296&q=60"
							alt="First slide">
					</div>
					<div class="carousel-item">
						<img class="d-block img-fluid"
							src="https://images.unsplash.com/photo-1471421298428-1513ab720a8e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1296&q=60"
							alt="Second slide">
					</div>
					<div class="carousel-item">
						<img class="d-block img-fluid"
							src="https://images.unsplash.com/photo-1575367439058-6096bb9cf5e2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1296&q=60"
							alt="Third slide">
					</div>
					<div class="carousel-item">
						<img class="d-block img-fluid"
							src="https://images.unsplash.com/photo-1558642891-54be180ea339?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1296&q=60"
							alt="Fourth slide">
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleIndicators"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
			<div class="row">
				<c:forEach var="beer" items="${beers}">
					<c:if test="${not empty beer}">
						<div class="col-lg-4 col-md-6 mb-4">
							<div class="card h-100">
								<h2 class="text-center">Beer Recipe</h2>
								<img src="${beer.imgUrl }" class="card-img-top"
									alt="beer glass in hand">
								<div class="card-body text-center">
									<a href="getBeerById.do?id=${beer.id}">
										<h2 class="post-title">${beer.beerName}</h2>
										<p class="card-text">${beer.updatedAt}</p>
									</a>
									<p class="card-text">${beer.beerType}</p>
									<p class="card-text">${beer.yeast}</p>
									<div class="card-footer">
										<small class="text-muted">&#9733; &#9733; &#9733;
											&#9733; &#9734;</small>
									</div>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
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