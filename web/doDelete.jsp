<%@ page language="java" pageEncoding="GBK"	import="njust.biz.*,njust.entity.*"%>
<%@ page import="njust.biz.MessageBiz" %>
<%@ page import="njust.entity.User" %>
<%@ page import="njust.entity.Message" %>
<%
	User loginUser = (User) session.getAttribute("loginUser");  // ��session�л�õ�¼�û�
	if (loginUser == null) {
		response.sendRedirect("index.jsp");
		return;
	}
	int msgId = Integer.parseInt(request.getParameter("msgid"));  // ��������ȡ��Ҫɾ���Ķ���Ϣid
	MessageBiz messageBiz = new MessageBiz();
	Message message = messageBiz.findMessage(msgId);                     // ȡ��Ҫɾ������Ϣ�Ķ���
	if (loginUser.getName().equals(message.getReceiveUname())) {                 // �ж��û����
		messageBiz.delete(msgId);
	}
	response.sendRedirect("listMsg.jsp");
%>
