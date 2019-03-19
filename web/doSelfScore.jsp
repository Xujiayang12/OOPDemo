<%--
  Created by IntelliJ IDEA.
  User: atony
  Date: 19-3-19
  Time: 下午10:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*,java.net.*,info.*" contentType="text/html; charset=utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>Title</title>
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
    String self_score_txt = URLEncoder.encode(request.getParameter("self_score"), "utf-8");
    int self_score = Integer.parseInt(self_score_txt);
    User.setSelfScore(user.getId(),self_score);
    out.print("<script type='text/javascript'>alert('评分成功');document.location.href='ProjectDetail.jsp';</script>");
%>
</body>
</html>
