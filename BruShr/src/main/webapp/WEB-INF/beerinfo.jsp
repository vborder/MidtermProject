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
This is the beer info


	<p>${beer.id}</p>
	<p>${beer.beerName}</p>
	<a href="updateBeer.do?id=${beer.id}">Edit Beer</a>
	<a href="deleteBeer.do?id=${beer.id}">DELETE Beer</a>
</body>
</html>