<%@ page language="java" contentType="text/html;charset=GBK"%>
<%@ page import="njust.entity.User" %>
<%@ page import="java.util.List" %>
<%@ page import="njust.biz.UserBiz" %>
<%
	User loginUser = (User) session.getAttribute("loginUser");
	if (loginUser == null) {
		request.setAttribute("error_msg", "您尚未登录");
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
    <title>发短消息</title>
	<link rel="stylesheet" type="text/css" href="style/style.css">
	<script type="text/javascript">
		function check() {
			var receiveUname = document.forms[0].receiveUname.value;
			var note = document.forms[0].note.value;
			var errorMsg = "";
			if (receiveUname == "" || receiveUname == "请输入您的名字") {
				errorMsg += "作者不能为空";
			}
			if (note == "") {
				errorMsg += "\n内容不能为空";
			}
			if (note.length > 500) {
				errorMsg += "\n内容长度不能大于100";
			}
			if (receiveUname.length > 20) {
				errorMsg += "\n用户名长度不能大于20";
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
	  <%--  用户信息  --%>
	  <div style="width:500px">
		  当前用户 <%=loginUser.getName()%>
		  <a href="doLogout.jsp">[登出]</a>
		  <a href="listMsg.jsp">[我的短消息]</a>
	  </div>
	  <br/>

	  <div class="t1">
		  <br/>

		  <h2>发短消息</h2>

		  <div align="left" style="width:400px">
			  <form action="doPost.jsp" method="post" onsubmit="return check()">
				  <input type="hidden" name="sendUname" value="<%=loginUser.getName() %>"/>

				  <div>发送给&nbsp;
					  <input type="text" name="receiveUname" value="<%=receiveUname.isEmpty()?"":receiveUname %>" class="input"/>
				  </div>
				  <br/>

				  <div>短消息</div>
				  <div style="position:relative ;top:-17px;left:42px">
					  <textarea name="note" cols="40"  rows="7"></textarea></div>
				  <input type="submit" value="&nbsp;发 送&nbsp;" class="btn" style="position:relative ;left:150px"/>
			  </form>
		  </div>
	  </div>
  </div>
  </body>
</html>
