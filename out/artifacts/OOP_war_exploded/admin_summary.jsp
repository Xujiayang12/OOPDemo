<%--
  Created by IntelliJ IDEA.
  User: 小梁
  Date: 2019/3/9
  Time: 23:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*,java.net.*,info.*" contentType="text/html; charset=utf-8" %>

<html>
<head>
    <title>Grade assess</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <script src="http://echarts.baidu.com/build/dist/echarts.js"></script>
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
    int[] sum = User.getSummary(stulist);
    for (int i:sum)
    {
        System.out.println(i);
    }

%>
<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<div id="main" style="height:780px"></div>


<script type="text/javascript">
    // 路径配置
    require.config({
        paths: {
            echarts: 'http://echarts.baidu.com/build/dist'
        }
    });
    // 使用
    require(
        [
            'echarts',
            'echarts/chart/pie' // 使用柱状图就加载bar模块，按需加载
        ],
        function (ec) {
            // 基于准备好的dom，初始化echarts图表
            var myChart = ec.init(document.getElementById('main'));
            var option = {
                title: {
                    text: '项目成员成绩分布图',
                    subtext: '<%=cls%>(目前假设为老师评分)',
                    x: 'center'
                },
                tooltip: {
                    trigger: 'item',
                    formatter: "分数段：{b} | 人数{c}  ({d}%)"
                },
                legend: {
                    x: 'center',
                    y: 'bottom',
                    data: ['100-96', '95-91', '90-86', '85-81', '80-76', '75-71', '70-66', '65-61', '其他']
                },
                toolbox: {
                    show: true,
                    feature: {
                        mark: {show: true},
                        dataView: {show: true, readOnly: false},
                        magicType: {
                            show: true,
                            type: ['pie', 'funnel']
                        },
                        restore: {show: true},
                        saveAsImage: {show: true}
                    }
                },
                calculable: true,
                series: [
                    {
                        name: '面积模式',
                        type: 'pie',
                        radius: [50, 200],
                        center: ['50%', 310],
                        roseType: 'area',
                        x: '50%',               // for funnel
                        max: 40,                // for funnel
                        sort: 'ascending',     // for funnel
                        data: [
                            {value: <%=sum[0]%>, name: '100-96'},
                            {value: <%=sum[1]%>, name: '95-91'},
                            {value: <%=sum[2]%>, name: '90-86'},
                            {value: <%=sum[3]%>, name: '85-81'},
                            {value: <%=sum[4]%>, name: '80-76'},
                            {value: <%=sum[5]%>, name: '75-71'},
                            {value: <%=sum[6]%>, name: '70-66'},
                            {value: <%=sum[7]%>, name: '65-61'},
                            {value: <%=sum[8]%>, name: '其他'}
                        ]
                    }
                ]
            };
            // 为echarts对象加载数据
            myChart.setOption(option);
        }
    );
</script>

</body>
</html>