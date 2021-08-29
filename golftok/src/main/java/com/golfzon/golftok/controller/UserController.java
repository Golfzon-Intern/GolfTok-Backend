package com.golfzon.golftok.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.golfzon.golftok.model.Criteria;
import com.golfzon.golftok.model.TokUsers;
import com.golfzon.golftok.service.PostService;
import com.golfzon.golftok.service.UsersService;

@RestController
@RequestMapping("user")
public class UserController {
	@Autowired
	private UsersService userService;
	
	@Autowired
	private PostService postService;

	// 유저 정보 조회
	@GetMapping("info")
	public HashMap<String, Object> getCurrentUserInfo(@RequestParam(value = "userId", required = false) Integer userId,
			Principal principal) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> user = null;

		if (userId == null) {
			if (principal != null) {
				String userName = principal.getName();
				user = userService.getUserByUserNameExceptPwd(userName);
			}
		} else {
			user = userService.getUserByUserId(userId);
		}

		map.put("user", user);
		return map;
	}
	
	
	// 프로필 페이지 - 게시물 썸네일 보기
	@GetMapping("posts")
	public HashMap<String, Object> getUserPosts(@RequestParam(value = "userId", required = false) Integer userId,
			Principal principal) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<HashMap<String, Object>> postList = null;

		// 로그인 된 상태에서 자기 자신의 프로필 페이지 조회
		if (userId == null) {
			if (principal != null) {
				String userName = principal.getName();
				int uId = userService.getUserIdByUserName(userName);
				postList = postService.getProfilePosts(uId);
			}
		}else { // 다른 사람 프로필 페이지 조회
			postList = postService.getProfilePosts(userId);
		}

		map.put("postList", postList);

		return map;
	}
	
	// 팔로잉 조회
	@GetMapping("following")
	public HashMap<String, Object> getFollowing(@RequestParam(value = "friendId") Integer friendId, Principal principal) {
		HashMap<String, Object> followingMap = new HashMap<String, Object>();
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if(principal!=null) {
			String userName = principal.getName();
			int userId = userService.getUserIdByUserName(userName);

			followingMap.put("userId", userId);
			followingMap.put("friendId", friendId);
			
			int following = userService.getFollowing(followingMap);

			map.put("following", following);
		}else {
			map.put("following", null);
		}
		
		return map;
	}

	// 팔로잉 하기
	@PostMapping("following")
	@ResponseStatus(code = HttpStatus.OK)
	public void following(@RequestBody HashMap<String, Object> map, Principal principal) {
		String userName = principal.getName();
		int userId = userService.getUserIdByUserName(userName);
		int friendId = (int) map.get("friendId");

		System.out.println("userId:"+userId);
		map.put("userId", userId);
		// follow 테이블에 insert
		userService.following(map);

		userService.increaseFollower(friendId);
		userService.increaseFollowing(userId);
	}

	// 팔로잉 취소하기
	@DeleteMapping("following")
	@ResponseStatus(code = HttpStatus.OK)
	public void unfollowing(@RequestParam(value = "friendId") int friendId, Principal principal) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String userName = principal.getName();
		int userId = userService.getUserIdByUserName(userName);

		map.put("userId", userId);
		map.put("friendId", friendId);

		userService.unfollowing(map);

		userService.decreaseFollower(friendId);
		userService.decreaseFollowing(userId);
	}

	// 내가 팔로잉 중인 계정 5개 보기 (사이드 메뉴)
	@GetMapping("fiveMyFollowing")
	public HashMap<String, Object> getFiveMyFollowing(Principal principal) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<HashMap<String, Object>> followingList = null;

		// 로그인 됐을 때
		if (principal != null) {
			String userName = principal.getName();
			int userId = userService.getUserIdByUserName(userName);
			
			followingList = userService.getFiveMyFollowing(userId);
		}
		
		map.put("followingList", followingList);

		return map;
	}

	// 내가 팔로잉 중인 계정 모두 보기
	@GetMapping("allMyFollowing")
	public HashMap<String, Object> getMyFollowing(Principal principal) {
		String userName = principal.getName();
		int userId = userService.getUserIdByUserName(userName);
		HashMap<String, Object> map = new HashMap<String, Object>();

		List<HashMap<String, Object>> followingList = null;

		// 로그인 됐을 때
		if (principal != null) {
			followingList = userService.getAllMyFollowing(userId);
		}
		map.put("followingList", followingList);

		return map;
	}

	// 내가 팔로잉 한 게시물만 모아보기
	@GetMapping("followingPost")
	public HashMap<String, Object> getFollowingPost(Principal principal,
			@RequestParam(value = "currentPageNo") int currentPageNo, Criteria criteria) {
		// paging 설정
		criteria.setRecordsPerPage(15);
		criteria.setCurrentPageNo(currentPageNo);
		// 해당페이지 시작 인덱스 설정
		criteria.setStartIndex((currentPageNo - 1) * 5);

		HashMap<String, Object> map = new HashMap<String, Object>();

		String userName = principal.getName();
		int userId = userService.getUserIdByUserName(userName);
		criteria.setUserId(userId);
		List<HashMap<String, Object>> postList = userService.getFollowingPost(criteria);

		map.put("postList", postList);

		return map;
	}

	// 사이드 메뉴 - 추천 계정 보기 (5개 가져오기)
	@GetMapping("recommend/fiveFollowing")
	public HashMap<String, Object> recommend5Following(Principal principal) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		List<HashMap<String, Object>> recommendList = null;

		if (principal != null) {
			String userName = principal.getName();
			int userId = userService.getUserIdByUserName(userName);
			
			HashMap<String, Object> user = userService.getUserByUserId(userId);
			HashMap<String, Object> recommendMap = new HashMap<String, Object>();
			
			recommendMap.put("userId", user.get("userId"));
			recommendMap.put("userGrade", user.get("userGrade"));
			recommendMap.put("handicap", user.get("handicap"));
			recommendList = userService.getRecommendedFriedns5ByOrders(recommendMap);
		} else { // 로그인 안됐을 때
			recommendList = userService.getRecommendedFriedns5ByLikeCount();
		}

		map.put("recommendList", recommendList);

		return map;
	}
}