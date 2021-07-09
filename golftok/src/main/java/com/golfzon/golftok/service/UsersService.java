package com.golfzon.golftok.service;

import java.util.HashMap;
import java.util.List;

import com.golfzon.golftok.model.GolfFriends;
import com.golfzon.golftok.model.TokUsers;

public interface UsersService {
	List<HashMap<String, Object>> getMyFriends(int userId);

	List<HashMap<String, Object>> getRecommendedFriedns(int userId);
}
