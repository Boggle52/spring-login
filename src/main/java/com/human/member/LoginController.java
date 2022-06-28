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
		} else {
			model.addAttribute("userinfo",session.getAttribute("userid"));
		}
		iPost post = sqlSession.getMapper(iPost.class);
		ArrayList<boardDTO> postList = post.listPost();
		model.addAttribute("plist",postList);
		return "home";
	}
	
	//~/login
	@RequestMapping("/login")
	public String doLogin() {
		return "login";
	}
	
	@RequestMapping(value="/user_check", method = RequestMethod.POST)
	public String doUserCheck(HttpServletRequest req, Model model) {
		iMember member = sqlSession.getMapper(iMember.class);
		String user_id = req.getParameter("userid");
		String password = req.getParameter("pwd");
		int cnt = member.checkUser(user_id, password);
		if(cnt!=0) {
			HttpSession session = req.getSession();
			session.setAttribute("userid", user_id);
			return "redirect:/";
		} else {
			return "login";
		}
	}
	
	@RequestMapping("/signin")
	public String doSignin() {
		return "signin";
	}
	
	@RequestMapping(value="/user_signin", method = RequestMethod.POST)
	public String doSigninCheck(HttpServletRequest req) {
		iMember member = sqlSession.getMapper(iMember.class);
		String uid = req.getParameter("userid");
		String pwd = req.getParameter("pwd");
		String name = req.getParameter("name");
		String mobile = req.getParameter("mobile");
		member.insert(uid, pwd, name, mobile);
		return "login";
	}
	
	@RequestMapping("/logout")
	public String doLogout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("/newpost")
	public String doNewPost(HttpServletRequest req) {
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
	
	@RequestMapping(value = "/addPost", method = RequestMethod.POST)
	public String doAddPost(HttpServletRequest req) {
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		HttpSession session = req.getSession();
		String writer = (String) session.getAttribute("userid");
		iPost post = sqlSession.getMapper(iPost.class);
		post.addPost(title, content, writer);
		return "redirect:/";
	}
	
	@RequestMapping("/post")
	public String doPost(int seqbbs, Model model) {
		iPost post = sqlSession.getMapper(iPost.class);
		boardDTO bDto = post.viewPost(seqbbs);
		model.addAttribute("post",bDto);
		return "postdetail";
	}
}
