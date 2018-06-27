package com.risingwind.mapper;

import com.risingwind.po.TblPic;
import java.util.List;
import java.util.Map;

public interface TblPicMapper {
	
    List<TblPic> findAll();
    
    TblPic findByPostId(Integer postid);
    
    TblPic findByName(String picname);

    Long countPic();
    
    int delete(TblPic tblPic);
    
    int insert(TblPic tblPic);
    
    int insertSelective(TblPic tblPic);
  
    int update(Map<String, Object> map);
    
    int updateByPrimaryKey(TblPic tblPic);
    
}