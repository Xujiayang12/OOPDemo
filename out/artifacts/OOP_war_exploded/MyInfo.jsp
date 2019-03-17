<%--
  Created by IntelliJ IDEA.
  User: atony
  Date: 19-3-3
  Time: 下午6:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*,java.net.*,info.*" contentType="text/html; charset=utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html style="background-color:#F8F9FA;">
<head>
    <title>My Info</title>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css"
          integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>
</head>
<body style="background-color:#F8F9FA;">
<%
    //    request.setCharacterEncoding("utf-8");
//    String username = URLEncoder.encode(request.getParameter("username"), "utf-8");
//    String password = URLEncoder.encode(request.getParameter("password"), "utf-8");
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
    String user_project;
    if(user.getProject() == 0)
    {
        user_project = "还未加入";
    }
    else {
        user_project = Project.findById(user.getProject()).getName();
    }
%>
<div class="info" style="background-color:#F8F9FA; ">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">用户名</h3>
        </div>
        <div class="panel-body">
            <%=user.getName()%>
            <%
                if(user.getAdmin()==1){
                    out.print("(管理员)");
                }
                else {
                    out.print("(普通用户)");
                }

            %>
        </div>
    </div>
    <div class="panel panel-success">
        <div class="panel-heading">
            <h3 class="panel-title">学号</h3>
        </div>
        <div class="panel-body">
            <%=user.getAccount()%>
        </div>
    </div>
    <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title">班级</h3>
        </div>
        <div class="panel-body">
            <%--<%--%>
                <%--String classroom = URLDecoder.decode(user.getClassroom(),"UTF-8");--%>
            <%--%>--%>
            <%--<%=classroom%>--%>
            <%=user.getClassroom()%>
        </div>
    </div>
    <div class="panel panel-warning">
        <div class="panel-heading">
            <h3 class="panel-title">QQ号</h3>
        </div>
        <div class="panel-body">
            <%=user.getQq()%>
        </div>
    </div>
    <div class="panel panel-danger"  >
        <div class="panel-heading">
            <h3 class="panel-title">手机号</h3>
        </div>
        <div class="panel-body">
            <%=user.getPhone()%>
        </div>
    </div>
    <div class="panel panel-success" <% if (user.getAdmin()==1){out.print("style=\"visibility: hidden;\"");}%>>
        <div class="panel-heading">
            <h3 class="panel-title">加入的项目</h3>
        </div>
        <div class="panel-body">
            <%=user_project%>
        </div>
    </div>

    <a type="button" class="btn btn-success" href="EditInfo.jsp">编辑信息</a>
</div>
</body>
</html>
