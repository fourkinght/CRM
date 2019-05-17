<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>模块管理</title>
	<link rel="stylesheet" href="js/jquery-easyui-1.4.3/themes/icon.css"/>
	<link rel="stylesheet" href="js/jquery-easyui-1.4.3/themes/default/easyui.css"/>
	<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="js/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>
<script src="js/global.js"></script>
<script >
	/*数据加载*/
	$(function (){
		init();
	})
	function init() {
		$("#tab").datagrid({
			url:'selectUsersAll', //数据接口的地址
			method:'post',
			toolbar:'#userToolbar',
			queryParams: { //要发送的参数列表
				us_LoginName:$("#userName").textbox("getValue"),
				minTime:$("#minTime").datetimebox("getValue"),
				maxTime:$("#maxTime").datetimebox("getValue"),
				us_IsLockout:$("#UsersSel").datetimebox("getValue")
			} 
		});
		$("#usersForm").form("reset");
	}
	/*新增 */
	function addInfo() {
		$("#addUser").window("open");
	}
	/*新增--保存 */
	function submitUserForm() {
		var us_LoginName = $("#add_Name").textbox("getValue");
		var us_PassWord = $("#add_Pwd").textbox("getValue");
		var us_ProtecEmail = $("#add_Email").textbox("getValue");
		var us_ProtecMtel = $("#add_Mtel").textbox("getValue");
		if(!(/^1\d{10}$/.test(us_ProtecMtel))) {
			$.messager.alert("提示","手机号码有误，请从新输入！");
			return false;
		}
		//判断文本框格式是否正确（必填）
		var flog=$("#addForm").form("validate");
		if(flog){
			$.post("insertUsers",{
				us_LoginName:us_LoginName,
				us_PassWord: us_PassWord,
				us_ProtecEmail: us_ProtecEmail,
				us_ProtecMtel: us_ProtecMtel
			},function(res) {
				if(res==1) {
					$.messager.alert("提示","新增成功");
					$("#addUser").window("close");
					$("#tab").datagrid("reload");
				}else if(res==2){
					$.messager.alert("提示","用户名已存在");
				}else if(res==4){
					$.messager.alert("提示","手机号已存在");
				}else if(res==3){
					$.messager.alert("提示","邮箱已存在");
				}else{
					$.messager.alert("提示","新增失败");
				}
			}, "json");
		}
	}
	/*新增--取消 */
	function clearUserForm() {
		$("#addForm").form("clear");
	}
	
	//锁定和解锁用户
	function formatterLockUser(value, row, index) {
		return "<a style='cursor: pointer;' onclick='suoDingUser(" + index + ")'>锁定用户</a> <a style='cursor: pointer;' onclick='jieSuoUser(" + index + ")'>解锁用户</a>";
	}
	/*锁定用户*/
	function suoDingUser(index){
		var data=$("#tab").datagrid("getData");
		var row=data.rows[index];
		if(row.us_IsLockout==0){
		$.messager.confirm('确认','您确认想要锁定该用户吗？',function(res){
			if(res){
				$.post("updateUsersSuoDing",{
					us_Id:row.us_Id
				},function(res){
					if(res>0){
						$("#tab").datagrid("reload");
						$.messager.alert("提示","锁定用户成功");
					}
				},"json");
			}else{
				$.messager.alert("提示","锁定用户失败");
			}
		});
		}else{
			$.messager.alert("提示","该用户已是锁定状态！");
		}
	}
	/*解锁用户*/
	function jieSuoUser(index){
		var data=$("#tab").datagrid("getData");
		var row=data.rows[index];
		if(row.us_IsLockout==1){
		$.messager.confirm('确认','您确认想要解锁该用户吗？',function(res){  
			if(res){
				$.post("updateUsersJieSuo",{
					us_Id:row.us_Id
				},function(res){
					if(res>0){
						$("#tab").datagrid("reload");
						$.messager.alert("提示","解锁用户成功");
					}
				},"json");
			}else{
				$.messager.alert("提示","解锁用户失败");
			}
		});
		}else{
			$.messager.alert("提示","该用户已是解锁状态！");
		}
	}
	//设置角色权限
	function formatterSetRole(value, row, index) {
		return "<a style='cursor: pointer;' onclick='sheZhi(" + index + ")'>设置</a>";
	}
	/*角色权限设置*/
	var userId;
	function sheZhi(index){
		$("#userSheZhi").window("open");
		//获取数据表格里的所有数据
		var data=$("#tab").datagrid("getData");
		//根据index下标拿到选中的数据
		var row=data.rows[index];
		//拿到用户id
		userId=row.us_Id;
		//查询全部角色
		$("#userAllRole").datagrid({
			url: 'selectRolesAll',  //数据接口的地址
			method:'post'
			
		});
		//根据用户id查询角色
		$("#userDangQianRole").datagrid({
			url:'selectUserRolesById',
			method:'post',
			queryParams:{
				usersId:row.us_Id
			}
		}); 
	}
	/*设置--添加角色*/
	function addRole(){
		//获取选中的数据
		var row=$("#userAllRole").datagrid("getSelected");
		if(row!=null){
			$.post('insertUserRoles',{
				urs_UserId: userId,		//用户id
				urs_RoleId: row.rs_Id	//角色id
			},function(row){
				if(row>0){
					$("#userDangQianRole").datagrid("reload");
				}else{
					$.messager.alert("提示",row.message);
				}
			},"json");
		}else{
			$.messager.alert("提示","请选中要设置的角色");
		}
	}
	/*设置--移除角色*/
	function removeRole(){
		//获取选中的数据
		var row=$("#userDangQianRole").datagrid("getSelected");
			if(row!=null){
			$.post("deleteUserRoles",{
				urs_UserId: userId,		//用户id
				urs_RoleId: row.rs_Id	//角色id
			},function(row){
				if(row>0){
					$("#userDangQianRole").datagrid("reload");
				}else{
					$.messager.alert("提示",row.message);
				}
			},"json");
		}else{
			$.messager.alert("提示","请选中要设置的角色");
		} 
	} 
	//重置密码
	function formatterResetPassword(value, row, index) {
		return "<a style='cursor: pointer;' onclick='chongZhiMiMa(" + index + ")'>重置密码</a>";
	}
	/*重置密码*/
	function chongZhiMiMa(index){
		var data=$("#tab").datagrid("getData");
		var row=data.rows[index];
		$.messager.confirm('确认','您确认想要重置密码吗？',function(res){ 
			if(res){
				$.post("updateUsersPwd",{
					us_Id:row.us_Id
				},function(res){
					if(res>0){
						$.messager.alert("提示","密码重置成功，密码为:ysd123");
					}
				},"json");
			}else{
				$.messager.alert("提示","密码重置失败！");
			}
		});
	}
	//操作用户
	function formatterOPUser(value, row, index) {
		return "<a style='cursor: pointer;' onclick='updateInfo(" + index + ")'>编辑</a> <a style='cursor: pointer;' onclick='deleteInfo(" + index + ")'>删除</a>";
	}
	/*修改*/
	function updateInfo(index){
		 //将当前行数据填入表单
        var data = $("#tab").datagrid("getData"); //获取datagrid对应的json数据（对象集合）
        var row = data.rows[index];  //获取第index行对应的json对象。 index为传递过来的索引参数，从0开始，就像数组下标。
        $("#updateFrom").form("load",row); //使用form的load方法，快速将json对象的数据显示到 弹出窗口的表单元素之中。
        $("#updateUser").window("open");   //打开窗口。
	}
	/*修改--保存*/
	function updateSubmitUserForm(){
		var us_LoginName=$("#upd_Name").textbox("getValue");
		var us_ProtecEmail=$("#upd_Email").textbox("getValue");
		var us_ProtecMtel=$("#upd_Mtel").textbox("getValue");
		alert(us_LoginName+"=="+us_ProtecEmail+"=="+us_ProtecMtel);
		if(!(/^1\d{10}$/.test(us_ProtecMtel))) {
			$.messager.alert("提示","手机号码有误，请从新输入！");
			return false;
		}
		$.post("updateUsersByNameEmailMtel",{
			us_LoginName:us_LoginName,
			us_ProtecEmail:us_ProtecEmail,
			us_ProtecMtel:us_ProtecMtel
		},function(res){
			if(res==1){
				$.messager.alert("提示","修改成功");
				$("#updateUser").window("close");//关闭弹框
				$("#tab").datagrid("reload");	//重新刷新表格
			}else if(res==2){
				$.messager.alert("提示","邮箱已存在！");
			}else if(res==3){
				$.messager.alert("提示","手机号已存在！");
			}else{
				$.messager.alert("提示","修改失败！");
			}
		},"json");
	}
	/*修改--取消*/
	function updateClearUserForm(){
		$("#updateUser").window("close");
	}
	/*删除*/
	function deleteInfo(index){
		var data=$("#tab").datagrid("getData");		//获取数据
		var row=data.rows[index];	//根据index获取需要操作的一条数据
		$.messager.confirm('确认','您确认想要删除信息吗？',function(res){  
			if(res){
				$.post("deleteusers",{
					usersId:row.us_Id
				},function(res){
	   			 	if (res==1){ // 用户点击了确认按钮
	   			 		$.messager.alert("提示","删除成功");   
	        			$("#tab").datagrid("reload");
	    			}else if(res==2){
	    				$.messager.alert("提示","该用户已有角色，不能删！");  
	    			}else{
	    				$.messager.alert("提示","删除失败");
	    			}  
				});
			}else{
				$.messager.alert("提示","删除失败");
			}   
		});
	}
	function formatterus_IsLockout(value, row, index){
		if(value==0){
			return "否";
		}else{
			return "是";
		}
	}
	$('#minTime').datetimebox({    
	    required: true  
	}); 
	$('#maxTime').datetimebox({    
	    required: true  
	}); 
</script>
<body>
<!-- 工具栏 -->
<div id="userToolbar" style="padding:5px; height:auto">
	<form id="usersForm">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addInfo()">新增</a>
		名称: <input class="easyui-textbox" id="userName" style="width:100px">
		创建时间：<input class="easyui-datetimebox" id="minTime"  style="width:140px">
				~<input class="easyui-datetimebox" id="maxTime"  style="width:140px">
		是否锁定：<select id="UsersSel" class="easyui-combobox" >   
				    <option value="">-请选择-</option>   
				    <option value="1">是</option>   
				    <option value="0">否</option>   
				</select>  
		
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="init()">查找</a>
	</form>
</div>
<table id="tab" class="easyui-datagrid" title="用户列表" data-options="rownumbers:true,singleSelect:true,pagination:true,pageSize:10">
	<thead>
		<tr>
			<th data-options="field:'us_LoginName',width:60,align:'center'">用户名</th>
			<th data-options="field:'us_ProtecEmail',width:150,align:'center'">邮箱</th>
			<th data-options="field:'us_ProtecMtel',width:100,align:'center'">手机号</th>
			<th data-options="field:'us_IsLockout',width:70,align:'center',formatter:formatterus_IsLockout">是否锁定</th>
			<th data-options="field:'us_LockTime',width:140,align:'center'">锁定时间</th>
			<th data-options="field:'us_CreateTime',width:140,align:'center',sortable:true">创建时间</th>
			<th data-options="field:'us_LastLoginTime',width:140,align:'center'">最后登录的时间</th>
			<th data-options="field:'setRoleAction',width:60,align:'center',formatter:formatterSetRole">角色</th>
			<th data-options="field:'setUserAction',width:120,align:'center',formatter:formatterOPUser">操作</th>
			<th data-options="field:'setPassword',width:80,align:'center',formatter:formatterResetPassword">操作</th>
			<th data-options="field:'setLock',width:140,align:'center',formatter:formatterLockUser">用户操作</th>

		</tr>
	</thead>
</table>

<!--新增-->
<div id="addUser" class="easyui-window" title="新增员工信息" data-options="closed:true,iconCls:'icon-save'" style="width:500px;height:300px;padding:10px;">
	<form id="addForm">
		<table cellpadding="5">
			<tr>
				<td>用户名:</td>
				<td><input class="easyui-textbox" type="text"  id="add_Name" data-options="required:true"></input>
				</td>
			</tr>
			<tr>
				<td>密码:</td>
				<td><input class="easyui-textbox" type="password" id="add_Pwd"  data-options="required:true"></input>
				</td>
			</tr>
			<tr>
				<td>Email:</td>
				<td><input class="easyui-textbox" type="text"  id="add_Email" data-options="required:true,validType:'email'"></input>
				</td>
			</tr>

			<tr>
				<td>手机号:</td>
				<td><input type="text" class="easyui-numberbox" id="add_Mtel" data-options="required:true"></td>
			</tr>
		</table>
	</form>
	<div style="text-align: center;">
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitUserForm()">保存</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearUserForm()">取消</a>
	</div>
</div>
<!--修改-->
<div id="updateUser" class="easyui-window" title="修改用户信息" data-options="closed:true,iconCls:'icon-save'" style="width:500px;height:300px;">
	<form id="updateFrom">
		<table cellpadding="5">
			<tr>
				<td>用户名:</td>
				<td><input class="easyui-textbox" type="text" name="us_LoginName" id="upd_Name" readonly="readonly" data-options="required:true" disabled="disabled"></input>
				</td>
			</tr>
			<tr>
				<td>Email:</td>
				<td><input class="easyui-textbox" type="text" name="us_ProtecEmail" id="upd_Email" data-options="required:true,validType:'email'"></input>
				</td>
			</tr>

			<tr>
				<td>手机号:</td>
				<td><input type="text" class="easyui-numberbox" id="upd_Mtel" name="us_ProtecMtel" data-options="required:true"></td>
			</tr>
		</table>
	</form>
	<div style="text-align: center;">
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="updateSubmitUserForm()">保存</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="updateClearUserForm()">取消</a>
	</div>
</div>
<!--设置-->
<div id="userSheZhi" class="easyui-window" title="您正在设置角色信息" data-options="closed:true,modal:true,iconCls:'icon-save'" style="width:500px;height:500px;">
	<table cellpadding="5">
		<tr>
			<td>
				<table id="userAllRole" class="easyui-datagrid" title="系统所有角色" data-options="rownumbers:true,singleSelect:true" style="width:200px;height:700px;">
					<thead>
						<tr>
							 <th data-options="field:'rs_Name',width:170">用户名</th>
						</tr>
					</thead>
				</table>
			</td>
			<td style="width:100px;height:700px;">
				<a href="javascript:void(0)"  class="easyui-linkbutton" onclick="addRole()">>></a><br />
				<a href="javascript:void(0)"  class="easyui-linkbutton" onclick="removeRole()"><<</a>
			</td>
			<td>
				<table id="userDangQianRole" class="easyui-datagrid"  title="当前用户的角色" data-options="rownumbers:true,singleSelect:true" style="width:200px;height:700px;"> 
					<thead>
					    <tr>
					         <th data-options="field:'rs_Name',width:170">用户名</th>
					    </tr>                                      
					</thead>
				</table>
			</td>
		</tr>
	</table>
</div>
</body>
