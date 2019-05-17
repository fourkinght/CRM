package com.crm.service;


import java.util.List;



import com.crm.entity.Clients;
import com.crm.entity.Fenye;
import com.crm.entity.Users;

public interface ClientsUsersService {
	//������
	Fenye SelectClientsUsers(Fenye fenye);
	List<Users> SelectUsers();
	//导出
    List<Clients>  SelectClientsUsersExport(Integer Cs_Id);
    //查询不同用户下的客户
    Fenye SelectUsersRolesClients(Fenye fenye);
    //查看签到的咨询师进行分量
    List<Users> ZiXunSHiQianDaoFenLiangOption();
    //根据用户客户id修改 分配用户
    Integer UsersQianDaoFenLiang(Clients c);
    //添加
    Integer innserClient(Clients clients);
}
