<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Beer</title>
<link rel="stylesheet"
	href=" https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
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
	<hr>
	<br>
	<div class="container-fluid">
		<div class="container altfont">
			<div class="col-md-8 offset-md-3 mx-auto">
				<div class="card card-outline-secondary">
					<div class="card-body">
						<h5 class="text-center">Update Beer Recipe</h5>
						<br>
						<form action="updateBeer.do" class="form-horizontal" method="POST">
							<fieldset>
								<div>
									<!-- Beer Name -->
									<div class="control-group">
										<label class="control-label" for="beer name">Beer
											name:</label> <input type="hidden" id="id" name="id"
											value="${beer.id}"></input> <input class="form-control"
											type="text" id="beer name" value="${beer.beerName}"
											name="beerName" autocomplete="off" required />
									</div>
								</div>
								<br>
								<!-- Beer Type -->
								<div class="form group">
									<label for="beer type">Beer type: (Previously selected:
										${beer.beerType})</label> <select multiple class="form-control"
										id="beer type" value="${beer.beerType}" name="beerType">
										<option selected>${beer.beerType}</option>
										<option>Brown Ale</option>
										<option>Belgian-Style Ale</option>
										<option>Dark Lager</option>
										<option>German Bock</option>
										<option>Pale Ale</option>
										<option>Pale Lager and Pilsner</option>
										<option>Porter</option>
										<option>Specialty Beer</option>
										<option>Stout</option>
										<option>Wheat Beer</option>
										<option>Wild & Sour Ale</option>
									</select>
								</div>
								<br>
								<!-- Beer Yeast -->
								<div class="form-group">
									<label for="yeast">Yeast: (Previously selected:
										${beer.yeast})</label> <select class="form-control" id="yeast"
										value="${beer.yeast}" name="yeast">
										<!-- 	<option selected>Choose one of the following types</option> -->
										<option selected>${beer.yeast}</option>
										<option>Ale</option>
										<option>Lager</option>
									</select>
								</div>
								<!-- Beer Description -->
								<div class="form-group">
									<label for="description">Description:</label>
									<textarea class="form-control" type="text" id="description"
										value="${beer.description}" name="description" rows="6"
										columns="140" autocomplete="off">${beer.description}</textarea>
								</div>
								<br> <input type="hidden" name="user_id"
									value="${sessionScope.user.id}">
								<button type="submit" class="btn btn-success text-center">Update</button>
								<a button type="button" class="btn btn-secondary"
									href="index.do">Discard changes</a>
							</fieldset>
						</form>
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