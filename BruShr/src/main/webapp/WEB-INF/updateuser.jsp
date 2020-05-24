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

<p> THIS IS WHERE YOU UPDATE YOUR USER PROFILE</p>
<p>${user.id}</p>

<form action="updateProfile.do" method="POST">
	<input type="text" name="firstName" placeHolder="${user.firstName}" />
	<input type="text" name="lastName" placeHolder="${user.lastName}" />
	<input type="text" name="loginName" placeHolder="${sessionScope.user.loginName}"/>
	<input type = "hidden" name="password" value="${sessionScope.user.password}"/>
	<input type = "hidden" name="id" value="${user.id}"/>
	<input type="submit" value="submit" /> 
</form>
</body>
</html>