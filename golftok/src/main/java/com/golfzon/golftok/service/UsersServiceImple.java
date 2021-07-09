package com.golfzon.golftok.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.golfzon.golftok.mapper.UsersMapper;
import com.golfzon.golftok.model.GolfFriends;
import com.golfzon.golftok.model.TokUsers;

@Service
@Transactional
public class UsersServiceImple implements UsersService{
	@Autowired
	private UsersMapper userMapper;


	// 내 골프 친구 보기 
	@Override
	public List<HashMap<String, Object>> getMyFriends(int userId) {
		return userMapper.getMyFriends(userId);
	}


	// 추천 계정 보기 (나이대 별 골프 친구 많은 사람 추천)
	@Override
	public List<HashMap<String, Object>> getRecommendedFriedns(int userId) {
		return userMapper.getRecommendedFriedns(userId);
	}
}
