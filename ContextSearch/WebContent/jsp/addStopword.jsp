<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@page import="java.util.List"%>
<%@page import="com.model.AJAXResponse"%>
<%@page import="com.model.Message"%>

<%@page import="com.constants.ContextualConstantsIF"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Stopword</title>
<script type="text/javascript">

validatestopword=function()
{
	var stopWord=document.getElementById('stopWord').value;

	if(stopWord<=0)
	{
		alert("Please Enter a Value for Stop Word");
		return false;
	}
}
</script>
</head>
<body background="<%=request.getContextPath()%>/images/background.jpg">
<jsp:include page="/jsp/customer.jsp"></jsp:include>
<jsp:include page="/jsp/adminmenu.jsp"></jsp:include>


<%
AJAXResponse ajaxResponse=(AJAXResponse) request.getAttribute(ContextualConstantsIF.Keys.OBJ);
if(null==ajaxResponse)
{
	
}
else
{
	boolean status=ajaxResponse.isStatus();
%>
<%
	if(!status)
	{
		List<Message> msg=ajaxResponse.getEbErrors();
%>
<%
		for(int i=0;i<msg.size();i++)
		{
			Message tempMsg=msg.get(i);
	%>
	
	<div class="errMsg"><%= tempMsg.getErrMessage()%></div>
	
<%		}
	
	}
}
%>


<form action="<%=request.getContextPath()%>/review/addStopword.do" method="post"  >


	<table>
		<tr>
			<td><label>Enter Stop Word:</label> </td>
			<td><input name="stopWord" id="stopWord" type="text"  size="50" maxlength="50" /></td>
		</tr>
			<tr>
			<td><input  type="submit" value="Add StopWord" onclick="validatestopword()"/></td>
		</tr>
			
	</table>
</form>
</body>
</html>