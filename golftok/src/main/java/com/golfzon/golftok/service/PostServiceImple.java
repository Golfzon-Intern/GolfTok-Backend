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
public class PostServiceImple implements PostService {
	@Autowired
	private PostMapper postMapper;

	@Override
	public int insertPost(HashMap<String, Object> map) {
		return postMapper.insertPost(map);
	}

	@Override
	public List<HashMap<String, Object>> getNasmo(int userId) {
		return postMapper.getNasmo(userId);
	}

	@Override
	public List<TokPosts> getDetailPost(int postId) {
		return postMapper.getDetailPost(postId);
	}

	@Override
	public int updatePost(HashMap<String, Object> map) {
		return postMapper.updatePost(map);
	}

	@Override
	public int deletePost(int postId) {
		return postMapper.deletePost(postId);
	}

	@Override
	public int likePost(int postId) {
		return postMapper.likePost(postId);
	}

	@Override
	public int unlikePost(int postId) {
		return postMapper.unlikePost(postId);
	}

	@Override
	public List<HashMap<String, Object>> getTodayAllPosts() {
		return postMapper.getTodayAllPosts();
	}

	@Override
	public List<HashMap<String, Object>> getOtherDayAllPosts() {
		return postMapper.getOtherDayAllPosts();
	}

	@Override
	public List<HashMap<String, Object>> getAllUserPosts(int userId) {
		return postMapper.getAllUserPosts(userId);
	}

	@Override
	public int getPostIdByContentAndId(HashMap<String, Object> postMap) {
		return postMapper.getPostIdByContentAndId(postMap);
	}

	@Override
	public void insertHashTag(HashMap<String, Object> postMap) {
		String postContent = (String) postMap.get("postContent");
		int postId = (int) postMap.get("postId");
		
		String[] contentList = postContent.split(" ");
		HashMap<String, Object> map = new HashMap<String, Object>();

		for (String content : contentList) {
			if (content.startsWith("#")) {
				String hashtagContent = content.substring(1);

				map.put("postId", postId);
				map.put("hashtagContent", hashtagContent);
				
				postMapper.insertHashtag(map);
			}
		}
	}
}
