package com.human.member;

import java.util.ArrayList;

public interface iMember {
	ArrayList<tmemberDTO> list();
	void insert(String id, String pwd, String name, String mobile);
}
