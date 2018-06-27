package com.risingwind.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.risingwind.mapper.TblPicMapper;
import com.risingwind.po.TblPic;
import com.risingwind.service.TblPicService;

public class TblPicServiceImpl implements TblPicService {
	
	@Autowired TblPicMapper tblPicMapper;
	
	//查询所有
    @Override
	public List<TblPic> findAll(){
		return tblPicMapper.findAll();
    }

    //通过帖子id查询
	@Override
	public TblPic findByPostId(Integer postid) {
		return tblPicMapper.findByPostId(postid);
	}
	
    //通过图片名查询
    @Override
	public TblPic findByName(String value) {
    	return tblPicMapper.findByName(value);
    }

    //得到数据库中总条数
    @Override
	public Long countPic() {
    	return tblPicMapper.countPic();
    }
    
    //删除
    @Override
	public int delete(TblPic tblPic) {
		return tblPicMapper.delete(tblPic);
    }
    
    //插入数据
    @Override
	public int insert(TblPic tblPic) {
    	return tblPicMapper.insert(tblPic);
    }
    
    //选择性插入数据
	@Override
	public int insertSelective(TblPic tblPic) {
		// TODO Auto-generated method stub
		return 0;
	}
  
    //更新修改数据Map<newpicname,oldpicname>
    @Override
	public int update(Map<String, Object> map) {
    	return tblPicMapper.update(map);
    }
    
    //通过主键更新修改
    @Override
	public int updateByPrimaryKey(TblPic tblPic) {
    	return tblPicMapper.updateByPrimaryKey(tblPic);
    }


}
