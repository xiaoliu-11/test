<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>                                                                                                                       
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
success
<br>
欢迎您:${sessionScope.user.name }，您已成功登录！<h3><a href="<%=basePath%>/listUser" >进入用户管理页</a></h3>
</body>
</html>