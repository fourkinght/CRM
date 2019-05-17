package com.crm.service;

import java.util.List;

import com.crm.entity.RoleModules;

public interface RoleModulesService {
	
	/**
	 * 根据角色id查询判断是否存在
	 * @param rolesId
	 * @return
	 */
	List<RoleModules> selectRoleModulesById(Integer rolesId);
	/**
	 * 根据角色id查询判断是否存在
	 * @param rolesId
	 * @return
	 */
	Integer selectRoleModulesByRolesId(Integer rolesId);
	/**
	 * 根据模块id查询判断是否存在
	 * @param modulesId
	 * @return
	 */
	Integer selectRoleModulesByModulesId(Integer modulesId);

}
