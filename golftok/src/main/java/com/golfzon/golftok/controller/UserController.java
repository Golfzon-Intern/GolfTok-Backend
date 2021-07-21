package com.golfzon.golftok.controller;

import java.security.Principal;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.golfzon.golftok.jwt.JwtUtil;
import com.golfzon.golftok.service.UsersService;

@RestController
@RequestMapping("/golftok")
public class UserController {
	@Autowired
	private AuthenticationManager authenticationManager;
	
	@Autowired
	private UsersService userService;

	@Autowired
	private JwtUtil jwtUtil;

	// 로그인
	@PostMapping("user/login")
	public String generateToken(@RequestBody HashMap<String, Object> map) throws Exception {
		String userName=(String) map.get("userName");
		String userPassword = (String) map.get("userPassword");
		try {
			authenticationManager.authenticate(
					new UsernamePasswordAuthenticationToken(userName, userPassword));
		}catch (Exception e) {
			System.out.println(e);
		}
		return jwtUtil.generateToken(userName);
	}
	
	// 골프 친구 신청
	@PostMapping("friend/requestFriend")
	public HashMap<String, Object> requestGolfFriend(@RequestBody HashMap<String, Object> map,Principal principal) {
		String userName = principal.getName();
		int userId = userService.getUserNameByUserId(userName);
		map.put("userId", userId);
		
		userService.requestGolfFriend(map);
		
		return null;
	}
	
	// 골프 친구 승인
	@PostMapping("friend/approveFriend")
	public HashMap<String, Object> approveFriendRequest(@RequestBody HashMap<String, Object> map,Principal principal) {
		String userName = principal.getName();
		int userId = userService.getUserNameByUserId(userName);
		int requestId = (int) map.get("requestId");
		int requestUserId = userService.getUserIdByRequestId(requestId);
		
		HashMap<String, Object> approveMap1 = new HashMap<String, Object>();
		approveMap1.put("userId", userId);
		approveMap1.put("friendId", requestUserId);
		HashMap<String, Object> approveMap2 = new HashMap<String, Object>();
		approveMap2.put("friendId", userId);
		approveMap2.put("userId", requestUserId);
		
		// 친구 신청 승인 1 : 친구 리스트에 넣기 (양방향)
		userService.approveFriendRequest(approveMap1);
		userService.approveFriendRequest(approveMap2);
		// 친구 신청 승인 2 : 요청 삭제
		userService.deleteFriendRequset(requestId);
		
		return null;
	}
	
	// 골프 친구 거부
}