<%@ page language="java" import="java.util.*,java.net.*,info.*" contentType="text/html; charset=utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>老师评分</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String idd = request.getQueryString();
    int id = Integer.parseInt(idd.split("[&]")[0]);
    int score = Integer.parseInt(idd.split("[&]")[1]);
    User.setTeacherScore(id,score);
    out.print("<script>window.location.href='admin_score.jsp';</script>");

%>
</body>

</html>
