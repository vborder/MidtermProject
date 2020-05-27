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
<script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js"
	crossorigin="anonymous"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700;900&display=swap"
	rel="stylesheet">
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;700;800&display=swap')
	;
</style>
<link rel="stylesheet" type="text/css" href="resources/styles.css"></link>
</head>
<body>
	<!-- Navigation -->
	<%@ include file="navbar.jsp"%>


	<!-- Page Content -->
	<div class="container-fluid">
		<div class="container">

			<form action="search.do" class="text-center" method="GET">
				<input type="text"  id = "searchbar"   name="search" class="mr-3 cardshadow text-center bg-light"
					placeholder="search your beers here" /> <input type="submit"
					class="btn btn-info border border-dark rounded-0" value="S U B M I T" />

			</form>
			<!-- CAROUSEL -->
			<!-- <div class="container"> -->
				<div id="carouselExampleIndicators" class="carousel slide my-4"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carouselExampleIndicators" data-slide-to="0"
							class="active"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="5"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="6"></li>
					</ol>
					<div class="carousel-inner" role="listbox">
						<div class="carousel-item active">
							<img class="d-block img-fluid"
								src="resources/media/beer1.jpg"
								alt="First slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid"
								src="resources/media/beer2.jpg"
								alt="Second slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid"
								src="resources/media/beer3.jpg"
								alt="Third slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid"
								src="resources/media/beer4.jpg"
								alt="Fourth slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid"
								src="resources/media/beer5.jpg"
								alt="Fifth slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid"
								src="resources/media/beer6.jpg"
								alt="Sixth slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid"
								src="resources/media/beer7.jpg"
								alt="Seventh slide">
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
				<!-- </div> -->
			</div>
			<div class="row">
				<c:forEach var="beer" items="${beers}">
					<c:if test="${not empty beer and beer.enabled == true}">
						<div class="col-lg-4 col-md-6 mb-4">
							<div class="card h-100 cardshadow">
								<!-- <h2 class="text-center">Beer Recipe</h2> -->
								<img src="${beer.imgUrl }" class="card-img-top"
									alt="beer glass in hand">
								<div class="card-body text-center">
									<a href="getBeerById.do?id=${beer.id}">
										<h2 class="post-title alert alert-secondary">${beer.beerName}</h2>
										<p class="card-text">${beer.updatedAt}</p>
									</a>
									<p class="card-text">${beer.beerType}</p>
									<%-- <p class="card-text">${beer.yeast}</p> --%>
									<!-- <div class="card-footer pt-5 mt-5">
										<small class="text-muted">&#9733; &#9733; &#9733;
											&#9733; &#9734;</small>
									</div> -->
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