<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>History</title>
</head>
<body>
<c:import url="menu.jsp" />
<br/><br/>
<sql:setDataSource var="conn"
		driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/dxclibrary"
		user="root"
		password="root" />

<sql:query var="history" dataSource="${conn}">
	SELECT * FROM TRANSRETURN, BOOKS WHERE USERNAME=? AND TRANSRETURN.BOOKID = BOOKS.ID
	<sql:param value="${userName}" />
</sql:query>
<table border="2">
<tr>
	<th>Book Id</th>
	<th>Book Name</th>
	<th>Author</th>
	<th>From Date</th>
	<th>To Date</th>
</tr>
<c:forEach var="uh" items="${history.rows}">
<tr>
	<td><c:out value="${uh.BookId}" /></td>
	<td><c:out value="${uh.Name}" /></td>
	<td><c:out value="${uh.Author}" /></td>
	<td><c:out value="${uh.Fromdate}" /></td>
	<td><c:out value="${uh.Todate}" /></td>
</tr>
</c:forEach>
</table>
</body>
</html>