<%@ page language="java" contentType="text/html;charset=GBK"%>
<%@ page import="njust.entity.*" %>
<%
response.setCharacterEncoding("GBK");
User loginUser = (User)session.getAttribute("loginUser");  // ��session�л�õ�¼�û�
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>���¼</title>
	<link rel="stylesheet" type="text/css" href="style/style.css">
  </head>

  <body>
  <div align="center">
  	<%--  ��¼ --%>
  	<%
  	if(loginUser==null){ // δ��¼
  	%>
  	
    <div class="login" align="center">
    	<br/>
        <h2>����ϵͳ��¼</h2>
    	<form action="doLogin.jsp" method="post">
           ��¼��<input type="text" name="uname" class="input"/><br/>
           ��&nbsp;&nbsp;��<input type="password" name="upass" class="input"/><br/>
    		<input type="submit" value=" ��¼" class="btn"/>
    	</form>
    </div>
    <%
    } else {            // �ѵ�¼
    	response.sendRedirect("showMsg.jsp");
    }
    %>
  </div>
  </body>
</html>
