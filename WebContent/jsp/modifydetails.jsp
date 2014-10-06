<%@page import="java.util.Iterator"%>
<%@page import="java.util.ListIterator"%>
<%@page import="pojo.User_detail"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page session="true" %>
    <%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
function validateForm()
{
var x=document.forms["myForm"]["name"].value;
var y=document.forms["myForm"]["password"].value;
var a=document.forms["myForm"]["address"].value;
var b=document.forms["myForm"]["contact"].value;
if (x==null || x==""|| y==null||y==""  || a==null || a==""|| b==null||b=="")
  {
  alert("First name must be filled out");
  return false;
  }
}
</script>
</head>

<body>
<h2 class="heading">Modify</h2>
<%
	User_detail user = (User_detail) session.getAttribute("tomodify");
	System.out.println("jsp re "+user.getContact());
	
%>
<s:set var="Name"><%=user.getName()%></s:set>
<s:set var="cnt"><%=user.getContact()%></s:set>
<s:set var="add"><%=user.getAddress()%></s:set>
<s:set var="pass"><%=user.getPassword()%></s:set>
<s:form action="modifyfinal" name="myForm" onsubmit="return validateForm()" theme="xhtml">
<br><br>
			<table border="0" align="center">
				<tr>
					<td align="right">First Name :</td>
					<td align="left"><s:textfield name="name" value="%{Name}" theme="simple"/></td>
				</tr>
				<tr>
			
				<tr>
					<td align="right">Address:</td>
					<td align="left"><s:textfield name="address" value="%{add}" theme="simple"/></td>
				</tr> 
			
				<tr>
					<td align="right">Contact No :</td>
					<td align="left"><s:textfield name="contact" value="%{cnt}" theme="simple"/> </td>
				</tr>
				<tr>
					<td align="right">Password :</td>
					<td align="left"> <s:textfield name="password" value="%{pass}" theme="simple"/></td>
				</tr>
				
				<tr>
					<td align="right"><s:submit value="Update" theme="simple" cssClass="mybutton"/></td>
					<td ><s:reset value="Undo changes" theme="simple" cssClass="mybutton"/></td>
				</tr>	
			</table>	</s:form>
</body>
</html>