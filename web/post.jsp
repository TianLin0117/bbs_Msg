<%@ page language="java" contentType="text/html;charset=GBK"%>
<%@ page import="njust.entity.User" %>
<%@ page import="java.util.List" %>
<%@ page import="njust.biz.UserBiz" %>
<%
	User loginUser = (User) session.getAttribute("loginUser");
	if (loginUser == null) {
		request.setAttribute("error_msg", "����δ��¼");
		response.sendRedirect("index.jsp");
		return;
	}
	String receiveUname = "";
	try {
		receiveUname = new String(request.getParameter("receiveUname").getBytes("ISO-8859-1"));
	} catch (NullPointerException e) {
		receiveUname = "";
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	  <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>������Ϣ</title>
	<link rel="stylesheet" type="text/css" href="style/style.css">
	<script type="text/javascript">
		function check() {
			var receiveUname = document.forms[0].receiveUname.value;
			var note = document.forms[0].note.value;
			var errorMsg = "";
			if (receiveUname == "" || receiveUname == "��������������") {
				errorMsg += "���߲���Ϊ��";
			}
			if (note == "") {
				errorMsg += "\n���ݲ���Ϊ��";
			}
			if (note.length > 500) {
				errorMsg += "\n���ݳ��Ȳ��ܴ���100";
			}
			if (receiveUname.length > 20) {
				errorMsg += "\n�û������Ȳ��ܴ���20";
			}
			if (errorMsg != "") {
				alert(errorMsg);
				return false;
			}
	}
	</script>
  </head>

  <body>
  <div align="center">
	  <%--  �û���Ϣ  --%>
	  <div style="width:500px">
		  ��ǰ�û� <%=loginUser.getName()%>
		  <a href="doLogout.jsp">[�ǳ�]</a>
		  <a href="listMsg.jsp">[�ҵĶ���Ϣ]</a>
	  </div>
	  <br/>

	  <div class="t1">
		  <br/>

		  <h2>������Ϣ</h2>

		  <div align="left" style="width:400px">
			  <form action="doPost.jsp" method="post" onsubmit="return check()">
				  <input type="hidden" name="sendUname" value="<%=loginUser.getName() %>"/>

				  <div>���͸�&nbsp;
					  <input type="text" name="receiveUname" value="<%=receiveUname.isEmpty()?"":receiveUname %>" class="input"/>
				  </div>
				  <br/>

				  <div>����Ϣ</div>
				  <div style="position:relative ;top:-17px;left:42px">
					  <textarea name="note" cols="40"  rows="7"></textarea></div>
				  <input type="submit" value="&nbsp;�� ��&nbsp;" class="btn" style="position:relative ;left:150px"/>
			  </form>
		  </div>
	  </div>
  </div>
  </body>
</html>
