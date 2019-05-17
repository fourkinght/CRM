package com.crm.service;


import com.crm.entity.UserRoles;

public interface UserRolesService {

	/**
	 * 根据用户名查询该条数据
	 * @param UserRoles
	 * @return
	 */
	UserRoles selectUserRolesByName(UserRoles ur);
	/**
	 * 添加角色模块
	 * @param userRoles
	 * @return
	 */
	Integer insertUserRoles(UserRoles userRoles);
	/**
	 * 根据用户id和角色id删除该条数据
	 * @param userRoles
	 * @return
	 */
	Integer deleteUserRoles(UserRoles userRoles);
	/**
	 * 根据用户id查询判读该用户时候有角色
	 * @param usersId
	 * @return
	 */
	Integer selectUserRolesById(Integer usersId);
}
