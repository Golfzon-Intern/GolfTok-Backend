package com.golfzon.golftok.jwt;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.golfzon.golftok.mapper.UsersMapper;
import com.golfzon.golftok.model.TokUsers;


@Service
public class UserDetailsServiceImple implements UserDetailsService {
	@Autowired
	private UsersMapper usersMapper;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		TokUsers user = usersMapper.getUserByUserName(username);
		return new org.springframework.security.core.userdetails.User(user.getUserName(), user.getUserPassword(),
				new ArrayList<>());
	}
}
