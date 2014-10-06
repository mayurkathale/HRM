<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script type="text/javascript">
function validateForm()
{
var x=document.forms["myForm"]["accno"].value;
if (x==null || x=="")
  {
  alert("Enter Account Number First !");
  return false;
  }
}
</script>
</head>
<body>
<h2 class="heading">Modify Account </h2>
<s:form action ="modifyacc" name="myForm" namespace="/test" theme="xhtml" onsubmit="return validateForm()">
<br><br><br><br>
<table align="center">
			<tr>
				<td><s:textfield name="accno" label="Enter Account no" /></td>
			</tr>
			<tr>
				<td align="right"></td>
				<td><s:submit value="Submit" theme="simple" align="right" cssClass="mybutton"/>
				<s:reset value="reset" theme="simple" cssClass="mybutton"/></td>
			</tr>
</table>
</s:form>
</body>
</html>