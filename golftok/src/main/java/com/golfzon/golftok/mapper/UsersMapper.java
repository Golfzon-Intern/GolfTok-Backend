package com.golfzon.golftok.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Repository;

import com.golfzon.golftok.model.Follow;
import com.golfzon.golftok.model.TokUsers;

@Mapper
@Repository
public interface UsersMapper {

	List<HashMap<String, Object>> getMyFollowing(int userId);
	List<HashMap<String, Object>> getRecommendedFriednsByOrders(int userId);
	TokUsers checkLogin(HashMap<String, Object> map);
	TokUsers getUserByUserName(String userName);
	Integer getUserIdByUserName(String userName);
	int requestGolfFriend(HashMap<String, Object> map);
	int approveFriendRequest(HashMap<String, Object> map);
	int getFriendIdByRequestId(int requestId);
	int deleteFriendRequset(int requestId);
	int getUserIdByRequestId(int requestId);
	int following(HashMap<String, Object> map);
	int increaseFollower(int friendId);
	int increaseFollowing(int userId);
	int registerUser(HashMap<String, Object> userMap);
	String getPasswordByUserName(String userName);
	List<HashMap<String, Object>> getRecommendedFriednsByLikeCount();
	HashMap<String, Object> getUserByUserId(int userId);

}
