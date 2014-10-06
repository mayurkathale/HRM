<%@page import="org.apache.taglibs.standard.tag.common.core.ForEachSupport"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page import="pojo.BankTransaction"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="/struts-tags" prefix="s" %>
    <%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%
	List<BankTransaction> list = (List<BankTransaction>) session.getAttribute("trlist");
	ListIterator itr = list.listIterator();
	session.removeAttribute("trlist");
	BankTransaction bkt= new BankTransaction();
	String temp = null;
%>
<body>
<h2 class="heading">Transaction Log</h2>
<center>
<div class="scroll-table">
<table border="0" style="margin:10px; " bgcolor="#868686" cellpadding="6">
	<tr bgcolor="black">
		<td><font color="white"> Transaction Account</font></td>
		<td><font color="white">Amount</font></td>
		<td><font color="white">Transaction Type</font></td>
	</tr>
<%
	while(itr.hasNext())
	{
		bkt = (BankTransaction) itr.next();
		if(bkt.getTtype().equals("d"))
			temp="DEPOSIT";
		else
			temp="WITHDRAW";
%>
	<tr>
		<td><%=bkt.getAccno2()%></td><td><%=bkt.getAmount()%></td><td><%=temp%></td>
	</tr>
<%
	}
%>
</table>
</div>
</center>
</body>
</html>