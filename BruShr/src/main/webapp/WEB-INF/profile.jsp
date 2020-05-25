<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link
	href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700;900&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="resources/styles.css"></link>
</head>
<body>


	<%-- <p>${user.loginName}</p>
<p>${user.first_name}</p>
<p>${user.lastName}</p> --%>


	<div class="container-fluid">
		<div class="container">

			<div class="list-group list-group-flush mt-5">

				<div id="textbox" class=" border-bottom border-dark">
					<p class="alignleft">USERNAME: </p>
					<p class="alignright">${user.loginName}</p>
				
				</div>
				<div id="textbox" class=" border-bottom border-dark">
					<p class="alignleft">FIRST NAME</p>
					<p class="alignright">${user.firstName}</p>
				</div>
				<div id="textbox" class=" border-bottom border-dark">
					<p class="alignleft">LAST NAME</p>
					<p class="alignright">${user.lastName}</p>
				</div>

				<div style="clear: both;"></div>
			</div>

		</div>
	</div>


	<a href="updateProfile.do?userName=${user.loginName}"
		class="text-center btn btn-danger btn-lg btn-block mb-5 mt-5"
		role="button">Go To Edit User</a>
	<a href="index.do"
		class="text-center btn btn-primary btn-lg btn-block mb-5 mt-5"
		role="button">Go To See All The Beer Recipes</a>


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