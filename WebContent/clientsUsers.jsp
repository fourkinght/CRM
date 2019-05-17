<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>查询所有客户以及用户对客户的跟踪记录</title>
    <link rel="stylesheet" href="js/jquery-easyui-1.4.3/themes/icon.css"/>
	<link rel="stylesheet" href="js/jquery-easyui-1.4.3/themes/default/easyui.css"/>
	<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="js/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>
	<!-- 三级联动的js -->
	 <script class="resources library" src="js/area.js" type="text/javascript"></script> 
	 <script class="resources library" src="js/address.js" type="text/javascript"></script> 
	
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
		
			
		$('#Us_Id').combobox({    
		    url:'selectUsers',    
		    method:"post",
		    valueField:'us_Id',    
		    textField:'us_LoginName'   
		});  
		
		
		search();
		});
	function search(){
		/* var Us_Ida=$("#Us_Id").combobox("getValue")
		if(Us_Ida=="---请选择---"){
			Us_Ida="";
		} */

			$("#tabid").datagrid({
				url:'SelectClientsUsers',
				method:"post",
				pagination:true,
				queryParams:{
					Cs_Name:$("#Cs_Name").val() ,
					Cs_Sex:$("#Cs_Sex").combobox("getValue"),
					Cs_Phone:$("#Cs_Phone").val(),
					Cs_ClientState:$("#Cs_ClientState").combobox("getValue"),
					Cs_Source:$("#Cs_Source").combobox("getValue"),
					Us_Id:$("#Us_Id").combobox("getValue"),
					Cs_FenPei:$("#Cs_FenPei").combobox("getValue"),
					Cs_SiteSheng:$("#Cs_SiteSheng").val(),
					Cs_SiteShi:$("#Cs_SiteShi").val(),
					Cs_SiteXian:$("#Cs_SiteXian").val(),
					Cur_ZhuangTai:$("#Cur_ZhuangTai").combobox("getValue"),
					Cur_RecordTimeMin:$("#Cur_RecordTimeMin").datebox("getValue"),
					Cur_RecordTimeMax:$("#Cur_RecordTimeMax").datebox("getValue")
				}
			});
			 $("#chongzhi").form("reset");//重置文本框内容 
		}
         //手动分量
         function shoudongfenliang(){
        	 //已签到用户id 
        	
		
        	 var data=$("#tabid").datagrid("getSelections");
     	    var aa="";
     		for(var i=0;i<data.length;i++){
     			 var row=data[i].c_Id;
     			aa=aa+row+",";
     			 
     		} 
     		var haha=aa.substring(0,aa.length-1);
     		var arr=haha.split(",");
     		
     		
     		var code = "";
    		for(var i=0;i<arr.length;i++){
    			
    			code=true;
    			
    			if(arr[i] =="0"){
    				code = false;
    			}
    			
    		}
    		
   		     if(row!=null){
        	 if(code==false){
        		 $("#UpdateUsers_window").window("open"); //打开窗口。     
        	 }else{
        	     $.messager.alert("提示","有的客户已经分配咨询师请重新选择");	
        	 }
   		     }else{
        	     $.messager.alert("提示","请选择要分配的客户");	
        	 }
        	
         }
        
        function  zidogfenliang() {
        	 
         }
        //增加客户
        function addClients(){
        	addressInit('cs_SiteSheng', 'cs_SiteShi', 'cs_SiteXian');//省市县（区）三级联动，必须和js文件地址匹配
        	$('#add_ClientWin').window('open');
        }
        function Client_Submit(){	
    		var a= $("#innsert_cs_HuiFangInfo").val();
    		alert(a);
    		$.post('innsertClient',{
    				cs_Name:$("#innsert_cs_Name").val(),
    				cs_Sex:$("#innsert_cs_Sex").val(),
    				cs_Age:$("#innsert_cs_Age").val(),
    				cs_Phone:$("#innsert_cs_Phone").val(),
    				cs_Xueli:$("#innsert_cs_Xueli").val(),
    				cs_Email:$("#innsert_cs_Email").val(),
    				cs_QQ:$("#innsert_cs_QQ").val(),
    				cs_WeiXin:$("#innsert_cs_WeiXin").val(),
    				cs_Source:$("#innsert_cs_Source").combobox("getValue"),
    				cs_ClientState:$("#innsert_cs_ClientState").val(),
    				cs_SiteXiangXi:$("#innsert_cs_SiteXiangXi").val(),
    				cs_IsJiaoFei:$("#innsert_cs_IsJiaoFei").val(),
    				cs_IsHuiFang:$("#innsert_cs_IsHuiFang").val(),
    				cs_IsValid:$("#innsert_cs_IsValid").val(),
    				cs_IsVisit:$("#innsert_cs_IsVisit").val(),
    				cs_IsBaoBei:$("#innsert_cs_IsBaoBei").val(),
    				cs_IsTuiFen:$("#innsert_cs_IsTuiFen").val(),
    				cs_TuiFenInfo:$("#innsert_cs_TuiFenInfo").val(),
    				cs_IsJinBan:$("#innsert_cs_IsJinBan").val(),
    				cs_HuiFangInfo:$("#innsert_cs_HuiFangInfo").val(),
    				cs_Courses:$("#innsert_cs_Courses").val(),
    				cs_Money:$("#innsert_cs_Money").val(),
    				cs_Grade:$("#innsert_cs_Grade").val(),
    				cs_IsValidInfo:$("#innsert_cs_IsValidInfo").val(),
    				cs_HuiFangTime:$("#innsert_cs_HuiFangTime").datebox('getValue'),
    				cs_VisitTime:$("#innsert_cs_VisitTime").datebox('getValue'),
    				cs_JiaoFeiTime:$("#innsert_cs_JiaoFeiTime").datebox('getValue'),
    				cs_JinBanTime:$("#innsert_cs_JinBanTime").val(),
    				cs_ShenFenZheng:$("#innsert_cs_ShenFenZheng").val(),
    				cs_BirthTime:$("#innsert_cs_BirthTime").datebox('getValue'),
    				cs_Remark:$("#innsert_cs_Remark").val(),
    				cs_SiteSheng:$("#cs_SiteSheng").val(),
					cs_SiteShi:$("#cs_SiteShi").val(),
					cs_SiteXian:$("#cs_SiteXian").val()
    				  
    		},function (res){
    			if(res>0){
    				alert("添加成功");
    				$('#tabid').datagrid('reload');
    				 $("#Client_from").form('clear');
    			        $("#add_ClientWin").window("close");
    			}else{
    				alert("添加失败");
    			}
    			
    		},'json');
    	}

         function SubmitUpdateForm(){
        	 var data=$("#tabid").datagrid("getSelections");
     		var Cs_Id="";
     		var  C_Id=$("#QianDaoUs_Id").combobox("getValue");
     		
     		//获取选中客户id 根据客户id循环分配 选中的已签到的用户
     		for(var i=0;i<data.length;i++){
 				var row=data[i].cs_Id;
 				Cs_Id=Cs_Id+row+",";	
 			} 
     		
     		$.post(
     				"UsersQianDaoFenLiang", {
     					Cs_Id:Cs_Id,
     					C_Id:C_Id
     				},
     				function(res) {
     					if(res>0) {
     						$.messager.alert("提示","分量成功");	
     						$("#tabid").datagrid("reload");
     						 $("#UpdateUsers_window").window("close");
     					}
     				}, "json");
     		
				
         }
         function CloseForm(){
        	 $("#UpdateUsers_window").window("close");
         }
	
	
		//导出
	  	function exportExcel(){  
		  	var data=$("#tabid").datagrid("getSelections");
		    var cs_Id="";
			for(var i=0;i<data.length;i++){
				var row=data[i].cs_Id;
				cs_Id=cs_Id+row+",";
			}   
			if(row!=null){
				 location.href="excel/export?&Cs_Id="+cs_Id;   
			}else{
				alert("请选择要导出的行");
			}
		       
	    }  
		
	  function LoginNameformatter(value,row,index){
		  if(row.users!=null){
			  return row.users.us_LoginName;
		  }
		  else{
			  return "暂无";
		  }
		  
	     
	  }
	  function Cur_RecordTimeformatter(value,row,index){
		  if(row.clientUserRecord!=null){
			  return row.clientUserRecord.cur_RecordTime;
		  }
		  else{
			  return "暂无";
		  }
	  }  
	  function  ClientsImgformatter(value,row,index){
	      if(row.cs_Img!=null && row.cs_Img!=""){
	         return "<img style='width:24px;height:24px;'border='1' src='image/"+row.cs_Img+".jpg'/>";
	      }
	      else{
			  return "暂无";
		  }
	  } 
	  function cs_Sexformatter(value,row,index){
		  if(row.cs_Sex=="1"){
			  return "男";
		  }
		  else{
			  return "女";
		  }
	  }  
	  function cs_ClientStateformatter(value,row,index){
		  if(row.cs_ClientState=="1"){
			  return "潜在客户";
		  }else if(row.cs_ClientState=="2"){
			  return "意向客户";
		  }else if(row.cs_ClientState=="3"){
			  return "续保客户";
		  }else if(row.cs_ClientState=="4"){
			  return "正式客户";
		  }else if(row.cs_ClientState=="5"){
			  return "流失客户";
		  }else if(row.cs_ClientState=="6"){
			  return "未分配客户";
		  }
		 
	  } 
	  function cs_Sourceformatter(value,row,index){
		  if(row.cs_Source=="1"){
			  return "QQ";
		  }else if(row.cs_Source=="2"){
			  return "微信";
		  }else if(row.cs_Source=="3"){
			  return "赶集网";
		  }else if(row.cs_Source=="4"){
			  return "天涯社区";
		  }else if(row.cs_Source=="5"){
			  return "新浪论坛";
		  }else if(row.cs_Source=="6"){
			  return "网易论坛";
		  }else if(row.cs_Source=="7"){
			  return "百度贴吧";
		  }else if(row.cs_Source=="8"){
			  return "58同城";
		  }
		 
	  } 
	  //三级联动
	 var Gid  = document.getElementById ;
     var showArea = function(){
	 Gid('show').innerHTML = "<h3>省" + Gid('Cs_SiteSheng').value + " - 市" + 	
	 Gid('Cs_SiteShi').value + " - 县/区" + 
	 Gid('Cs_SiteXian').value + "</h3>"
     }
     Gid('Cs_SiteXian').setAttribute('onchange','showArea()');
     
	</script>
	
</head>
<body>
    <form id="chongzhi">
  客户名称:  <input  class="easyui-textbox"  id="Cs_Name"  style="width:300px"> 
  性别：          <select id="Cs_Sex"  class="easyui-combobox" name="dept" style="width:200px;">   
			     <option value="">---请选择---</option>  
			     <option value="1">男</option>			     
			     <option value="2">女</option>  
           </select> 
  电话：<input class="easyui-textbox" id="Cs_Phone"  style="width:300px">
  客户状态： <select id="Cs_ClientState"  class="easyui-combobox" name="dept" style="width:200px;">   
			     <option value="">---请选择---</option>  
			     <option value="1">潜在客户</option>
			     <option value="2">意向客户</option>
			     <option value="3">续保客户</option>
			     <option value="4">正式客户</option>			     
			     <option value="5">流失客户</option>
			   
           </select>
 客户来源：<select id="Cs_Source"  class="easyui-combobox" name="dept" style="width:200px;">   
			     <option  value="">---请选择---</option>  
			     <option  value="1">QQ</option> 
			     <option  value="2">微信</option>
			     <option  value="3">赶集网</option>
			     <option  value="4">天涯社区</option>
			     <option  value="5">新浪论坛</option>
			     <option  value="6">网易论坛</option>
			     <option  value="7">百度贴吧</option>
			     <option  value="8">58同城</option>  
           </select>
           <br/>
 所属用户:  <select id="Us_Id"  class="easyui-combobox" name="dept" style="width:200px;">   
			    <option value="">---请选择---</option>    
			   <%--  <c:forEach items="${selectUsers}" var="users">
			     <option  value="${users.us_Id}">${users.us_LoginName}</option> 
			    </c:forEach>    --%>
         </select>
  分配:      <select id="Cs_FenPei"  class="easyui-combobox" name="dept" style="width:200px;">   
			     <option value="">---请选择---</option>  
			     <option value="0">已分配</option>  
			     <option value="1">未分配</option>  
          </select>
  地址:    <select id="Cs_SiteSheng" name="s_province" ></select>  
		  <select id="Cs_SiteShi"   name="s_city"     ></select>  
		  <select id="Cs_SiteXian"  name="s_county"   ></select>
		  <script type="text/javascript">_init_area();</script>
 意向状态:   <select id="Cur_ZhuangTai"  class="easyui-combobox" name="dept" style="width:200px;">   
			     <option value="">---请选择---</option>  
			     <option value="1">意向强</option>  
			     <option value="2">意向中</option>
			     <option value="3">意向弱</option> 
          </select>
 记录时间:<input  id="Cur_RecordTimeMin"  type= "text" class= "easyui-datebox" /> ~
         <input  id="Cur_RecordTimeMax"  type= "text" class= "easyui-datebox" /> 
         <br/>
     <a id="btn" href="javascript:search()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">搜索</a>
     <a id="zidogfenliang" href="javascript:zidogfenliang()" class="easyui-linkbutton" data-options="iconCls:'icon-man'">自动分量</a>
     <a id="shoudongfenliang" href="javascript:shoudongfenliang()" class="easyui-linkbutton" data-options="iconCls:'icon-man'">手动分量</a>
     <a id="btn" href="javascript:addClients()" class="easyui-linkbutton" data-options="iconCls:'icon-man'">增加客户</a>
     <a id="btn" href="javascript:exportExcel()" class="easyui-linkbutton" data-options="iconCls:'icon-redo'">导出</a>
    </form>
    <table id="tabid" class="easyui-datagrid">
           <thead>   
		        <tr> 
		            <th data-options="field:'che',checkbox:true"></th>
		            <th data-options="field:'cs_Id',width:100">客户Id</th>     
		            <th data-options="field:'cs_Name',width:100">客户姓名</th>
		            <th data-options="field:'cs_Img',width:100,formatter:ClientsImgformatter">客户照片</th> 
		            <th data-options="field:'cs_Sex',width:100,formatter:cs_Sexformatter">性别</th>
		            <th data-options="field:'cs_Phone',width:100">电话</th>
		            <th data-options="field:'cs_ClientState',width:100,formatter:cs_ClientStateformatter">客户状态</th>
		            <th data-options="field:'cs_Source',width:100,formatter:cs_Sourceformatter">客户来源</th>
		            <th data-options="field:'cs_SiteXiangXi',width:200">客户地址</th>
		            <th data-options="field:'cs_FoundTime',width:150">建档时间</th>
		            <th data-options="field:'users',width:100,formatter:LoginNameformatter">所属用户</th>
		            <th data-options="field:'clientUserRecord',width:150,formatter:Cur_RecordTimeformatter">记录时间</th>
		            <!-- <th data-options="field:'format',width:100,formatter:ClientUserRecordformatter">操作</th>  -->
		        </tr>   
		    </thead>   
    </table>
    <div id="UpdateUsers_window" class="easyui-window" title="修改信息" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:500px;height:300px;padding:10px;">
	<form id="UpdateUsers_Form">
		<table cellpadding="5">
		   <tr>
			    <td>已签到咨询师名称:</td>
				<td>
				<select id="QianDaoUs_Id"  class="easyui-combobox" name="dept" style="width:200px;">   
			    <option value="">请选择</option>  
			    <c:forEach items="${ziXunSHiQianDaoFenLiangOption}" var="zi">
			    <option  value="${zi.users.us_Id}">${zi.users.us_LoginName}</option> 
			    </c:forEach>    
                </select>  
				</td>
			</tr>
		   
			</table>
	</form>
	<div style="text-align:center;padding:5px">
		<a href="javascript:void(0)" class="easyui-linkbutton" type="button" onclick="SubmitUpdateForm()">保存</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="CloseForm()">取消</a>
	</div>
    </div>
    <!--客户添加页面  -->
	<div id="add_ClientWin" class="easyui-window"  title="新增客户"  style="width:800px;height:500px;background-color: aqua;" data-options="iconCls:'icon-save',modal:true,closed:true">
		<form id="Client_from" class="class-form">
					<table class="Client_table" style="width:700px;height:500px"   
					        data-options="fitColumns:true,singleSelect:true">   
					    <thead align="center"> 
					        <tr> 
					        <th>姓名：</th>
					         <th><input id="innsert_cs_Name"  data-options="required:true"  name="cs_Name" class="easyui-textbox" style="width:150px"/> </th>
					        <th data-options="field:'code',width:100"> 
					        <th>客户来源：</th> 
					        <th>
					        <select id="innsert_cs_Source"   class="easyui-combobox" name="dept" style="width:200px;">   
			     <option  value="">---请选择---</option>  
			     <option  value="1">QQ</option> 
			     <option  value="2">微信</option>
			     <option  value="3">赶集网</option>
			     <option  value="4">天涯社区</option>
			     <option  value="5">新浪论坛</option>
			     <option  value="6">网易论坛</option>
			     <option  value="7">百度贴吧</option>
			     <option  value="8">58同城</option>  
           </select>
					       
					         </th>
					        </tr>
					        <tr>  <th data-options="field:'code',width:100"> <tr><th>客户状态：</th> <th>
										    
											 <select id="innsert_cs_ClientState"  class="easyui-combobox" name="dept" style="width:200px;">   
			     <option value="">---请选择---</option>  
			     <option value="1">潜在客户</option>
			     <option value="2">意向客户</option>
			     <option value="3">续保客户</option>
			     <option value="4">正式客户</option>			     
			     <option value="5">流失客户</option>
			    
           </select>
					         </th>	<th><th>是否缴费：</th> <th>
					        				<select id="innsert_cs_IsJiaoFei"  name="cs_IsJiaoFei" data-options="formatter:shifou" style="width:100px;">   
											    <option value="">--请选择--</option>   
											    <option value="0" >是</option>   
											    <option value="1" >否</option>   
											</select>  </th></th>
					        </tr></th>   </tr>   
					        <tr>  <th data-options="field:'code',width:100"> <tr><th>创建时间：</th> <th><input class="easyui-datebox"  name="cs_JiaoFeiTime" id="innsert_cs_JiaoFeiTime" style="width:150px"/> </th>
					        <th><th>是否回访：</th> <th><select id="innsert_cs_IsHuiFang"  name="cs_IsHuiFang" data-options="formatter:shifou" style="width:100px;">   
											    <option value="">--请选择--</option>   
											    <option value="0" >是</option>   
											    <option value="1" >否</option>   
											</select>  </th></th>
					        </tr></th>   </tr>   
					        <tr>  <th data-options="field:'code',width:100"> <tr><th>性别：</th> <th>
					        <select id="innsert_cs_Sex"  name="cs_Sex" data-options="formatter:shifou" style="width:100px;">   
											    <option value="">--请选择--</option>   
											    <option value="0" >男</option>   
											    <option value="1" >女</option>   
											</select>
					         </th> <th><th>是否有效：</th> <th><select id="innsert_cs_IsValid"  name="cs_IsValid" data-options="formatter:shifou" style="width:100px;">   
											    <option value="">--请选择--</option>   
											    <option value="0" >是</option>   
											    <option value="1" >否</option>   
											</select>  </th></th>
					        </tr></th>   </tr>   
					        <tr>  <th data-options="field:'code',width:100"> <tr><th>年龄：</th> <th><input class="easyui-textbox" data-options="required:true"   name="cs_Age" id="innsert_cs_Age" style="width:150px"/> </th>
					        <th><th>是否上门：</th> <th><select id="innsert_cs_IsVisit"  name="cs_IsVisit" data-options="formatter:shifou" style="width:100px;">   
											    <option value="">--请选择--</option>   
											    <option value="0" >是</option>   
											    <option value="1" >否</option>   
											</select> </th></th>
					        </tr></th>   </tr>   
					        <tr>  <th data-options="field:'code',width:100"> <tr><th>手机号：</th> <th><input class="easyui-textbox" data-options="required:true"  name="cs_Phone"  id="innsert_cs_Phone" style="width:150px"/> </th>
					        <th><th>是否报备：</th> <th><select id="innsert_cs_IsBaoBei"  name="cs_IsBaoBei" data-options="formatter:shifou" style="width:100px;">   
											    <option value="">--请选择--</option>   
											    <option value="0" >是</option>   
											    <option value="1" >否</option>   
											</select>  </th></th>
					        </tr></th>   </tr>   
					        <tr>  <th data-options="field:'code',width:100"> <tr><th>学历：</th> <th><input class="easyui-textbox" data-options="required:true"  name="cs_Xueli"  id="innsert_cs_Xueli" style="width:150px"/> </th>
					        <th><th>是否退费：</th> <th><select id="innsert_cs_IsTuiFen"  name="cs_IsTuiFen" data-options="formatter:shifou" style="width:100px;">   
											    <option value="">--请选择--</option>   
											    <option value="0" >是</option>   
											    <option value="1" >否</option>   
											</select>  </th></th>
					        </tr></th>   </tr>   
					        <tr>  <th data-options="field:'code',width:100"> <tr><th>邮箱：</th> <th><input class="easyui-textbox"  data-options="required:true"  id="innsert_cs_Email" type="text" name="cs_Email" data-options="required:false,validType:'email'"/> </th>
					        <th><th>是否进班：</th> <th><select id="innsert_cs_IsJinBan"  name="cs_IsJinBan" data-options="formatter:shifou" style="width:100px;">   
											    <option value="">--请选择--</option>   
											    <option value="0" >是</option>   
											    <option value="1" >否</option>   
											</select>  </th></th>
					        </tr></th>   </tr>   
					        <tr>  <th data-options="field:'code',width:100"> <tr><th>QQ号：</th> <th><input class="easyui-textbox" data-options="required:true"  name="cs_QQ" id="innsert_cs_QQ" style="width:150px"/> </th>
					        <th><th>回访情况：</th> <th><select id="innsert_cs_HuiFangInfo"  name="cs_HuiFangInfo" data-options="formatter:shifou" style="width:100px;">   
											    <option value="">--请选择--</option>   
											    <option value="0" >已回访</option>   
											    <option value="1" >未回访</option>   
											</select>  </th></th>
					        </tr></th>   </tr>
					        <tr>  <th data-options="field:'code',width:100"> <tr><th>微信：</th> <th><input class="easyui-textbox" data-options="required:true"  name="cs_WeiXin" id="innsert_cs_WeiXin" style="width:150px"/> </th>
					        <th><th>课程：</th> <th><input class="easyui-textbox"  name="cs_Courses" id="innsert_cs_Courses"  style="width:150px"/> </th></th>
					        </tr></th>   </tr>   
					        <tr>  <th data-options="field:'code',width:100"> <tr><th>分配：</th> <th>
					         </th>
					        <th><th>课程费用：</th> <th><input class="easyui-textbox" name="cs_Money"  id="innsert_cs_Money" style="width:150px"/> </th></th>
					        </tr></th>   </tr>   
					        <tr>  <th data-options="field:'code',width:100">
					         <tr><th>地址：</th> <th style="width:200px">
								 
                <td>省:</td><td><select id="cs_SiteSheng"  name="cs_SiteSheng"><lect></td>
		 		<td>市:</td><td><select id="cs_SiteShi" name="cs_SiteShi" /></td>
		 		<td>县:</td><td><select id="cs_SiteXian" name="cs_SiteXian" /></td>
					         </th>
					         <th><th>缴费时间：</th> <th><input class="easyui-datebox" name="cs_IsJiaoFei"  id="innsert_cs_IsJiaoFei" style="width:150px"/> </th></th>
					        </tr> </th>   </tr>   
					        <tr>  <th data-options="field:'code',width:100"> <tr><th>详细地址：</th> <th><input class="easyui-textbox" data-options="required:true"  name="cs_SiteXiangXi"  id="innsert_cs_SiteXiangXi" style="width:150px"/> </th>
					        <th><th>无效原因：</th> <th><input class="easyui-textbox"  name="cs_IsValidInfo" id="innsert_cs_IsValidInfo" style="width:150px"/> </th></th>
					        </tr></th>   </tr>   
					        <tr>  <th data-options="field:'code',width:100">  <tr><th> 照片：</th> <th><input class="easyui-filebox " name="cs_Img" data-options="prompt:'选择一个文件...',buttonText:'浏览...',
                             buttonIcon:'icon-search',buttonAlign:'left'" style="width:100%"> </th> 
					        <th><th>首次回访时间：</th> <th><input class="easyui-datebox"  name="cs_HuiFangTime" id="innsert_cs_HuiFangTime" style="width:150px"/> </th></th>
					        </tr></th>   </tr>   
					        <tr>  <th data-options="field:'code',width:100"> <tr><th>身份证号：</th> <th><input class="easyui-textbox"  name="cs_ShenFenZheng" id="innsert_cs_Name" style="width:150px"/> </th>
					         <th><th>上门时间：</th> <th><input class="easyui-datebox" name="cs_VisitTime" id="innsert_cs_VisitTime" style="width:150px"/> </th></th>
					        </tr></th>   </tr>   
					        <tr>  <th data-options="field:'code',width:100">
					        	<tr><th>详细地址：</th> <th><input class="easyui-textbox"  id="innsert_cs_Name" style="width:150px"/>  </th>
					        <th><th>课程打分：</th> <th><input class="easyui-textbox" name="cs_Grade" id="innsert_cs_Grade" style="width:150px"/> </th></th>
					        </tr>
					        </th>  </tr>   
					        <tr>  <th data-options="field:'code',width:100"> <tr><th>咨询师：</th> <th><input name="" class="easyui-textbox" style="width:150px"/> </th>
					         
					        </tr></th>   </tr> 
					        <tr>  <th data-options="field:'code',width:100"> <tr><th>进班时间：</th> <th><input class="easyui-textbox" id="innsert_cs_JinBanTime"  name="cs_JinBanTime" style="width:150px"/> </th>
					         <th><th>出生时间：</th> <th><input class="easyui-datebox"  name="cs_BirthTime" id="innsert_cs_BirthTime" style="width:150px"/> </th></th>
					        </tr></th>   </tr> 
					        <tr>
					        </tr>
					        <tr align="center"> 
					        	<th> 
							        	<th><a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="Client_Submit()">保存</a></th>
							        	<th><a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-no'" onnclick="Client_cead()">取消</a></th>	
					        	</th>
					        </tr>  
					    </thead> 
					</table> 
		</form>
	
	</div>
</body>
</html>