<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function check(){
	
	alert("修改成功！");
}
</script>
</head>
<body>
 <form method="post" action="updateUser">
			姓名： <input name="name" value="${c.name}" type="text"> <br>
			年龄：   <input name="age" value="${c.age}" type="text"><br>
			性别：    <input name="sex" value="${c.sex}" type="text"><br>
			银行卡号：    <input name="idcard" value="${c.idcard}" type="text"><br>
			手机号：    <input name="phone" value="${c.phone}" type="text"><br>
			地址：    <input name="address" value="${c.address}" type="text"><br>
			入场时间：    <input name="time" value="${c.time}" type="text"><br>
			<input type="hidden" value="${c.id}" name="id">
			<input type="submit" value="修改" onclick="check()">
     </form>
</body>
</html>