<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="resources/style.css"></link>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link
	href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700;900&display=swap"
	rel="stylesheet">

<style>
/* body {
	background-color: red;
	color: #ff69b4;
	font-weight: 900;
	font-size: 5em;
} */
</style>
</head>

<body>
	<h1 class="text-center bg-danger mt-5 mb-5">This is where you create a userAccount</h1>

	<div class="container-fluid text-center col-lg-8 align-self-baseline pb-5 pt-3 bg-info">
		<div class="contain">
			<form action="createBeer.do" method="POST">
						<div class="form-group">
							<label class="text-white-75 font-weight-light"
								for="exampleFormControlTextarea1">First Name</label> <input
								type="text" class="form-control" id="exampleFormControlInput1"
								 name="firstName" placeholder="First Name">
						</div>
						<div class="form-group">
							<label class="text-white-75 font-weight-light"
								for="exampleFormControlTextarea1">Last Name</label> <input
								class="form-control" font-weight-light" type="text"
								class="form-control" id="Brewery" placeholder="Last Name"
								 name="lastName">
						</div>
						<div class="form-group">
							<label class="text-white-75 font-weight-light"
								for="exampleFormControlTextarea1">User Name</label> <input
								type="text" class="form-control" id="exampleFormControlInput1"
								placeholder="User Name"  name="loginName">
						</div>
						<div class="form-group">
							<label class="text-white-75 font-weight-light"
								for="exampleFormControlTextarea1">Email</label> <input
								type="text" class="form-control" id="exampleFormControlInput1"
								placeholder="Email"  name="email">
						</div>
						<div class="form-group">
							<label class="text-white-75 font-weight-light"
								for="exampleFormControlTextarea1">Password</label>
							<input class="form-control" id="exampleFormControlTextarea1"
								placeholder="Password"  name="password"></input>
						</div>
						<button class="btn btn-dark mt-3" type = "submit">Submit</button>
			</form>
		</div>
	</div>



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