<%@ page language="java" contentType="text/html;charset=GBK"%>
<%@ page import="njust.biz.*,njust.entity.*,njust.util.Tool"%>

<%
	response.setCharacterEncoding("GBK");
	User loginUser = (User) session.getAttribute("loginUser");             // ��session�л�õ�¼�û�
	if (loginUser == null) {                                                         // δ��¼��ת
		response.sendRedirect("index.jsp");
		return;
	}
	MessageBiz messageBiz = new MessageBiz();                                    // ��ö���Ϣҵ�����
	int msgId = 0;
	try {
		msgId = Integer.parseInt(request.getParameter("messageId"));  // �������л�ȡ����id
	} catch (Exception e) {
		response.sendRedirect("listMsg.jsp");
		return;
	}
	Message message = messageBiz.findMessage(msgId);                        // ���������Ϣ�б�Ķ���
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>�Ķ�����Ϣ</title>
	<link rel="stylesheet" type="text/css" href="style/style.css">
</head>

<body>
<div align="center">
	<%--  �û���Ϣ  --%>
	<div style="width:500px">
		��ǰ�û� <%=loginUser.getName() %>
		<a href="doLogout.jsp">[�ǳ�]</a>
		<a href="post.jsp">[������Ϣ]</a>
		<a href="listMsg.jsp">[�ҵĶ���Ϣ]</a>
	</div>

	<h2 align="left" style="width:400px">�Ķ�����Ϣ</h2>

	<%-- ����Ϣ --%>
	<div align="left" style="width:400px">

		<div class="t">
			<div style="background-color:#d4eff7">&nbsp;���ԣ�<%=message.getSendUname() %>
			</div>
			<div style="background-color:#f3f8ef"><br/>&nbsp;&nbsp;<%= message.getNote() %>
			</div>
			<div style="background-color:#f3f8ef" align="right">
				<a href="post.jsp?receiveUname=<%= message.getSendUname() %>">[�ظ�]</a>
				<a href="doDelete.jsp?msgid=<%=message.getId()%>">[ɾ��]</a>
			</div>
			<div align="right" class="gray">
				[<%=Tool.Date2Str(message.getPostTime(),"yyyy-MM-dd  HH:mm:ss").substring(0, 19) %>]
			</div>
		</div>
	</div>
</div>
</body>
</html>
