package com.crm.service;

import com.crm.entity.Fenye;
import com.crm.entity.Users;

public interface UsersService {
	
	/**
	 * 用户登录
	 * @param ur
	 * @return
	 */
	Users selectUsersLogin(Users users);
	/**
	 * 修改用户最后一次登录时间，密码错误次数
	 * @param time
	 * @return
	 */
	Integer updateUsers(Users users);
	/**
	 * 多条件查询全部用户
	 * @return
	 */
	Fenye selectUsersAll(Fenye fenye);
	/**
	 * 添加新用户
	 * @param users
	 * @return
	 */
	Integer insertUsers(Users users);
	/**
	 * 根据名称查找
	 * @param users
	 * @return
	 */
	Integer selectUsersByName(String usersName);
	/**
	 * 根据邮箱查找
	 * @param users
	 * @return
	 */
	Integer selectUsersByEmail(String usersEmail);
	/**
	 * 根据手机号查找
	 * @param users
	 * @return
	 */
	Integer selectUsersByMtel(String usersMtel);
	/**
	 * 根据用户id删除数据
	 * @param usersId
	 * @return
	 */
	Integer deleteusers(Integer usersId);
	/**
	 * 重置密码
	 * @param users
	 * @return
	 */
	Integer updateUsersPwd(Users users);
	/**
	 * 解锁，锁定
	 * @param users
	 * @return
	 */
	Integer updateUsersIsLockout(Users users);
	/**
	 * 修改邮箱，手机号
	 * @param users
	 * @return
	 */
	Integer updateUsersByNameEmailMtel(Users users);
	
}
