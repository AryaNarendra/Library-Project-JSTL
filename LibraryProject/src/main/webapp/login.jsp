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
<sql:setDataSource var="conn"
		driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/dxclibrary"
		user="root"
		password="root" />
		
<c:set var="userName" value="${param.userName}" scope="session"/>
<c:set var="password" value="${param.password}" scope="session"/>
<sql:query var="searchAccount" dataSource="${conn}">
		SELECT * FROM LibUsers WHERE USERNAME=? AND PASSWORD=?
		<sql:param value="${userName}" />
		<sql:param value="${password}" />
	</sql:query>
<c:if test="${not empty searchAccount.rows}">
	<c:redirect url="menu.jsp" />
</c:if>
<c:if test="${empty searchAccount.rows}">
	<c:redirect url="login.html" />
</c:if>
</body>
</html>