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

<c:set var="search" value="${param.criteria}" scope="session"/>
<c:set var="searchValue" value="${param.criterion}" scope="session"/>
<sql:setDataSource var="conn"
		driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/dxclibrary"
		user="root"
		password="root" />

<form action="issueBooks.jsp" method="get">
<c:if test="${search eq 1}">
<sql:query var="searchId" dataSource="${conn}">
	SELECT * FROM BOOKS WHERE ID=? AND ID NOT IN (SELECT BOOKID FROM TRANBOOK WHERE USERNAME=?)
	<sql:param value="${searchValue}" />
	<sql:param value="${userName}"/>
</sql:query>
<table border="2">
<tr>
	<th>Id</th>
	<th>Name</th>
	<th>Author</th>
	<th>Edition</th>
	<th>Department</th>
	<th>Total Books</th>
	<th>Select</th>
</tr>
<c:forEach var="u" items="${searchId.rows}">
<tr>
	<td><c:out value="${u.ID}" /></td>
	<td><c:out value="${u.Name}" /></td>
	<td><c:out value="${u.Author}" /></td>
	<td><c:out value="${u.Edition}" /></td>
	<td><c:out value="${u.Dept}" /></td>
	<td><c:out value="${u.TotalBooks}" /></td>
	<c:choose>
		<c:when test = "${u.TotalBooks <= 0}">            
			<td><input type="checkbox" name="check" value="${u.ID}" disabled="disabled" /></td>
		</c:when>
		<c:when test = "${u.TotalBooks > 0}">           
			<td><input type="checkbox" name="check" value="${u.ID}" /></td>
		</c:when>
	</c:choose>
</tr>

</c:forEach>
</table>
</c:if>

<c:if test="${search eq 2}">
<sql:query var="searchDept" dataSource="${conn}">
	SELECT * FROM BOOKS WHERE Dept=? AND ID NOT IN (SELECT BOOKID FROM TRANBOOK WHERE USERNAME=?)
	<sql:param value="${searchValue}" />
	<sql:param value="${userName}" />
</sql:query>
<table border="2">
<tr>
	<th>Id</th>
	<th>Name</th>
	<th>Author</th>
	<th>Edition</th>
	<th>Department</th>
	<th>Total Books</th>
	<th>Select</th>
</tr>
<c:forEach var="u" items="${searchDept.rows}">
<tr>
	<td><c:out value="${u.ID}" /></td>
	<td><c:out value="${u.Name}" /></td>
	<td><c:out value="${u.Author}" /></td>
	<td><c:out value="${u.Edition}" /></td>
	<td><c:out value="${u.Dept}" /></td>
	<td><c:out value="${u.TotalBooks}" /></td>
	<c:choose>
		<c:when test = "${u.TotalBooks <= 0}">            
			<td><input type="checkbox" name="check" value="${u.ID}" disabled="disabled" /></td>
		</c:when>
		<c:when test = "${u.TotalBooks > 0}">          
			<td><input type="checkbox" name="check" value="${u.ID}" /></td>
		</c:when>
	</c:choose>
</tr>
</c:forEach>
<tr></tr><tr>
	<td colspan="7" align="center"><input type="submit" value="Issue Books"></td>
</tr><tr></tr>
</table>
</c:if>


<c:if test="${search eq 3}">
<sql:query var="searchName" dataSource="${conn}">
	SELECT * FROM BOOKS WHERE Name=? AND ID NOT IN (SELECT BOOKID FROM TRANBOOK WHERE USERNAME=?)
	<sql:param value="${searchValue}" />
	<sql:param value="${userName}" />
</sql:query>
<table border="2">
<tr>
	<th>Id</th>
	<th>Name</th>
	<th>Author</th>
	<th>Edition</th>
	<th>Department</th>
	<th>Total Books</th>
	<th>Select</th>
</tr>
<c:forEach var="u" items="${searchName.rows}">
<tr>
	<td><c:out value="${u.ID}" /></td>
	<td><c:out value="${u.Name}" /></td>
	<td><c:out value="${u.Author}" /></td>
	<td><c:out value="${u.Edition}" /></td>
	<td><c:out value="${u.Dept}" /></td>
	<td><c:out value="${u.TotalBooks}" /></td>
	<c:choose>
		<c:when test = "${u.TotalBooks <= 0}">            
			<td><input type="checkbox" name="check" value="${u.ID}" disabled="disabled" /></td>
		</c:when>
		<c:when test = "${u.TotalBooks > 0}">            
			<td><input type="checkbox" name="check" value="${u.ID}" /></td>
		</c:when>
	</c:choose>
</tr>
</c:forEach>
<tr></tr><tr>
	<td colspan="7" align="center"><input type="submit" value="Issue Books"></td>
</tr><tr></tr>
</table>
</c:if>

<c:if test="${search eq 4}">
<sql:query var="searchAuthor" dataSource="${conn}">
	SELECT * FROM BOOKS WHERE Author=? AND ID NOT IN (SELECT BOOKID FROM TRANBOOK WHERE USERNAME=?)
	<sql:param value="${searchValue}" />
	<sql:param value="${userName}" />
</sql:query>
<table border="2">
<tr>
	<th>Id</th>
	<th>Name</th>
	<th>Author</th>
	<th>Edition</th>
	<th>Department</th>
	<th>Total Books</th>
	<th>Select</th>
</tr>
<c:forEach var="u" items="${searchAuthor.rows}">
<tr>
	<td><c:out value="${u.ID}" /></td>
	<td><c:out value="${u.Name}" /></td>
	<td><c:out value="${u.Author}" /></td>
	<td><c:out value="${u.Edition}" /></td>
	<td><c:out value="${u.Dept}" /></td>
	<td><c:out value="${u.TotalBooks}" /></td>
	<c:choose>
		<c:when test = "${u.TotalBooks <= 0}">            
			<td><input type="checkbox" name="check" value="${u.ID}" disabled="disabled" /></td>
		</c:when>
		<c:when test = "${u.TotalBooks > 0}">           
			<td><input type="checkbox" name="check" value="${u.ID}" /></td>
		</c:when>
	</c:choose>
</tr>
</c:forEach>
<tr></tr><tr>
	<td colspan="7" align="center"><input type="submit" value="Issue Books"></td>
</tr><tr></tr>
</table>
</c:if>

<c:if test="${search eq 5}">
<sql:query var="searchAll" dataSource="${conn}">
	SELECT * FROM BOOKS WHERE ID NOT IN (SELECT BOOKID FROM TRANBOOK WHERE USERNAME=?)
	<sql:param value="${userName}" />
</sql:query>
<table border="2">
<tr>
	<th>Id</th>
	<th>Name</th>
	<th>Author</th>
	<th>Edition</th>
	<th>Department</th>
	<th>Total Books</th>
	<th>Select</th>
</tr>
<c:forEach var="u" items="${searchAll.rows}">
<tr>
	<td><c:out value="${u.ID}" /></td>
	<td><c:out value="${u.Name}" /></td>
	<td><c:out value="${u.Author}" /></td>
	<td><c:out value="${u.Edition}" /></td>
	<td><c:out value="${u.Dept}" /></td>
	<td><c:out value="${u.TotalBooks}" /></td>
	<c:choose>
		<c:when test = "${u.TotalBooks <= 0}">
			<td><input type="checkbox" name="check" value="${u.ID}" disabled="disabled" /></td>
		</c:when>
		<c:when test = "${u.TotalBooks > 0}">        
			<td><input type="checkbox" name="check" value="${u.ID}"/></td>
		</c:when>
	</c:choose>

</tr>
</c:forEach>
<tr></tr><tr>
	<td colspan="7" align="center"><input type="submit" value="Issue Books"></td>
</tr><tr></tr>
</table>
</c:if>
</form>

</body>
</html>