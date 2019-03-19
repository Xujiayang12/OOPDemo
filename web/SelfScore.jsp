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
<%
    request.setCharacterEncoding("utf-8");
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
    int self_score = 0;
    try {
        self_score = user.getSelf_score();
    }
    catch (Exception e)
    {
        self_score = 0;
    }

%>
<div class="mui-container">
    <div class="row">
        <div class="col s12 m6">
            <div class="card large">
                <div class="card-image">
                    <img src="http://materializecss.cn/images/sample-1.jpg">
                    <span class="card-title">给自己的表现一个评分</span>
                </div>
                <div class="card-content">
                    <form action="doSelfScore.jsp" method="post">
                    <div class="input-field col s12">
                        <i class="material-icons prefix">filter_9_plus</i>
                        <input id="icon_prefix" type="text" class="validate" name="self_score" value="<%=self_score%>">
                        <label for="icon_prefix">评分</label>
                        <button class="btn waves-effect waves-light right" type="submit" name="action">确认
                            <i class="material-icons right">send</i>
                        </button>
                    </div>
                    </form>
                </div>

            </div>
        </div>
    </div>
</div>
</body>
</html>