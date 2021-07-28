package com.golfzon.golftok.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.golfzon.golftok.jwt.JwtUtil;
import com.golfzon.golftok.service.LoginService;
import com.golfzon.golftok.service.UsersService;

@RestController
@RequestMapping("user")
public class LoginController {
	// 인증에 대한 부분 처리
	// 인증이 성공하면 isAuthenticated=true 인 객체를 생성하여 SecurityContext에 저장
	@Autowired
	private AuthenticationManager authenticationManager;

	@Autowired
	private LoginService loginService;
	
	@Autowired
	private UsersService userService;

	@Autowired
	private JwtUtil jwtUtil;

	private BCryptPasswordEncoder pwdEncoder;

	// 회원가입
	@PostMapping("register")
	@ResponseStatus(code = HttpStatus.OK)
	public void userRegister(@RequestBody HashMap<String, Object> userMap, HttpServletResponse response)
			throws Exception {
		String userPassword = (String) userMap.get("userPassword");

		pwdEncoder = new BCryptPasswordEncoder();
		String password = pwdEncoder.encode(userPassword);
		System.out.println(password);
		userMap.put("userPassword", password);

		if (loginService.registerUser(userMap) == 0) {
			response.sendError(HttpServletResponse.SC_FORBIDDEN);
		}
	}

	// 로그인
	@PostMapping("login")
	public HashMap<String, Object> generateToken(@RequestBody HashMap<String, Object> map, HttpServletResponse response)
			throws Exception {
		HashMap<String, Object> loginMap = new HashMap<String, Object>();
		pwdEncoder = new BCryptPasswordEncoder();

		String userName = (String) map.get("userName");
		String userPassword = (String) map.get("userPassword");
		Integer userId = userService.getUserIdByUserName(userName);

		if (userId != null) {
			try {
				// UsernamePasswordAuthenticationToken : AuthenticationFilter의 구현체
				authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(userName, userPassword));
			} catch (Exception e) { // 비밀번호 틀렸을 시 -> 401
				System.out.println(e);
				response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
			}

			// token 생성
			String accessToken = jwtUtil.generateToken(userName);

			loginMap.put("accessToken", accessToken);
			loginMap.put("userId", userId);
			loginMap.put("userName", userName);

			System.out.println("login 성공!!" + loginMap.toString());
		} else { // 아이디가 틀리거나 존재하지 않을 시 -> 404
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
		}

		return loginMap;
	}
}
