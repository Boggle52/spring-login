package com.human.member;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/")
	public String home(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		if(session.getAttribute("userid") == null) {
			model.addAttribute("userinfo","");
//			model.addAttribute("statusLine","<a href='login'>로그인</a>&nbsp<a href='signin'>회원가입</a>");
//			model.addAttribute("newbutton", "<input type=button value='새글 쓰기' disabled>");
		} else {
			model.addAttribute("userinfo",session.getAttribute("userid"));
//			model.addAttribute("statusLine",session.getAttribute("userid")+"&nbsp<a href='logout'>로그아웃</a>");
//			model.addAttribute("newbutton","<input type=button value='새글 쓰기'>");
		}
		return "home";
	}
	
	//~/login
	@RequestMapping("/login")
	public String doLogin() {
		return "login";
	}
	
	@RequestMapping("/user_check")
	public String doUserCheck(HttpServletRequest req, Model model) {
		String user_id = req.getParameter("userid");
		String password = req.getParameter("pwd");
		model.addAttribute("user_id",user_id);
		model.addAttribute("password",password);
		HttpSession session = req.getSession();
		if(user_id.equals(session.getAttribute("newuser_id")) 
				&& password.equals(session.getAttribute("newuser_pwd"))) {
			session.setAttribute("userid", user_id);
		}
		return "redirect:/";
	}
	
	@RequestMapping("/signin")
	public String doSignin() {
		return "signin";
	}
	
	@RequestMapping("/user_signin")
	public String doSigninCheck(HttpServletRequest req) {
		String uid = req.getParameter("userid");
		String pwd = req.getParameter("pwd");
		HttpSession session = req.getSession();
		session.setAttribute("newuser_id", uid);
		session.setAttribute("newuser_pwd", pwd);
		return "login";
	}
	
	@RequestMapping("/logout")
	public String doLogout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("/newpost")
	public String doNewPost() {
		return "newpost";
	}
	
	@RequestMapping(value="/addnew")
	public String doAddNew(Model model) {
		iMember member = sqlSession.getMapper(iMember.class);
		ArrayList<tmemberDTO> memberlist = member.list();
		model.addAttribute("list",memberlist);
		return "addmember";
	}
	
	@RequestMapping(value="/addMember", method=RequestMethod.POST)
	public String doAddNew(@RequestParam("id") String id,
			@RequestParam("pwd") String pwd, @RequestParam("name") String name,
			@RequestParam("mobile") String mobile) {
		iMember member = sqlSession.getMapper(iMember.class);
		member.insert(id, pwd, name, mobile);
		return "redirect:/addnew";
	}
	

	
}
