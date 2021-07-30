package com.golfzon.golftok.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.golfzon.golftok.mapper.LikeMapper;

@Service
@Transactional
public class LikeServiceImple implements LikeService{
	@Autowired
	private LikeMapper likeMapper;

	@Override
	public int getPostLikeFlag(HashMap<String, Object> map) {
		return likeMapper.getPostLikeFlag(map);
	}

	@Override
	public int deletePostLike(HashMap<String, Object> likeMap) {
		return likeMapper.deletePostLike(likeMap);
	}

	@Override
	public int decresePostLikeCount(int postId) {
		return likeMapper.decresePostLikeCount(postId);
	}

	@Override
	public int insertPostLike(HashMap<String, Object> likeMap) {
		return likeMapper.insertPostLike(likeMap);
	}

	@Override
	public int increasePostLikeCount(int postId) {
		return likeMapper.increasePostLikeCount(postId);
	}

	@Override
	public int getCommentLikeFlag(HashMap<String, Object> likeMap) {
		return likeMapper.getCommentLikeFlag(likeMap);
	}

	@Override
	public int insertCommentLike(HashMap<String, Object> likeMap) {
		return likeMapper.insertCommentLike(likeMap);
	}

	@Override
	public int increaseCommentLikeCount(int commentId) {
		return likeMapper.increaseCommentLikeCount(commentId);
	}

	@Override
	public int deleteCommentLike(HashMap<String, Object> likeMap) {
		return likeMapper.deleteCommentLike(likeMap);
	}

	@Override
	public int decreseCommentLikeCount(int commentId) {
		return likeMapper.decreseCommentLikeCount(commentId);
	}

}
