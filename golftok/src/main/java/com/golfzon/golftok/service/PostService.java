package com.golfzon.golftok.service;

import java.util.HashMap;
import java.util.List;

import com.golfzon.golftok.model.Comments;
import com.golfzon.golftok.model.TokPosts;
import com.golfzon.golftok.model.TokUsers;

public interface PostService {
	public int insertPost(HashMap<String, Object> map);

	public List<HashMap<String, Object>> showNasmo(int userId);

	public List<TokPosts> getDetailPost(int postId);

	public int editPost(HashMap<String, Object> map);

	public int deletePost(int postId);

	public void likePost(int postId);

	public void unlikePost(int postId);

	public List<HashMap<String, Object>> getTodayAllPosts();

	public List<HashMap<String, Object>> getOtherDayAllPosts();

}
