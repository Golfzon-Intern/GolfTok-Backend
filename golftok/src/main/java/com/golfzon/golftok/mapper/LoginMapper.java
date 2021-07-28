package com.golfzon.golftok.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface LoginMapper {
	int registerUser(HashMap<String, Object> userMap);
}
