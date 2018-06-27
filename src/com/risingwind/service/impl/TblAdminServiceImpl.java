package com.risingwind.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.risingwind.po.TblAdmin;
import com.risingwind.service.TblAdminService;

public class TblAdminServiceImpl implements TblAdminService{

	@Autowired TblAdminService tblAdminService;
	
	//查询所有
	@Override
	public List<TblAdmin> findAll(){
		return tblAdminService.findAll();
	}

	//通过主键查询
    @Override
	public TblAdmin findByPrimaryKey(Integer num) {
		return tblAdminService.findByPrimaryKey(num);
    }
    
    //通过管理员名称查询
    @Override
	public TblAdmin findByAdminstrator(String adminstrator) {
		return tblAdminService.findByAdminstrator(adminstrator);
    }
    
	//通过管理员名称和密码查询登录
	@Override
	public TblAdmin findByAdminstratorWithSupervisorPassword(TblAdmin tblAdmin) {
		return tblAdminService.findByAdminstratorWithSupervisorPassword(tblAdmin);
	}
	
    //得到表中总条数
    @Override
	public Long countByAdmin() {
		return tblAdminService.countByAdmin();
    }
    
    //通过主键删除
    @Override
	public int deleteByPrimaryKey(Integer adminnun) {
		return tblAdminService.deleteByPrimaryKey(adminnun);
    }

    //通过管理员名称
    @Override
	public int deleteByAdminstrator(String adminstrator) {
		return tblAdminService.deleteByAdminstrator(adminstrator);
    }
    
    //插入数据
    @Override
	public int insert(TblAdmin tblAdmin) {
		return tblAdminService.insert(tblAdmin);
    }
    
    //选择性插入数据
    @Override
	public int insertSelective(TblAdmin tblAdmin) {
		return tblAdminService.insertSelective(tblAdmin);
	}

    //通过主键选择修改更新Map
	@Override
	public int updateByMapSelective(Map<String, Object> map) {
		return tblAdminService.updateByMapSelective(map);
	}

    //通过主键选择修改更新
    @Override
	public int updateByPrimaryKeySelective(TblAdmin tblAdmin) {
		return tblAdminService.updateByPrimaryKeySelective(tblAdmin);
    }
    
    //通过主键修改更新完整信息
    @Override
	public int updateByPrimaryKey(TblAdmin tblAdmin) {
		return tblAdminService.updateByPrimaryKey(tblAdmin);
    }

}
