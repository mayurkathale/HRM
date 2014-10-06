<%@page import="pojo.User_detail"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@taglib uri="/struts-tags" prefix="s"%>
   <%@page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>


<script type="text/javascript">
function validateForm()
{
var x=document.forms["myForm"]["to_deposit"].value;

if(x=="")
	{
	alert ("Enter Amount");
	return false;
	}
	else
	return true;
}
</script>





</head>
<%
	User_detail userwith= (User_detail) session.getAttribute("towithdraw");	
%>
<body>
<br><br><br><br>
<center>
<s:set var="sname"><%= userwith.getName()%></s:set>
<s:set var="sadd"><%= userwith.getAddress()%></s:set>
<s:set var="scnt"><%= userwith.getContact()%></s:set>
<s:set var="sbal"><%= userwith.getBalance()%></s:set>
<s:form action="withdraw_money" name="myForm" onsubmit="return validateForm()">
<s:label label="Name" value="%{sname}"></s:label>
<s:label label="Address" value="%{sadd}"></s:label>
<s:label label="contactno" value="%{scnt}"></s:label>
<s:label label="Current balace " value="%{sbal}"></s:label>
<s:textfield name="to_deposit" label="Enter Amount :"/>
<s:submit value="withdraw Amount" cssClass="mybutton"></s:submit>
</s:form>
</center>
</body>
</html>