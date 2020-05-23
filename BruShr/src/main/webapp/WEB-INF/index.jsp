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

	<c:forEach var="beer" items="${beers}">
		<c:if test="${not empty beer}">
			<div class="container">
				

				<div class="card" style="width: 18rem;">
				<h2>Beer Recipe</h2>
					<img
						src="src="https://s3-us-west-2.amazonaws.com/homebrewassoc/wp-content/uploads/pressure-drop-smokey-brown-400x400.jpg"
						class="card-img-top" alt="beer glass in hand"
						style="height: 200px; width: 200px;">
					<div class="card-body">
						<a href="getBeerById.do?id=${beer.id}">
							<h2 class="post-title">${beer.beerName}</h2>
							<p class="card-text">${beer.updatedAt}</p>
						</a>

						<p class="card-text">${beer.beerType}</p>
						<p class="card-text">${beer.yeast}</p>
						<p class="card-text">${beer.description}</p>

						
					</div>
				</div>
			</div>
		</c:if>
	</c:forEach>




<div class="container">
<a href="addBeer.do">Add New Beer Recipe</a>
</div>



	<%-- <c:forEach var="beer" items="${beers}">
		<c:if test="${not empty beer}">
			<div class="row">
				<div class="col-lg-8 col-md-10 mx-auto">
					<div class="post-preview">
						<a href="getBeerById.do?id=${beer.id}">
							<h2 class="post-title">${beer.beerName}</h2>
						</a>
						<p class="post-meta">${beer.beerType}</p>

						<hr>
					</div>
				</div>
			</div>
		</c:if>
	</c:forEach> --%>


	<br>
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