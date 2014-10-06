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
var x=document.forms["myForm"]["acc_to"].value;
var y=document.forms["myForm"]["amt_tr"].value;

if(x=="" && y=="")
{
alert ("Enter All");
return false;
}
else if(x==null || x=="")
{
	alert("Enter Accont No !");
	return false;
}
else if(y==null ||y=="")
{
	alert ("Enter Amount!");
	return false;
}

else
	return true;
}
</script>

</head>
<% User_detail user = (User_detail) session.getAttribute("currentuser");
	
%>
<s:set name="sname"><%=user.getName()%></s:set>
<s:set name="sbal"><%=user.getBalance()%></s:set>


<body>
<h2 class="heading">Tranfer Fund</h2>
<br><br><br><br>
<center>
<s:form action="transferfund" name="myForm" onsubmit="return validateForm()">
<s:label name="name" label="Current User :" value="%{sname}"></s:label>
<s:label name="bal" label="Balance :" value="%{sbal}"></s:label>
<s:textfield name="acc_to" label="Enter Account no:"> </s:textfield>
<s:textfield name="amt_tr" label="Enter Amount"> </s:textfield>
<s:submit value="Transfer" cssClass="mybutton"></s:submit>
</s:form>
</center>
</body>
</html>