package com.risingwind.service;

import java.util.List;
import java.util.Map;

import com.risingwind.po.TblAdmin;

public interface TblAdminService {

	//查询所有
	List<TblAdmin> findAll();

	//通过主键查询
	TblAdmin findByPrimaryKey(Integer num);

	//通过管理员名称查询
	TblAdmin findByAdminstrator(String adminstrator);

	//通过管理员名称和密码查询登录
	TblAdmin findByAdminstratorWithSupervisorPassword(TblAdmin tblAdmin);
	
	//得到表中总条数
	Long countByAdmin();

	//通过主键删除
	int deleteByPrimaryKey(Integer adminnun);

	//通过管理员名称
	int deleteByAdminstrator(String adminstrator);

	//插入数据
	int insert(TblAdmin tblAdmin);
	
	//选择性插入数据
	int insertSelective(TblAdmin tblAdmin);
	
	//通过主键选择修改更新Map
	int updateByMapSelective(Map<String, Object> map);
	
	//通过主键选择修改更新
	int updateByPrimaryKeySelective(TblAdmin tblAdmin);

	//通过主键修改更新完整信息
	int updateByPrimaryKey(TblAdmin tblAdmin);

}