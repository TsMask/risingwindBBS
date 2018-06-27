package com.risingwind.service;

import java.util.List;

import com.risingwind.po.TblForums;

public interface TblForumsService {

	//查询所有信息
	List<TblForums> findAll();

	//通过主键查询
	TblForums findByPrimaryKey(Integer id);

	//通过版块标题查询
	TblForums findByForumTitle(String title);

	//得到表中总条数
	Long countByForums();

	//插入数据
	int insert(TblForums tblForums);

	//通过主键删除
	int deleteByPrimaryKey(Integer id);

	//通过版块标题删除
	int deleteByForumTitle(String title);

	//通过主键选择性更新修改
	int updateByPrimaryKeySelective(TblForums tblForums);

	//通过主键完整更新修改
	int updateByPrimaryKey(TblForums tblForums);

}