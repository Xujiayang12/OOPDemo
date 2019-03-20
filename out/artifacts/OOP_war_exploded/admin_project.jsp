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
    List<Project> projectlist = Project.findByClass(cls);

%>

<div class="container">
    <div class="jumbotron">
        <h1><%=cls%></h1>
        <h5>项目总览</h5>
    </div>
    <table class="table table-hover">
        <thead>
        <tr>
            <th>序号</th>
            <th>项目名称</th>
            <th>项目成员</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <%
            for(Project p:projectlist)
            {
                out.print("<tr><td>"+p.getId()+"</td><td>"+p.getName()+"</td><td>"+Project.getMemberTxt(p)+"</td><td><a href=\"admin_project_detail.jsp?id="+p.getId()+"\"><button type=\"button\" class=\"btn btn-info\">详情页</button></a></td></tr>");
            }
        %>
        </tbody>
    </table>
</div>

</body>
</html>