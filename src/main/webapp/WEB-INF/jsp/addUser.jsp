<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
function check(){
	
	alert("添加成功！");
}
</script>
</head>
<body>
    <form method="post" action="addUserSucc">
			姓名： <input name="name" value="" type="text"> <br>
			年龄：   <input name="age" value="" type="text"><br>
			性别：    <input name="sex" value="" type="text"><br>
			银行卡号：    <input name="idcard" value="" type="text"><br>
			手机号：    <input name="phone" value="" type="text"><br>
			地址：    <input name="address" value="" type="text"><br>
			入场时间：    <input name="time" value="" type="text"><br>
			
			<input type="submit" value="增加" onclick="check()">
     </form>
</body>
</html>