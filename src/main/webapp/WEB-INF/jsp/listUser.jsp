<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>User</title>

 <link rel="stylesheet" href="css/newFile.css">
    <link rel="stylesheet" type="text/css" href="css/jquery-ui.min.css" />

<script language="javascript"> 
    function delcfm() { 
        if (!confirm("删除之后不可恢复，确认要删除？")) { 
            window.event.returnValue = false; 
        } 
    } 
    
    
    function jjump(p,s){
		var reg = /^\d*$/g; //限定数字
		if(!reg.test(p)){
			var p = 1;
		}
		
		document.submitForm.currentPage.value=p;
		document.submitForm.pageSize.value=s;
		//document.submitForm.action=<%=basePath%>/listUser;
		document.submitForm.submit();
	}
	
		
	    function jump(p,s){
		var reg = /^\d*$/g; //限定数字
		if(!reg.test(p)){
			var p = 1;
		}
		

		if(parseInt(p) < 1){
			p = 1;
		}else if(parseInt(p) > parseInt(document.submitForm.pageCount.value)){  
			p = parseInt(document.submitForm.pageCount.value);
		}	
			document.submitForm.currentPage.value=p;
			document.submitForm.pageSize.value=s;
			//document.submitForm.action=<%=basePath%>/listUser;
			document.submitForm.submit();
		}	
</script>
<style type="text/css">
			/*表格样式*/			
			table {
				width: 90%;
				background: #ccc;
				margin: 10px auto;
				border-collapse: collapse;/*border-collapse:collapse合并内外边距(去除表格单元格默认的2个像素内外边距*/	
			}				
			th,td {
				height: 25px;
				line-height: 25px;
				text-align: center;
				border: 1px solid #ccc;
			}		
			th {
				background: #eee;
				font-weight: normal;
			}		
			tr {
				background: #fff;
			}		
			tr:hover {
				background: #DDDDDD;
			}		
			td a {
				color: #06f;
				text-decoration: none;
			}		
			td a:hover {
				color: #06f;
				text-decoration: underline;
			}
			
			.td2{text-align: right;}
		</style>
</head>


<body>
 <h1 align="center">职工列表</h1>
 
 <form name="submitForm" action="<%=basePath%>/listUser" method="post" onsubmit="jump(1,${pager.pageSize })">
  		<input type="hidden" name="currentPage" >
		<input type="hidden" name="pageSize" >
		<input type="hidden" name="pageCount" value="${pager.pageCount }"><!-- 给Pager添加一个set方法解决报错 -->
		<table style="width:70%;margin:0 auto;">
  		<tr>
  			<td>用户名：<input type="text" name="name" value="${user.name }"/></td>
  			<td>电话：<input type="text" name="phone" value="${user.phone }" /></td>
  			<td><input type="submit" value="查询" /></td>
  		</tr>
  	

  	</form>
 <table>
 <div>
    <a href="addUser">添加用户</a>
    <button>批量删除</button>
 </div>
  	
 <hr style="color:red;"/>
   <tr> 
     
      <td>全选<input type="checkbox" id="id1"></td>
      <td>id</td>
      <td>姓名</td>
      <td>年龄</td>
      <td>性别</td>
      <td>银行卡号</td>
      <td>手机号</td>
      <td>地址</td>
      <td>入场时间</td>
      <td>编辑/删除</td>
      
   
   </tr>
   <c:forEach items="${ userList}" var="c" >
       <tr>
            <td><input type="checkbox" id="id2"></td>
           <td>${c.id}</td>
           <td>${c.name}</td>
           <td>${c.age}</td>
           <td>${c.sex}</td>
           <td>${c.idcard}</td>
           <td>${c.phone}</td>
           <td>${c.address}</td>
           <td>${c.time}</td>
           <td><a href="editUser?id=${c.id}" ><img src="img/3333.png" /></a>
           <a href="deleteUser?id=${c.id }" onclick="delcfm()"><img src="img/2222.png" /></a></td>
           
       </tr>
   
   </c:forEach>
   
 </table>
 
 <table>
		<tr>
			<td>
			第<span style="color: red;">${pager.currentPage }</span>/${pager.pageCount }页
			共${pager.total }条
			</td>
			<td style="text-align:center;">
				<c:choose>
					<c:when test="${pager.currentPage==1 }">
						首页
						上一页
					</c:when>
					<c:otherwise>
						<a href="javascript:jump(1,${pager.pageSize })">首页</a>
						<a href="javascript:jump(${pager.currentPage-1 },${pager.pageSize })">上一页</a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${pager.currentPage==pager.pageCount }">
						下一页
						末页
					</c:when>
					<c:otherwise>
						<a href="javascript:jump(${pager.currentPage+1 },${pager.pageSize })">下一页</a>
						<a href="javascript:jump(${pager.pageCount },${pager.pageSize })">末页</a>
					</c:otherwise>
				</c:choose>
				跳到:<input style="width:20px" id="gPage" type="text" value="${pager.currentPage }" />
				<input type="button" value="go" onclick="jump(document.getElementById('gPage').value,${pager.pageSize })" />
				每页显示:<select onchange="jump(1,this.value)">
						<option value="3" <c:if test="${pager.pageSize==3 }">selected="selected"</c:if>>3</option>
						<option value="5" <c:if test="${pager.pageSize==5 }">selected="selected"</c:if>>5</option>
						<option value="10" <c:if test="${pager.pageSize==10 }">selected="selected"</c:if>>10</option>
						<option value="15" <c:if test="${pager.pageSize==15 }">selected="selected"</c:if>>15</option>
						<option value="20" <c:if test="${pager.pageSize==20 }">selected="selected"</c:if>>20</option>
					</select>
			</td>
		</tr>
	</table>
 
 
 
 
 <div id="my_dialog" title="新建用户"  style="display: none" >
    <form>
                   <p>   姓名： <input name="name" value="" type="text" id="name"></p> <br>
			 <p>年龄：   <input name="age" value="" type="text" id="age"></p><br>
			 <p>性别：    <input name="sex" value="" type="text" id="sex"></p><br>
			 <p>银行卡号：    <input name="idcard" value="" type="text" id="idcard"></p><br>
			 <p>手机号：    <input name="phone" value="" type="text" id="phone"></p><br>
			 <p>地址：    <input name="address" value="" type="text" id="address"></p><br>
			 <p>入场时间：    <input name="time" value="" type="text" id="time"></p><br>
      <div style="float: right;">
       <button class="my-btn-gray" onclick="create_paper_cancel()">取消</button>
       <button class="my-btn-blue" onclick="create_paper_save()">确定</button>
      </div>
    </form>
  </div>
 
 <script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>

<script type="text/javascript" src="js/newFile.js"></script>
</body>
</html>