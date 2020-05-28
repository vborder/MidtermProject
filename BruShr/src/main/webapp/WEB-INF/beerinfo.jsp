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

		<c:choose>
			<c:when test="${beer.imgUrl == null }">
				<img src="resources/media/beer1.jpg" class="card-img-top"
					alt="beer glass in hand">
			</c:when>
			<c:otherwise>
				<img src="${beer.imgUrl }" class="card-img-top"
					alt="beer glass in hand">
			</c:otherwise>
		</c:choose>
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
			<p class="altfont text-lowercase">${beer.description}</p>

			<div class="changetext mb-5">
				<c:if test="${beer.id != null and user.id == beer.user.id}">
				<a href="index.do" class="changetext">HOME</a> <a
					href="updateBeer.do?id=${beer.id}" class="changetext">EDIT</a> <a
					href="deleteBeer.do?id=${beer.id}" class="changetext">DELETE</a>
				</c:if>
			</div>
		</div>

	</div>

	<div class="container-fluid mt-5">
		<div class="container">
			<form action="addComment.do" method="POST">
				<textarea rows="8" cols="50" name="content" placeholder="Comment"></textarea>
				<div id="center">
					<input type="hidden" name="beerId" value="${beer.id}"></input> <input
						type="submit" name="submit" value="Submit"
						class="altfont text-center btn btn-danger btn-lg mt-3"></input>

				</div>

			</form>
		</div>
	</div>





	<!-- user comments  -->

	<div class="container-fluid mt-5 mb-5 border border-danger mx-auto"
		style="width: 50rem;">
		<div class="altfont container list-unstyled ">


			<c:forEach var="comment" items="${beer.comments}">



				<div class="media-body">
					<h3 class="mt-0 mb-1">${comment.user.firstName}
						${comment.user.lastName}</h3>
					<p>${comment.content}</p>
				</div>


			</c:forEach>

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


