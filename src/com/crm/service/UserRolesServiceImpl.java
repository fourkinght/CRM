package com.crm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.dao.UserRolesMapper;
import com.crm.entity.UserRoles;

@Service
public class UserRolesServiceImpl implements UserRolesService {

	@Autowired
	private UserRolesMapper userRolesMapper;
	

	public UserRoles selectUserRolesByName(UserRoles ur) {
		// TODO Auto-generated method stub
		return userRolesMapper.selectUserRolesByName(ur);
	}

	@Override
	public Integer insertUserRoles(UserRoles userRoles) {
		// TODO Auto-generated method stub
		return userRolesMapper.insertUserRoles(userRoles);
	}

	@Override
	public Integer deleteUserRoles(UserRoles userRoles) {
		// TODO Auto-generated method stub
		return userRolesMapper.deleteUserRoles(userRoles);
	}

	@Override
	public Integer selectUserRolesById(Integer usersId) {
		// TODO Auto-generated method stub
		return userRolesMapper.selectUserRolesById(usersId);
	}

	
}
