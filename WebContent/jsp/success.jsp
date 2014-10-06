<%@page import="pojo.User_detail"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<% User_detail u = (User_detail) session.getAttribute("currentuser"); %>
<body>
<table height="100%" width="100%">
<tr valign="middle"><td align="center">
Welcome <%=u.getName().toUpperCase()%>
</td></tr></table>
</body>
</html>