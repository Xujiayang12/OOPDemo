<%@ page language="java" import="java.util.*,java.net.*,info.*" contentType="text/html; charset=utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html style="display:none">

<head>
    <meta charset="utf-8">
    <script>window.materialVersion = "180330",
        window.oldVersion = ["1.5.0a", "1.5.0b", "1.5.0c", "150d", "150e", "150f", "150g", "180222", "180223"]</script>
    <meta http-equiv="x-dns-prefetch-control" content="on">
    <link rel="dns-prefetch" href="//cdn.jsdelivr.net">
    <link rel="dns-prefetch" href="//s.nfz.yecdn.com">
    <link rel="preconnect" href="https://cdn.jsdelivr.net">
    <link rel="preconnect" href="https://s.nfz.yecdn.com">
    <meta http-equiv="Content-Security-Policy" content="block-all-mixed-content">
    <script>(/eruda=true/.test(window.location) || "true" == localStorage.getItem("active-eruda")) && (document.write('<script src="https://cdn.jsdelivr.net/npm/eruda@1.4.3/eruda.min.js"><\/script>'), document.write("<script>eruda.init();<\/script>"))</script>
    <script>/vconsole=true/.test(window.location) && (document.write('<script src="https://cdn.jsdelivr.net/npm/vconsole@3.1.0/dist/vconsole.min.js"><\/script>'), document.write("<script>var vConsole = new VConsole();<\/script>"))</script>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
    <title>项目文档管理系统</title>
    <link rel="icon shortcut" type="image/ico" href="https://st.nfz.yecdn.com/favicon.ico">
    <link rel="icon" href="https://st.nfz.yecdn.com/favicon.png">
    <meta name="format-detection" content="telephone=no">
    <meta name="theme-color" content="#455A64">
    <meta http-equiv="Cache-Control" content="no-transform">
    <meta http-equiv="Cache-Control" content="no-siteapp">
    <link rel="manifest" href="/static/manifest.min.json">
    <script>window.lsloader = {
        jsRunSequence: [],
        jsnamemap: {},
        cssnamemap: {}
    },
        lsloader.removeLS = function (e) {
            try {
                localStorage.removeItem(e)
            } catch (e) {
            }
        },
        lsloader.setLS = function (e, s) {
            try {
                localStorage.setItem(e, s)
            } catch (e) {
            }
        },
        lsloader.getLS = function (e) {
            var s = "";
            try {
                s = localStorage.getItem(e)
            } catch (e) {
                s = ""
            }
            return s
        },
        versionString = "/*" + (window.materialVersion || "unknownVersion") + "*/",
        lsloader.clean = function () {
            var e, s;
            try {
                for (e = [], s = 0; s < localStorage.length; s++) e.push(localStorage.key(s));
                e.forEach(function (e) {
                    var s = lsloader.getLS(e);
                    window.oldVersion && window.oldVersion.reduce(function (e, t) {
                            return e || -1 !== s.indexOf("/*" + t + "*/")
                        },
                        !1) && lsloader.removeLS(e)
                })
            } catch (e) {
            }
        },
        lsloader.clean(),
        lsloader.load = function (e, s, t, n) {
            var o;
            if ("boolean" == typeof t && (n = t, t = void 0), n = n || !1, t = t ||
                function () {
                },
            (o = this.getLS(e)) && -1 === o.indexOf(versionString)) return this.removeLS(e),
                void this.requestResource(e, s, t, n);
            if (o) {
                if (o.split(versionString)[0] != s) return console.log("reload:" + s),
                    this.removeLS(e),
                    void this.requestResource(e, s, t, n);
                o = o.split(versionString)[1],
                    n ? (this.jsRunSequence.push({
                        name: e,
                        code: o
                    }), this.runjs(s, e, o)) : (document.getElementById(e).appendChild(document.createTextNode(o)), t())
            } else this.requestResource(e, s, t, n)
        },
        lsloader.requestResource = function (e, s, t, n) {
            var o = this;
            n ? this.iojs(s, e,
                function (e, s, t) {
                    o.setLS(s, e + versionString + t),
                        o.runjs(e, s, t)
                }) : this.iocss(s, e,
                function (t) {
                    document.getElementById(e).appendChild(document.createTextNode(t)),
                        o.setLS(e, s + versionString + t)
                },
                t)
        },
        lsloader.iojs = function (e, s, t) {
            var n, o = this;
            o.jsRunSequence.push({
                name: s,
                code: ""
            });
            try {
                (n = new XMLHttpRequest).open("get", e, !0),
                    n.onreadystatechange = function () {
                        if (4 == n.readyState) {
                            if ((n.status >= 200 && n.status < 300 || 304 == n.status) && "" != n.response) return void t(e, s, n.response);
                            o.jsfallback(e, s)
                        }
                    },
                    n.send(null)
            } catch (t) {
                o.jsfallback(e, s)
            }
        },
        lsloader.iocss = function (e, s, t, n) {
            var o, a = this;
            try {
                (o = new XMLHttpRequest).open("get", e, !0),
                    o.onreadystatechange = function () {
                        if (4 == o.readyState) {
                            if ((o.status >= 200 && o.status < 300 || 304 == o.status) && "" != o.response) return t(o.response),
                                void n();
                            a.cssfallback(e, s, n)
                        }
                    },
                    o.send(null)
            } catch (t) {
                a.cssfallback(e, s, n)
            }
        },
        lsloader.iofonts = function (e, s, t, n) {
            var o, a = this;
            try {
                (o = new XMLHttpRequest).open("get", e, !0),
                    o.onreadystatechange = function () {
                        if (4 == o.readyState) {
                            if ((o.status >= 200 && o.status < 300 || 304 == o.status) && "" != o.response) return t(o.response),
                                void n();
                            a.cssfallback(e, s, n)
                        }
                    },
                    o.send(null)
            } catch (t) {
                a.cssfallback(e, s, n)
            }
        },
        lsloader.runjs = function (e, s, t) {
            var n, o, a;
            if (s && t) for (n in this.jsRunSequence) this.jsRunSequence[n].name == s && (this.jsRunSequence[n].code = t);
            this.jsRunSequence[0] && this.jsRunSequence[0].code && "failed" != this.jsRunSequence[0].status ? ((o = document.createElement("script")).appendChild(document.createTextNode(this.jsRunSequence[0].code)), o.type = "text/javascript", document.getElementsByTagName("head")[0].appendChild(o), this.jsRunSequence.shift(), this.jsRunSequence.length > 0 && this.runjs()) : this.jsRunSequence[0] && "failed" == this.jsRunSequence[0].status && (a = this, (o = document.createElement("script")).src = this.jsRunSequence[0].path, o.type = "text/javascript", this.jsRunSequence[0].status = "loading", o.onload = function () {
                a.jsRunSequence.shift(),
                a.jsRunSequence.length > 0 && a.runjs()
            },
                document.body.appendChild(o))
        },
        lsloader.tagLoad = function (e, s) {
            this.jsRunSequence.push({
                name: s,
                code: "",
                path: e,
                status: "failed"
            }),
                this.runjs()
        },
        lsloader.jsfallback = function (e, s) {
            if (!this.jsnamemap[s]) {
                for (var t in this.jsnamemap[s] = s, this.jsRunSequence) this.jsRunSequence[t].name == s && (this.jsRunSequence[t].code = "", this.jsRunSequence[t].status = "failed", this.jsRunSequence[t].path = e);
                this.runjs()
            }
        },
        lsloader.cssfallback = function (e, s, t) {
            var n, o;
            this.cssnamemap[s] || (this.cssnamemap[s] = 1, (n = document.createElement("link")).type = "text/css", n.href = e, n.rel = "stylesheet", n.onload = n.onerror = t, (o = document.getElementsByTagName("script")[0]).parentNode.insertBefore(n, o))
        },
        lsloader.runInlineScript = function (e, s) {
            var t = document.getElementById(s).innerText;
            this.jsRunSequence.push({
                name: e,
                code: t
            }),
                this.runjs()
        },
        lsloader.css = function (e, s) {
            void 0 === window.lsLoadCSSMaxNums && (window.lsLoadCSSMaxNums = 0),
                window.lsLoadCSSMaxNums++,
                lsloader.load(e, s,
                    function () {
                        void 0 === window.lsLoadCSSNums && (window.lsLoadCSSNums = 0),
                            window.lsLoadCSSNums++,
                        window.lsLoadCSSNums == window.lsLoadCSSMaxNums && (document.documentElement.style.display = "")
                    },
                    !1)
        },
        lsloader.js = function (e, s) {
            lsloader.load(e, s, !0)
        }</script>
    <script>function Queue() {
        this.dataStore = [],
            this.offer = function (e) {
                this.debug && console.log("Offered a Queued Function.");
                "function" == typeof e ? this.dataStore.push(e) : console.log("You must offer a function.")
            },
            this.poll = function () {
                this.debug && console.log("Polled a Queued Function.");
                return this.dataStore.shift()
            },
            this.execNext = function () {
                var e = this.poll();
                void 0 !== e && (this.debug && console.log("Run a Queued Function."), e())
            },
            this.debug = !1,
            this.startDebug = function () {
                this.debug = !0
            }
    }

    var queue = new Queue</script>
    <style id="spectre_css"></style>
    <script>lsloader.css("spectre_css", "https://st.nfz.yecdn.com/blog.nfz.moe/libs/spectre/spectre.min.css")</script>
    <style id="spectre_exp_css"></style>
    <script>lsloader.css("spectre_exp_css", "https://st.nfz.yecdn.com/blog.nfz.moe/libs/spectre/spectre-exp.min.css")</script>
    <style id="style_css"></style>
    <script>lsloader.css("style_css", "https://st.nfz.yecdn.com/blog.nfz.moe/css/styles.min.css")</script>
    <style id="prism_css"></style>
    <script>lsloader.css("prism_css", "https://st.nfz.yecdn.com/blog.nfz.moe/css/prism.min.css")</script>
    <style>body, html {
        overflow-x: hidden !important
    }</style>
    <link rel="canonical" href="https://blog.nfz.moe/">
    <script type="application/ld+json">{
        "@context": "http://schema.org",
        "@type": "Blog",
        "name": "neoFelhz&#39;s Blog",
        "author": {
          "@type": "Person",
          "name": "neoFelhz",
          "image": {
            "@type": "ImageObject",
            "url": "https://st.nfz.yecdn.com/img/avatar/icon-144x144.png"
          },
          "description": "Nothing can be done without paranoia."
        },
        "publisher": {
          "@type": "Organization",
          "name": "neoFelhz&#39;s Blog",
          "logo": {
            "@type": "ImageObject",
            "url": "https://st.nfz.yecdn.com/favicon.png"
          }
        },
        "url": "https://blog.nfz.moe",
        "image": {
          "@type": "ImageObject",
          "url": "https://st.nfz.yecdn.com/favicon.png"
        },
        "mainEntityOfPage": {
          "@type": "WebPage",
          "@id": "https://blog.nfz.moe"
        },
        "keywords": "项目,文档,管理,系统",
        "description": "项目文档管理系统"
      }
    </script>
    <link rel="stylesheet" href="/css/prism-solarizedlight.css" type="text/css">
    <link rel="stylesheet" href="/css/prism-line-numbers.css" type="text/css">
</head>

<body>
<%
    request.setCharacterEncoding("utf-8");
    String user_name="";
    String pass_word = "";
    String username = URLEncoder.encode(request.getParameter("username"),"utf-8");
    String password = URLEncoder.encode(request.getParameter("password"),"utf-8");
    Cookie[] cookies = request.getCookies();
    if(cookies!=null&&cookies.length>0)
    {
        for(Cookie c:cookies)
        {
            if(c.getName().equals("username"))
            {
                user_name = URLDecoder.decode(c.getValue(),"utf-8");
            }
            if(c.getName().equals("password"))
            {
                pass_word = URLDecoder.decode(c.getValue(),"utf-8");
            }
        }
    }
    User user = User.findByAccount(username);
%>
<div class="off-canvas off-canvas-sidebar-show">
    <a class="off-canvas-toggle btn btn-link btn-action" href="#sidebar">
        <i class="icon material-icons casino-icons">menu</i></a>
    <div id="sidebar" class="off-canvas-sidebar">
        <div id="sidebar-content">
            <ul class="nav">
                <a class="off-canvas-toggle btn btn-link btn-action" href="#close">
                    <i class="icon material-icons casino-icons">arrow_back</i></a>
                <div class="sidebar-top"></div>
                <span class="h4 text-center">项目文档管理系统</span>
                <div class="divider"></div>
                <li class="nav-item">
                    <a href="MyInfo.jsp" target="main">姓名：<%=user.getName() %>
                        <%
                            if(user.getAdmin()==1){
                                out.print("(管理员)");
                            }
                            else {
                                out.print("(普通用户)");
                            }

                        %>
                    </a></li>
                <div class="divider"></div>
                <li class="nav-item">
                    <a href="admin_all_people.jsp" target="main">
                        <i class="icon material-icons sidebar-icons">people</i>班级成员</a></li>
                <li class="nav-item">
                    <a href="markdown/examples/SetProject.jsp" target="main">
                        <i class="icon material-icons sidebar-icons">pages</i>班级项目</a></li>
                <li class="nav-item">
                    <a href="ProjectDetail.jsp" target="main">
                        <i class="icon material-icons sidebar-icons">school</i>成绩管理</a></li>
                <li class="nav-item">
                    <a href="SeeProject.jsp" target="main">
                        <i class="icon material-icons sidebar-icons">event_note</i>成绩统计</a></li>
                <li class="nav-item">
                    <a href="DeleteProject.jsp" target="main">
                        <i class="icon material-icons sidebar-icons">delete</i>再想要什么</a></li>
                <div class="divider"></div>
                <li class="nav-item">
                    <a href="quit.jsp" target="_top">
                        <i class="icon material-icons sidebar-icons">exit_to_app</i>退出</a></li>
            </ul>
        </div>
    </div>
    <a class="off-canvas-overlay" href="#close"></a>
    <div class="off-canvas-content" >
        <iframe name="main" id="main" frameborder="0" scrolling="no" width="1000" height="1000" style="border-top-width:60px; border-color: transparent;"></iframe>
    </div>
</div>
<script>lsloader.js("lazy_js", "https://st.nfz.yecdn.com/blog.nfz.moe/libs/js/lazyload.min.js")</script>
<script>lsloader.js("nfz_js", "https://st.nfz.yecdn.com/blog.nfz.moe/static/js/nfz.js")</script>
<script type="text/ls-javascript" id="lazy-load">var myLazyLoad = new LazyLoad({
        elements_selector: ".lazy"
      });
      // Start Queue
      window.onload = function() {
        setInterval(function() {
          queue.execNext();
        },
        200);
      };
</script>
<script type="text/javascript">var copyrightNow = (new Date).getFullYear(),
    textContent = document.querySelector("span[year]");
copyrightSince = 2016,
    copyrightSince === copyrightNow ? textContent.textContent = copyrightNow : textContent.textContent = copyrightSince + " - " + copyrightNow</script>
<script>!
    function () {
        for (var e = document.querySelectorAll('script[type="text/ls-javascript"]'), r = 0; r < e.length; ++r) {
            var n = e[r];
            lsloader.runInlineScript(n.id, n.id)
        }
    }(),
    console.log("2333")</script>
</body>

</html>