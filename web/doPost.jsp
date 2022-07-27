<%@ page language="java" pageEncoding="GBK"
	import="java.util.*,njust.entity.*,njust.biz.*"%>
<%
	request.setCharacterEncoding("GBK");

	User loginUser = (User) session.getAttribute("loginUser");
	if (loginUser == null) {
		response.sendRedirect("index.jsp");
		return;
	}

	Message message = new Message();
	MessageBiz messageBiz = new MessageBiz();
	UserBiz userBiz = new UserBiz();

	String sendUname=loginUser.getName();
	String receiveUname = request.getParameter("receiveUname");
	String note=request.getParameter("note");
	int readSign=0;

	message.setNote(note);
	message.setSendUname(sendUname);
	message.setReceiveUname(receiveUname);
	message.setPostTime(new Date());
	message.setReadSign(readSign);

	messageBiz.save(message);

	response.sendRedirect("index.jsp");
%>
