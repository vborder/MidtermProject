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
	
		<div class="container">
			<div class="row">
				<h5>Add Beer Recipe</h5>
				<form action="addBeer.do" method="POST">
					<div class="form-group">
						<label>Name: <input type="text" placeholder="Enter Name"
							name="beerName" autocomplete="off" />
						</label>
					</div>
					<div class="form-group">
						<label>Beer Recipe Type: <input type="text" placeholder="Enter Type of Beer"
							name="beerType" autocomplete="off"/>
						</label>
					</div>
					<div class="form-group">
						<label>Description: <textarea class="form-control" type="text" placeholder="Enter Description"
							name="description" rows="3" autocomplete="off"></textarea>
						</label>
					</div>
					
					<br>
					<input type="hidden" name = "user_id" value = "${sessionScope.user.id}">
					<button type="submit" class="btn btn-success text-center">Add
						Beer Recipe</button>
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