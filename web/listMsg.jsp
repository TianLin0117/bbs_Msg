<%@ page language="java" contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*,njust.biz.*,njust.entity.*"%>

<%
	response.setCharacterEncoding("GBK");
	User loginUser = (User) session.getAttribute("loginUser");             // 从session中获得登录用户
	if (loginUser == null) {                                                         // 未登录跳转
		response.sendRedirect("index.jsp");
		return;
	}
	MessageBiz messageBiz = new MessageBiz();                                    // 获得短消息业务对象
	List<Message> messageList = messageBiz.listByReceiveUname(loginUser.getName());  // 创建存放消息列表的对象
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	  <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	  <title>浏览短消息</title>
	  <link rel="stylesheet" type="text/css" href="style/style.css">
  </head>

  <body>
  <div align="center">
	  <%--  用户信息  --%>
	  <div style="width:500px">
		  当前用户<%=loginUser.getName()%>
		  <a href="doLogout.jsp">[登出]</a>
		  <a href="post.jsp">[发短消息]</a>
	  </div>

	  <h2 align="left" style="width:400px">我的短消息</h2>

	  <%-- 短消息列表 --%>
	  <div align="left" style="width:400px">
		  <%
			  for (int i = 0; i < messageList.size(); i++) {
				  Message message = messageList.get(i);
				  String note = message.getNote().length() > 10 ? message.getNote().substring(0, 10) + "... " : message.getNote();//做多显示10个字符
				  int readSign = message.getReadSign();
		  %>
		  <div class="t2">
			  <div>&nbsp;
				  <img src="image/<%= readSign==0 ? "new.jpg":"old.jpg" %>"/>
				  <a href="showMsg.jsp?messageId=<%= message.getId() %>">
					  [<%=message.getSendUname() %>]： <%= note %>
				  </a>
			  </div>
		  </div>
		  <%} %>
	  </div>
  </div>
  </body>
</html>
