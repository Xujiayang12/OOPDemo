<%--
  Created by IntelliJ IDEA.
  User: atony
  Date: 19-3-2
  Time: 下午6:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*,java.net.*,info.*" contentType="text/html; charset=utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>set project</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String name = URLEncoder.encode(request.getParameter("projectname"),"utf-8");
    String classroom = URLEncoder.encode(request.getParameter("classroom"),"utf-8");
    String detail = URLEncoder.encode(request.getParameter("detail"),"utf-8");
    String link = URLEncoder.encode(request.getParameter("link"),"utf-8");
    String document = URLEncoder.encode(request.getParameter("document"),"utf-8");
//    String name = request.getParameter("projectname");
//    String classroom = request.getParameter("classroom");
//    String detail = request.getParameter("detail");
//    String link = request.getParameter("link");
//    String document = request.getParameter("document");
    if(Project.setProject(name,classroom,detail,link,document))
    {
        out.print("<script type='text/javascript'>alert('创建成功');</script>");
    }
    else
    {
        out.print("<script type='text/javascript'>alert('创建失败');</script>");
    }
    out.print("<script type='text/javascript'>window.history.back();window.location.reload();</script>");
%>
</body>
</html>
