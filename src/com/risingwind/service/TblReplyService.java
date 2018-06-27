package com.risingwind.service;

import java.util.List;
import java.util.Map;

import com.risingwind.po.TblReply;

public interface TblReplyService {

	//查询所有
	List<TblReply> findAll();

	//通过主键查询
	TblReply findByPrimaryKey(Integer replyid);
	
	//通过总帖子id查询
	List<TblReply> findByPostId(Integer replyid);
	
	//通过回复用户和帖子id查询
	TblReply findByReplyUserwhthPostId(TblReply tblReply);

	//得到数据库中总条数
	long countByReply();

	//通过主键删除
	int deleteByPrimaryKey(Integer replyid);

	//通过回复用户和帖子id删除
	int deleteByReplyUserwhthPostId(TblReply tblReply);

	//插入数据
	int insert(TblReply tblReply);

	//选择性插入数据
	int insertSelective(TblReply tblReply);

	//通过主键选择性更新数据map
	int updateByMapSelective(Map<String, Object> map);

	//通过主键选择性更新数据tblreply
	int updateByPrimaryKeySelective(TblReply tblReply);

	//通过主键更新数据含回帖内容字段
	int updateByPrimaryKeyWithBLOBs(TblReply tblReply);

	//通过主键更新数据无回帖内容字段
	int updateByPrimaryKey(TblReply tblReply);

}