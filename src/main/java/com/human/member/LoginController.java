package com.human.member;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LoginController {

	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/")
	public String home(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		if (session.getAttribute("username") == null) {
			model.addAttribute("username", "");
		} else {
			model.addAttribute("username", session.getAttribute("username"));
		}
		iPost post = sqlSession.getMapper(iPost.class);
		ArrayList<boardDTO> postList = post.listPost();
		model.addAttribute("plist", postList);
		return "home";
	}

	// ~/login
	@RequestMapping("/login")
	public String doLogin() {
		return "login";
	}

	@RequestMapping(value = "/user_check", method = RequestMethod.POST)
	public String doUserCheck(HttpServletRequest req, Model model) {
		iMember member = sqlSession.getMapper(iMember.class);
		String user_id = req.getParameter("userid");
		String password = req.getParameter("pwd");
		int cnt = member.checkUser(user_id, password);
		if (cnt != 0) {
			HttpSession session = req.getSession();
			String name = member.name(user_id);
			session.setAttribute("username", name);
			return "redirect:/";
		} else {
			model.addAttribute("checkUser", "false");
			return "login";
		}
	}

	@RequestMapping("/signin")
	public String doSignin() {
		return "signin";
	}

	@RequestMapping(value = "/user_signin", method = RequestMethod.POST)
	public String doSigninCheck(HttpServletRequest req, Model model) {
		iMember member = sqlSession.getMapper(iMember.class);
		String uid = req.getParameter("userid");
		String name = req.getParameter("name");
		int cnt = member.checkId(uid);
		int cnt2 = member.checkName(name);
		if (cnt == 0 && cnt2 == 0) {
			String pwd = req.getParameter("pwd");
			String mobile = req.getParameter("mobile");
			member.insert(uid, pwd, name, mobile);
			return "login";
		} else if (cnt != 0) {
			model.addAttribute("checkId", "false");
			return "signin";
		} else {
			model.addAttribute("checkName", "false");
			return "signin";
		}
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

	@RequestMapping(value = "/addnew")
	public String doAddNew(Model model) {
		iMember member = sqlSession.getMapper(iMember.class);
		ArrayList<tmemberDTO> memberlist = member.list();
		model.addAttribute("list", memberlist);
		return "addmember";
	}

	@RequestMapping(value = "/addMember", method = RequestMethod.POST)
	public String doAddNew(@RequestParam("id") String id, @RequestParam("pwd") String pwd,
			@RequestParam("name") String name, @RequestParam("mobile") String mobile) {
		iMember member = sqlSession.getMapper(iMember.class);
		member.insert(id, pwd, name, mobile);
		return "redirect:/addnew";
	}

	@RequestMapping(value = "/addPost", method = RequestMethod.POST)
	public String doAddPost(HttpServletRequest req) {
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		content = content.replace("\r\n", "<br>");
		iPost post = sqlSession.getMapper(iPost.class);
		HttpSession session = req.getSession();
		String writer = (String) session.getAttribute("username");
		post.addPost(title, content, writer);
		return "redirect:/";
	}

	@RequestMapping("/post")
	public String doPost(int seqbbs, Model model, HttpServletRequest req) {
		iPost post = sqlSession.getMapper(iPost.class);
		boardDTO bDto = post.viewPost(seqbbs);
		model.addAttribute("post", bDto);
		HttpSession session = req.getSession();
		if (session.getAttribute("username") == null) {
			model.addAttribute("username", "");
		} else {
			model.addAttribute("username", session.getAttribute("username"));
		}
		return "postdetail";
	}

	@RequestMapping("/updatePost")
	public String doUpdatePost(HttpServletRequest req, Model model) {
		int seqbbs = Integer.parseInt(req.getParameter("seqbbs"));
		iPost post = sqlSession.getMapper(iPost.class);
		boardDTO bDto = post.viewPost(seqbbs);
		String brRemoved = bDto.getContent().replaceAll("<br>", "\r\n");
		bDto.setContent(brRemoved);
		model.addAttribute("bDto", bDto);
		return "updatepost";
	}

	@RequestMapping("/deletePost")
	public String doDelete(int seqbbs, HttpServletRequest req) {
		iPost post = sqlSession.getMapper(iPost.class);
		seqbbs = Integer.parseInt(req.getParameter("seqbbs"));
		post.deletePost(seqbbs);
		return "redirect:/";
	}

	@RequestMapping("/confirmPost")
	public String doConfirmPost(HttpServletRequest req) {
		iPost post = sqlSession.getMapper(iPost.class);
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		content = content.replace("\r\n", "<br>");
		int seqbbs = Integer.parseInt(req.getParameter("seqbbs"));
		post.updatePost(title, content, seqbbs);
		return "redirect:/";
	}

	@RequestMapping("/addReply")
	public String doAddReply(HttpServletRequest req, Model model) {
		String content = req.getParameter("content");
		HttpSession session = req.getSession();
		String writer = (String) session.getAttribute("username");
		int seqbbs = Integer.parseInt(req.getParameter("seqbbs"));
		iReply reply = sqlSession.getMapper(iReply.class);
		reply.addReply(content, seqbbs, writer);
		return "redirect:/post?seqbbs=" + seqbbs;
	}


	 @SuppressWarnings("unchecked")
	 @ResponseBody 
	 @RequestMapping(value="/listReply", produces="application/text; charset=UTF-8") 
	 public String doListReply(@RequestParam("seqbbs") int seqbbs) {
		iReply reply = sqlSession.getMapper(iReply.class);
		ArrayList<replyDTO> replyList = reply.listReply(seqbbs);
		JSONArray ja = new JSONArray();
		for(int i = 0;i<replyList.size();i++){
			replyDTO rDto = replyList.get(i);
			JSONObject jo = new JSONObject();
			jo.put("seq", rDto.getSeq());
			jo.put("content", rDto.getContent());
			jo.put("seqbbs", rDto.getSeqbbs());
			jo.put("writer", rDto.getWriter());
			jo.put("replydate", rDto.getReplydate());
			jo.put("seqparent", rDto.getSeqparent());
			ja.add(jo);
		}
		return ja.toJSONString();
	 }

}
