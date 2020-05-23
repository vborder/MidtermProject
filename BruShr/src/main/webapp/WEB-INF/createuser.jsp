<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="spreadsheet" href="resources/style.css"></link>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
	
<style>
body {
	background-color: red;
	color: #ff69b4;
	font-weight:900;
	font-size: 5em;
}
</style>
</head>

<body>
	<p class = "text-center">This is where you create a userAccount</p>

	<div class="container-fluid text-center">
		<div class = "contain">
			<form action="createAccount.do" method="POST">
				<div class="form-row">
				<!-- THIS NEEDS TO BE ADDED TO THE DATABASE SCHEMA -->
					<!-- <div class="form-group col-md-6">
						<label for="inputEmail4">Email</label> 
						<input type="text" class="form-control" name="loginName">
					</div> -->
					<input type="text" name="loginName"></input>
					<div class="form-group col-md-6">
						<label for="inputPassword4">Password</label> 
						<input type="password" name="password" class="form-control" id="inputPassword4"
							placeholder="Password">
					</div>
				</div>
<!-- 				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="inputCity">City</label> 
						<input type="text" class="form-control" id="inputCity">
					</div> -->
<!-- 					<div class="form-group col-md-4">
						<label for="inputState">State</label> 
						<select id="inputState" class="form-control">
							<option selected>Choose...</option>
							<option>...</option>
						</select>
					</div> -->
<!-- 					<div class="form-group col-md-2">
						<label for="inputZip">Zip</label> 
						<input type="text" class="form-control" id="inputZip">
					</div> -->
				</div>
				<button type="submit" class="btn btn-warning">Sign in</button>
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