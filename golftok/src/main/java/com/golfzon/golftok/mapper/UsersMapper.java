package com.golfzon.golftok.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.golfzon.golftok.model.GolfFriends;

@Mapper
@Repository
public interface UsersMapper {

	List<HashMap<String, Object>> getMyFriends(int userId);
	List<HashMap<String, Object>> getRecommendedFriedns(int userId);

}
