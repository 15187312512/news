<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="UTF-8">
    <title>Basic Layout - eraJs Demo</title>

    <script type="text/javascript" src="myjs/bootstrap.js"></script>

    <script type="text/javascript">
       $(function(){


        erajs.onReady(function(){

	       return true;
	    },{
	        needValidated : true,
	        validationPath:'./validation/validation.xml',
	        loadValidationXml:true,
	        targetForm : 'changeForm'
	    });



})
    </script>
</head>
<body>
<div>
    <form name="changeForm" method="post">
    <div data-options="region:'center',border:true "  >
        <ul class="content_ul">
            <li class="title140"><span class="require">*</span>第一货币：</li>
            <li class="input180">
                <select  name="currOne" xtype="combobox"
                        data-options=" onSelect : selectChange" class="input-css">
                    <option value="0">人民币</option>
                    <option value="1">美元</option>
                    <option value="2">日元</option>
                </select>
            </li>
            <li class="title140"><span class="require">*</span>第二货币：</li>
            <li class="input180">
                <select  name="currTwo" xtype="combobox" data-options="onSelect:selectChange">
                    <option value="0">人民币</option>
                    <option value="1">美元</option>
                    <option value="2">日元</option>
                </select>
            </li>
        </ul>
        <ul class="content_ul">
            <li class="title140"><span class="require">*</span>产品类型：</li>
            <li class="input180">
                <select name="type" xtype="combobox" data-options="disabled:true">

                    <option value="1">外汇</option>
                    <option value="2">结算汇</option>
                </select>

            </li>
            <li class="title140"><span class="require">*</span>结算货币：</li>
            <li class="input180">

                <select  name="balCode" xtype="combobox" data-options="">
                    <option value="0">人民币</option>
                    <option value="1">美元</option>
                    <option value="2">日元</option>
                </select>
            </li>
        </ul>
        <ul class="content_ul">
            <li class="title140"><span class="require">*</span>牌价发布标识：</li>
            <li class="input180">

                <select name="isPub" xtype="combobox" data-options="">

                    <option value="0">0</option>
                    <option value="1">1</option>

                </select>
            </li>
            <li class="title140"><span class="require">*</span>平盘方式：</li>
            <li class="input180">
                <select name="pptype" xtype="combobox" data-options="">

                    <option value="0">全部</option>
                    <option value="1">第一货币</option>
                    <option value="2">第二货币</option>
                </select>
            </li>
        </ul>
        <ul class="content_ul">
            <li class="title140"><span class="require">*</span>即期报价有效位数：</li>
            <li class="input180">
                <input xtype="textbox"  name="spotAvalible"  class="input-css"/>
            </li>
            <li class="title140"><span class="require">*</span>远期报价有效位数：</li>
            <li class="input180">
                <input xtype="textbox"    name="forwardAvalible"   class="input-css"/>
            </li>
        </ul>
        <ul class="content_ul">
            <li class="title140"><span class="require">*</span>即期报价基位：</li>
            <li class="input180">
                <input xtype="textbox"  name="spotBaseUnit"  class="input-css"/>
            </li>
            <li class="title140"><span class="require">*</span>远期报价基位：</li>
            <li class="input180">
                <input xtype="textbox"    name="forwardBaseUnit"  class="input-css" />
            </li>
        </ul>
        <ul class="content_ul">
            <li class="title140"><span class="require">*</span>即期报价单位：</li>
            <li class="input180">
                <input xtype="textbox"  name="spotUnit" class="input-css" />
            </li>
            <li class="title140"><span class="require">*</span>远期报价单位：</li>
            <li class="input180">
                <input xtype="textbox"    name="forwardUnit"   class="input-css" />
            </li>
        </ul>

    </div>
        <div region="south" border="false" class="form-foot-btns">
            <div xtype="button" class="middleBtn" iconCls="icon-save"
			custom-options="
                      btnType:'submit',
                      refFormName:'changeForm'

                     
          "></div>
            <div xtype="button" class="middleBtn" iconCls="icon-cancel"
                 custom-options="
                        btnType:'cancel'
            "></div>
        </div>
    </form>
</div>
</body>
</html>