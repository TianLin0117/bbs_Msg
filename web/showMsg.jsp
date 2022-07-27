<%@ page language="java" contentType="text/html;charset=GBK"%>
<%@ page import="njust.biz.*,njust.entity.*,njust.util.Tool"%>

<%
	response.setCharacterEncoding("GBK");
	User loginUser = (User) session.getAttribute("loginUser");             // 从session中获得登录用户
	if (loginUser == null) {                                                         // 未登录跳转
		response.sendRedirect("index.jsp");
		return;
	}
	MessageBiz messageBiz = new MessageBiz();                                    // 获得短消息业务对象
	int msgId = 0;
	try {
		msgId = Integer.parseInt(request.getParameter("messageId"));  // 从请求中获取短信id
	} catch (Exception e) {
		response.sendRedirect("listMsg.jsp");
		return;
	}
	Message message = messageBiz.findMessage(msgId);                        // 创建存放消息列表的对象
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>阅读短消息</title>
	<link rel="stylesheet" type="text/css" href="style/style.css">
</head>

<body>
<div align="center">
	<%--  用户信息  --%>
	<div style="width:500px">
		当前用户 <%=loginUser.getName() %>
		<a href="doLogout.jsp">[登出]</a>
		<a href="post.jsp">[发短消息]</a>
		<a href="listMsg.jsp">[我的短消息]</a>
	</div>

	<h2 align="left" style="width:400px">阅读短消息</h2>

	<%-- 短消息 --%>
	<div align="left" style="width:400px">

		<div class="t">
			<div style="background-color:#d4eff7">&nbsp;来自：<%=message.getSendUname() %>
			</div>
			<div style="background-color:#f3f8ef"><br/>&nbsp;&nbsp;<%= message.getNote() %>
			</div>
			<div style="background-color:#f3f8ef" align="right">
				<a href="post.jsp?receiveUname=<%= message.getSendUname() %>">[回复]</a>
				<a href="doDelete.jsp?msgid=<%=message.getId()%>">[删除]</a>
			</div>
			<div align="right" class="gray">
				[<%=Tool.Date2Str(message.getPostTime(),"yyyy-MM-dd  HH:mm:ss").substring(0, 19) %>]
			</div>
		</div>
	</div>
</div>
</body>
</html>
