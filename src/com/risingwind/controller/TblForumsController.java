package com.risingwind.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.risingwind.po.TblForums;
import com.risingwind.po.TblPost;
import com.risingwind.po.TblUser;
import com.risingwind.service.TblForumsService;
import com.risingwind.service.TblPicService;
import com.risingwind.service.TblPostService;
import com.risingwind.service.TblReplyService;
import com.risingwind.service.TblUserService;


@Controller
@SessionAttributes({"tfr","countFPost","tpB","ltutpb"})
public class TblForumsController {
	
	@Autowired
	private TblForumsService tblForumsService;
	@Autowired
	private TblPostService tblPostService;
	@Autowired
	private TblUserService tblUserService;
	@Autowired
	private TblReplyService tblReplyService;
	@Autowired
	private TblPicService tblPicService;
	
	//版块数据输出
	@RequestMapping("/forums")
	public String Forums(HttpServletRequest request, Model model) {	
		//所有版块
		List<TblForums> tf = tblForumsService.findAll();
		model.addAttribute("tf", tf);
		//得到版块对应的帖子列表
		List<Integer> countFPost = new ArrayList<Integer>();
		for(TblForums listf:tf) {
			List<TblPost> tp = tblPostService.findByForumId(listf.getForumid());
			countFPost.add(tp.size());
		}
		model.addAttribute("countFPost", countFPost);
		//帖子总数
		long countPost = tblPostService.countByPost();
		model.addAttribute("countPost", countPost);
		//会员注册总数
		long countUser = tblUserService.countByUser();
		model.addAttribute("countUser", countUser);
		//发帖总数
		long countReply = tblReplyService.countByReply();
		model.addAttribute("countReply", countReply);
		//数据库中图片总数
		long countPic = tblPicService.countPic();
		model.addAttribute("countPic", countPic);
		return "JspPages/forums";
	}

	//首页拦截注入数据
	@RequestMapping("/")
	public ModelAndView HotForums() {
		ModelAndView mav = new ModelAndView();
		//所有版块
		List<TblForums> tfr = tblForumsService.findAll();
		mav.addObject("tfr", tfr);
		//得到版块对应的帖子列表
		List<Integer> countFPost = new ArrayList<Integer>();
		for(TblForums listf:tfr) {
			List<TblPost> tpr = tblPostService.findByForumId(listf.getForumid());
			countFPost.add(tpr.size());
		}
		mav.addObject("countFPost", countFPost);
		//所有帖子最大浏览量升序
		List<TblPost> tpB = tblPostService.findByPageViewsDESC();
		mav.addObject("tpB", tpB);
		//通过帖子读取用户
		List<TblUser> listtu = new ArrayList<TblUser>();
		for(TblPost list:tpB) {
			TblUser tu = tblUserService.findByPrimaryKey(list.getUid());
			listtu.add(tu);
		}
		mav.addObject("ltutpb", listtu);
		mav.setViewName("forward:oindex.jsp");
		return mav;
	}
	
	//首页分页
	@RequestMapping("/index{id}")
	public String PageOver(Model model,@PathVariable Integer id) {
		int pageover;
		if(id==1) {
			pageover = 0;
		}else {
			pageover = 4*id-4;
		}
		model.addAttribute("pageover", pageover);
		model.addAttribute("id", id);
		return "forward:/";
	}
	
}
