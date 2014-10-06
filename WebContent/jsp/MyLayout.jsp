<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@page import="java.util.Date" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link rel="stylesheet" href="css/style.css" type="text/css" media="screen" />
<title>Banking System</title>
</head><div class="datecss">
<%     Date date = new Date();
		int i = 1900+date.getYear();
	StringBuilder sb = new StringBuilder();
	sb.append("");
	sb.append(i);
	String strI = sb.toString();
	%>
      <%=date.getDate()+"/"+date.getMonth()+"/"+strI%>
</div>
<body style="width: 1000px; margin: 0 auto; height:100%;" background="./images/a.jpg" >

 



<table width="100%" border="0" height="800px"style="padding-top:200px">
<tr height="10%" background="./img/b.jpg" >
	<td colspan="2" ><tiles:insertAttribute name="header" /></td>
</tr>

<tr height="280px" valign="top" class="container">
	<td valign="middle" width="20%"><tiles:insertAttribute name="menu"/>
	</td>
	<td width="80%" class="fontbody"><tiles:insertAttribute name="body"/>
	</td>

</tr>
<%-- <tr height="50px" style="color:#fff; background-color: #BBB; width: 100%;">
	 <td align="right" colspan="2" >&copy;2012 C-DAC Co.<tiles:insertAttribute name="footer"/> </td>
</tr> --%>
</table>


</body>
</html>