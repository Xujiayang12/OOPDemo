<%@ page language="java" import="java.util.*,java.net.*,info.*" contentType="text/html; charset=utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
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
    <title>admin_add_people</title>
</head>

<body style="background-color:#F8F9FA;">

<form action="admin_do_add_people.jsp" method="post"
      style="border-color: transparent;background-color: transparent;">
    <div class="input-group input-group-lg">
        <span class="input-group-addon">学号</span>
        <input type="text" name="username" class="form-control"
               aria-describedby="sizing-addon1" pattern="[0-9]*" required="required">
    </div>
    <br/>
    <div class="input-group input-group-lg">
        <span class="input-group-addon">密码</span>
        <input type="password" name="password" class="form-control"
               aria-describedby="sizing-addon1" required="required">
    </div>
    <br/>
    <div class="input-group input-group-lg">
        <span class="input-group-addon">姓名</span>
        <input type="text" name="fullname" class="form-control"
               aria-describedby="sizing-addon1" required="required">
    </div>
    <br/>
    <div class="input-group input-group-lg">
        <span class="input-group-addon">班级</span>
        <select class="form-control" name="classroom" required="required" >
            <option ></option>
            <option value="软工1班">软工1班</option>
            <option value="软工2班">软工2班</option>
            <option value="软工3班">软工3班</option>
            <option value="软工4班">软工4班</option>
            <option value="软工5班">软工5班</option>
            <option value="软工6班">软工6班</option>
            <option value="双学位">双学位</option>
        </select>
    </div>
    <br/>
    <div class="input-group input-group-lg">
        <span class="input-group-addon">QQ号</span>
        <input type="text" name="qq" class="form-control" aria-describedby="sizing-addon1"
               pattern="[0-9]*" required="required">
    </div>
    <br/>
    <div class="input-group input-group-lg">
        <span class="input-group-addon">手机号</span>
        <input type="text" name="phone" class="form-control"
               aria-describedby="sizing-addon1" pattern="[0-9]*" required="required">
    </div>
    <br/>
    <div class="input-group input-group-lg">
        <span class="input-group-addon">是否管理员</span>
        <select class="form-control" name="admin" required="required" >
            <option value="0">否</option>
            <option value="1">是</option>
        </select>
    </div>
    <br/>
    <button type="submit" class="btn btn-success">确认</button>
</form>
</body>
</html>
