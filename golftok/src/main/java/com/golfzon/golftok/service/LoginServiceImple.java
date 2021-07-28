package com.golfzon.golftok.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.golfzon.golftok.mapper.LoginMapper;

@Service
@Transactional
public class LoginServiceImple implements LoginService{
	@Autowired
	private LoginMapper loginMapper;

	@Override
	public int registerUser(HashMap<String, Object> userMap) {
		return loginMapper.registerUser(userMap);
	}

}
