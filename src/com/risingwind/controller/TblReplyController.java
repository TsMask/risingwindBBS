package com.risingwind.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.risingwind.po.TblForums;
import com.risingwind.po.TblPost;
import com.risingwind.po.TblReply;
import com.risingwind.po.TblUser;
import com.risingwind.service.TblForumsService;
import com.risingwind.service.TblPostService;
import com.risingwind.service.TblReplyService;
import com.risingwind.service.TblUserService;

@Controller
public class TblReplyController {
	
	@Autowired
	private TblReplyService tblReplyService;
	@Autowired
	private TblPostService tblPostService;
	@Autowired
	private TblUserService tblUserService;
	@Autowired
	private TblForumsService tblForumsService;
	
	//帖子内容信息
	@RequestMapping("/reply{postid}")
	public String Reply(Model model,@PathVariable Integer postid) {	
		//回帖信息
		List<TblReply> trs = tblReplyService.findByPostId(postid);
		model.addAttribute("listtr", trs);
		//对回帖读取用户
		List<TblUser> tus = new ArrayList<TblUser>();
		for(TblReply listtr:trs) {
			TblUser tur = tblUserService.findByPrimaryKey(listtr.getReplyuser());
			tus.add(tur);
		}
		model.addAttribute("listtu", tus);
		//版主帖子信息
		TblPost tp = tblPostService.findByPrimaryKey(postid);
		tp.setPageviews(tp.getPageviews()+1);
		//浏览量+1
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("pageviews", tp.getPageviews());
		map.put("postid", postid);
		tblPostService.updateByMapSelective(map);
		model.addAttribute("tp",tp);
		//版块信息
		TblForums tf = tblForumsService.findByPrimaryKey(tp.getForumid());
		model.addAttribute("tf", tf);
		//版主信息
		TblUser tu = tblUserService.findByPrimaryKey(tp.getUid());
		model.addAttribute("tu", tu);
		return "JspPages/reply";
	}
	
	//回帖的点击提交插入
	@RequestMapping("/replypost")
	public String ReplyPost(Model model, TblReply tblReply) {
		//帖子回帖量+1
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("regen", tblReply.getFloor());
		map.put("postid", tblReply.getPostid());
		tblPostService.updateByMapSelective(map);
		//帖子回复+1
		int row = tblReplyService.insert(tblReply);
		if(row>0) {
			model.addAttribute("message", "回复成功，刷新查看");
		}else {
			model.addAttribute("message", "回复失败-_-||");
		}
		return "redirect: forums";
	}
	
	//发新帖页面
	@RequestMapping("/newspost")
	public String NewsPost(Model model) {
		List<TblForums> listtf = tblForumsService.findAll();
		model.addAttribute("listtf", listtf);
		return "JspPages/newspost";
	}
	
	//发新帖的点击提交插入数据库
	@RequestMapping("/donewspost")
	public String DoNewsPost(Model model, TblPost tblPost) {
		tblPost.setPageviews(0);
		tblPost.setRegen(0);
		int row = tblPostService.insert(tblPost);
		if(row>0) {
			model.addAttribute("message", "发帖成功，刷新查看");
			return "redirect: forums";
		}else {
			model.addAttribute("message", "发帖失败-_-||");
		}
		return "forward:newspost";
	}

	//帖子内容分页
	@RequestMapping("/reply{postid}/{id}")
	public String PageOver(Model model,@PathVariable Integer postid, @PathVariable Integer id) {
		int pageover;
		if(id==1) {
			pageover = 0;
		}else {
			pageover = 10*id-10;
		}
		model.addAttribute("pageover", pageover);
		model.addAttribute("id", id);
		return "forward:/reply"+postid;
	}
}
