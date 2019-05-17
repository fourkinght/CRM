<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>登录页面</title>
	<link rel="stylesheet" href="js/jquery-easyui-1.4.3/themes/icon.css"/>
	<link rel="stylesheet" href="js/jquery-easyui-1.4.3/themes/default/easyui.css"/>
	<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="js/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>
<script src="js/global.js"></script>
</head>
	<body>
		<div style="margin: 100px auto;width: 400px; height: 300px;">
			<div class="easyui-panel" title="欢迎登录" style="width: 400px; height:300px;">
				<div style="padding: 20px 60px 20px 60px;" >
					<form id="for" action="selectUserRolesLogin" method="post">
						<table cellpadding="6">
							<tr>
								<td>登录名：</td>
								<td><input class="easyui-textbox" id="ename" name="us_LoginName"  data-options="prompt:'登录账号',iconCls:'icon-man',iconWidth:38"/></td>
							</tr>
							<tr>
								<td>密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
								<td><input class="easyui-textbox" id="paw" name="us_PassWord" type="password"   data-options="prompt:'登录密码',iconCls:'icon-lock',iconWidth:38"></td>
							</tr>
							<tr>
								<td>验证码：</td>
								<td>
									<input type="text"  class="easyui-textbox"  name="yanzheng"  data-options="prompt:'验证码'  " id="checkcode" style="width:50%;"/>
									<img alt="random" src="checkCode"  style="width:45%;" onclick="this.src=this.src+'?'">
									
								</td>
							</tr>
							<tr>
								<td></td>
								<td><span style="color: red;">${msg }</span></td>
							</tr>
						</table>
						<input class="easyui-linkbutton" data-options="iconCls:'icon-ok'" type="submit" value="登录系统"/>
					</form>
				</div>
				
			</div>
		</div>
	</body>
</html>