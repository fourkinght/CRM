<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="js/jquery-easyui-1.4.3/themes/icon.css">
<link rel="stylesheet" href="js/jquery-easyui-1.4.3/themes/default/easyui.css">
<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
$(function(){
	init();
})
function init() {
	var minTime=$("#minTime").datebox("getValue");
	
	
	var maxTime=$("#maxTime").datebox("getValue");
	
	if(minTime<=maxTime){
		$("#csTab").datagrid({
			url:"selectCstClientsByAll",
			method:"post",
			pagination:true,
			rownumbers:true,
			toolbar:"#csbar",
			queryParams:{
				Cs_Name:$("#Cs_NameBar").val(),
				minTime:minTime,
				maxTime:maxTime,
				Cs_IsHuiFang:$("#Cs_IsHuiFangBar").combobox("getValue"),
				Cs_IsJiaoFei:$("#Cs_IsJiaoFeiBar").combobox("getValue")
			}		 
		})
	}else{
		$.messager.alert("提示","跟踪开始时间不能大于跟踪结束时间！！！");
	}
	
}
function  caozuoFormatter(value,row,index) {
	return "<a  href='javascript:chakanCs("+index+")'>查看</a><a style='cursor:pointer;' href='javascript:void(0)' onclick='updateCs("+index+")'>修改</a>"
}

function chakanCs(index) {
	
	var rows=$("#csTab").datagrid("getRows");
	var row=rows[index];
	$("#chakan_form").form("load",row);
	
	var a=$("#cs_Img").val();//获取图片名称		
	a="image/"+a;//图片路径
	$("#aaa").attr("src",a);//给img设置
	
	$("#chakan_dialog").dialog("open");
	
}

function ImgFormatter(value,row,index) {
	return "<img style='width:24px;height:24px;' src='image/"+row.cs_Img+"'/>"
}
function SexFormatter(value,row,index) {
	return value==0?'男':'女'
}
 
function StateFormatter(value,row,index) {
	
	return value==0?'续保':value==1?'正式':'流失'
}

function FenFormatter(value,row,index) {
	return value==0?'未分配':'分配'
}
function JiaoFormatter(value,row,index) {
	return value==0?'未缴费':'已缴费'
}
function HuiFormatter(value,row,index) {
	return value==0?'未回访':'已回访'
}
function ValidFormatter(value,row,index) {
	return value==0?'无效':'有效'
}
function VisitFormatter(value,row,index) {
	return value==0?'未上门':'已上门'
}
function BaoFormatter(value,row,index) {
	return value==0?'未报备':'已报备'
}
function TuiFormatter(value,row,index) {
	return value==0?'未退费':'已退费'
}
function JinFormatter(value,row,index) {
	return value==0?'未进班':'已进班'
}
function CouFormatter(value,row,index) {
	return null
}
function closed_edit() {
	$("#edit_dialog").dialog("close");
}
function updateCs(index) {
	  
	var rows=$("#csTab").datagrid("getRows");
	var row=rows[index];
	 $("#edit_form").form("load",row);
	 var a=$("#edit_Img").val();
	 a="image/"+a;//图片路径
	$("#bbb").attr("src",a);//给img设置
	$("#edit_dialog").dialog("open");	
}
function clients_edit() {
	var flag=$("#edit_form").form("validate");
	
	if(flag){
		
		$.post("updateClient",{
			Cs_ClientState:$("#Cs_ClientState").combobox("getValue"),
			Cs_FenPei:$("#Cs_FenPei").combobox("getValue"),
			Cs_IsJiaoFei:$("#Cs_IsJiaoFei").combobox("getValue"),
			Cs_IsHuiFang:$("#Cs_IsHuiFang").combobox("getValue"),
			Cs_IsValid:$("#Cs_IsValid").combobox("getValue"),
			Cs_IsVisit:$("#Cs_IsVisit").combobox("getValue"),
			Cs_IsBaoBei:$("#Cs_IsBaoBei").combobox("getValue"),
			Cs_IsTuiFen:$("#Cs_IsTuiFen").combobox("getValue"),
			Cs_IsJinBan:$("#Cs_IsJinBan").combobox("getValue"),
			Cs_Id:$("#Cs_Id").val(),
			Cs_Name:$("#Cs_Name").val(),
			Cs_Img:$("#Cs_Img").val(),
			Cs_Sex:$("#Cs_Sex").val(),
			Cs_Age:$("#Cs_Age").val(),
			Cs_Phone:$("#Cs_Phone").val(),
			Cs_Xueli:$("#Cs_Xueli").val(),
			Cs_Email:$("#Cs_Email").val(),
			Cs_QQ:$("#Cs_QQ").val(),
			Cs_WeiXin:$("#Cs_WeiXin").val(),
			Cs_Source:$("#Cs_Source").val(),
			Cs_SiteSheng:$("#Cs_SiteSheng").val(),
			Cs_SiteShi:$("#Cs_SiteShi").val(),
			Cs_SiteXian:$("#Cs_SiteXian").val(),
			Cs_SiteXiangXi:$("#Cs_SiteXiangXi").val(),
			Cs_TuiFenInfo:$("#Cs_TuiFenInfo").val(),
			Cs_HuiFangInfo:$("#Cs_HuiFangInfo").val(),
			Cs_Courses:$("#Cs_Courses").val(),
			Cs_Money:$("#Cs_Money").val(),
			Cs_Grade:$("#Cs_Grade").val(),
			Cs_IsValidInfo:$("#Cs_IsValidInfo").val(),
			Cs_HuiFangTime:$("#Cs_HuiFangTime").val(),
			Cs_VisitTime:$("#Cs_VisitTime").val(),
			Cs_JiaoFeiTime:$("#Cs_JiaoFeiTime").val(),
			Cs_FoundTime:$("#Cs_FoundTime").val(),
			Cs_JinBanTime:$("#Cs_JinBanTime").val(),
			Cs_ShenFenZheng:$("#Cs_ShenFenZheng").val(),
			Cs_BirthTime:$("#Cs_BirthTime").val(),
			Cs_ConsultantRemark:$("#Cs_ConsultantRemark").val(),
			Cs_Remark:$("#Cs_Remark").val(),
			Cs_Weight:$("#Cs_Weight").val(),
		},function(res){
			if(res>0){				
				$.messager.alert("提示","修改成功！！！");
				closed_edit();
				init();
			}else{
				$.messager.alert("提示","修改失败！！！");
			}
		},"json")
	}else{
		$.messager.alert("提示","请按要求填写表单！！！");
	}
}
</script>
</head>
<body>
	<table id="csTab" class="easyui-datagrid">
		<thead>
			<tr>
				<th data-options="field:'cs_Id',title:'编号'"></th>				
				<th data-options="field:'cs_Img',title:'头像',formatter:ImgFormatter"></th>	
				 <th data-options="field:'cs_Name',title:'姓名'"></th>
				<th data-options="field:'cs_Sex',title:'性别',formatter:SexFormatter"></th>
				<th data-options="field:'cs_Age',title:'年龄'"></th>
				<th data-options="field:'cs_Phone',title:'电话'"></th>
				<th data-options="field:'cs_Xueli',title:'学历'"></th>
				<th data-options="field:'cs_Email',title:'邮箱'"></th>
				<th data-options="field:'cs_QQ',title:'QQ号'"></th>
				<th data-options="field:'cs_WeiXin',title:'微信号'"></th>
				<th data-options="field:'cs_Source',title:'客户来源'"></th>
				<th data-options="field:'cs_ClientState',title:'客户状态',formatter:StateFormatter"></th>
				<th data-options="field:'cs_FenPei',title:'分配',formatter:FenFormatter"></th>
				<th data-options="field:'cs_SiteSheng',title:'省'"></th>
				<th data-options="field:'cs_SiteShi',title:'市'"></th>
				<th data-options="field:'cs_SiteXian',title:'县'"></th>
				<th data-options="field:'cs_SiteXiangXi',title:'详细地址'"></th>
				<th data-options="field:'cs_IsJiaoFei',title:'是否缴费',formatter:JiaoFormatter"></th>
				<th data-options="field:'cs_IsHuiFang',title:'是否回访',formatter:HuiFormatter"></th>
				<th data-options="field:'cs_IsValid',title:'是否有效',formatter:ValidFormatter"></th>
				<th data-options="field:'cs_IsVisit',title:'是否上门',formatter:VisitFormatter"></th>
				<th data-options="field:'cs_IsBaoBei',title:'是否报备',formatter:BaoFormatter"></th>
				<th data-options="field:'cs_IsTuiFen',title:'是否退费',formatter:TuiFormatter"></th>
				<th data-options="field:'cs_TuiFenInfo',title:'退费原因'"></th>
				<th data-options="field:'cs_IsJinBan',title:'是否进班',formatter:JinFormatter"></th>
				<th data-options="field:'cs_HuiFangInfo',title:'回访情况'"></th>
				<th data-options="field:'cs_Courses',title:'课程',formatter:CouFormatter"></th>
				<th data-options="field:'cs_Money',title:'课程费用'"></th>
				<th data-options="field:'cs_Grade',title:'课程打分'"></th>
				<th data-options="field:'cs_IsValidInfo',title:'无效原因'"></th>	
				<th data-options="field:'cs_HuiFangTime',title:'首次回访时间'"></th>
				<th data-options="field:'cs_VisitTime',title:'上门时间'"></th>
				<th data-options="field:'cs_JiaoFeiTime',title:'缴费时间'"></th>
				<th data-options="field:'cs_FoundTime',title:'创建时间'"></th>
				<th data-options="field:'cs_JinBanTime',title:'进班时间'"></th>
				<th data-options="field:'cs_ShenFenZheng',title:'身份证号'"></th>
				<th data-options="field:'cs_BirthTime',title:'出生时间'"></th>
				<th data-options="field:'cs_ConsultantRemark',title:'咨询师备注'"></th>
				<th data-options="field:'cs_Remark',title:'备注'"></th>
				<th data-options="field:'cs_Weight',title:'客户权重'"></th>	 	
				  <th data-options="field:'caozuo',width:140,align:'center',formatter:caozuoFormatter">操作</th> 				
			</tr>
		</thead>
	</table>
	<div id="csbar">
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="addstu()">添加</a>
		姓名：<input type="text" class="easyui-textbox" name="Cs_NameBar" id="Cs_NameBar">
		回访：<select id="Cs_IsHuiFangBar" class="easyui-combobox" name="Cs_IsHuiFangBar" style="width:200px;">   
	   			 <option value="-1">请选择</option>
	   			  <option value="0">未回访</option> 
	   			  <option value="1">已回访</option>
			</select>
		缴费：<select id="Cs_IsJiaoFeiBar" class="easyui-combobox" name="Cs_IsJiaoFeiBar" style="width:200px;">   
   			 <option value="-1">请选择</option>
   			  <option value="0">未缴费</option> 
   			  <option value="1">已缴费</option>
		</select>
		跟踪开始时间：<input type="text" class="easyui-datebox" name="minTime" id="minTime">		
		跟踪结束时间：<input type="text" class="easyui-datebox" name="maxTime" id="maxTime">
		
		<a href="javascript:void()"  class="easyui-linkbutton" onclick="init()" data-options="iconCls:'icon-search'">搜索</a> 
	</div>
	<!-- 查看 -->
	<div id="chakan_dialog" class="easyui-dialog" data-options="title:'查看',modal:true,closed:true">
		<form id="chakan_form" class="easyui-form">	
		 <table>
		 	<tr>
		 		<td>编号:</td><td><input disabled="disabled" class="easyui-numberbox" type="text" name="cs_Id" /></td>
		 		<td>头像:</td><td> <img alt="" id="aaa" src="" style="width:24px;height:24px;">
	        		<input id="cs_Img" class="easyui-textbox" type="hidden" name="cs_Img" /></td>
	        	<td>姓名:</td><td><input disabled="disabled" class="easyui-textbox" type="text" name="cs_Name" /></td>
		 	</tr>
		 	<tr>
		 		<td>性别:</td><td><select disabled="disabled" class="easyui-combobox" name="cs_Sex" style="width:200px;">   	   			 
	   			  <option value="0">男</option> 
	   			  <option value="1">女</option>
				</select></td> 
			<td>年龄:</td><td><input disabled="disabled" class="easyui-numberbox" type="text" name="cs_Age" /></td> 
			<td>电话:</td><td><input disabled="disabled" class="easyui-textbox" type="text" name="cs_Phone" /></td>
		 	</tr>
		 	<tr>
		 		<td>学历:</td><td><input disabled="disabled" class="easyui-textbox" type="text" name="cs_Xueli" /></td>
		 		<td>邮箱:</td><td> <input disabled="disabled" class="easyui-textbox" type="text" name="cs_Email" /></td>
		 		<td>QQ:</td><td><input disabled="disabled" class="easyui-textbox" type="text" name="cs_QQ" /></td>
		 	</tr>
		 	
		 	<tr>
		 		<td>省:</td><td><input disabled="disabled" class="easyui-textbox" type="text" name="cs_SiteSheng" /></td>
		 		<td>市:</td><td><input disabled="disabled" class="easyui-textbox" type="text" name="cs_SiteShi" /></td>
		 		<td>县:</td><td><input disabled="disabled" class="easyui-textbox" type="text" name="cs_SiteXian" /></td>
		 	</tr>
		 	<tr>
		 		<td>详细地址:</td><td><input disabled="disabled" class="easyui-textbox" type="text" name="cs_SiteXiangXi" /></td>
		 		<td>微信号:</td><td><input disabled="disabled" class="easyui-textbox" type="text" name="cs_WeiXin" /></td>
		 		<td>客户来源:</td><td><input disabled="disabled" class="easyui-textbox" type="text" name="cs_Source" /></td>
		 	</tr>
		 	<tr>
		 		<td>退费原因:</td><td><input disabled="disabled" class="easyui-textbox" type="text" name="cs_TuiFenInfo" /></td>
		 		<td>回访情况:</td><td><input disabled="disabled" class="easyui-textbox" type="text" name="cs_HuiFangInfo" /></td>
		 		<td>课程:</td><td><input disabled="disabled" class="easyui-numberbox" type="text" name="cs_Courses" /></td>
		 	</tr>
		 	<tr>
		 		<td>课程费用:</td><td><input disabled="disabled" class="easyui-numberbox" type="text" name="cs_Money" /></td>
		 		<td>课程打分:</td><td><input disabled="disabled" class="easyui-numberbox" type="text" name="cs_Grade" /></td>
		 		<td>无效原因:</td><td><input disabled="disabled" class="easyui-textbox" type="text" name="cs_IsValidInfo" /></td>
		 	</tr>
		 	<tr>
		 		<td>首次回访时间:</td><td><input disabled="disabled" class="easyui-datebox" type="text" name="cs_HuiFangTime" /></td>
		 		<td>上门时间:</td><td><input disabled="disabled" class="easyui-datebox" type="text" name="cs_VisitTime" /></td>
		 		<td>缴费时间:</td><td><input disabled="disabled" class="easyui-datebox" type="text" name="cs_JiaoFeiTime" /></td>
		 	</tr>
		 	<tr>
		 		<td>创建时间:</td><td><input disabled="disabled" class="easyui-datebox" type="text" name="cs_FoundTime" /></td>
		 		<td>进班时间:</td><td><input disabled="disabled" class="easyui-datebox" type="text" name="cs_JinBanTime" /></td>
		 		<td>身份证号:</td><td><input disabled="disabled" class="easyui-textbox" type="text" name="cs_ShenFenZheng" /></td>
		 	</tr>
		 	<tr>
		 		<td>出生时间:</td><td><input disabled="disabled" class="easyui-datebox" type="text" name="cs_BirthTime" /></td>
		 		<td>咨询师备注:</td><td><input disabled="disabled" class="easyui-textbox" type="text" name="cs_ConsultantRemark" /></td>
		 		<td>备注:</td><td><input disabled="disabled" class="easyui-textbox" type="text" name="cs_Remark" /></td>
		 	</tr>
		 	<tr>
		 		<td>客户权重:</td><td><input disabled="disabled" class="easyui-numberbox" type="text" name="cs_Weight" /></td>
		 		<td>客户状态:</td><td> <select disabled="disabled" class="easyui-combobox" name="cs_ClientState" style="width:200px;">   	   			 
	   			  <option value="0">续保</option> 
	   			  <option value="1">正式</option>
	   			  <option value="2">流失</option>
				</select></td>
		 		<td>是否缴费:</td><td><select disabled="disabled" class="easyui-combobox" name="cs_IsJiaoFei" style="width:200px;">   	   			 
	   			  <option value="0">未缴费</option> 
	   			  <option value="1">已缴费</option>
				</select></td>
		 	</tr>
		 	<tr>
		 		<td>是否回访:</td><td><select disabled="disabled" class="easyui-combobox" name="cs_IsHuiFang" style="width:200px;">  	   			 
	   			  <option value="0">未回访</option> 
	   			  <option value="1">已回访</option>
				</select></td>
		 		<td>是否有效:</td><td><select disabled="disabled" class="easyui-combobox" name="cs_IsValid" style="width:200px;">   	   			 
	   			  <option value="0">无效</option> 
	   			  <option value="1">有效</option>
				</select></td>
		 		<td>是否上门:</td><td><select disabled="disabled" class="easyui-combobox" name="cs_IsVisit" style="width:200px;">   	   			 
	   			  <option value="0">未上门</option> 
	   			  <option value="1">已上门</option>
				</select></td>
		 	</tr>
		 	<tr>
		 		<td>是否报备:</td><td><select disabled="disabled" class="easyui-combobox" name="cs_IsBaoBei" style="width:200px;">   	   			 
	   			  <option value="0">未报备</option> 
	   			  <option value="1">已报备</option>
				</select></td>
		 		<td>是否退费</td><td><select disabled="disabled" class="easyui-combobox" name="cs_IsTuiFen" style="width:200px;">   	   			 
	   			  <option value="0">未退费</option> 
	   			  <option value="1">已退费</option>
				</select></td>
		 		<td>是否进班:</td><td><select disabled="disabled" class="easyui-combobox" name="cs_IsJinBan" style="width:200px;">   	   			 
	   			  <option value="0">未进班</option> 
	   			  <option value="1">已进班</option>
				</select></td>
		 	</tr>
		 </table>   
  		 </form>>   
	</div>
	<!-- 修改 -->
<div id="edit_dialog" class="easyui-dialog" data-options="title:'修改对话框',modal:true,closed:'true',
			buttons:[{
				text:'保存',
				handler:function(){
				clients_edit();<!-- 保存 -->
				init();<!-- 刷新 -->
				closed_edit();<!-- 关闭弹窗 -->
				}
			},{
				text:'关闭',
				handler:function(){
				closed_edit();
				}
			}]">
	<form id="edit_form" class="easyui-form">
		<table>
		 	<tr>
		 		<td>编号:</td><td><input disabled="disabled" class="easyui-numberbox" id="Cs_Id" type="text" name="cs_Id"/></td>
		 		<td>头像:</td><td> <img alt="" id="bbb" src="" style="width:24px;height:24px;">
	        		<input id="edit_Img" class="easyui-textbox" type="hidden" name="cs_Img" /></td>
	        	<td>姓名:</td><td><input class="easyui-textbox" type="text" name="cs_Name" /></td>
		 	</tr>
		 	<tr>
		 		<td>性别:</td><td><select id="Cs_Sex" class="easyui-combobox" name="cs_Sex" style="width:200px;">   	   			 
	   			  <option value="0">男</option> 
	   			  <option value="1">女</option>
				</select></td> 
			<td>年龄:</td><td><input id="Cs_Age" class="easyui-numberbox" type="text" name="cs_Age" /></td> 
			<td>电话:</td><td><input id="Cs_Phone" class="easyui-textbox" type="text" name="cs_Phone" /></td>
		 	</tr>
		 	<tr>
		 		<td>学历:</td><td><input id="Cs_Xueli" class="easyui-textbox" type="text" name="cs_Xueli" /></td>
		 		<td>邮箱:</td><td> <input id="Cs_Email" class="easyui-textbox" type="text" name="cs_Email" /></td>
		 		<td>QQ:</td><td><input id="Cs_QQ" class="easyui-textbox" type="text" name="cs_QQ" /></td>
		 	</tr>
		 	
		 	<tr>
		 		<td>省:</td><td><input id="Cs_SiteSheng" class="easyui-textbox" type="text" name="cs_SiteSheng" /></td>
		 		<td>市:</td><td><input id="Cs_SiteShi" class="easyui-textbox" type="text" name="cs_SiteShi" /></td>
		 		<td>县:</td><td><input id="Cs_SiteXian" class="easyui-textbox" type="text" name="cs_SiteXian" /></td>
		 	</tr>
		 	<tr>
		 		<td>详细地址:</td><td><input id="Cs_SiteXiangXi" class="easyui-textbox" type="text" name="cs_SiteXiangXi" /></td>
		 		<td>微信号:</td><td><input id="Cs_WeiXin" class="easyui-textbox" type="text" name="cs_WeiXin" /></td>
		 		<td>客户来源:</td><td><input id="Cs_Source" class="easyui-textbox" type="text" name="cs_Source" /></td>
		 	</tr>
		 	<tr>
		 		<td>退费原因:</td><td><input id="Cs_TuiFenInfo" class="easyui-textbox" type="text" name="cs_TuiFenInfo" /></td>
		 		<td>回访情况:</td><td><input id="Cs_HuiFangInfo" class="easyui-textbox" type="text" name="cs_HuiFangInfo" /></td>
		 		<td>课程:</td><td><input id="Cs_Courses" class="easyui-numberbox" type="text" name="cs_Courses" /></td>
		 	</tr>
		 	<tr>
		 		<td>课程费用:</td><td><input id="Cs_Money" class="easyui-numberbox" type="text" name="cs_Money" /></td>
		 		<td>课程打分:</td><td><input id="Cs_Grade" class="easyui-numberbox" type="text" name="cs_Grade" /></td>
		 		<td>无效原因:</td><td><input id="Cs_IsValidInfo" class="easyui-textbox" type="text" name="cs_IsValidInfo" /></td>
		 	</tr>
		 	<tr>
		 		<td>首次回访时间:</td><td><input id="Cs_HuiFangTime" class="easyui-datebox" type="text" name="cs_HuiFangTime" /></td>
		 		<td>上门时间:</td><td><input id="Cs_VisitTime" class="easyui-datebox" type="text" name="cs_VisitTime" /></td>
		 		<td>缴费时间:</td><td><input id="Cs_JiaoFeiTime" class="easyui-datebox" type="text" name="cs_JiaoFeiTime" /></td>
		 	</tr>
		 	<tr>
		 		<td>创建时间:</td><td><input id="Cs_FoundTime" class="easyui-datebox" type="text" name="cs_FoundTime" /></td>
		 		<td>进班时间:</td><td><input id="Cs_JinBanTime" class="easyui-datebox" type="text" name="cs_JinBanTime" /></td>
		 		<td>身份证号:</td><td><input id="Cs_ShenFenZheng" class="easyui-textbox" type="text" name="cs_ShenFenZheng" /></td>
		 	</tr>
		 	<tr>
		 		<td>出生时间:</td><td><input id="Cs_BirthTime" class="easyui-datebox" type="text" name="cs_BirthTime" /></td>
		 		<td>咨询师备注:</td><td><input id="Cs_ConsultantRemark" class="easyui-textbox" type="text" name="cs_ConsultantRemark" /></td>
		 		<td>备注:</td><td><input id="Cs_Remark" class="easyui-textbox" type="text" name="cs_Remark" /></td>
		 	</tr>
		 	<tr>
		 		<td>客户权重:</td><td><input id="Cs_Weight" class="easyui-numberbox" type="text" name="cs_Weight" /></td>
		 		<td>客户状态:</td><td> <select id="Cs_ClientState" class="easyui-combobox" name="cs_ClientState" style="width:200px;">   	   			 
	   			  <option value="0">续保</option> 
	   			  <option value="1">正式</option>
	   			  <option value="2">流失</option>
				</select></td>
		 		<td>是否缴费:</td><td><select id="Cs_IsJiaoFei" class="easyui-combobox" name="cs_IsJiaoFei" style="width:200px;">   	   			 
	   			  <option value="0">未缴费</option> 
	   			  <option value="1">已缴费</option>
				</select></td>
		 	</tr>
		 	<tr>
		 		<td>是否回访:</td><td><select id="Cs_IsHuiFang" class="easyui-combobox" name="cs_IsHuiFang" style="width:200px;">  	   			 
	   			  <option value="0">未回访</option> 
	   			  <option value="1">已回访</option>
				</select></td>
		 		<td>是否有效:</td><td><select id="Cs_IsValid" class="easyui-combobox" name="cs_IsValid" style="width:200px;">   	   			 
	   			  <option value="0">无效</option> 
	   			  <option value="1">有效</option>
				</select></td>
		 		<td>是否上门:</td><td><select id="Cs_IsVisit" class="easyui-combobox" name="cs_IsVisit" style="width:200px;">   	   			 
	   			  <option value="0">未上门</option> 
	   			  <option value="1">已上门</option>
				</select></td>
		 	</tr>
		 	<tr>
		 		<td>是否报备:</td><td><select id="Cs_IsBaoBei" class="easyui-combobox" name="cs_IsBaoBei" style="width:200px;">   	   			 
	   			  <option value="0">未报备</option> 
	   			  <option value="1">已报备</option>
				</select></td>
		 		<td>是否退费</td><td><select id="Cs_IsTuiFen" class="easyui-combobox" name="cs_IsTuiFen" style="width:200px;">   	   			 
	   			  <option value="0">未退费</option> 
	   			  <option value="1">已退费</option>
				</select></td>
		 		<td>是否进班:</td><td><select id="Cs_IsJinBan" class="easyui-combobox" name="cs_IsJinBan" style="width:200px;">   	   			 
	   			  <option value="0">未进班</option> 
	   			  <option value="1">已进班</option>
				</select></td>
		 	</tr>
		 </table>   
	</form>
</div>
	
</body>
</html>