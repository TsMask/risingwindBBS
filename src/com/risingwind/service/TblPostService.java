package com.risingwind.service;

import java.util.List;
import java.util.Map;

import com.risingwind.po.TblPost;

public interface TblPostService {

	//查询所有
	List<TblPost> findAll();

	//最大浏览量升序
	List<TblPost> findByPageViewsDESC();
	
	//通过主键查找
	TblPost findByPrimaryKey(Integer postid);

	//通过版块id查找
	List<TblPost> findByForumId(Integer forumid);

	//通过用户UID查找
	List<TblPost> findByUID(Integer uid);

	//得到总数据条数
	long countByPost();

	//通过主键删除
	int deleteByPrimaryKey(Integer postid);

	//通过用户UID和帖子标题删除map<uid,posttitle>
	int deleteByUIDwithpostTitle(Map<String, Object> map);

	//新增数据
	int insert(TblPost tblPost);

	//选择性新增
	int insertSelective(TblPost tblPost);

	//选择性更新修改map
	int updateByMapSelective(Map<String, Object> map);

	//选择性更新修改tblpost
	int updateByPrimaryKeySelective(TblPost tblPost);

	//通过主键更新修改可改帖子内容字段
	int updateByPrimaryKeyWithBLOBs(TblPost tblPost);

	//通过主键更新修改不包含帖子内容字段
	int updateByPrimaryKey(TblPost tblPost);

}