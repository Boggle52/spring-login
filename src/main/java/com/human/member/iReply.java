package com.human.member;

import java.util.ArrayList;

public interface iReply {
	void addReply(String content, int seqbbs, String writer);
	ArrayList<replyDTO> listReply(int seqbbs);
}
