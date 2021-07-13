package com.golfzon.golftok.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.golfzon.golftok.mapper.PostMapper;
import com.golfzon.golftok.model.Comments;
import com.golfzon.golftok.model.TokPosts;
import com.golfzon.golftok.model.TokUsers;

@Service
@Transactional
public class PostServiceImple implements PostService{
	@Autowired
	private PostMapper postMapper;

	public List<TokUsers> getAllUsers() {
		return postMapper.getAllUsers();
	}

	@Override
	public List<TokPosts> getAllPosts() {
		return postMapper.getAllPosts();
	}

	@Override
	public int insertPost(HashMap<String, Object> map) {
		return postMapper.insertPost(map);
	}

	@Override
	public List<HashMap<String, Object>> showNasmo(int userId) {
		return postMapper.showNasmo(userId);
	}

	@Override
	public List<TokPosts> getDetailPost(int postId) {
		return postMapper.getDetailPost(postId);
	}

	@Override
	public int editPost(HashMap<String, Object> map) {
		return postMapper.editPost(map);
	}

	@Override
	public int deletePost(int postId) {
		return postMapper.deletePost(postId);
	}

	@Override
	public void likePost(int postId) {
		postMapper.likePost(postId);
	}

	@Override
	public void unlikePost(int postId) {
		postMapper.unlikePost(postId);
	}
}
