<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>查询所有用户以及用户角色</title>
    <link rel="stylesheet" href="js/jquery-easyui-1.4.3/themes/icon.css"/>
	<link rel="stylesheet" href="js/jquery-easyui-1.4.3/themes/default/easyui.css"/>
	<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="js/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript">
	//easyui 右键动态显示隐藏列
	var createGridHeaderContextMenu = function(e, field) {
	    e.preventDefault();
	    var grid = $(this);/* grid本身 */
	    var headerContextMenu = this.headerContextMenu;/* grid上的列头菜单对象 */
	    if (!headerContextMenu) {
	        var tmenu = $('<div style="width:100px;"></div>').appendTo('body');
	        var fields = grid.datagrid('getColumnFields');//获取列
	        for ( var i = 0; i < fields.length; i++) {
	            var fildOption = grid.datagrid('getColumnOption', fields[i]);
	            if (!fildOption.hidden) {
	                $('<div iconCls="icon-ok" field="' + fields[i] + '"/>').html(fildOption.title).appendTo(tmenu);
	            } else {
	                $('<div iconCls="icon-empty" field="' + fields[i] + '"/>').html(fildOption.title).appendTo(tmenu);
	            }
	        }
	        headerContextMenu = this.headerContextMenu = tmenu.menu({
	            onClick : function(item) {
	                var field = $(item.target).attr('field');
	                if (item.iconCls == 'icon-ok') {
	                    grid.datagrid('hideColumn', field);
	                    $(this).menu('setIcon', {
	                        target : item.target,
	                        iconCls : 'icon-empty'
	                    });
	                } else {
	                    grid.datagrid('showColumn', field);
	                    $(this).menu('setIcon', {
	                        target : item.target,
	                        iconCls : 'icon-ok'
	                    });
	                }
	            }
	        });
	    }
	    headerContextMenu.menu('show', {
	        left : e.pageX,
	        top : e.pageY
	    });
	};
	$.fn.datagrid.defaults.onHeaderContextMenu = createGridHeaderContextMenu;
	$.fn.treegrid.defaults.onHeaderContextMenu = createGridHeaderContextMenu;
	$(function(){
		search();
		});
	function search(){
		var C_UserId=${usersId}
		$("#tabid").datagrid({
			url:'SelectUserRoles',
			method:"post",
			pagination:true,
			queryParams:{
				C_UserId:C_UserId,
				Us_LoginName:$("#Us_LoginName").val() ,
				Rs_Id:$("#Rs_Id").combobox("getValue"),
				Us_IsLockout:$("#Us_IsLockout").combobox("getValue"),
				Rls_State:$("#Rls_State").combobox("getValue"),
				Us_ProtecMtel:$("#Us_ProtecMtel").val(),
				Us_CreateTimeMin:$("#Us_CreateTimeMin").datebox("getValue"),
				Us_CreateTimeMax:$("#Us_CreateTimeMax").datebox("getValue"),
				Rls_StartTimeMin:$("#Rls_StartTimeMin").datetimebox("getValue"),
				Rls_StartTimeMax:$("#Rls_StartTimeMax").datetimebox("getValue"),
				Rls_FinishTimeMin:$("#Rls_FinishTimeMin").datetimebox("getValue"),
				Rls_FinishTimeMax:$("#Rls_FinishTimeMax").datetimebox("getValue")
			}
		});
		 $("#chongzhi").form("reset");//重置文本框内容 
	}
	//签到
	function qiandao(){	
	 
		 var C_UserId=${usersId}
		alert(C_UserId);
		 var  rls_State=${usersLoginState.consultantLabels.rls_State}
		alert(rls_State);
		if(rls_State!=1){
		 $.post(
					"ConsultantLabelsStart", {
						C_UserId:C_UserId
					},
					function(res) {
						if(res>0) {
							$.messager.alert("提示","签到成功");	
							$("#qiandao").linkbutton({
								disabled:true,
								text:'已签到'
							});
							$("#tabid").datagrid("reload");
							
						}
					}, "json");
	}else{
		$.messager.alert("提示","已经签到过了");	
		$("#qiandao").linkbutton({
			disabled:true,
			text:'已签到'
		});
	}
	}
	//导出
  	function exportExcel(){  
	  	var data=$("#tabid").datagrid("getSelections");
	  
	    var us_Id="";
	 
		for(var i=0;i<data.length;i++){
			var row=data[i].us_Id;
			us_Id=us_Id+row+",";
			
		}   
		if(row!=null){
			 location.href="excel/exportUserRoles?&Us_Id="+us_Id;   
		}else{
			$.messager.alert("提示","请选择要导出的行");	
			
		}
	       
    }  
	
	
	//角色名
	function rs_Nameformatter(value,row,index){
		  if(row.roles!=null){
			  return row.roles.rs_Name;
		  }
		  else{
			  return "暂无";
		  } 
	  }
	//图片
	function  UserImgformatter(value,row,index){
	      if(row.us_UserImg!=null && row.us_UserImg!=""){
	         return "<img style='width:24px;height:24px;'border='1' src='image/"+row.us_UserImg+".jpg'/>";
	      }
	      else{
			  return "暂无";
		  }
	  } 
	//锁定
	function us_IsLockoutformatter(value,row,index){
	        if(row.us_IsLockout!=null && row.us_IsLockout!="" && row.us_IsLockout=="1"){
		         return "已锁定";
		      }
		      else{
				  return "未锁定";
			  }
		  }
	//员工的客户
	function clientsformatter(value,row,index){
		  if(row.clients!=null ){
			  return row.clients.cs_Id;
		  }
		  else{
			  return "0";
		  } 
	  }
	//手动签退
	 function UserQianTUi(index){
		  var data = $("#tabid").datagrid("getData"); //获取datagrid对应的json数据（对象集合）
	      var row = data.rows[index];
	      var Us_Id=row.us_Id;
	      var State=row.consultantLabels.rls_State;
	     
	     if(State=="1"){
		  $.post(
					"UsersQianTui", {
						Us_Id:Us_Id
					},
					function(res) {
						if(res>0) {
							$.messager.alert("提示","签退成功");	
							/* $("#qiandao").linkbutton({
								enable:true,
								text:'用户已签退'
							}); */
						
							
							$("#tabid").datagrid("reload");
							
						}
					}, "json");
	     }else{
	    	 $.messager.alert("提示","此用户未签到不能签退");	
	     }
		  
	} 
	 function qiantui(){
		var data=$("#tabid").datagrid("getSelections");
	    var Us_Id="";
	    var Start1="";
		for(var i=0;i<data.length;i++){
			 var row=data[i].us_Id;
			 var State=data[i].consultantLabels.rls_State;
			 Start1=Start1+State+",";
			 Us_Id=Us_Id+row+",";
		} 
	    
		var arr=Start1.split(",");
		var code = true;
		for(var i=0;i<arr.length;i++){
			
			if(arr[i] =="0" && arr[i] !=null){
				code = false;
			}
		}
		if(Us_Id){
		if(code){
		$.post(
				"UsersQianTui", {
					Us_Id:Us_Id
				},
				function(res) {
					if(res>0) {
						$.messager.alert("提示","签退成功");
						code=true;
						$("#qiandao").linkbutton({
							enable:false,
							text:'签到'
						});
						$("#tabid").datagrid("reload");
						
					}
				}, "json");
		}else{
			 $.messager.alert("提示","有用户未签到不能签退");	
		}
		}else{
			$.messager.alert("提示","请选择要签退的用户");	
		}
		
		
		
		
		 
		
	}
		  function  UserRolesformatter(value,row,index){
			     return "<a style='cursor: pointer; color:blue;' onclick='SelectClientRoles(" + index + ")'>查看客户</a> ";
			   /*   <a style='cursor: pointer; color:#00BB00;' onclick='UserQianTUi(" + index + ")'>手动签退</a> */
		  }
		  //查看客户操作
		  function  SelectClientRoles(index){
			  var data = $("#tabid").datagrid("getData"); //获取datagrid对应的json数据（对象集合）
		      var row = data.rows[index];
			  var Us_Id=row.us_Id;
			  var cs_Id=row.clients.cs_Id; 
			  
			  if(row.clients.cs_Id>0 || row.clients!=null  || row.clients.cs_Id!="" || row.clients.cs_Id!=null){
				  location.href="selectUserClientRoles.jsp?&Us_Id="+Us_Id; 
			  } else{
				 alert("此用户无客户");
			  } 
			  
		  }
		  //签到状态显示
		  function consultantLabelsformatter(value,row,index){
			  if(row.consultantLabels.rls_State=="1"){
				  return "已签到";		 
			  }else{
				  return "未签到";
			  }
		  }
		  //签到时间显示
		  function Rls_StartTimeformatter(value,row,index){
			  if(row.consultantLabels!=null){
				  return row.consultantLabels.rls_StartTime;		 
			  }
		  }
		  //签退时间显示
		  function Rls_FinishTimeformatter(value,row,index){
			  if(row.consultantLabels!=null){
				  return row.consultantLabels.rls_FinishTime;		 
			  }
		  }
		  
	</script>	
</head>
<body>
     <form id="chongzhi">
  用户名称:  <input  class="easyui-textbox"  id="Us_LoginName"  style="width:300px"> 
  角色名称:      <select id="Rs_Id"  class="easyui-combobox" name="dept" style="width:200px;">   
			    <option value="">---请选择---</option>    
			    <c:forEach items="${selectRoles}" var="roles">
			     <option  value="${roles.rs_Id}">${roles.rs_Name}</option> 
			    </c:forEach>   
         </select>
  是否锁定：          <select id="Us_IsLockout"  class="easyui-combobox" name="dept" style="width:200px;">   
			     <option value="">---请选择---</option>  
			     <option value="1">已锁定</option>			     
			     <option value="0">未锁定</option>  
           </select> 
 签到状态：          <select id="Rls_State"  class="easyui-combobox" name="dept" style="width:200px;">   
			     <option value="">---请选择---</option>  
			      <option value="1">已签到</option>  
			     <option value="0">未签到</option>			     
			    
           </select> 
  电话：<input class="easyui-textbox" id="Us_ProtecMtel"  style="width:300px">
  <br/>
 创建时间:<input  id="Us_CreateTimeMin"   type= "text" class= "easyui-datebox" /> ~
         <input  id="Us_CreateTimeMax"   type= "text" class= "easyui-datebox" />
 签到时间:<input  id="Rls_StartTimeMin"   type= "text" class= "easyui-datetimebox" /> ~
         <input  id="Rls_StartTimeMax"   type= "text" class= "easyui-datetimebox" />
 签退时间:<input  id="Rls_FinishTimeMin"  type= "text" class= "easyui-datetimebox" /> ~
         <input  id="Rls_FinishTimeMax"  type= "text" class= "easyui-datetimebox" />
       
     <a id="btn" href="javascript:search()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">搜索</a>
     <a id="qiandao" href="javascript:qiandao()" class="easyui-linkbutton" data-options="iconCls:'icon-man'">考勤签到</a>
     <a id="qiantuia" href="javascript:qiantui()" class="easyui-linkbutton" data-options="iconCls:'icon-man'">手动签退</a>
   
     <a id="btn" href="javascript:exportExcel()" class="easyui-linkbutton" data-options="iconCls:'icon-redo'">导出</a>
    </form>
     <table id="tabid" class="easyui-datagrid">
           <thead>
		        <tr> 
		            <th data-options="field:'che',checkbox:true"></th>
		            <th data-options="field:'us_LoginName',width:100">用户名</th>     
		            <th data-options="field:'us_UserImg',width:100,formatter:UserImgformatter">用户照片</th> 
		            <th data-options="field:'users',width:100,formatter:rs_Nameformatter">所属角色</th>
		            <th data-options="field:'us_CreateTime',width:150">创立时间</th> 
		            <th data-options="field:'us_IsLockout',width:100,formatter:us_IsLockoutformatter">是否锁定</th>
		            <th data-options="field:'us_LockTime',width:150">被锁定时间</th>
		            <th data-options="field:'consultantLabels',width:100,formatter:consultantLabelsformatter">签到状态</th>
		            <th data-options="field:'Rls_StartTime',width:150,formatter:Rls_StartTimeformatter">签到时间</th>
		            <th data-options="field:'Rls_FinishTime',width:150,formatter:Rls_FinishTimeformatter">签退时间</th>
		            <th data-options="field:'us_ProtecMtel',width:100">手机号码</th> 
		            <th data-options="field:'clients',width:100,formatter:clientsformatter">客户个数</th>
		            <th data-options="field:'format',width:150,formatter:UserRolesformatter">操作</th>
		        </tr>   
		    </thead>   
    </table>
</body>
</html>