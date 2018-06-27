package com.risingwind.service;

import java.util.List;
import java.util.Map;

import com.risingwind.po.TblUser;

public interface TblUserService {

	//查询所有
	List<TblUser> findAll();

	//通过主键查询
	TblUser findByPrimaryKey(Integer uid);

	//通过用户名查询
	TblUser findByUserName(String username);

	//通过用户名密码查询
	TblUser findByUserNameAndPassword(TblUser tblUser);
	
	//通过手机号密码查询
	TblUser findByPhoneNumAndPassword(TblUser tblUser);
	
	//通过Email查询
	List<TblUser> findByEmail(String email);

	//得到数据库中总条数
	long countByUser();

	//通过主键删除
	int deleteByPrimaryKey(Integer uid);

	//通过用户名删除
	int deleteByUserName(String username);

	//插入数据
	int insert(TblUser tblUser);

	//选择性插入数据
	int insertSelective(TblUser tblUser);

	//通过主键选择性更新修改map
	int updateByMapSelective(Map<String, Object> map);

	//通过主键选择性更新修改tbluser
	int updateByPrimaryKeySelective(TblUser tblUser);

	//通过主键更新数据完整字段
	int updateByPrimaryKey(TblUser tblUser);

}