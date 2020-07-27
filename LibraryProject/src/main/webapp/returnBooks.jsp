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
<c:import url="menu.jsp" />


	<sql:setDataSource var="conn"
			driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/dxclibrary"
			user="root"
			password="root" />

	<h4>Books Returned : </h4>
	<c:forEach var="bookIds" items="${paramValues.checkReturn}">
		<sql:query var="bookIssueDate" dataSource="${conn}">
			SELECT * FROM TRANBOOK WHERE USERNAME=? AND BOOKID=?
			<sql:param value="${userName}" />
			<sql:param value="${bookIds}" />
		</sql:query>
		
	<c:forEach var="BID" items="${bookIssueDate.rows}">
	<c:set var="date" value="${BID.Fromdate}" />
		<sql:update var="booksReturn" dataSource="${conn}">
			INSERT INTO TRANSRETURN(Username,BookId,Fromdate) VALUES(?,?,?)
			<sql:param value="${userName}" />
			<sql:param value="${bookIds}" />
			<sql:dateParam value="${date}"/>
		</sql:update>
		
		<sql:update var=" deleteIssue" dataSource="${conn}">
			DELETE FROM TRANBOOK WHERE USERNAME=? AND BOOKID=?
			<sql:param value="${userName}" />
			<sql:param value="${bookIds}" />
		</sql:update>
		
		</c:forEach>
		<c:out value="Book ID : ${bookIds}" /><br/>
		
		<sql:update var="booksUpdate" dataSource="${conn}">
			Update Books set TotalBooks=TotalBooks+1 where Id=?
			<sql:param value="${bookIds}" />
		</sql:update>
	</c:forEach>



</body>
</html>