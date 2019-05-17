package com.crm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.dao.UserRolesMapper;
import com.crm.entity.Fenye;
import com.crm.entity.Roles;
import com.crm.entity.UserRoles;
import com.crm.entity.Users;
@Service
public class UserRolesServiceImpl implements UserRolesService {

	@Autowired
	private UserRolesMapper userRolesMapper;
	
	

	public Fenye SelectUserRoles(Fenye fenye) {
		Integer selectCountUserRoles = userRolesMapper.SelectCountUserRoles(fenye);
		List<UserRoles> selectUserRoles = userRolesMapper.SelectUserRoles(fenye);
		fenye.setTotal(selectCountUserRoles);
		fenye.setRows(selectUserRoles);
		return fenye;
	}

	public List<Roles> SelectRoles() {
		List<Roles> selectRoles = userRolesMapper.SelectRoles();
		return selectRoles;
	}

	public Integer ConsultantLabelsStart(Integer C_UserId) {
		Integer consultantLabelsStart = userRolesMapper.ConsultantLabelsStart(C_UserId);
		return consultantLabelsStart;
	}

	public List<Users> SelectUserRolesExport(Integer Cs_Id) {
		List<Users> selectUserRolesExport = userRolesMapper.SelectUserRolesExport(Cs_Id);
		return selectUserRolesExport;
	}

	public Integer UsersQianTui(Integer Us_Id) {
		Integer usersQianTui = userRolesMapper.UsersQianTui(Us_Id);
		return usersQianTui;
	}
	public Users UsersLoginState(Fenye fenye) {
		
		return userRolesMapper.UsersLoginState(fenye);
	}
}
