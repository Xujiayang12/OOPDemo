<%@ page language="java" import="java.util.*,java.net.*,info.*" contentType="text/html; charset=utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.bootcss.com/material-design-icons/3.0.1/iconfont/material-icons.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/materialize/1.0.0-rc.2/css/materialize.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/materialize/1.0.0-rc.2/js/materialize.min.js"></script>
    <link href="//cdn.muicss.com/mui-0.9.41/css/mui.min.css" rel="stylesheet" type="text/css"/>
    <script src="//cdn.muicss.com/mui-0.9.41/js/mui.js"></script>
    <script src="https://cdn.bootcss.com/marked/0.6.1/marked.min.js"></script>

</head>
<body style="background-color:#F8F9FA;">


<div class="mui-container">
    <div class="col s12 m7">
        <div class="card small">
            <div class="card-image">
                <img src="https://ws3.sinaimg.cn/large/a74cb9c0ly1g0vhhmiyhsj20sg0lcaen.jpg">
                <span class="card-title"><h1>加入项目</h1></span>
            </div>
            <div class="card-content">
                <h5>这里写一些组队规则</h5>
            </div>
            <a class="btn-floating halfway-fab waves-effect waves-light btn-large blue"><i
                    class="material-icons">people</i></a>
            <div class="card-action">

            </div>
        </div>
    </div>
</div>
<br/>
<%
    List<Project> projectlist = Project.getAllProject();

%>
<div class="mui-container">
    <div class="mui-panel">
        <label><h4>选择项目</h4></label>
        <form action="doJoinProject.jsp" method="post" >
            <div class="input-field">
                <select class="browser-default" required="required" name="projectID">
                    <option value="" disabled selected>选择你要加入的项目</option>
                    <%
                        for(Project p:projectlist)
                        {
                            out.print("<option value=\""+p.getId()+"\">ID:"+p.getId()+" | "+p.getName()+" | "+p.getClassroom()+"</option>");
                        }
                    %>
                </select>
            </div>
            <button class="btn waves-effect waves-light right" type="submit">加入
                <i class="material-icons right">send</i>
            </button>
        </form>
    </div>
</div>
</body>
</html>