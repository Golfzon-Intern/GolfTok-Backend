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
		String userName = principal.getName();
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<HashMap<String, Object>> todayPostList = null;
		List<HashMap<String, Object>> otherPostList= null;
		List<HashMap<String, Object>> recommendList=null;

		// 로그인하지 않은 경우
		if (userName == null) {
			todayPostList = postService.getTodayAllPosts();
			otherPostList = postService.getOtherDayAllPosts();
			// recommendList 논의 후, 추가 해햐 함
		} else { // 로그인 한 경우
			int userId = userService.getUserNameByUserId(userName);
			
			todayPostList = postService.getTodayAllPostsByUserId(userId);
			otherPostList = postService.getOtherDayAllPostsByUserId(userId);
			List<HashMap<String, Object>> friendList = userService.getMyFriends(userId);
			recommendList = userService.getRecommendedFriedns(userId);
			
			map.put("friendList", friendList);
			map.put("recommendList", recommendList);
		}

		map.put("todayPostList", todayPostList);
		map.put("otherPostList", otherPostList);

		return map;
	}

}
