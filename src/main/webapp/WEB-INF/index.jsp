<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Languages</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>
	<h1>Languages: </h1>
	
<table>
    <thead>
        <tr>
            <th>Name</th>
            <th>Creator</th>
            <th>Version</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${languages}" var="language">
        <tr>
            <td><a href = "languages/info/${language.id}"><c:out value="${language.name}"/></a></td>
            <td><c:out value="${language.creator}"/></td>
            <td><c:out value="${language.version}"/></td>
            <td>
            	<a href = "languages/edit/${language.id}">Edit</a> | 
            	<form action="/languages/delete/${language.id}" method = "post" class = "dele">
            		<input type = "hidden" name = "_method" value = "delete">
					<input type = "submit" value = "Delete Language">
            	</form>
            </td>
        </tr>
        </c:forEach>
    </tbody>
</table>

	<h1>Log A New Language:</h1>
	
	<form:form action="/languages/create" method="POST" modelAttribute="language">
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
		
		<input type = "submit" value = "Log Language"/>
	</form:form>
</body>
</html>