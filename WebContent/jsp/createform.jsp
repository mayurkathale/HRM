<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">





function validateForm()
{
	
var x=document.forms["myForm"]["accno"].value;
var y=document.forms["myForm"]["password"].value;
var yl=document.forms["myForm"]["password"].length;
var z=document.forms["myForm"]["address"].value;
var a=document.forms["myForm"]["contact"].value;
var b=document.forms["myForm"]["balance"].value;
var c=document.forms["myForm"]["acctype"].value;


if (x==null || x==""|| y==null||y==""||z==null || z==""|| a==null||a==""||b==null || b==""|| c==null||c=="")
  {
  alert("All fields are Neccesorry");
  /* if(b<1000)
  		 alert("balace should be atleast 1000);
  	if(y1<6)
  		alert("balace should be atleast 1000); 
  	*/
  return false;
  }
}
</script>
</head>
<s:form name="myForm" action="registration" namespace="/test" theme="xhtml" onsubmit="return validateForm()">
<body>
			<h2 class="heading">Registration</h2><br><br><br><br>
			<table border="0" align="center">
				<tr>
					<td align="right">First Name :</td>
					<td align="right"><s:textfield name="name" theme="simple"/> </td>
					 
				</tr>
				<tr>
			
				<tr>
					<td align="right">Account no:</td>
					<td align="right"><s:textfield name="accno" theme="simple"/></td>
					
				</tr> 
			
				<tr>
					<td align="right">Password :</td>
					<td align="right"><s:password name="password" theme="simple"/></td>
					
				</tr>
				<tr>
					<td align="right">Address :</td>
					<td align="right"><s:textfield name="address" theme="simple"/></td>
				</tr>
				
				<tr>
					<td align="right">Contact No :</td>
					<td align="right"><s:textfield name="contact" theme="simple"/></td>
					
				</tr>
				
				<tr align="right">
					<td align="right">Balance :</td>
					<td align="right"><s:textfield name="balance" theme="simple"/></td>	
				</tr>
				
				<tr>
					<td align="right">Account Type :</td>
					<td align="left"> &nbsp;&nbsp;<select name="acctype">
							<option disabled="disabled">--Account Type--</option>
							<option value="c">Current</option>
							<option value="s">Saving</option>
					</select></td>
				</tr>
				
				<tr><td></td>
					<td align="left"><s:submit value="Register" theme="simple" cssClass="mybutton"/>&nbsp;&nbsp;&nbsp;<s:reset value="Reset" theme="simple" cssClass="mybutton"/></td>
				</tr>
			</table>
	</s:form>
</body>
</html>