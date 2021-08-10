package com.golfzon.golftok.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.golfzon.golftok.mapper.PostMapper;
import com.golfzon.golftok.model.Criteria;
import com.golfzon.golftok.model.TokPosts;

@Service
@Transactional
public class PostServiceImple implements PostService {
	@Autowired
	private PostMapper postMapper;
	
	// 모든 게시물 가져오기 (하루 + 2일~7일 게시물 병합 후 반환)
	@Override
	public List<HashMap<String, Object>> getAllPosts(Criteria criteria) {
		//List<HashMap<String, Object>> todayPostList = postMapper.getTodayAllPosts(criteria);
		//List<HashMap<String, Object>> otherPostList = postMapper.getOtherDayAllPosts(criteria);
		
		List<HashMap<String, Object>> allPosts = postMapper.getAllPosts(criteria);
		//todayPostList.addAll(otherPostList);
		//return todayPostList;
		
		return allPosts;
	}

	
	@Override
	public int insertPost(HashMap<String, Object> map) {
		return postMapper.insertPost(map);
	}

	@Override
	public List<HashMap<String, Object>> getNasmo(int userId) {
		return postMapper.getNasmo(userId);
	}

	@Override
	public List<HashMap<String, Object>> getDetailPost(int postId) {
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

	@Override
	public List<TokPosts> searchPosts(String keyword) {
		return postMapper.searchPosts(keyword);
	}

	@Override
	public Object getPostLikeCount(int postId) {
		return postMapper.getPostLikeCount(postId);
	}


	@Override
	public List<HashMap<String, Object>> getProfilePosts(Integer userId) {
		return postMapper.getProfilePosts(userId);
	}

}
