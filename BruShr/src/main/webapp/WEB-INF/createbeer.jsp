<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Beer</title>
<link rel="stylesheet"
	href=" https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<link rel="stylesheet" href="resources/media/style.css" type="text/css">
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<br>
	<br>
	<div class="container-fluid">
		<div class="col-md-6 offset-md-3">
			<div class="card card-outline-secondary">
				<div class="card-body">
					<h5 class="text-center">Add Beer Recipe</h5>
					<form action="addBeer.do" class="form" role="form" method="POST">
						<div class="form-group">
							<div class="input-group-prepend">
								<label class="input-group-text" for="inputGroupSelect01">Name</label>
							<input type="text" placeholder="Enter Name" name="beerName"
								autocomplete="off" required />
							</div>
						</div>
						<!-- <div class="form-group">
						<label>Beer Recipe Type: <input type="text"
							placeholder="Enter Type of Beer" name="beerType"
							autocomplete="off" />
						</label>
					</div> -->

						<div class="input-group mb-auto">
							<div class="input-group-prepend">
								<label class="input-group-text col-md-12"
									for="inputGroupSelect01" name="beerType">Beer type</label>
							</div>

							<select class="selectpicker" data-width="auto"
								id="inputGroupSelect01">
								<option selected>Choose one of the following types</option>
								<option value="1">Brown Ale</option>
								<option value="2">Dark Lager</option>
								<option value="3">India Pale Ale</option>
							</select>
						</div>
						<br>
						<div class="input-group mb-auto">
							<div class="input-group-prepend">
								<label class="input-group-text col-md-12" for="inputGroupSelect01" name="yeast">Yeast</label>
							</div>
							<select class="selectpicker" data-width="auto"
								id="inputGroupSelect01">
								<option selected>Choose one of the following types</option>
								<option value="1">Ale</option>
								<option value="2">Lager</option>
							</select>
						</div>
						<div class="form-group">
						<div class="col-sm-9">
							<label class="input-group-text col-md-12" name="description">Description: </label><textarea class="form-control"
									type="text" placeholder="Enter Description" name="description"
									rows="4" columns="140" autocomplete="off"></textarea>
						</div>
						</div>

						<br> <input type="hidden" name="user_id"
							value="${sessionScope.user.id}">
						<button type="submit" class="btn btn-success text-center">Add
							Beer Recipe</button>
					</form>
				</div>
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