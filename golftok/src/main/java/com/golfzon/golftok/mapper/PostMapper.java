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
	public List<TokUsers> getAllUsers();
	public List<TokPosts> getAllPosts();
	public int insertPost(HashMap<String, Object> map);
	public List<HashMap<String, Object>> showNasmo(int userId);
	public List<TokPosts> getDetailPost(int postId);
	public List<Comments> getAllComments(int postId);
	public int editPost(HashMap<String, Object> map);
	public int deletePost(int postId);
	public int likePost(int postId);
	public void unlikePost(int postId);
	public void likeComment(int commentId);
	public void unlikeComment(int commentId);
}
