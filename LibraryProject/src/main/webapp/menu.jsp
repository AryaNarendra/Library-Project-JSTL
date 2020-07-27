
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

