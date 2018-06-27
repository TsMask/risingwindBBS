package com.risingwind.mapper;

import java.util.List;
import java.util.Map;

import com.risingwind.po.TblAdmin;

public interface TblAdminMapper {
	
	List<TblAdmin> findAll();

    TblAdmin findByPrimaryKey(Integer num);
    
    TblAdmin findByAdminstrator(String adminstrator);
    
    TblAdmin findByAdminstratorWithSupervisorPassword(TblAdmin tblAdmin);
    
    Long countByAdmin();
    
    int deleteByPrimaryKey(Integer adminnun);

    int deleteByAdminstrator(String adminstrator);
    
    int insert(TblAdmin tblAdmin);
    
    int insertSelective(TblAdmin tblAdmin);
    
    int updateByMapSelective(Map<String, Object> map);
    
    int updateByPrimaryKeySelective(TblAdmin tblAdmin);
    
    int updateByPrimaryKey(TblAdmin tblAdmin);
    
}