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
    <link rel="stylesheet" href="markdown/css/editormd.preview.css"/>
    <script src="markdown/src/jquery.min.js"></script>
    <script src="markdown/lib/marked.min.js"></script>
    <script src="markdown/lib/prettify.min.js"></script>
    <script src="markdown/lib/raphael.min.js"></script>
    <script src="markdown/lib/underscore.min.js"></script>
    <script src="markdown/lib/sequence-diagram.min.js"></script>
    <script src="markdown/lib/flowchart.min.js"></script>
    <script src="markdown/lib/jquery.flowchart.min.js"></script>
    <script src="markdown/editormd.min.js"></script>

</head>
<body style="background-color:#F8F9FA;">
<%
    request.setCharacterEncoding("utf-8");
    String idd = request.getQueryString();
    int id = Integer.parseInt(idd.split("[=]")[1]);
    Project project;
    List<User> member;
    String doc;
    if(id == 0)
    {
        project = new Project();
        project.setDocument("");
        project.setClassroom("");
        project.setDetail("");
        project.setLink("");
        project.setName("请加入一个项目");
        project.setId(0);
        member = null;
        doc = " ";
    }
    else
    {
        project = Project.findById(id);
        member = User.findAllByProject(id);
        doc = project.getDocument();
        request.setAttribute("doc", doc);
    }

%>
<div class="mui-container">
    <div class="col s12 m7">
        <div class="card medium">
            <div class="card-image">
                <img src="https://ws3.sinaimg.cn/large/a74cb9c0ly1g0vhhmiyhsj20sg0lcaen.jpg">
                <span class="card-title"><h1><%=project.getName()%></h1><div class="chip">ID: <%=project.getId()%></div></span>
            </div>
            <div class="card-content">
                <p><%=project.getDetail()%>
                </p>
            </div>
            <a class="btn-floating halfway-fab waves-effect waves-light btn-large blue"><i
                    class="material-icons">people</i></a>
            <div class="card-action">
                <%
                    try{
                        for (User u : member) {
                            out.print("<div class=\"chip\">" + u.getName() + "</div>");
                        }
                    }
                    catch (Exception e)
                    {

                    }

                %>
            </div>
        </div>
    </div>
</div>
<br/>

<div class="mui-container">
    <div class="mui-panel">
        <ul class="mui-tabs__bar mui-tabs__bar--justified">
            <li class="mui--is-active"><a data-mui-toggle="tab" data-mui-controls="pane-justified-1">项目文档</a></li>
            <li><a data-mui-toggle="tab" data-mui-controls="pane-justified-2">项目工程</a></li>
            <li><a data-mui-toggle="tab" data-mui-controls="pane-justified-3">评分信息</a></li>
        </ul>
        <div class="mui-tabs__pane mui--is-active" id="pane-justified-1">
            <div id="doc-content">
<textarea style="display:none;" placeholder="markdown语言">
${doc}

</textarea>
            </div>
        </div>
        <div class="mui-tabs__pane" id="pane-justified-2">
            <a class="waves-effect waves-light btn blue">
                <i class="material-icons right" onclick="window.open('<%=project.getLink()%>');">play_for_work</i>下载
            </a>
            <label><h4><%=project.getLink()%></h4></label>
        </div>
        <div class="mui-tabs__pane" id="pane-justified-3">
            <ul class="collection">
                <%
                    try{
                        for(User u:member)
                        {
                            out.print("<li class=\"collection-item avatar\"><i class=\"material-icons circle green\">person</i><span class=\"title\">"+u.getName()+"</span><p>自评："+u.getSelf_score()+" 分<br>老师评分："+u.getTeacher_score()+" 分</p></li>");
                        }
                    }
                    catch (Exception e)
                    {

                    }

                %>
            </ul>


        </div>
    </div>
</div>
<script type="text/javascript">
    var testEditor;
    $(function () {
        testEditor = editormd.markdownToHTML("doc-content", {//注意：这里是上面DIV的id
            htmlDecode: "style,script,iframe",
            emoji: true,
            taskList: true,
            tocm: true,
            tex: true, // 默认不解析
            flowChart: true, // 默认不解析
            sequenceDiagram: true, // 默认不解析
            codeFold: true
        });
    });

    function del() {
        var r = confirm("你确定要退出此项目吗？")
        if(r == true)
        {
            window.location.href="QuitProject.jsp";
        }
        else
        {
            return false;
        }

    }
</script>
</body>
</html>