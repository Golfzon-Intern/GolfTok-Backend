package com.golfzon.golftok.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	public HashMap<String, Object> getMain(@RequestParam(value="userId") int userId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		// 하루동안의 게시물 가져오기(좋아요, 댓글 순)
		List<HashMap<String, Object>> todayPostList = postService.getTodayAllPosts(userId);
		// 하루이상 ~ 일주일 이내의 게시물 (좋아요, 댓글 순)
		List<HashMap<String, Object>> otherPostList = postService.getOtherDayAllPosts(userId);

		List<HashMap<String, Object>> friendList = userService.getMyFriends(userId);
		List<HashMap<String, Object>> recommendList = userService.getRecommendedFriedns(userId);
	
		map.put("todayPostList", todayPostList);
		map.put("otherPostList", otherPostList);
		map.put("friendList", friendList);
		map.put("recommendList", recommendList);
		return map;
	}
	
}
