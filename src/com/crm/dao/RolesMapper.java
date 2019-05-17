package com.crm.dao;

import java.util.List;

import com.crm.entity.Roles;

public interface RolesMapper {
	/**
	 * 查询全部角色
	 * @return
	 */
	List<Roles> selectRolesAll();
	/**
	 *根据用户id查询该用户的角色(链表查，用户，角色，用户角色表)
	 * @param usersId
	 * @return
	 */
	List<Roles> selectUserRolesById(Integer usersId);
	/**
	 * 根据角色id删除
	 * @param rolesId
	 * @return
	 */
	Integer deleteRoles(Integer rolesId);
	/**
	 * 添加新角色
	 * @param roles
	 * @return
	 */
	Integer insertRoles(Roles roles);
	/**
	 * 修改角色
	 * @param roles
	 * @return
	 */
	Integer updateRoles(Roles roles);
	/**
	 * 根据角色名查询(判断是否存在该角色名)
	 * @param RolesName
	 * @return
	 */
	Integer selectRolesByName(String RolesName);
}
