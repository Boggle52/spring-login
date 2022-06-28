package com.human.member;

import java.util.ArrayList;

public interface iPost {

	void addPost(String title, String content, String writer);
	ArrayList<boardDTO> listPost();
	boardDTO viewPost(int seqno);
}
