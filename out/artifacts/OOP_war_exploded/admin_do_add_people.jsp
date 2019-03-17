<%--
  Created by IntelliJ IDEA.
  User: atony
  Date: 19-3-4
  Time: 下午11:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*,java.net.*,info.*" contentType="text/html; charset=utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>add_people</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String username = URLEncoder.encode(request.getParameter("username"),"utf-8");
    String password = URLEncoder.encode(request.getParameter("password"),"utf-8");
    String fullname = URLEncoder.encode(request.getParameter("fullname"),"utf-8");
    String classroom = URLEncoder.encode(request.getParameter("classroom"),"utf-8");
    String qq = URLEncoder.encode(request.getParameter("qq"),"utf-8");
    String phone = URLEncoder.encode(request.getParameter("phone"),"utf-8");
    String admin = URLEncoder.encode(request.getParameter("admin"),"utf-8");
    if(User.isAccountExist(username))
    {
        out.print("<script type='text/javascript'>alert('改学号已存在');");
    }
    else{
        User.adminAdd(username,fullname,password,classroom,qq,phone,admin);
        out.print("<script type='text/javascript'>alert('添加成功');document.location.href='admin_all_people.jsp';</script>");
    }
%>
</body>
</html>
