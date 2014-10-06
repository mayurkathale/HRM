<%@ page import="com.lowagie.text.Document" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" %>
<head>
<title>E-Recruitment System :: Login</title>
<script type="text/javascript">
function validateForm()
{
var x=document.forms["myForm"]["accno"].value;
var y=document.forms["myForm"]["password"].value;
if(x=="" && y=="")
{
alert ("Enter User name &password");
return false;
}
else if(x==null || x=="")
{
	alert("Enter User name");
	return false;
}
else if(y==null ||y=="")
{
	alert ("Enter password");
	return false;
}
else
	return true;
}
</script>
</head>
<h2 class="heading">User Login</h2>

<fieldset title="Login">
<h2>
<% String msg = (String) session.getAttribute("loginmsg");
   session.removeAttribute("loginmsg");
   if(msg!=null && !msg.equals(null)){
	   %>
	   <c:out  escapeXml="true" value="${msg}"/>
   <%} 
  
   %>
	 
	   

	</h2>
	<legend> please fill in below details for login</legend>
<s:form action ="login" name="myForm" namespace="/test" theme="xhtml" onsubmit="return validateForm()">
<table align="center">
			<tr>
				<td><s:textfield name="accno" label="Enter Account No"/></td>
			</tr>
			<tr>
				<td><s:password name="password" label="Enter Password" /></td>
			</tr>
			<tr>
				<td align="right"></td>
				
			</tr>
			<tr>
				<td></td>
				<td><s:submit value="Login" align="right" theme="simple" cssClass="mybutton"/><s:reset value="reset" theme="simple" cssClass="mybutton"/></td>
			</tr>
</table>

</s:form>
</fieldset>
