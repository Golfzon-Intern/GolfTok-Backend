package com.golfzon.golftok.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.golfzon.golftok.jwt.JwtUtil;
import com.golfzon.golftok.model.TokUsers;
import com.golfzon.golftok.service.PostService;
import com.golfzon.golftok.service.UsersService;

@RestController
@RequestMapping("/golftok")
public class UserController {
	// 인증에 대한 부분 처리
	// 인증이 성공하면 isAuthenticated=true 인 객체를 생성하여 SecurityContext에 저장
	@Autowired
	private AuthenticationManager authenticationManager;

	@Autowired
	private UsersService userService;

	@Autowired
	private PostService postService;

	@Autowired
	private JwtUtil jwtUtil;

	private BCryptPasswordEncoder pwdEncoder;

	// 회원가입
	@PostMapping("user/register")
	public HashMap<String, Object> userRegister(@RequestBody HashMap<String, Object> userMap) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String userPassword = (String) userMap.get("userPassword");

		pwdEncoder = new BCryptPasswordEncoder();
		String password = pwdEncoder.encode(userPassword);
		System.out.println(password);
		userMap.put("userPassword", password);
		userService.registerUser(userMap);
		map.put("msg", "회원가입이 완료되었습니다.");

		return map;
	}

	// 로그인
	@PostMapping("user/login")
	public HashMap<String, Object> generateToken(@RequestBody HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> loginMap = new HashMap<String, Object>();
		pwdEncoder = new BCryptPasswordEncoder();

		String userName = (String) map.get("userName");
		String userPassword = (String) map.get("userPassword");
		int userId = userService.getUserIdByUserName(userName);
		
		try {
			// UsernamePasswordAuthenticationToken : AuthenticationFilter의 구현체
			authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(userName, userPassword));
		} catch (Exception e) {
			System.out.println(e);
		}
		
		// token 생성
		String accessToken = jwtUtil.generateToken(userName);
		
		loginMap.put("accessToken", accessToken);
		loginMap.put("userId", userId);
		loginMap.put("userName", userName);

		return loginMap;
	}
	
	/*
	 * @PostMapping("user/login") public String generateToken(@RequestBody
	 * HashMap<String, Object> map) throws Exception { pwdEncoder = new
	 * BCryptPasswordEncoder();
	 * 
	 * String userName = (String) map.get("userName"); String userPassword =
	 * (String) map.get("userPassword"); try { //
	 * UsernamePasswordAuthenticationToken : AuthenticationFilter의 구현체
	 * authenticationManager.authenticate(new
	 * UsernamePasswordAuthenticationToken(userName, userPassword)); } catch
	 * (Exception e) { System.out.println(e); }
	 * 
	 * return jwtUtil.generateToken(userName); }
	 */

	// 팔로잉
	@PostMapping("following")
	public HashMap<String, Object> following(@RequestBody HashMap<String, Object> map, Principal principal) {
		String userName = principal.getName();
		int userId = userService.getUserIdByUserName(userName);
		int friendId = (int) map.get("friendId");

		map.put("userId", userId);
		// follow 테이블에 insert
		userService.following(map);

		userService.increaseFollower(friendId);
		userService.increaseFollowing(userId);

		return null;
	}

	// 내가 팔로잉 중인 계정 모두 보기
	@GetMapping("getMyFollowing")
	public HashMap<String, Object> getMyFollowing(Principal principal) {
		String userName = principal.getName();
		int userId = userService.getUserIdByUserName(userName);
		HashMap<String, Object> map = new HashMap<String, Object>();

		List<HashMap<String, Object>> followingList = userService.getMyFollowing(userId);
		map.put("followingList", followingList);

		return map;
	}

	// 프로필 페이지보기
	@GetMapping("getProfilePage")
	public HashMap<String, Object> getProfilePage(@RequestParam(value = "userId") int userId, Principal principal) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<HashMap<String, Object>> recommendList = null;
		List<HashMap<String, Object>> followingList = null;

		HashMap<String, Object> user = userService.getUserByUserId(userId);
		List<HashMap<String, Object>> postList = postService.getAllUserPosts(userId);

		map.put("user", user);
		map.put("postList", postList);

		// 로그인 됐을 때
		if (principal != null) {
			String userName = principal.getName();
			int loginUserId = userService.getUserIdByUserName(userName);
			followingList = userService.getMyFollowing(loginUserId);
			recommendList = userService.getRecommendedFriednsByOrders(loginUserId);

			map.put("followingList", followingList);
			map.put("recommendList", recommendList);
		} else { // 로그인 안됐을 때
			recommendList = userService.getRecommendedFriednsByLikeCount();
			map.put("followingList", null);
			map.put("recommendList", recommendList);
		}

		return map;
	}

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