package com.crm.dao;

import java.util.List;

import com.crm.entity.Clients;
import com.crm.entity.Fenye;
import com.crm.entity.Roles;
import com.crm.entity.UserRoles;
import com.crm.entity.Users;

public interface UserRolesMapper {
	
	
	//查询
    Integer  SelectCountUserRoles(Fenye fenye);
    //查询
    List<UserRoles> SelectUserRoles(Fenye fenye);
    
    List<Roles> SelectRoles();
    //导出
  	List<Users>  SelectUserRolesExport(Integer Cs_Id);
    //签到
	Integer ConsultantLabelsStart(Integer C_UserId);
	//手动签退
	Integer UsersQianTui(Integer Us_Id);
	//根据登录的用户id查看签到状态
	Users  UsersLoginState(Fenye fenye);
	
	
	
}
