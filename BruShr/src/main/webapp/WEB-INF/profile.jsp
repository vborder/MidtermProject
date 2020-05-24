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
<p>${user.loginName}</p>
<p>${user.lastName}</p>

<a href="updateProfile.do?userName=${user.loginName}">EDIT ME</a>
</body>
</html>