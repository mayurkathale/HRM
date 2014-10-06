<%@page import="java.util.Iterator"%>
<%@page import="pojo.User_detail"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page session="true" %>
    <%@ taglib uri="/struts-tags" prefix="s"%>
    <%
    	List<User_detail> userlist = (List<User_detail>) session.getAttribute("viewlist");
    	Iterator itr = userlist.iterator();
    	User_detail user = new User_detail();
    	session.removeAttribute("viewlist");
    	String temp=null;
     %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>
<body>
<h2 class="heading">User Details</h2>
<br><br>
<center>

<div class="scroll-table">
<table border="0" align="center" style="margin:10px; " bgcolor="#868686" cellpadding="6">
<tr bgcolor="black" >
<td width="30" class="hideextra"><font color="white">Account No.</font></td>
<td width="60" class="hideextra"><font color="white">Name</font></td>
<td width="60" class="hideextra"><font color="white">Balance</font></td>
<td width="60" class="hideextra"><font color="white">Address</font></td>
<td width="40" class="hideextra"><font color="white">Account Type</font></td>
<td width="80" class="hideextra"><font color="white">Contact</font></td>
</tr>
	<% 
	while(itr.hasNext())
	{
		user = (User_detail)itr.next();
		if(user.getAcctype().equalsIgnoreCase("s"))
			temp="Saving ";
		else
			temp="Current";
		%>
		<tr><td><%=user.getAccno()%></td><td><%=user.getName()%></td><td><%=user.getBalance()%></td><td><%=user.getAddress()%></td><td><%=temp%></td><td><%=user.getContact()%></td></tr>
		<% 
	}
	%>

</table>
</div>
</center>
</body>
</html>