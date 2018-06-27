package com.risingwind.mapper;

import com.risingwind.po.TblForums;
import java.util.List;

public interface TblForumsMapper {

	List<TblForums> findAll();
	
	TblForums findByPrimaryKey(Integer id);
	
	TblForums findByForumTitle(String title);
	
	Long countByForums();
	
	int insert(TblForums tblForums);
	
    int deleteByPrimaryKey(Integer id);

    int deleteByForumTitle(String title);

    int updateByPrimaryKeySelective(TblForums tblForums);

    int updateByPrimaryKey(TblForums tblForums);

}