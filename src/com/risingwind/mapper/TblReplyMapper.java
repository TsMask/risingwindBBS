package com.risingwind.mapper;

import com.risingwind.po.TblReply;
import java.util.List;
import java.util.Map;

public interface TblReplyMapper {
	
	List<TblReply> findAll();
	
	TblReply findByPrimaryKey(Integer replyid);
	
	List<TblReply> findByPostId(Integer replyid);
	
	TblReply findByReplyUserwhthPostId(TblReply tblReply);
	
    long countByReply();

    int deleteByPrimaryKey(Integer replyid);

    int deleteByReplyUserwhthPostId(TblReply tblReply);

    int insert(TblReply tblReply);

    int insertSelective(TblReply tblReply);

    int updateByMapSelective(Map<String, Object> map);

    int updateByPrimaryKeySelective(TblReply tblReply);

    int updateByPrimaryKeyWithBLOBs(TblReply tblReply);

    int updateByPrimaryKey(TblReply tblReply);
    
}