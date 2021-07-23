package com.golfzon.golftok.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.golfzon.golftok.service.PostService;
import com.golfzon.golftok.service.UsersService;

@RestController
@RequestMapping("/golftok")
public class MainController {
	@Autowired
	private PostService postService;

	@Autowired
	private UsersService userService;

	@GetMapping("main")
	public HashMap<String, Object> getMain(Principal principal) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		System.out.println("principal:"+principal);
		
		List<HashMap<String, Object>> todayPostList = postService.getTodayAllPosts();
		List<HashMap<String, Object>> otherPostList = postService.getOtherDayAllPosts();
		List<HashMap<String, Object>> recommendList = null;
		List<HashMap<String, Object>> followingList = null;

		// 로그인 됐을 때
		if (principal != null) {
			String userName = principal.getName();
			int userId = userService.getUserNameByUserId(userName);
			followingList = userService.getMyFollowing(userId);
			recommendList = userService.getRecommendedFriednsByOrders(userId);

			map.put("followingList", followingList);
			map.put("recommendList", recommendList);
		}else { // 로그인 안됐을 때
			recommendList = userService.getRecommendedFriednsByLikeCount();
			map.put("followingList", null);
			map.put("recommendList", recommendList);
		}
		
		map.put("todayPostList", todayPostList);
		map.put("otherPostList", otherPostList);

		return map;
	}

}
