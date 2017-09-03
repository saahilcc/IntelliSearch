<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.constants.ContextualConstantsIF"%>
<%@page import="com.model.AJAXResponse"%>
<%@page import="com.model.Message"%>
<%@page import="com.model.ArticleVO"%>
<%@page import="java.util.List"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/css/errormsg.css"
	rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/customer.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript" >
var contextPath='<%=request.getContextPath()%>';
var updatable=false;
</script>

<script type="text/javascript">
 function preventBack(){window.history.forward();}
  setTimeout("preventBack()", 0);
  window.onunload=function(){null};
</script>

</head>
<body> 
<jsp:include page="/jsp/customer.jsp"></jsp:include>
<jsp:include page="/jsp/adminmenu.jsp"></jsp:include>

<%
									AJAXResponse ajax=(AJAXResponse)request.getAttribute(ContextualConstantsIF.Keys.OBJ);
									if(null==ajax){
										
									}else{	
											List<Message> msgList=ajax.getEbErrors();
											if(null==msgList){
											}
											else{
												
												Message msge=msgList.get(0);
												
												String msg =msge.getErrMessage();
												
								%>
							<div class="isa_error">	<%=msg%></div>
								<%
										}
											
											String sucessMsg = ajax.getMessage();
											
											if(null==sucessMsg){
												
											}else{
												
												if(sucessMsg!=null && !sucessMsg.isEmpty()){
													
									%>
										<div class="isa_sucess">	<%=sucessMsg%></div>
									<%
													
												}
												
											}
											
											ArticleVO articleVO =(ArticleVO)ajax.getModel();
											
											if(articleVO!=null){
												
										%>
										
								<div class="articleDesc">
									<%=articleVO.getArticleDesc()%>
								</div>		
										
										
										<%
												
												
											}
											
											
											
									}
								%>


</body>
</html>