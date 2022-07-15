package com.human.member;

import java.util.ArrayList;

public interface iPost {

	void addPost(String title, String content, String writer);
	void updatePost(String title, String content, int seqbbs);
	void deletePost(int seqbbs);
	ArrayList<boardDTO> listPost();
	boardDTO viewPost(int seqno);
}
