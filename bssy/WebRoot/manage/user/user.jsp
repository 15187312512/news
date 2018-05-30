<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript">
   
</SCRIPT>




<div class="pageContent">
	
	<form method="post" name=form1 action="houtaimethod!changepwd2.action" class="pageForm" onsubmit="return validateCallback(this,dialogAjaxDone);">
	
<div class="pageFormContent" layoutH="58">

			<div class="unit">
				<label>原密码</label>
				 <input  name="password1" id="user_password" size="30" class="required" type="password"/>
			</div>
			<div class="unit">
				<label>新密码</label>
				 <input  name="password2" size="30" class="required" type="password" />
			</div>
			<div class="unit">
				<label>确认新密码</label>
				 <input  name="password3" size="30" class="required" type="password" />
			</div>
			
			
			
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">提交</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
			</ul>
		</div>
	</form>
	
</div>