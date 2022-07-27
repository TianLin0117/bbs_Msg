<%@ page language="java" contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*,njust.biz.*,njust.entity.*"%>

<%
	response.setCharacterEncoding("GBK");
	User loginUser = (User) session.getAttribute("loginUser");             // ��session�л�õ�¼�û�
	if (loginUser == null) {                                                         // δ��¼��ת
		response.sendRedirect("index.jsp");
		return;
	}
	MessageBiz messageBiz = new MessageBiz();                                    // ��ö���Ϣҵ�����
	List<Message> messageList = messageBiz.listByReceiveUname(loginUser.getName());  // ���������Ϣ�б�Ķ���
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	  <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	  <title>�������Ϣ</title>
	  <link rel="stylesheet" type="text/css" href="style/style.css">
  </head>

  <body>
  <div align="center">
	  <%--  �û���Ϣ  --%>
	  <div style="width:500px">
		  ��ǰ�û�<%=loginUser.getName()%>
		  <a href="doLogout.jsp">[�ǳ�]</a>
		  <a href="post.jsp">[������Ϣ]</a>
	  </div>

	  <h2 align="left" style="width:400px">�ҵĶ���Ϣ</h2>

	  <%-- ����Ϣ�б� --%>
	  <div align="left" style="width:400px">
		  <%
			  for (int i = 0; i < messageList.size(); i++) {
				  Message message = messageList.get(i);
				  String note = message.getNote().length() > 10 ? message.getNote().substring(0, 10) + "... " : message.getNote();//������ʾ10���ַ�
				  int readSign = message.getReadSign();
		  %>
		  <div class="t2">
			  <div>&nbsp;
				  <img src="image/<%= readSign==0 ? "new.jpg":"old.jpg" %>"/>
				  <a href="showMsg.jsp?messageId=<%= message.getId() %>">
					  [<%=message.getSendUname() %>]�� <%= note %>
				  </a>
			  </div>
		  </div>
		  <%} %>
	  </div>
  </div>
  </body>
</html>
