package com.risingwind.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.risingwind.mapper.TblForumsMapper;
import com.risingwind.po.TblForums;
import com.risingwind.service.TblForumsService;

public class TblForumsServiceImpl implements TblForumsService {
	
	@Autowired TblForumsMapper tblForumsMapper;
	
	//查询所有信息
	@Override
	public List<TblForums> findAll(){
		return tblForumsMapper.findAll();
	}
	
	//通过主键查询
	@Override
	public TblForums findByPrimaryKey(Integer id) {
		return tblForumsMapper.findByPrimaryKey(id);
	}
	
	//通过版块标题查询
	@Override
	public TblForums findByForumTitle(String title) {
		return tblForumsMapper.findByForumTitle(title);
	}
	
	//得到表中总条数
	@Override
	public Long countByForums() {
		return tblForumsMapper.countByForums();
	}
	
	//插入数据
	@Override
	public int insert(TblForums tblForums) {
		return tblForumsMapper.insert(tblForums);
	}
	
	//通过主键删除
    @Override
	public int deleteByPrimaryKey(Integer id) {
		return tblForumsMapper.deleteByPrimaryKey(id);
    }

    //通过版块标题删除
    @Override
	public int deleteByForumTitle(String title) {
		return tblForumsMapper.deleteByForumTitle(title);
    }

    //通过主键选择性更新修改
    @Override
	public int updateByPrimaryKeySelective(TblForums tblForums) {
		return tblForumsMapper.updateByPrimaryKeySelective(tblForums);
    }

    //通过主键完整更新修改
    @Override
	public int updateByPrimaryKey(TblForums tblForums) {
		return tblForumsMapper.updateByPrimaryKey(tblForums);
    }
    
}
