<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="pageContent">
<form method="post" name=form1 action="houtaimethod!lanmuupdate2.action" class="pageForm" onsubmit="return validateCallback(this,dialogAjaxDone);">
	<div class="pageFormContent nowrap" layoutH="80">
				
				
				
				<div class="unit">
				<label>栏目名:</label>
				 <input type="text" name="lanmuming" class="required" size="60" value="${bean.lanmuming }"/> 
				
				</div>
				
				
				 <input type="hidden" name="id"  value="${bean.id }"/> 
				
				
				
				
				
						
						

	</div>
<div class="formBar">
      <ul>
            <li>
                 <div class="buttonActive"><div class="buttonContent"><button type="submit">提交</button></div></div>
            </li>
            <li>
                  <div class="button"><div class="buttonContent"><button type="Button" class="close">取消</button></div></div>
            </li>
      </ul>
</div>
</form>
</div>

