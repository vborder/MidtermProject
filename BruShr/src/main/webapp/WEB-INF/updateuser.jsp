<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BrüShr | Update Profile</title>
<link rel="stylesheet"
	href=" https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js"
	crossorigin="anonymous"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700;900&display=swap"
	rel="stylesheet">
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;700;800&display=swap')
	;
</style>
<link rel="stylesheet" type="text/css" href="resources/styles.css"></link>
</head>
<body>
	<!-- Navigation -->
	<%@ include file="navbar.jsp"%>
	
	<!-- Page Content -->
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
									<p>Welcome, ${user.loginName}!</p>
									
									
							</div>
							<!-- loginName -->
							<div class="form-group">
								<label class="control-label" for="loginName">User Name:
								</label> 
								
								 <input class="form-control" type="loginName" name="loginName"
									placeHolder="${sessionScope.user.loginName}" autocomplete="off" required/>
							</div>

							<!-- firstName -->
							<div class="form-group">
								<label class="control-label" for="firstName">First Name:
								</label>
								
									<input class="form-control" type="text" id="firstName" name="firstName" placholder="Enter First Name"
										value="${user.firstName}" />
								
							</div>

							<!-- lastName -->
							<div class="form-group">
								<label class="control-label" for="email">Last Name: </label>
								
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
							<div class="form-group">
								<label class="control-label" for="password">Password: </label>
								
									<input class="form-control" type="password" name="password" placeholder="Enter Password"
										value="${sessionScope.user.password}" autocomplete="off" required/>
									<input class="form-control" type="hidden" name="id" value="${user.id}" />
							
							</div>
							<!-- update.do -->
							<div class="form-group">
								<div class="controls"></div>
							</div>
							<input class="btn btn-success btn-block" type="submit" value="Submit" />
						</fieldset>
					</form>
					</div>
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