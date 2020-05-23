<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BrüShr</title>
</head>
<body>
This is the main view page


<c:forEach var="beer" items="${beers}">
			<c:if test="${not empty beer}">
				<div class="row">
					<div class="col-lg-8 col-md-10 mx-auto">
						<div class="post-preview">
							<a href="getBeer.do?bid=${beer.id}">
								<h2 class="post-title">${beer.beerName}</h2>
							</a>
							<p class="post-meta">${beer.beerType}</p>
							<hr>
						</div>
					</div>
				</div>
			</c:if>
		</c:forEach>
</body>
</html>