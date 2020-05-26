<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Navigation -->
<%-- 	<p>${sessionScope.user}</p> --%>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="index.do">BrüShr</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<c:if test="${sessionScope.user == null }">
						<li><a class="btn btn-primary" href="login.do">Sign In</a></li>
						<li><a class="btn btn-success" href="createAccount.do">Create
								Account</a></li>
					</c:if>
					<li class="nav-item active"><a class="nav-link" href="#">Home |
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item active"><a class="nav-link"
						href="BeersByNameOrDescription.do"> Search Beer Recipe |</a></li>
					<li class="nav-item active"><a class="nav-link"
						href="about.do"> ABOUT</a></li>
						
					<c:if test="${sessionScope.user != null }">
						<li class="nav-item"><a class="nav-link" href="addBeer.do">Add
								Beer Recipe</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">My
								Account</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="updateProfile.do">Update
									Profile</a> <a class="dropdown-item" href="logout.do">Sign Out</a>
							</div></li>
					</c:if>
				</ul>
				<ul>
<%-- 					<c:if test="${sessionScope.user != null }">
						<li><a class="btn btn-success" href="logout.do">Sign Out</a></li>
					</c:if> --%>
				</ul>
			</div>
		</div>
	</nav>



</body>
</html>