package com.golfzon.golftok.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.security.core.userdetails.UserDetails;

import com.golfzon.golftok.model.Criteria;
import com.golfzon.golftok.model.Follow;
import com.golfzon.golftok.model.TokPosts;
import com.golfzon.golftok.model.TokUsers;

public interface UsersService {

	TokUsers getUserByUserName(String userName);

	Integer getUserIdByUserName(String userName);

	int requestGolfFriend(HashMap<String, Object> map);

	int approveFriendRequest(HashMap<String, Object> map);

	int deleteFriendRequset(int requestId);

	int getUserIdByRequestId(int requestId);

	int following(HashMap<String, Object> map);

	int increaseFollower(int friendId);

	int increaseFollowing(int userId);

	String getPasswordByUserName(String userName);

	HashMap<String, Object> getUserByUserId(int userId);

	HashMap<String, Object> getUserByUserNameExceptPwd(String userName);

	List<TokPosts> getFollowingPost(Criteria criteria);

	List<HashMap<String, Object>> getRecommendedFriedns5ByOrders(int userId);

	List<HashMap<String, Object>> getRecommendedFriedns5ByLikeCount();

	List<HashMap<String, Object>> getRecommendedFriedns15ByOrders(int userId);

	List<HashMap<String, Object>> getRecommendedFriedns15ByLikeCount();

	List<HashMap<String, Object>> getFiveMyFollowing(int userId);

	List<HashMap<String, Object>> getAllMyFollowing(int userId);
	
	int getFollowing(HashMap<String, Object> followingMap);
}
