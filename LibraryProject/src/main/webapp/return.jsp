<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<c:import url="menu.jsp" />>
<br/><br/>

<sql:setDataSource var="conn"
		driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/dxclibrary"
		user="root"
		password="root" />

<form action="returnBooks.jsp" method="post">
	<sql:query var="getId" dataSource="${conn}">
			SELECT * FROM TRANBOOK WHERE USERNAME=?
			<sql:param value="${userName}" />
	</sql:query>
<table border="2">
	<tr>
			<th>Id</th>
			<th>Name</th>
			<th>Author</th>
			<th>Edition</th>
			<th>Department</th>
			<th>Select</th>
	</tr>		
		<c:forEach var="Id" items="${getId.rows}">
		<c:set var="Book" value="${Id.BookId}" />


	<sql:query var="Ids" dataSource="${conn}">
		SELECT * FROM BOOKS WHERE ID=?
		<sql:param value="${Book}" />
	</sql:query>

<c:forEach var="uR" items="${Ids.rows}">
	<tr>
			<td><c:out value="${uR.ID}" /></td>
			<td><c:out value="${uR.Name}" /></td>
			<td><c:out value="${uR.Author}" /></td>
			<td><c:out value="${uR.Edition}" /></td>
			<td><c:out value="${uR.Dept}" /></td>            
			<td><input type="checkbox" name="checkReturn" value="${uR.ID}" /></td>
	</tr>

</c:forEach>
</c:forEach>
	<tr></tr><tr>
			<td colspan="7" align="center"><input type="submit" value="Return Books"></td>
	</tr><tr></tr>
</table>
</form>	
</body>
</html>