package com.crm.dao;

import java.util.List;

import com.crm.entity.ClientUserRecord;
import com.crm.entity.Clients;
import com.crm.entity.Fenye;
import com.crm.entity.Users;
/**
 * ��ѯ���пͻ��Լ��û��Կͻ��ĸ��ټ�¼
 * @author ZhangYao
 *
 */
public interface ClientsUsersMapper {
    
	
	Integer  SelectCountClientsUsers(Fenye fenye);
	
	List<Clients> SelectClientsUsers(Fenye fenye);


	List<Users> SelectUsers();

	//导出
	List<Clients>  SelectClientsUsersExport(Integer Cs_Id);
	//查询用户下的客户
	Integer  SelectCountUsersRolesClients(Fenye fenye);
	List<Clients> SelectUsersRolesClients(Fenye fenye);
	//查看签到的咨询师进行分量
    List<Users> ZiXunSHiQianDaoFenLiangOption();
    //根据用户客户id修改 分配用户
   

	Integer UsersQianDaoFenLiang(Clients c);
	//添加数据
		 Integer innserClient(Clients clients);	
}
