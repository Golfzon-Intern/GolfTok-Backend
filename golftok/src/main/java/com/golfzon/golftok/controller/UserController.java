package com.golfzon.golftok.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.golfzon.golftok.jwt.JwtUtil;

@RestController
@RequestMapping("/golftok")
public class UserController {
	// @Autowired
	// private JwtUtil jwtUtil;

	@Autowired
	private AuthenticationManager authenticationManager;

	@Autowired
	private JwtUtil jwtUtil;

	// @Autowired
	// private JwtUtils jwtUtils;
	
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
}