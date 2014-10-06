<%@page import="pojo.User_detail"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ taglib uri="/struts-tags" prefix="s"%>
   <%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h2 class="heading">Details</h2>
<%
	User_detail user = (User_detail) session.getAttribute("currentuser");
	System.out.println("jsp re "+user.getContact());
%>
<br><br><br>

<s:set var="sname"><%=user.getName()%></s:set>
<s:set var="scnt"><%=user.getContact()%></s:set>
<s:set var="sadd"><%=user.getAddress()%></s:set>
<s:set var="saccno"><%=user.getAccno()%></s:set>
<s:set var="sacct"><%=user.getAcctype()%></s:set>
<s:set var="sbal"><%=user.getBalance()%></s:set>
<center>
<s:form>
<s:label label="Name" value="%{sname}"></s:label>
<s:label label="Address" value="%{sadd}"></s:label>
<s:label label="contactno" value="%{scnt}"></s:label>
<s:label label="Account type " value="%{sacct}"></s:label>
<s:label label="Account No " value="%{saccno}"></s:label>
<s:label label="Current balace " value="%{sbal}"></s:label>
	</s:form>
	</center>
</body>
</html>