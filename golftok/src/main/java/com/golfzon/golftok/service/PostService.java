package com.golfzon.golftok.service;

import java.util.HashMap;
import java.util.List;

import com.golfzon.golftok.model.Criteria;
import com.golfzon.golftok.model.TokPosts;

public interface PostService {
	public int insertPost(HashMap<String, Object> map);

	public List<HashMap<String, Object>> getNasmo(int userId);

	public List<HashMap<String, Object>> getDetailPost(HashMap<String, Object> detailMap);

	public int updatePost(HashMap<String, Object> map);

	public int deletePost(int postId);

	public List<HashMap<String, Object>> getAllUserPosts(int userId);

	public int getPostIdByContentAndId(HashMap<String, Object> postMap);

	public void insertHashTag(HashMap<String, Object> postMap);

	public List<TokPosts> searchPosts(String keyword);

	public List<HashMap<String, Object>> getAllPosts(Criteria criteria);

	public Object getPostLikeCount(int postId);

	public List<HashMap<String, Object>> getProfilePosts(Integer userId);

	public int getUserIdByPostId(int postId);

	public Integer getPreviousPostId(HashMap<String, Object> detailMap);

	public Integer getNextPostId(HashMap<String, Object> detailMap);

	public HashMap<String, Object> getPostByPostId(int postId);

}
