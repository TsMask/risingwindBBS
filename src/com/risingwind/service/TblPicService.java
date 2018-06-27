package com.risingwind.service;

import java.util.List;
import java.util.Map;

import com.risingwind.po.TblPic;

public interface TblPicService {

	//查询所有
	List<TblPic> findAll();
	
	//通过帖子id查询
	TblPic findByPostId(Integer postid);
	
	//通过图片名查询
	TblPic findByName(String picname);

	//得到数据库中总条数
	Long countPic();

	//删除
	int delete(TblPic tblPic);

	//插入数据
	int insert(TblPic tblPic);
	
	//选择性插入数据
	int insertSelective(TblPic tblPic);

	//更新修改数据Map<newpicname,oldpicname>
	int update(Map<String, Object> map);

	//通过主键更新修改
	int updateByPrimaryKey(TblPic tblPic);

}