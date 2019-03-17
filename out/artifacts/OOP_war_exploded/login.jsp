<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*,java.net.*" %>
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
    <link rel="stylesheet" href="https://cdn.bootcss.com/weui/1.1.3/style/weui.min.css">
    <link rel="stylesheet" href="https://cdn.bootcss.com/jquery-weui/1.2.1/css/jquery-weui.min.css">
    <script src="https://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/jquery-weui/1.2.1/js/jquery-weui.min.js"></script>
    <meta http-equiv="Content-Security-Policy" content="block-all-mixed-content">
    <script>(/eruda=true/.test(window.location) || "true" == localStorage.getItem("active-eruda")) && (document.write('<script src="https://cdn.jsdelivr.net/npm/eruda@1.4.3/eruda.min.js"><\/script>'), document.write("<script>eruda.init();<\/script>"))</script>
    <script>/vconsole=true/.test(window.location) && (document.write('<script src="https://cdn.jsdelivr.net/npm/vconsole@3.1.0/dist/vconsole.min.js"><\/script>'), document.write("<script>var vConsole = new VConsole();<\/script>"))</script>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
    <title>项目文档管理系统 - 登录</title>
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
    <link rel="stylesheet" href="/css/prism-solarizedlight.css" type="text/css">
    <link rel="stylesheet" href="/css/prism-line-numbers.css" type="text/css">
</head>

<body>
<%
    request.setCharacterEncoding("utf-8");
    String username = "";
    String password = "";
    Cookie[] cookies = request.getCookies();
    if (cookies != null && cookies.length > 0) {
        for (Cookie c : cookies) {
            if (c.getName().equals("username")) {
                username = URLDecoder.decode(c.getValue(), "utf-8");
            }
            if (c.getName().equals("password")) {
                password = URLDecoder.decode(c.getValue(), "utf-8");
            }
        }
    }
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
                    <a href="login.jsp">
                        <i class="icon material-icons sidebar-icons">home</i>登陆</a></li>
                <li class="nav-item">
                    <a href="signup.jsp">
                        <i class="icon material-icons sidebar-icons">bookmark</i>注册</a></li>
            </ul>
        </div>
    </div>
    <a class="off-canvas-overlay" href="#close"></a>
    <div class="off-canvas-content">
        <main>
            <div class="container container-header">
                <div class="columns">
                    <div class="column col-xs-12 col-8 daily_pic">
                        <div class="card">
                            <div class="card-image" style="background-image:url(./static/d.jpg)">
                                <p>项目文档管理系统</p>
                            </div>
                            <div class="card-footer bg-gray hide-xs">
                                <div class="card-title">请登录</div>
                            </div>
                        </div>
                    </div>
                    <div class="column col-xs-12 col-4 author_info card-footer bg-gray hide-xs"
                         style="border-color: transparent;background-color: transparent;">
                        <form action="handlelogin.jsp" method="post"
                              style="border-color: transparent;background-color: transparent;">
                            <div class="weui-form-preview"
                                 style="border-color: transparent;background-color: transparent;">
                                <div class="weui-cell">
                                    <div class="weui-cell__hd"><label class="weui-label">学号</label></div>
                                    <div class="weui-cell__bd">
                                        <input class="weui-input" type="text" name="username"/>
                                    </div>
                                </div>
                                <div class="weui-cell">
                                    <div class="weui-cell__hd"><label class="weui-label">密码</label></div>
                                    <div class="weui-cell__bd">
                                        <input class="weui-input" type="password" name="password"/>
                                    </div>
                                </div>
                                <div class="weui-form-preview__bd">
                                    <div class="weui-form-preview__item" style="font-size: small;">
                                        <span class="weui-form-preview__value">建议使用Google浏览器</span>
                                    </div>
                                </div>
                                <label for="weuiAgree" class="weui-agree">
                                    <input id="weuiAgree" type="checkbox" class="weui-agree__checkbox"
                                           name="isUseCookie" id="s11" checked="checked">
                                    <span class="weui-agree__text">十天内记住我</span>
                                </label>
                                <div class="weui-form-preview__ft">
                                    <button type="submit" class="weui-form-preview__btn weui-form-preview__btn_primary"
                                            href="javascript:">登录
                                    </button>
                                    <a class="weui-form-preview__btn weui-form-preview__btn_default"
                                            href="signup.jsp">注册
                                    </a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </main>
        <div class="back-to-top rounded">
            <a href="#">
                <i class="icon material-icons casino-icons">expand_less</i></a>
        </div>
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
    console.log(" \n %c Spectre Theme | © neoFelhz | Verision 180330 %c https://github.com/neoFelhz/hexo-theme-spectre ", "color: #fff; background-image: linear-gradient(90deg, rgb(236, 61, 1213) 0%, rgb(94, 108, 198) 100%); padding:5px 1px;", "background-image: linear-gradient(90deg, rgb(94, 108, 198) 0%, rgb(194, 194, 194) 0%); padding:5px 0;")</script>
</body>

</html>