package com.risingwind.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.risingwind.po.TblForums;
import com.risingwind.po.TblPost;
import com.risingwind.po.TblUser;
import com.risingwind.service.TblForumsService;
import com.risingwind.service.TblPostService;
import com.risingwind.service.TblUserService;

@Controller
public class TblPostController {
	
	@Autowired
	private TblForumsService tblForumsService;
	@Autowired
	private TblPostService tblPostService;
	@Autowired
	private TblUserService tblUserService;
	
	//版块内帖子数据输出
	@RequestMapping(value= {"/posts{forumsId}"},method=RequestMethod.GET)
	public String Posts(Model model,@PathVariable Integer forumsId) {
		//版块信息
		TblForums tf = tblForumsService.findByPrimaryKey(forumsId);
		model.addAttribute("tf", tf);
		//版块帖子
		List<TblPost> tps = tblPostService.findByForumId(forumsId);
		model.addAttribute("listPost", tps);
		//对帖子读取用户
		List<TblUser> listtu = new ArrayList<TblUser>();
		for(TblPost list:tps) {
			TblUser tu = tblUserService.findByPrimaryKey(list.getUid());
			listtu.add(tu);
		}
		model.addAttribute("listUser", listtu);
		return "JspPages/posts";
	}
	
	//帖子分页
	@RequestMapping("/posts{forumid}/{id}")
	public String PageOver(Model model,@PathVariable Integer forumid, @PathVariable Integer id) {
		int pageover;
		if(id==1) {
			pageover = 0;
		}else {
			pageover = 10*id-10;
		}
		model.addAttribute("pageover", pageover);
		model.addAttribute("id", id);
		return "forward:/posts"+forumid;
	}
	
	//帖子分页后跳转帖子内容
	@RequestMapping("/posts{forumid}/reply{postid}")
	public String PageOverPost(Model model,@PathVariable Integer forumid, @PathVariable Integer postid) {
		return "forward:/reply"+postid;
	}

}
