<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>首页</title>
	<link rel="stylesheet" href="js/jquery-easyui-1.4.3/themes/icon.css"/>
	<link rel="stylesheet" href="js/jquery-easyui-1.4.3/themes/default/easyui.css"/>
	<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="js/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>
</head>
<script src="js/global.js"></script>
<script type="text/javascript">
	function tuichu(){
		window.location.href="login.jsp";
	}
	//树形结构显示
	$(function() {
		var usersName= '<%=session.getAttribute("usersName")  %>';
		$("#spUName").text(usersName);
		var usersId= '<%=session.getAttribute("usersId")  %>';
			if(usersId!=null){
				$("#menuTree").tree({
					url:'selectModulesById',
					method:'post',
					lines:true,		//定义是否显示树控件上的虚线。
					animate:true,	//定义节点在展开或折叠的时候是否显示动画效果。
					queryParams:{
						usersId:usersId
					},
					onClick: function(node) {
						var flag = $('#tt').tabs('exists', node.text);
						var isLeaf = $('#menuTree').tree('isLeaf', node.target); //是否是叶子节点
						if(isLeaf) { //只有叶子节点才会在选项卡中创建选项页（每个选项页对应1个功能）
							if(!flag) {
								$('#tt').tabs('add', { //在选项卡中，创建1个选项页
									title: node.text, //选项卡中，选项页的标题（在同一个选项卡中，选项页需要保持一致）。
									closable: true,
									content: "<iframe  width='100%' height='700px'  src='" + node.url + "'/>" //此处做了调整，推荐使用iframe的方式实现
								});
							} else {
								$("#tt").tabs('select', node.text); //直接选中title对应的选项卡
							}
						}
					}
				});
			}
		})
</script>
<body>
		<div style="margin:20px 0;"></div>
		<div class="easyui-layout" style="width:100%;height:700px;">
			<div data-options="region:'north'" style="height:50px">
				<h2>CRM系统&nbsp;&nbsp;欢迎您:<span id="spUName"></span><a id="btn" style="cursor: pointer; color: #0000FF;" onclick="tuichu()">&nbsp;&nbsp;安全退出</a></h2></div>
			<div data-options="region:'south',split:true" style="height:50px;"></div>
			<!--<div data-options="region:'east',split:true" title="East" style="width:100px;"></div>-->
			<div data-options="region:'west',split:true" title="导航应用" style="width:150px;">
				<div>
					<!--这个地方显示树状结构-->
					<ul id="menuTree" class="easyui-tree"></ul>
				</div>
			</div>
			<div id="centerTabs" data-options="region:'center',iconCls:'icon-ok'" style="width: 100px;">
				<div id="tt" class="easyui-tabs">
					<!--这个地方采用tabs控件进行布局-->

				</div>
			</div>
		</div>
	</body>
</html>