package com.golfzon.golftok.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.golfzon.golftok.model.Criteria;
import com.golfzon.golftok.model.TokPosts;
import com.golfzon.golftok.model.TokUsers;

@Mapper
@Repository
public interface UsersMapper {

	List<HashMap<String, Object>> getMyFollowing(int userId);
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
	String getPasswordByUserName(String userName);
	HashMap<String, Object> getUserByUserId(int userId);
	HashMap<String, Object> getUserByUserNameExceptPwd(String userName);
	List<HashMap<String, Object>> getFollowingPost(Criteria criteria);
	List<HashMap<String, Object>> getRecommendedFriedns5ByOrders(HashMap<String, Object> recommendMap);
	List<HashMap<String, Object>> getRecommendedFriedns5ByLikeCount();
	List<HashMap<String, Object>> getRecommendedFriedns15ByOrders(int userId);
	List<HashMap<String, Object>> getRecommendedFriedns15ByLikeCount();
	List<HashMap<String, Object>> getFiveMyFollowing(int userId);
	List<HashMap<String, Object>> getAllMyFollowing(int userId);
	List<TokPosts> getFollowingPost(HashMap<String, Object> map);
	int getFollowing(HashMap<String, Object> map);
	int unfollowing(HashMap<String, Object> map);
	int decreaseFollower(int friendId);
	int decreaseFollowing(int userId);

}
