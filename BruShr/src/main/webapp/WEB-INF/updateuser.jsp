<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BrüShr | Update Profile</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link
	href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700;900&display=swap"
	rel="stylesheet">
<script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js"
	crossorigin="anonymous"></script>
</head>
<body>

	<div class="container-fluid">
	<div class="container">
		<div class="col-md-6 offset-md-3 mx-auto">
			<div class="card card-outline-secondary">
				<div class="card-body">
					<form action="updateProfile.do" class="form-horizontal"
						method="POST">
						<fieldset>
							<div>
								<h5 class="card-title text-center">Update Profile</h5>
									<p> ${user.firstName} </p>
									
									
							</div>
							<!-- loginName -->
							<div class="control-group">
								<label class="control-label" for="loginName">User name:
								</label> 
								
								 <input class="form-control" type="hidden" name="loginName"
									placeHolder="${sessionScope.user.loginName}" />
							</div>

							<!-- firstName -->
							<div class="control-group">
								<label class="control-label" for="firstName">First Name:
								</label>
								
									<input class="form-control" type="text" id="firstName" name="firstName" placholder="Enter First Name"
										value="${user.firstName}" />
								
							</div>

							<!-- lastName -->
							<div class="control-group">
								<label class="control-group" for="email">Last Name: </label>
								
									<input class="form-control" type="text" name="lastName"
										placeHolder="Enter Last Name" value="${user.lastName}" />
								
							</div>
							<!-- email -->
							<%-- <div class="control-group">
								<label class="control-group" for="email">Email: </label>
								<i class="glyphicon glyphicon-envelope"></i>
									<input class="form-control" type="text" id="email" name="email"
										placeHolder="Enter Email" value="${user.email}" required/>
							
							</div> --%>

							<!-- password -->
							<div class="control-group">
								<label class="control-label" for="password">Password: </label>
								
									<input class="form-control" type="password" name="password" placeholder="Enter Password"
										value="${sessionScope.user.password}" required/>
									<p><small>Password should be at least 6 characters</small></p>
									<input class="form-control" type="hidden" name="id" value="${user.id}" />
							
							</div>
							<!-- update.do -->
							<div class="conrol-group">
								<div class="controls"></div>
							</div>
							<input class="btn btn-success btn-block" type="submit" value="submit" />
						</fieldset>
					</form>
					</div>
				</div>
			</div>
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