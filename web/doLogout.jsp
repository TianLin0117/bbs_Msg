<%@ page language="java" pageEncoding="GBK"%>
<%
    session.removeAttribute("loginUser");
    session.invalidate();
    response.sendRedirect("index.jsp");
%>
