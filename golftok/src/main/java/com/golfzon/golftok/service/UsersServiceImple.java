package com.golfzon.golftok.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.golfzon.golftok.mapper.UsersMapper;
import com.golfzon.golftok.model.TokPosts;
import com.golfzon.golftok.model.TokUsers;

@Service
@Transactional
public class UsersServiceImple implements UsersService{
	@Autowired
	private UsersMapper userMapper;

	@Autowired
	private PasswordEncoder passwordEncoder;

	// 내 골프 친구 보기 
	@Override
	public List<HashMap<String, Object>> getMyFollowing(int userId) {
		return userMapper.getMyFollowing(userId);
	}


	// 추천 계정 보기 (나이대 별 골프 친구 많은 사람 추천)
	@Override
	public List<HashMap<String, Object>> getRecommendedFriednsByOrders(int userId) {
		return userMapper.getRecommendedFriednsByOrders(userId);
	}


	@Override
	public TokUsers getUserByUserName(String userName) {
		TokUsers user = userMapper.getUserByUserName(userName);
		TokUsers encodedUser = new TokUsers();
		encodedUser.setUserName(user.getUserName());
		encodedUser.setUserPassword(passwordEncoder.encode(user.getUserPassword()));
		return encodedUser;
	}


	@Override
	public Integer getUserIdByUserName(String userName) {
		return userMapper.getUserIdByUserName(userName);
	}


	@Override
	public int requestGolfFriend(HashMap<String, Object> map) {
		return userMapper.requestGolfFriend(map);
	}


	@Override
	public int approveFriendRequest(HashMap<String, Object> map) {
		return userMapper.approveFriendRequest(map);
	}


	@Override
	public int deleteFriendRequset(int requestId) {
		return userMapper.deleteFriendRequset(requestId);
	}


	@Override
	public int getUserIdByRequestId(int requestId) {
		return userMapper.getUserIdByRequestId(requestId);
	}


	@Override
	public int following(HashMap<String, Object> map) {
		return userMapper.following(map);
	}


	@Override
	public int increaseFollower(int friendId) {
		return userMapper.increaseFollower(friendId);
	}


	@Override
	public int increaseFollowing(int userId) {
		return userMapper.increaseFollowing(userId);
	}

	@Override
	public String getPasswordByUserName(String userName) {
		return userMapper.getPasswordByUserName(userName);
	}


	@Override
	public List<HashMap<String, Object>> getRecommendedFriednsByLikeCount() {
		return userMapper.getRecommendedFriednsByLikeCount();
	}


	@Override
	public TokUsers getUserByUserId(int userId) {
		return userMapper.getUserByUserId(userId);
	}


	@Override
	public TokUsers getUserByUserNameExceptPwd(String userName) {
		return userMapper.getUserByUserNameExceptPwd(userName);
	}


	@Override
	public List<TokPosts> getFollowingPost(int userId) {
		return userMapper.getFollowingPost(userId);
	}
}
