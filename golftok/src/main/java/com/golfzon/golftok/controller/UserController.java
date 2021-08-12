package com.golfzon.golftok.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.golfzon.golftok.model.Criteria;
import com.golfzon.golftok.model.TokPosts;
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
	

	// 팔로잉
	@PostMapping("following")
	@ResponseStatus(code = HttpStatus.OK)
	public void following(@RequestBody HashMap<String, Object> map, Principal principal) {
		String userName = principal.getName();
		int userId = userService.getUserIdByUserName(userName);
		int friendId = (int) map.get("friendId");

		map.put("userId", userId);
		// follow 테이블에 insert
		userService.following(map);

		userService.increaseFollower(friendId);
		userService.increaseFollowing(userId);
	}

	// 내가 팔로잉 중인 계정 5개 보기 (사이드 메뉴)
	@GetMapping("fiveMyFollowing")
	public HashMap<String, Object> getFiveMyFollowing(Principal principal) {
		String userName = principal.getName();
		int userId = userService.getUserIdByUserName(userName);
		HashMap<String, Object> map = new HashMap<String, Object>();

		List<HashMap<String, Object>> followingList = null;

		// 로그인 됐을 때
		if (principal != null) {
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
		criteria.setRecordsPerPage(4);
		criteria.setCurrentPageNo(currentPageNo);
		// 해당페이지 시작 인덱스 설정
		criteria.setStartIndex((currentPageNo - 1) * 5);

		HashMap<String, Object> map = new HashMap<String, Object>();

		String userName = principal.getName();
		int userId = userService.getUserIdByUserName(userName);
		criteria.setUserId(userId);
		List<TokPosts> postList = userService.getFollowingPost(criteria);

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
			recommendList = userService.getRecommendedFriedns5ByOrders(userId);
		} else { // 로그인 안됐을 때
			recommendList = userService.getRecommendedFriedns5ByLikeCount();

		}
		map.put("recommendList", recommendList);

		return map;
	}

	// 전체 보기 - 추천 계정 보기 (15개 가져오기)
	@GetMapping("recommend/fifteenFollowing")
	public HashMap<String, Object> recommend15Following(Principal principal) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		List<HashMap<String, Object>> recommendList = null;

		if (principal != null) {
			String userName = principal.getName();
			int userId = userService.getUserIdByUserName(userName);
			recommendList = userService.getRecommendedFriedns15ByOrders(userId);
		} else { // 로그인 안됐을 때
			recommendList = userService.getRecommendedFriedns15ByLikeCount();

		}
		map.put("recommendList", recommendList);

		return map;
	}

	// 프로필 페이지보기
	/*
	 * @GetMapping("profile") public HashMap<String, Object>
	 * getProfilePage(@RequestParam(value = "userId") int userId, Principal
	 * principal) { HashMap<String, Object> map = new HashMap<String, Object>();
	 * List<HashMap<String, Object>> recommendList = null; List<HashMap<String,
	 * Object>> followingList = null;
	 * 
	 * TokUsers user = userService.getUserByUserId(userId); List<HashMap<String,
	 * Object>> postList = postService.getAllUserPosts(userId);
	 * 
	 * map.put("user", user); map.put("postList", postList);
	 * 
	 * // 로그인 됐을 때 if (principal != null) { String userName = principal.getName();
	 * int loginUserId = userService.getUserIdByUserName(userName); followingList =
	 * userService.getMyFollowing(loginUserId); recommendList =
	 * userService.getRecommendedFriednsByOrders(loginUserId);
	 * 
	 * map.put("followingList", followingList); map.put("recommendList",
	 * recommendList); } else { // 로그인 안됐을 때 recommendList =
	 * userService.getRecommendedFriednsByLikeCount(); map.put("followingList",
	 * null); map.put("recommendList", recommendList); }
	 * 
	 * return map; }
	 */

	// 골프 친구 신청
	/*
	 * @PostMapping("friend/requestFriend") public HashMap<String, Object>
	 * requestGolfFriend(@RequestBody HashMap<String, Object> map,Principal
	 * principal) { String userName = principal.getName(); int userId =
	 * userService.getUserNameByUserId(userName); map.put("userId", userId);
	 * 
	 * userService.requestGolfFriend(map);
	 * 
	 * return null; }
	 * 
	 * // 골프 친구 승인
	 * 
	 * @PostMapping("friend/approveFriend") public HashMap<String, Object>
	 * approveFriendRequest(@RequestBody HashMap<String, Object> map,Principal
	 * principal) { String userName = principal.getName(); int userId =
	 * userService.getUserNameByUserId(userName); int requestId = (int)
	 * map.get("requestId"); int requestUserId =
	 * userService.getUserIdByRequestId(requestId);
	 * 
	 * HashMap<String, Object> approveMap1 = new HashMap<String, Object>();
	 * approveMap1.put("userId", userId); approveMap1.put("friendId",
	 * requestUserId); HashMap<String, Object> approveMap2 = new HashMap<String,
	 * Object>(); approveMap2.put("friendId", userId); approveMap2.put("userId",
	 * requestUserId);
	 * 
	 * // 친구 신청 승인 1 : 친구 리스트에 넣기 (양방향)
	 * userService.approveFriendRequest(approveMap1);
	 * userService.approveFriendRequest(approveMap2); // 친구 신청 승인 2 : 요청 삭제
	 * userService.deleteFriendRequset(requestId);
	 * 
	 * return null; }
	 */

}