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
						<c:if test="${sessionScope.user != null}">
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
							<ul>
								<li class="nav-item"><a class="nav-link" href="addBeer.do">Add
										Beer Recipe</a></li>
								<li><a class="nav-item" href="updateProfile.do">Update Profile ${sessionScope.user.loginName}</a></li>
									<li class="nav-item dropdown"><a class="text-white" href="logout.do">${sessionScope.user.loginName}
								Sign Out</a>
							</li>
							</ul>
							</c:when>
							
							<c:otherwise>
							<ul class="navbar-nav" style="flex-direction: row; padding-left: 15px;">
							<li class="nav-item active"><a class="nav-link"
							href="login.do"> Log in</a></li>
							</ul>
							</c:otherwise>
							
						</c:choose>
						<ul>	
						</li>
						<li class="nav-item active"><a class="nav-link"
							href="BeersByNameOrDescription.do"> Search Beer Recipe |</a></li>
						<li class="nav-item active"><a class="nav-link"
							href="about.do"> ABOUT</a></li>
							</ul>
				</div>
			</div>
		
		</nav>
	</header>


</body>
</html>