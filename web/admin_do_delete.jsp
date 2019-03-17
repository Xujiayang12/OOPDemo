<%--
  Created by IntelliJ IDEA.
  User: atony
  Date: 19-3-5
  Time: 上午12:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*,java.net.*,info.*" contentType="text/html; charset=utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>admin delete</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String id = request.getQueryString();
    int idd = Integer.parseInt(id.split("[=]")[1]);
    User.deleteById(idd);
    out.print("<script type='text/javascript'>alert('删除成功');document.location.href='admin_all_people.jsp';</script>");
%>
</body>
</html>
