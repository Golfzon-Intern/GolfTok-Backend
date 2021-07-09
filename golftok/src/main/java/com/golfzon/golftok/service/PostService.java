package com.golfzon.golftok.service;

import java.util.HashMap;
import java.util.List;

import com.golfzon.golftok.model.Comments;
import com.golfzon.golftok.model.TokPosts;
import com.golfzon.golftok.model.TokUsers;


public interface PostService {
	public List<TokUsers> getAllUsers();
	public List<TokPosts> getAllPosts();
	public int insertPost(HashMap<String, Object> map);
	public List<HashMap<String, Object>> showNasmo(int userId);
	public List<TokPosts> getDetailPost(int postId);
	public int editPost(HashMap<String, Object> map);
	public int deletePost(int postId);
	public void likePost(int postId);
	public void unlikePost(int postId);
}
