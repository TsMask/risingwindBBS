package com.risingwind.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.risingwind.po.TblAdmin;
import com.risingwind.po.TblPost;
import com.risingwind.po.TblReply;
import com.risingwind.po.TblUser;
import com.risingwind.service.TblAdminService;
import com.risingwind.service.TblPostService;
import com.risingwind.service.TblReplyService;
import com.risingwind.service.TblUserService;


@Controller
@SessionAttributes("admin")
public class TblAdminController {
	
	@Autowired
	private TblPostService tblPostService;
	@Autowired
	private TblUserService tblUserService;
	@Autowired
	private TblReplyService tblReplyService;
	@Autowired
	private TblAdminService tblAdminService;
	
	
	//管理员登录界面
	@RequestMapping("/adminlogin")
	public String AdminLogin() {
		return "JspPages/admin";
	}
	
	//用户登出提交链接
	@RequestMapping("/outadminlogin{uid}")
	public String OutLogin(HttpSession session,SessionStatus sessionStatus,@PathVariable Integer uid) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uid", uid);
		map.put("oldlogintime", new Date());
		tblUserService.updateByMapSelective(map);
		session.removeAttribute("user");
		sessionStatus.setComplete(); 
		return "redirect:login";
	}
	
	//管理员登录提交
	@RequestMapping("/adminservice")
	public String AdminService(Model model,TblAdmin tblAdmin) {
		TblAdmin ta = tblAdminService.findByAdminstratorWithSupervisorPassword(tblAdmin);
		if(ta==null) {model.addAttribute("message", "管理账号密码不正确");return "JspPages/admin";}
		tblAdmin.setAdminnum(ta.getAdminnum());
		tblAdmin.setLogincount(ta.getLogincount()+1);
		int row = tblAdminService.updateByPrimaryKeySelective(tblAdmin);
		if(row>0) {
			model.addAttribute("admin", tblAdminService.findByAdminstratorWithSupervisorPassword(ta));
			return "forward:/adminmanager";
		}else {
			model.addAttribute("message", "服务异常");
		}
		return "JspPages/admin";
	}
	
	//
	@RequestMapping("/adminmanager")
	public String Pic(Model model) {	
		List<TblUser> tu = tblUserService.findAll();
		model.addAttribute("listtu", tu);
		List<TblPost> tp = tblPostService.findAll();
		model.addAttribute("listtp", tp);
		List<TblReply> tr = tblReplyService.findAll();
		model.addAttribute("listtr", tr);
		return "JspPages/adminmanager";
	}
	
	
	
}
