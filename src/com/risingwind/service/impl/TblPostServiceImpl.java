package com.risingwind.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.risingwind.mapper.TblPostMapper;
import com.risingwind.po.TblPost;
import com.risingwind.service.TblPostService;

public class TblPostServiceImpl implements TblPostService {

	@Autowired TblPostMapper tblPostMapper;
	
	//查询所有
	@Override
	public List<TblPost> findAll() {
		return tblPostMapper.findAll();
	}

	//最大浏览量升序
	@Override
	public List<TblPost> findByPageViewsDESC() {
		return tblPostMapper.findByPageViewsDESC();
	}
	
	//通过主键查找
	@Override
	public TblPost findByPrimaryKey(Integer postid) {
		return tblPostMapper.findByPrimaryKey(postid);
	}
    
	//通过版块id查找
	@Override
	public List<TblPost> findByForumId(Integer forumid) {
		return tblPostMapper.findByForumId(forumid);
	}
    
	//通过用户UID查找
	@Override
	public List<TblPost> findByUID(Integer uid) {
		return tblPostMapper.findByUID(uid);
	}
    
	//得到总数据条数
	@Override
	public long countByPost() {
		return tblPostMapper.countByPost();
	}

	//通过主键删除
	@Override
	public int deleteByPrimaryKey(Integer postid) {
		return tblPostMapper.deleteByPrimaryKey(postid);
	}
    
	//通过用户UID和帖子标题删除map<uid,posttitle>
	@Override
	public int deleteByUIDwithpostTitle(Map<String, Object> map) {
		return tblPostMapper.deleteByUIDwithpostTitle(map);
	}
    
	//新增数据
	@Override
	public int insert(TblPost tblPost) {
		return tblPostMapper.insert(tblPost);
	}

	//选择性新增
	@Override
	public int insertSelective(TblPost tblPost) {
		return tblPostMapper.insertSelective(tblPost);
	}
    
	//选择性更新修改map
	@Override
	public int updateByMapSelective(Map<String, Object> map) {
		return tblPostMapper.updateByMapSelective(map);
	}
    
	//选择性更新修改tblpost
	@Override
	public int updateByPrimaryKeySelective(TblPost tblPost) {
		return tblPostMapper.updateByPrimaryKeySelective(tblPost);
	}

	//通过主键更新修改可改帖子内容字段
	@Override
	public int updateByPrimaryKeyWithBLOBs(TblPost tblPost) {
		return tblPostMapper.updateByPrimaryKeyWithBLOBs(tblPost);
	}
    
	//通过主键更新修改不包含帖子内容字段
	@Override
	public int updateByPrimaryKey(TblPost tblPost) {
		return tblPostMapper.updateByPrimaryKey(tblPost);
	}
    
}
