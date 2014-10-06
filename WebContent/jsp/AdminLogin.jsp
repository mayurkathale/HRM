<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s" %>


<title>E-Recruitment System :: Login</title>
<head>


<script type="text/javascript">
function validateForm()
{
var x=document.forms["myForm"]["accno"].value;
var y=document.forms["myForm"]["password"].value;
if(x=="" && y=="")
	{
	alert ("Enter Admin name &password");
	return false;
	}
else if(x==null || x=="")
	{
		alert("Enter Admin name");
		return false;
	}
else if(y==null ||y=="")
	{
		alert ("Enter password");
		return false;
	}
	
}
</script>
</head>

<h2 class="heading">Admin Login</h2>
<fieldset title="Login">
<h2>
<%HttpSession hs=request.getSession();
%>
<%if(session.getAttribute("LoginMsg")!=null)
{%>
<%=session.getAttribute("LoginMsg")%>
<% request.removeAttribute("LoginMsg");} %>
	</h2>
	<legend> please fill in below details for login</legend>
<s:form action ="adminlogin" namespace="/test" theme="xhtml" name="myForm" onsubmit="return validateForm()">
<table align="center">
			<tr>
				<td><s:textfield name="accno" label="Enter AdminName" value=""/></td>
			</tr>
			<tr>
				<td><s:password name="password" label="Enter Password" value=""/></td>
			</tr>
			<tr>
				<td align="right"></td>
				<td><s:submit value="Login" theme="simple" align="right" cssClass="mybutton"/>
				<s:reset value="reset" theme="simple" cssClass="mybutton"/></td>
			</tr>
</table>

</s:form>
</fieldset>
