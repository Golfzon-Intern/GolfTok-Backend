package com.golfzon.golftok.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.golfzon.golftok.model.Comments;
import com.golfzon.golftok.model.TokPosts;
import com.golfzon.golftok.model.TokUsers;

@Mapper
@Repository
public interface PostMapper {
	public int insertPost(HashMap<String, Object> map);

	public List<HashMap<String, Object>> getNasmo(int userId);

	public List<TokPosts> getDetailPost(int postId);

	public List<Comments> getAllComments(int postId);

	public int updatePost(HashMap<String, Object> map);

	public int deletePost(int postId);

	public int likePost(int postId);

	public int unlikePost(int postId);

	public int likeComment(int commentId);

	public int unlikeComment(int commentId);

	public List<HashMap<String, Object>> getTodayAllPosts();

	public List<HashMap<String, Object>> getOtherDayAllPosts();

	public List<HashMap<String, Object>> getAllUserPosts(int userId);
}
