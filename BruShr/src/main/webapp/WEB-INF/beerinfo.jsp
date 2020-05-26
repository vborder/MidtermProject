<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href=" https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js"
	crossorigin="anonymous"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700;900&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="resources/styles.css"></link>
</head>
<body>

	<%@ include file="navbar.jsp"%>


	<div class="card mt-5 ml-5 text-center bg-light mx-auto "
		style="width: 50rem;">
		<img class="card-img-top" src="resources/media/EspressoStout.jpg"
			alt="Card image cap">
		<div class="card-body">

			<hr>
			<h2>
				<strong>Beer Name: ${beer.beerName}</strong>
			</h2>
			<hr>
			<h3>
				<strong>Beer Type: ${beer.beerType}</strong>
			</h3>
			<hr>
			<h3>
				<strong>Beer Yeast: ${beer.yeast}</strong>
			</h3>
			<hr>
			<p>
				<strong>Beer Description</strong>
			</p>
			<p class="text-lowercase">${beer.description}</p>

			<div class="changetext mb-5">
				<a href="index.do" class="changetext">HOME</a> <a
					href="updateBeer.do?id=${beer.id}" class="changetext">EDIT</a> <a
					href="deleteBeer.do?id=${beer.id}" class="changetext">DELETE</a>
			</div>
		</div>

	</div>




	<div class="container-fluid mt-5 mb-5 border border-danger" style="width: 50rem;">
		<div class=" container list-unstyled ">
		
		
			<c:forEach var="comment" items="${beer.comments}">
				<c:if test="${not empty beer.comments}">
				
				
					<div class="media-body">
						<h3 class="mt-0 mb-1">${comment.user.firstName}  ${comment.user.lastName} </h3>
						<p>${comment.content}</p>
					</div>

				</c:if>
			</c:forEach>

		</div>
	</div>




	<%-- <c:forEach var="beer" items="${beers}">
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
				</c:forEach> --%>


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


