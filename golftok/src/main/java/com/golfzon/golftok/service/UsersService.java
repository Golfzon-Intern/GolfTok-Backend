package com.golfzon.golftok.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.security.core.userdetails.UserDetails;

import com.golfzon.golftok.model.Follow;
import com.golfzon.golftok.model.TokUsers;

public interface UsersService {
	List<HashMap<String, Object>> getMyFollowing(int userId);

	List<HashMap<String, Object>> getRecommendedFriednsByOrders(int userId);

	TokUsers getUserByUserName(String userName);

	int getUserNameByUserId(String userName);

	int requestGolfFriend(HashMap<String, Object> map);

	int approveFriendRequest(HashMap<String, Object> map);

	int deleteFriendRequset(int requestId);

	int getUserIdByRequestId(int requestId);

	int following(HashMap<String, Object> map);

	int increaseFollower(int friendId);

	int increaseFollowing(int userId);

	int registerUser(HashMap<String, Object> userMap);

	String getPasswordByUserName(String userName);

	List<HashMap<String, Object>> getRecommendedFriednsByLikeCount();
}
