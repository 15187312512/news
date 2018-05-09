<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>

<TITLE>无标题页</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<LINK 
href="images/public.css" type=text/css rel=stylesheet>
<LINK 
href="images/login.css" type=text/css rel=stylesheet>
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
<STYLE type=text/css>
</STYLE>
<META content="MSHTML 6.00.2900.5848" name=GENERATOR>
</HEAD>
<BODY onload="createCode()">
<DIV id=div1>
	<form action="houtaimethod!login.action" method="post"  onsubmit="return checkregisterform()">
  <TABLE id=login height="100%" cellSpacing=0 cellPadding=0 width=800 align=center>
    <TBODY>
      <TR id=main>
        <TD>
          <TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%">
            <TBODY>
              <TR>
                <TD colSpan=4>&nbsp;</TD>
              </TR>
              <TR height=30>
                <TD width=380>&nbsp;</TD>
                <TD>&nbsp;</TD>
                <TD>&nbsp;</TD>
                <TD>&nbsp;</TD>
              </TR>
              <TR height=40>
                <TD rowSpan=4>&nbsp;</TD>
                <TD>用户名：</TD>
                <TD>
                  <INPUT class=textbox  name="username" id="user_name">
                </TD>
                <TD width=120>&nbsp;</TD>
              </TR>
              <TR height=40>
                <TD>密　码：</TD>
                <TD>
                  <INPUT class=textbox name="password" id="user_password" type=password>
                </TD>
                <TD width=120>&nbsp;</TD>
              </TR>
              <TR height=40>
                <TD>验证码：</TD>
                <TD vAlign=center colSpan=2>
                  <INPUT id="input1" size=4 name=txtSN>
                  &nbsp; <input type="text" id="checkCode" class="code" style="width: 55px" size="20"/> <a href="####" onclick="createCode()">看不清楚</a></TD>
              </TR>
              <TR height=40>
                <TD></TD>
                <TD align=right>
                 <button type="submit" class="positive" name="Submit">
								登录</button>
								
								<button type="button" class="positive"  onclick="aa()" >
								退出</button>
                </TD>
                <TD width=120>&nbsp;</TD>
              </TR>
              <TR height=110>
                <TD colSpan=4>&nbsp;</TD>
              </TR>
            </TBODY>
          </TABLE>
        </TD>
      </TR>
      <TR id=root height=104>
        <TD>&nbsp;</TD>
      </TR>
    </TBODY>
  </TABLE>
  </form>
</DIV>
<DIV id=div2 style="DISPLAY: none"></DIV>
</CONTENTTEMPLATE>
</BODY>
</HTML>
