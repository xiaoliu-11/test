<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>后台登录页面</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <!-- //for-mobile-apps -->
    <link href="css/login.css" rel="stylesheet" type="text/css" media="all" />

<link rel="stylesheet" href="css/style.css"> 

</head>
<body>
<!-- 背景特效 -->
<div id="controls"></div>
<script src='js/p5.min.js'></script>
<script src="js/index.js"></script>
<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js">
</script>
 <div class="main">
        <h1>
            后台登录系统
        </h1>
        <form id="myform" method="post" action="login">
           <span id="message" style="font-size:24px;"></span>
            <input type="text" id="phone" name="phone"  placeholder="手机号" > 
             <span id="userspan"></span>  
            <input type="password" placeholder="密码" name="password" id="password">
            <span
                id="pswspan"></span>
            <input id="btn" type="submit" value="登录">
        </form>
    </div>
    <div class="footer">
        <p>
                      有任何问题请私信网站管理人员
        </p>
    </div>

</body>
</html>