<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet"
	href=" https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="resources/styles.css"></link>

</head>
<body class="bg-light">

<%@ include file="navbar.jsp"%>
	<h1 class="text-center mt-5 mb-5 bg-info">BrüShr Login</h1>
	<div class="container-fluid mt-5">
		<div class="container mt-5 altfont">
			<form action="loginUser.do" method="POST">
				<div>
					<div class="form-row form-group ">
						<input type="text" placeholder="User Name" name="loginName"class="text-center form-control mb-5" ></input>
					</div>
					<div class="">
						<input type="password" name="password" class=" text-center form-control mb-5"
							id="inputPassword4" placeholder="Password"></input>
					</div>
				</div>
				<button type="submit" class="btn btn-primary btn-lg btn-block font-weight-bold text-dark text-center">Sign in</button>
			</form>
		</div>
	</div>


<%@ include file="footer.jsp"%> 
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>
</html>