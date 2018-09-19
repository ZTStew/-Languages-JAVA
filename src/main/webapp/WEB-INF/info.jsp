<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Language Info</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>
	<h1><c:out value = "${lang.name}" /></h1>
	<p>Creator: <c:out value = "${lang.creator}" /></p>
	<p>Version: <c:out value = "${lang.version}" /></p>
	<a href = "/languages">Desktop</a>
	<a href = "/languages/edit/${lang.id}">Edit</a>
	<form action="/languages/delete/${lang.id}" method = "post" class = "dele">
        <input type = "hidden" name = "_method" value = "delete">
		<input type = "submit" value = "Delete Language">
	</form>

</body>
</html>