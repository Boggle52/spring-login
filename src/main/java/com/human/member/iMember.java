package com.human.member;

import java.util.ArrayList;

public interface iMember {
	ArrayList<tmemberDTO> list();
	void insert(String id, String pwd, String name, String mobile);
	int checkUser(String id, String pwd);
	String name(String userid);
	int checkId(String id);
	int checkName(String name);
}
