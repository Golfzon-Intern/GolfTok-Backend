package com.golfzon.golftok.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Repository;

import com.golfzon.golftok.model.GolfFriends;
import com.golfzon.golftok.model.TokUsers;

@Mapper
@Repository
public interface UsersMapper {

	List<HashMap<String, Object>> getMyFriends(int userId);
	List<HashMap<String, Object>> getRecommendedFriedns(int userId);
	TokUsers checkLogin(HashMap<String, Object> map);
	TokUsers getUserByUserName(String userName);
	int getUserNameByUserId(String userName);
	int requestGolfFriend(HashMap<String, Object> map);
	int approveFriendRequest(HashMap<String, Object> map);
	int getFriendIdByRequestId(int requestId);
	int deleteFriendRequset(int requestId);
	int getUserIdByRequestId(int requestId);

}
