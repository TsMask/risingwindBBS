package com.risingwind.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.risingwind.mapper.TblReplyMapper;
import com.risingwind.po.TblReply;
import com.risingwind.service.TblReplyService;

public class TblReplyServiceImpl implements TblReplyService {

	@Autowired TblReplyMapper tblReplyMapper;
	
	//查询所有
	@Override
	public List<TblReply> findAll() {
		return tblReplyMapper.findAll();
	}
	
	//通过主键查询
	@Override
	public TblReply findByPrimaryKey(Integer replyid) {
		return tblReplyMapper.findByPrimaryKey(replyid);
	}
	
	//通过总帖子id查询
	@Override
	public List<TblReply> findByPostId(Integer replyid) {
		// TODO Auto-generated method stub
		return tblReplyMapper.findByPostId(replyid);
	}
	
	//通过回复用户和帖子id查询
	@Override
	public TblReply findByReplyUserwhthPostId(TblReply tblReply) {
		return tblReplyMapper.findByReplyUserwhthPostId(tblReply);
	}
	
	//得到数据库中总条数
	@Override
	public long countByReply() {
		return tblReplyMapper.countByReply();
	}

	//通过主键删除
	@Override
	public int deleteByPrimaryKey(Integer replyid) {
		return tblReplyMapper.deleteByPrimaryKey(replyid);
	}

	//通过回复用户和帖子id删除
	@Override
	public int deleteByReplyUserwhthPostId(TblReply tblReply) {
		return tblReplyMapper.deleteByReplyUserwhthPostId(tblReply);
	}

	//插入数据
	@Override
	public int insert(TblReply tblReply) {
		return tblReplyMapper.insert(tblReply);
	}

	//选择性插入数据
	@Override
	public int insertSelective(TblReply tblReply) {
		return tblReplyMapper.insertSelective(tblReply);
	}

	//通过主键选择性更新数据map
	@Override
	public int updateByMapSelective(Map<String, Object> map) {
		return tblReplyMapper.updateByMapSelective(map);
	}

	//通过主键选择性更新数据tblreply
	@Override
	public int updateByPrimaryKeySelective(TblReply tblReply) {
		return tblReplyMapper.updateByPrimaryKeySelective(tblReply);
	}

	//通过主键更新数据含回帖内容字段
	@Override
	public int updateByPrimaryKeyWithBLOBs(TblReply tblReply) {
		return tblReplyMapper.updateByPrimaryKeyWithBLOBs(tblReply);
	}

	//通过主键更新数据无回帖内容字段
	@Override
	public int updateByPrimaryKey(TblReply tblReply) {
		return tblReplyMapper.updateByPrimaryKey(tblReply);
	}

}
