<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
<h4>Welcome : <c:out value="${userName}" /></h4>

<form method="post" action="logout.jsp">
  <label>
  <input name="logout" type="submit" value="log out" />
  </label>
</form>
<br/><br/>
<table border="2" width="75%">
<tr align="center">
	<td><a href="accountDetails.jsp">Account Details</a></td>
	<td><a href="Issue.jsp">Search/Issue</a></td>
	<td><a href="return.jsp">Return</a></td>
	<td><a href="history.jsp">History</a></td>
</tr>
</table>
</body>
</html>
