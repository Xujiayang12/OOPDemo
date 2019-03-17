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
    //
    //读取提交修改的表单信息
    request.setCharacterEncoding("utf-8");
    user.setName(URLEncoder.encode(request.getParameter("fullname"), "utf-8"));
    user.setPassword(URLEncoder.encode(request.getParameter("password"), "utf-8"));
    user.setQq(URLEncoder.encode(request.getParameter("qq"), "utf-8"));
    user.setPhone(URLEncoder.encode(request.getParameter("phone"), "utf-8"));
    user.setClassroom(URLEncoder.encode(request.getParameter("classroom"), "utf-8"));
    User.updateById(user);
    out.print("<script type='text/javascript'>alert('修改成功');document.location.href='MyInfo.jsp';</script>");
%>
</body>
</html>
