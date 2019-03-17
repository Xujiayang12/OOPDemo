<%--
  Created by IntelliJ IDEA.
  User: atony
  Date: 19-3-4
  Time: 下午5:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*,java.net.*,info.*" contentType="text/html; charset=utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>Do Edit Info</title>
</head>
<body>
<%
    //读取Cookie
    Cookie[] cookies = request.getCookies();
    String user_name = "";
    String pass_word = "";
    if (cookies != null && cookies.length > 0) {
        for (Cookie c : cookies) {
            if (c.getName().equals("username")) {
                user_name = URLDecoder.decode(c.getValue(), "utf-8");
            }
            if (c.getName().equals("password")) {
                pass_word = URLDecoder.decode(c.getValue(), "utf-8");
            }
        }
    }
    User user = User.findByAccount(user_name);
    request.setCharacterEncoding("utf-8");
    String pidtxt = request.getParameter("projectID");
    int pid = Integer.parseInt(pidtxt);
    User.updateHisProject(user.getId(),pid);
    out.print("<script type='text/javascript'>alert('加入成功');document.location.href='ProjectDetail.jsp';</script>");
%>
</body>
</html>
