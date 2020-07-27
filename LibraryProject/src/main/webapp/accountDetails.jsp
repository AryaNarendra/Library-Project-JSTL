<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Account Details</title>
</head>
<body>
<c:import url="menu.jsp" />
<br/><br/>

<sql:setDataSource var="conn"
		driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/dxclibrary"
		user="root"
		password="root" />

<sql:query var="accountDetails" dataSource="${conn}">
	SELECT * FROM TRANBOOK, BOOKS WHERE USERNAME=? AND TRANBOOK.BOOKID = BOOKS.ID
	<sql:param value="${userName}" />
</sql:query>
<table border="2">
<tr>
	<th>Book Id</th>
	<th>Book Name</th>
	<th>Author</th>
	<th>From Date</th>
</tr>
<c:forEach var="uD" items="${accountDetails.rows}">
<tr>
	<td><c:out value="${uD.BookId}" /></td>
	<td><c:out value="${uD.Name}" /></td>
	<td><c:out value="${uD.Author}" /></td>
	<td><c:out value="${uD.Fromdate}" /></td>
</tr>
</c:forEach>
</table>
</body>
</html>