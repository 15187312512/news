<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理</title>
<link href="css/styles.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
function aa(){

window.close();
}

		
		
var code ; //在全局 定义验证码
function createCode(){ 
code = "";
var codeLength = 4;//验证码的长度
var checkCode = document.getElementById("checkCode");
checkCode.value = "";

var selectChar = new Array(2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','J','K','L','M','N','P','Q','R','S','T','U','V','W','X','Y','Z');

for(var i=0;i<codeLength;i++) {
   var charIndex = Math.floor(Math.random()*32);
   code +=selectChar[charIndex];
}
if(code.length != codeLength){
   createCode();
}
checkCode.value = code;
}
		
		

		function checkregisterform(){
		
		var inputCode = document.getElementById("input1").value.toUpperCase();

if(inputCode.length <=0) {
   alert("请输入验证码！");
   return false;
}
else if(inputCode != code ){
   alert("验证码输入错误！");
   createCode();
   return false;
		
		
		
}
	 
	 if (document.getElementById('user_name').value=="")
	{
		alert("账号不能为空");
		return false;
	}


	if (document.getElementById('user_password').value=="")
	{
		alert("密码不能为空");
		return false;
	}

	return true;
	
}




</script>

<style type="text/css">
img, div { behavior: url(iepngfix.htc) }

</style>

</head>


<body   onload="createCode();">
		<div id="wrappertop"></div>
			<div id="wrapper">
					<div id="content">
						<div id="header">
							<span style="color: blue;font-size: 18px;font-weight: bold;"><br /><br /><br />后台管理</span>
						</div>
							
						<div id="darkbannerwrap">
						</div>
						<form action="houtaimethod!login.action" method="post"  onsubmit="return checkregisterform()">
						<fieldset class="form">
							
                        	<p>
								<label for="user_name">账号:</label>
								<input name="username" id="user_name" type="text"  />
							</p>
							<p>
								<label for="user_password">密码:</label>
								<input name="password" id="user_password" type="password"  />
							</p>
							
							<p>
								<label for="user_password">输入验证码:</label>
								<input type="text" id="input1" size="25"/>
							</p>
							
							<p>
								<label for="user_password">获取验证码:</label>
								<input type="text" id="checkCode" class="code" style="width: 55px" size="20"/> <a href="####" onclick="createCode()">看不清楚</a>
							</p>
							
							<button type="submit" class="positive" name="Submit">
								登录</button>
								
								<button type="button" class="positive"  onclick="aa()" >
								退出</button>
   						  </fieldset>
						<div align="center"><a href="."><em><strong>【返回首页】</strong></em></a>
						  
						  </div>
						</form></div>
				</div>   
  


</body>
</html>