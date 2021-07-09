package com.golfzon.golftok.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.golfzon.golftok.model.Comments;

@Mapper
@Repository
public interface CommentMapper {

	public List<Comments> getAllComments(int postId);
}
