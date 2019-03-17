<%--
  Created by IntelliJ IDEA.
  User: atony
  Date: 19-3-2
  Time: 下午6:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*,java.net.*,info.*" contentType="text/html; charset=utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>Login Check</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String username = URLEncoder.encode(request.getParameter("username"),"utf-8");
    //使用URLEncoder解决无法在Cookie当中保存中文字符串问题
    String password = URLEncoder.encode(request.getParameter("password"),"utf-8");
    if(User.loginCheck(username,password)){
        String[] isUseCookies = request.getParameterValues("isUseCookie");
        if(isUseCookies!=null&&isUseCookies.length>0)
        {
            //把用户名和密码保存在Cookie对象里面
            Cookie usernameCookie = new Cookie("username",username);
            Cookie passwordCookie = new Cookie("password",password);
            usernameCookie.setMaxAge(864000);
            passwordCookie.setMaxAge(864000);//设置最大生存期限为10天
            response.addCookie(usernameCookie);
            response.addCookie(passwordCookie);
        }
        else
        {
            Cookie[] cookies = request.getCookies();
            if(cookies!=null&&cookies.length>0)
            {
                for(Cookie c:cookies)
                {
                    if(c.getName().equals("username")||c.getName().equals("password"))
                    {
                        c.setMaxAge(0); //设置Cookie失效
                        response.addCookie(c); //重新保存。
                    }
                }
            }
        }
        User user = User.findByAccount(username);
        if(user.getAdmin()==1)
            pageContext.forward("admin.jsp");
        else
            pageContext.forward("main.jsp");
    }else{
        out.print("<script type='text/javascript'>alert('密码错误或者无此用户');document.location.href='login.jsp';</script>");
    }
%>
</body>
</html>
