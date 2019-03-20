<%@ page language="java" import="java.util.*,java.net.*,info.*" contentType="text/html; charset=utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin People</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body style="background-color:#F8F9FA;">

<%
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
    String cls = user.getClassroom();
    List<User> stulist = User.findAllByClass(cls);
%>

<div class="container">
    <div class="jumbotron">
        <h1><%=cls%>
        </h1>
        <h5>成绩管理</h5>
    </div>
    <table class="table table-hover">
        <thead>
        <tr>
            <th>序号</th>
            <th>学号</th>
            <th>姓名</th>
            <th>加入的项目</th>
            <th>自评分数</th>
            <th>老师评分</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (User u : stulist) {
                if (u.getAdmin() == 0)
                    out.print("<tr><td>" + u.getId() + "</td><td>" + u.getAccount() + "</td><td>" + u.getName() + "</td><td><a href=\"admin_project_detail.jsp?id=" + u.getProject() + "\">" + u.getProjectName() + "</a></td><td>" + u.getSelf_score() + "</td><td>" + u.getTeacher_score() + "</td><td><a onclick=\"score(" + u.getId() + ")\"><button type=\"button\" class=\"btn btn-primary\">评分</button></a></td></tr>");
            }
        %>
        </tbody>
    </table>
</div>
<script>
    function score(uid) {
        teacher_score = prompt("请输入给这位同学的评分", "0");
        var real_score = parseInt(teacher_score);
        if (real_score >= 0) {
            window.location.href = 'admin_pingfen.jsp?' + uid + "&" + teacher_score;
        }
        else {
            alert("请输入有效有效分数");
        }
    }
</script>
</body>
</html>