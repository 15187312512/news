<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<link href="css/auto.css" rel="stylesheet" type="text/css" />
		<title>新用户注册</title>
		<%
		response.addHeader("Cache-Control", "no-store, must-revalidate"); 
		response.addHeader("Expires", new java.util.Date().getTime()+"");
		%>
		
	<style type="text/css">
#regdiv {
	position: absolute;
	width:825px;
	height: 500px;
	background-image: url(img/b2c_04.jpg);
}
</style>
<script language="javascript" type="text/javascript" src="js/jquery.min.js"></script>

<script language="javascript" type="text/javascript">

function checkregisterform()
{
	 
	 if (document.getElementById('usernameid').value=="")
	{
		alert("昵称不能为空");
		return false;
	}
	var valid=/^\w+$/;
	if(!valid.test(document.getElementById('usernameid').value)){
		alert("用户名必须是数字、字母或下划线");
		return false;
	}

	if (document.getElementById('passwordid').value=="")
	{
		alert("密码不能为空");
		return false;
	}
	if (document.getElementById('passwordid').value.length<6)
	{
		alert("密码长度必须大于6位");
		return false;
	}
	if (document.getElementById('password2id').value != document.getElementById('passwordid').value)
	{
		alert("确认密码与密码不一致");
		return false;
	}	 

	doRequestUsingPOSTregister();
	
}

function createQueryStringregister(){
	//必须两次编码才能解决中文问题
	var username = encodeURI(encodeURI($("#usernameid").val()));
	var password = encodeURI(encodeURI($("#passwordid").val()));

	var queryString = 
	"username="+username+
	"&password="+password;
	return queryString;
}



function doRequestUsingPOSTregister(){

		$.ajax({
			type: "POST",
			url: "wangzhanmethod!register.action",
			data: createQueryStringregister(),
			success: function(data){
			var returnvalue = decodeURI(data);
				alert(returnvalue);
				if('该昵称已经存在，请重新注册！'!=returnvalue){
					window.close();
				}
				
			}
		});
}


function resetform(){
window.close();
}
</script>


</head>



	
<body>
<div class="header wrapfix" >
	
	<div class="help">
		<a href="index.jsp" target="_blank" title="">首页</a> | <a href="index.jsp" target="_blank" title="帮助中心">帮助中心</a>
		<span class="tel">客服热线: 13......</span>
	</div>
</div>
<div class="clearfix"></div><!-- 清除浮动 -->

<div class="wrap">

       	<div class="login_main_white">
            	<div class="login_main_announce">
                	<ol><b>注册须知：</b>
					<li>1:在本站注册的会员，必须遵守《互联网电子公告服务管理规定》，不得在本站发表诽谤他人，侵犯他人隐私，侵犯他人知识产权，传播病毒，政治言论，商业机密等信息。</li>
					<li>2:在所有在本站发表的文章，本站都具有最终编辑权，并且保留用于印刷或向第三方发表的权利，如果你的资料不齐全，我们将有权不作任何通知使用你在本站发布的作品。</li>
					</ol>
                </div>
                <div class="clearfix"></div>
         </div>


           <dl>
           
                      

		   
			<dd>您的昵称：
		
			<input type="text" name="username"  id="usernameid" class="log_input2"/></dd>
			
			<dd>登陆密码：
	
			<input type="password" name="password" size="25" id="passwordid" class="log_input2"/></dd>
			<dd>重复密码：
			
			<input type="password" name="password2" size="25" id="password2id" class="log_input2"/>
			
			
			<dd><br /><input type="submit" name="Submit2" value="确定注册" class="Btn" onclick="checkregisterform()"/>
			&nbsp;&nbsp;
			<input type="reset" name="Submit22" value="重 置" class="Btn" onclick="resetform()"/>
			<br /><br />
            </dd>
            
</dl>

</div>


<div class="clearfix"></div><!-- 清除浮动 -->
<div class="footet_box">
	<div class="footet_dh">
	<a href="/abouts/index.html">网站简介</a> - <a href="/abouts/team.html">管理团队</a> - <a href="/abouts/services.html">产品与服务</a> - <a href="/abouts/jobs.html">招贤纳士</a> - <a href="/abouts/marketing.html">网络营销</a> - <a href="/abouts/contact.html">联系我们</a>
	</div>
	<div class="footet_bj"><?php echo $cfg_powerby?></div>
</div>

</body>
</html>
