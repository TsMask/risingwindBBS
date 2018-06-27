package com.risingwind.mapper;

import com.risingwind.po.TblUser;
import java.util.List;
import java.util.Map;

public interface TblUserMapper {
	
    List<TblUser> findAll();
    
    TblUser findByPrimaryKey(Integer uid);
    
    TblUser findByUserName(String username);

    TblUser findByUserNameAndPassword(TblUser tblUser);
    
    TblUser findByPhoneNumAndPassword(TblUser tblUser);
    
    List<TblUser> findByEmail(String email);
        
    long countByUser();
    
    int deleteByPrimaryKey(Integer uid);
    
    int deleteByUserName(String username);
    
    int insert(TblUser tblUser);
    
    int insertSelective(TblUser tblUser);

    int updateByMapSelective(Map<String, Object> map);
    
    int updateByPrimaryKeySelective(TblUser tblUser);

    int updateByPrimaryKey(TblUser tblUser);
    
}