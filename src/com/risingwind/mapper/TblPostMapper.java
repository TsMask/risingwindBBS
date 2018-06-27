package com.risingwind.mapper;

import com.risingwind.po.TblPost;
import java.util.List;
import java.util.Map;

public interface TblPostMapper {
	
    List<TblPost> findAll();
    
    List<TblPost> findByPageViewsDESC();
    
    TblPost findByPrimaryKey(Integer postid);
    
    List<TblPost> findByForumId(Integer forumid);
    
    List<TblPost> findByUID(Integer uid);
    
    long countByPost();

    int deleteByPrimaryKey(Integer postid);
    
    int deleteByUIDwithpostTitle(Map<String, Object> map);
    
    int insert(TblPost tblPost);

    int insertSelective(TblPost tblPost);
    
    int updateByMapSelective(Map<String, Object> map);
    
    int updateByPrimaryKeySelective(TblPost tblPost);

    int updateByPrimaryKeyWithBLOBs(TblPost tblPost);
    
    int updateByPrimaryKey(TblPost tblPost);
   
}