package com.risingwind.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.risingwind.mapper.TblUserMapper;
import com.risingwind.po.TblUser;
import com.risingwind.service.TblUserService;

public class TblUserServiceImpl implements TblUserService {

	@Autowired TblUserMapper tblUserMapper;
	
	//查询所有
	@Override
	public List<TblUser> findAll(){
		return tblUserMapper.findAll();
	}
    
	//通过主键查询
	@Override
	public TblUser findByPrimaryKey(Integer uid) {
		return tblUserMapper.findByPrimaryKey(uid);
	}
    
	//通过用户名查询
	@Override
	public TblUser findByUserName(String username) {
		return tblUserMapper.findByUserName(username);
	}
	
    //通过用户名密码查询
	@Override
	public TblUser findByUserNameAndPassword(TblUser tblUser) {
		return tblUserMapper.findByUserNameAndPassword(tblUser);
	}
	
	//通过手机号密码查询
	@Override
	public TblUser findByPhoneNumAndPassword(TblUser tblUser) {
		return tblUserMapper.findByPhoneNumAndPassword(tblUser);
	}
	
	//通过Email查询
	@Override
	public List<TblUser> findByEmail(String email) {
		return tblUserMapper.findByEmail(email);
	}
    
	//得到数据库中总条数
	@Override
	public long countByUser() {
		return tblUserMapper.countByUser();
	}
	
	//通过主键删除
	@Override
	public int deleteByPrimaryKey(Integer uid) {
		return tblUserMapper.deleteByPrimaryKey(uid);
	}
    
	//通过用户名删除
	@Override
	public int deleteByUserName(String username) {
		return tblUserMapper.deleteByUserName(username);
	}
    
	//插入数据
	@Override
	public int insert(TblUser tblUser) {
		return tblUserMapper.insert(tblUser);
	}
    
	//选择性插入数据
	@Override
	public int insertSelective(TblUser tblUser) {
		return tblUserMapper.insertSelective(tblUser);
	}

	//通过主键选择性更新修改map
	@Override
	public int updateByMapSelective(Map<String, Object> map) {
		return tblUserMapper.updateByMapSelective(map);
	}
    
	//通过主键选择性更新修改tbluser
	@Override
	public int updateByPrimaryKeySelective(TblUser tblUser) {
		return tblUserMapper.updateByPrimaryKeySelective(tblUser);
	}

	//通过主键更新数据完整字段
	@Override
	public int updateByPrimaryKey(TblUser tblUser) {
		return tblUserMapper.updateByPrimaryKey(tblUser);
	}
    
}
