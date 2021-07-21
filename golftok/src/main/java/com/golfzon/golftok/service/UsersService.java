package com.golfzon.golftok.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.security.core.userdetails.UserDetails;

import com.golfzon.golftok.model.GolfFriends;
import com.golfzon.golftok.model.TokUsers;

public interface UsersService {
	List<HashMap<String, Object>> getMyFriends(int userId);

	List<HashMap<String, Object>> getRecommendedFriedns(int userId);

	TokUsers getUserByUserName(String userName);

	int getUserNameByUserId(String userName);

	int requestGolfFriend(HashMap<String, Object> map);

	int approveFriendRequest(HashMap<String, Object> map);

	int deleteFriendRequset(int requestId);

	int getUserIdByRequestId(int requestId);
}
