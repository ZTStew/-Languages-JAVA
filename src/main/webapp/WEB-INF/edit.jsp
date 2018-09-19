<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Language</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>
	<form:form action="/languages/edit/${lang.id}" method="POST" modelAttribute="lang">
		<input type = "hidden" name = "_method" value = "put">
		
		<p><form:errors path="name"></form:errors></p>
		<p>
			<form:label path="name">Name: </form:label>
			<form:input path="name"></form:input>
		</p>
		
		
		<p><form:errors path="creator"></form:errors></p>
		<p>
			<form:label path="creator">Creator Name: </form:label>
			<form:input path="creator"></form:input>
		</p>
		
		
		<p><form:errors path="version"></form:errors></p>
		<p>
			<form:label path="version">Version: </form:label>
			<form:input path="version"></form:input>
		</p>
		
		
		<input type = "submit" value = "Edit"/>
	</form:form>
	
	<form action="/languages/delete/${lang.id}" method = "post" class = "dele">
		<input type = "hidden" name = "_method" value = "delete">
		<input type = "submit" value = "Delete Language">
    </form>
	<a href = "/languages">Desktop</a>

</body>
</html>