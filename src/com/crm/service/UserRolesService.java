package com.crm.service;



import java.util.List;

import com.crm.entity.Fenye;
import com.crm.entity.Roles;
import com.crm.entity.UserRoles;
import com.crm.entity.Users;

public interface UserRolesService {

	
	//查询
	Fenye SelectUserRoles(Fenye fenye);
	//查询所有角色
	List<Roles> SelectRoles();
	//签到
	Integer ConsultantLabelsStart(Integer C_UserId);
	//手动签退
	Integer UsersQianTui(Integer Us_Id);
	//导出
	List<Users>  SelectUserRolesExport(Integer Cs_Id);
	//根据登录的用户id查看签到状态
	Users  UsersLoginState(Fenye fenye);
	

}
