<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Books Issued</title>
</head>
<body>
<c:import url="menu.jsp" />
<br/><br/>

<sql:setDataSource var="conn"
		driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/dxclibrary"
		user="root"
		password="root" />

	<h4>Books Issued : </h4>
	<c:forEach var="bookId" items="${paramValues.check}">
		<sql:update var="booksIssue" dataSource="${conn}">
			INSERT INTO TRANBOOK(Username,BookId) VALUES(?,?)
			<sql:param value="${userName}" />
			<sql:param value="${bookId}" />
		</sql:update>
		
		<c:out value="Book ID : ${bookId}" />
		<br/>
		
		<sql:update var="booksUpdate" dataSource="${conn}">
			Update Books set TotalBooks=TotalBooks-1 where Id=?
			<sql:param value="${bookId}" />
		</sql:update>
	</c:forEach>
</body>
</html>