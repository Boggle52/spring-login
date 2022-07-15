package com.human.member;

public class replyDTO {
	private int seq;
	private String content;
	private int seqbbs;
	private String writer;
	private String replydate;
	private int seqparent;
//	private String username;
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getSeqbbs() {
		return seqbbs;
	}
	public void setSeqbbs(int seqbbs) {
		this.seqbbs = seqbbs;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getReplydate() {
		return replydate;
	}
	public void setReplydate(String replydate) {
		this.replydate = replydate;
	}
	public int getSeqparent() {
		return seqparent;
	}
	public void setSeqparent(int seqparent) {
		this.seqparent = seqparent;
	}
//	public String getUsername() {
//		return username;
//	}
//	public void setUsername(String username) {
//		this.username = username;
//	}
	
	
}
