package com.risingwind.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.risingwind.po.TblUser;
import com.risingwind.service.TblUserService;


@Controller
@SessionAttributes("user")
public class TblUserController {
	
	@Autowired
	private TblUserService tblUserService;
	
	//登录界面
	@RequestMapping("/login")
	public String Login() {
		return "JspPages/login";
	}
	
	//用户资料设置
	@RequestMapping("/userdata")
	public String UserData() {
		return "JspPages/userdata";
	}
	
	//用户个人资料
	@RequestMapping("/userinfo")
	public String UserInfo() {
		return "JspPages/userinfo";
	}
	
	//他人的个人资料
	@RequestMapping("/otherinfo{uid}/{forumid}")
	public String OtherInfo(Model model,@PathVariable Integer uid,@PathVariable Integer forumid) {
		System.out.println(uid+"0---"+forumid);
		TblUser tu = tblUserService.findByPrimaryKey(uid);
		model.addAttribute("other", tu);
		model.addAttribute("forumid", forumid);
		return "JspPages/otherinfo";
	}
	
	//签到积分经验
	@RequestMapping("/signin{uid}")
	public String Signin(Model model, @PathVariable Integer uid) {
		//随机数获取
		Random rand = new Random();
		int signinpoints = rand.nextInt(10) + 1;
		int empiricvalue = rand.nextInt(20) + 1;
		//得到用户信息
		TblUser tu = tblUserService.findByPrimaryKey(uid);
		//对用户信息进行更新
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("signinnum", tu.getSigninnum()+1);
		map.put("signinpoints", tu.getSigninpoints()+signinpoints);
		map.put("empiricvalue", tu.getEmpiricvalue()+empiricvalue);
		map.put("uid", tu.getUid());
		if(tu.getEmpiricvalue()>=156) {
			map.put("grade", tu.getGrade()+1);
			map.put("positi", "菜鸟");
		}
		int row = tblUserService.updateByMapSelective(map );
		if(row>0) {
			String message = "签到成功！，签到积分：<strong>"+signinpoints+"</strong>，经验值<strong>"+empiricvalue+"</strong>";
			model.addAttribute("message", message);
		}else {
			model.addAttribute("message", "NO!,签到失败-_-||");
		}
		return "forward:/";
	}
	
	//用户登出提交链接
	@RequestMapping("/outlogin{uid}")
	public String OutLogin(HttpSession session,SessionStatus sessionStatus,@PathVariable Integer uid) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uid", uid);
		map.put("oldlogintime", new Date());
		tblUserService.updateByMapSelective(map);
		session.removeAttribute("user");
		sessionStatus.setComplete(); 
		return "redirect:login";
	}
	
	//用户登录提交链接
	@RequestMapping("/userlogin")
	public String UserLogin(Model model,TblUser tblUser) {	
		TblUser tu = tblUserService.findByUserNameAndPassword(tblUser);
		if(tu==null) {model.addAttribute("message", "用户名密码不正确");return "JspPages/login";}
		tblUser.setUid(tu.getUid());
		int row = tblUserService.updateByPrimaryKeySelective(tblUser);
		if(row>0) {
			model.addAttribute("user", tblUserService.findByUserNameAndPassword(tblUser));
			return "JspPages/userinfo";
		}else {
			model.addAttribute("message", "服务异常");
		}
		return "JspPages/login";
	}
	
	//注册提交链接插入数据
	@RequestMapping("/userregister")
	public String UserRegister(Model model,TblUser tblUser,@RequestParam("repassword") String repwd) {	
		TblUser tu = tblUserService.findByUserName(tblUser.getUsername());
		if(tu!=null) {
			model.addAttribute("message", "用户名已存在");
			return "JspPages/login";
		}
		if(tblUser.getUsername().isEmpty() || "".equals(tblUser.getUsername())) {
			model.addAttribute("message", "用户名不能为空");
			return "JspPages/login";
		}else if(tblUser.getPassword().isEmpty() || !tblUser.getPassword().equals(repwd)) {
			model.addAttribute("message", "不为空，两次密码不一致");
			return "JspPages/login";
		}else if(tblUser.getEmail().contains("@")) {
			tblUser.setPositi("小白");
			tblUser.setGrade(1);
			tblUser.setEmpiricvalue(0);
			tblUser.setSigninnum(0);
			tblUser.setSigninpoints(0);
			int row = tblUserService.insertSelective(tblUser);
			if(row>0) {
				model.addAttribute("message", "注册成功，请登录");
				return "JspPages/login";
			}else {
				model.addAttribute("message", "注册失败，请重新注册");
			}
		}
		return "JspPages/login";
	}
	
	//忘记密码提交链接
	@RequestMapping("/userforget")
	public String UserForget(Model model,TblUser tblUser,@RequestParam("repassword") String repwd) {
		TblUser tu = tblUserService.findByUserName(tblUser.getUsername());
		List<TblUser> tulist = tblUserService.findByEmail(tblUser.getEmail());
		if(tu==null) {model.addAttribute("message", "用户不存在");return "JspPages/login";}
		else if(tulist.isEmpty()) {model.addAttribute("message", "请正确输入邮箱");return "JspPages/login";}
		else if(tblUser.getPassword().equals(repwd)) {
			tblUser.setUid(tu.getUid());
			int row = tblUserService.updateByPrimaryKeySelective(tblUser);
			if(row>0) {
				model.addAttribute("message", "密码修改成功，请登录");
				return "JspPages/login";
			}else {
				model.addAttribute("message", "密码修改失败，请重新联系管理员");
			}
		}
		return "JspPages/login";
	}
	
	//用户头像提交链接
	@RequestMapping(value="/updateHeadportrait",method=RequestMethod.POST)
	public String UpdateHeadportrait(Model model,TblUser tblUser, MultipartFile headPortrait) throws IllegalStateException, IOException {
		//上传的图片名称
		String originalFilename = headPortrait.getOriginalFilename();
		if(!headPortrait.isEmpty()) {
			//存储路径
			String pic_path = "G:\\Eclipse\\pictures\\";
			//新的图片名称
			String newfilename = "/pic_user/"+UUID.randomUUID()+originalFilename.substring(originalFilename.lastIndexOf("."));
			//图片写入
			File file = new File(pic_path+newfilename);
			headPortrait.transferTo(file);
			//名称写到Image实体
			tblUser.setHeadportrait(newfilename);			
		}
		int row = tblUserService.updateByPrimaryKeySelective(tblUser);
		if(row>0) {
			model.addAttribute("message", "修改成功,请重新登录查看");
		}else {
			model.addAttribute("message", "修改失败");
		}
		return "JspPages/userdata";
	}

	//用户修改基本资料提交链接
	@RequestMapping("/updateBaseDate")
	public String UpdateBaseDate(Model model,TblUser tblUser) {
		int row = tblUserService.updateByPrimaryKeySelective(tblUser);
		if(row>0) {
			model.addAttribute("message", "修改成功,请重新登录查看");
		}else {
			model.addAttribute("message", "修改失败");
		}
		return "JspPages/userdata";
	}
	
	//用户修改个人信息提交链接
	@RequestMapping("/updateInfoData")
	public String UpdateInfoData(Model model,TblUser tblUser) {
		int row = tblUserService.updateByPrimaryKeySelective(tblUser);
		if(row>0) {
			model.addAttribute("message", "修改成功,请重新登录查看");
		}else {
			model.addAttribute("message", "修改失败");
		}
		return "JspPages/userdata";
	}
	
}
