package com.golfzon.golftok.service;

import java.util.HashMap;
import java.util.List;

import com.golfzon.golftok.model.Comments;
import com.golfzon.golftok.model.TokPosts;
import com.golfzon.golftok.model.TokUsers;

public interface PostService {
	public int insertPost(HashMap<String, Object> map);

	public List<HashMap<String, Object>> getNasmo(int userId);

	public List<TokPosts> getDetailPost(int postId);

	public int updatePost(HashMap<String, Object> map);

	public int deletePost(int postId);

	public int likePost(int postId);

	public int unlikePost(int postId);

	public List<HashMap<String, Object>> getTodayAllPosts();

	public List<HashMap<String, Object>> getOtherDayAllPosts();

	public List<HashMap<String, Object>> getAllUserPosts(int userId);

	public int getPostIdByContentAndId(HashMap<String, Object> postMap);

	public void insertHashTag(HashMap<String, Object> postMap);

	public List<TokPosts> searchPosts(String keyword);

}
