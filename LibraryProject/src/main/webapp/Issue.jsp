<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search/Issue Books</title>
</head>
<body>
<c:import url="menu.jsp" />
<br/><br/>
Select Search Criteria
<form method="get" action="search.jsp">
<table>
	<tr><td><input type="radio" name="criteria" value="1" />By Book ID</td></tr>
	<tr><td><input type="radio" name="criteria" value="2" />By Department</td></tr>
	<tr><td><input type="radio" name="criteria" value="3" />By Book Name</td></tr>
	<tr><td><input type="radio" name="criteria" value="4" />By Author Name</td></tr>
	<tr><td><input type="radio" name="criteria" value="5" />By Books</td></tr>
	<tr><td>Insert Search Value <input type="text" name="criterion" /></td></tr>
	<tr><td><input type="submit" value="Search" /></td></tr>
</table>
</form>
</body>
</html>