<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Navigation -->
	<%-- 	<p>${sessionScope.user}</p> --%>
	<header>
		<nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
			<div class="container">
				<a class="navbar-brand" href="index.do">BrüShr</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarResponsive" aria-controls="navbarResponsive"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="navbar-collapse collapse navbar-nav pull-right"
					id="collapsibleNavbar">
					<ul class="navbar-nav ml-auto">
						<c:if test="${sessionScope.user == null}">
							<li><a class="btn btn-primary" href="login.do">Sign In</a></li>
							<li><a class="btn btn-success" href="createAccount.do">Create
									Account</a></li>
							<li class="nav-item active"><a class="nav-link"
								href="index.do">Home | <span class="sr-only">(current)</span>
							</a>
						</c:if>
					</ul>

					<c:choose>
						<c:when test="${sessionScope.user != null }">
								<a class="nav-link" href="addBeer.do">Add
										Beer Recipe |</a>
								<a class="text-white" href="updateProfile.do">Update ${sessionScope.user.loginName} |</a>
								<a class="text-white" href="logout.do">${sessionScope.user.loginName} Sign Out |</a>
							
						</c:when>



						<c:otherwise>
							<ul class="navbar-nav">
								<li class="nav-item active"><a class="nav-link"
									href="login.do"> Log in |</a></li>
							</ul>
						</c:otherwise>
					</c:choose>
					
						
						<a class="nav-link"
							href="BeersByNameOrDescription.do"> Search Beer Recipe |</a>
						<a class="nav-link"
							href="about.do"> ABOUT</a>
					
				</div>
			</div>

		</nav>
	</header>


</body>
</html>