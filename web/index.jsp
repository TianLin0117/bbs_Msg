<%@ page language="java" contentType="text/html;charset=GBK"%>
<%@ page import="njust.entity.*" %>
<%
response.setCharacterEncoding("GBK");
User loginUser = (User)session.getAttribute("loginUser");  // 从session中获得登录用户
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>请登录</title>
	<link rel="stylesheet" type="text/css" href="style/style.css">
  </head>

  <body>
  <div align="center">
  	<%--  登录 --%>
  	<%
  	if(loginUser==null){ // 未登录
  	%>
  	
    <div class="login" align="center">
    	<br/>
        <h2>短信系统登录</h2>
    	<form action="doLogin.jsp" method="post">
           登录名<input type="text" name="uname" class="input"/><br/>
           密&nbsp;&nbsp;码<input type="password" name="upass" class="input"/><br/>
    		<input type="submit" value=" 登录" class="btn"/>
    	</form>
    </div>
    <%
    } else {            // 已登录
    	response.sendRedirect("showMsg.jsp");
    }
    %>
  </div>
  </body>
</html>
