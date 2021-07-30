package com.golfzon.golftok.service;

import java.util.HashMap;

public interface LikeService {

	int getPostLikeFlag(HashMap<String, Object> map);

	int deletePostLike(HashMap<String, Object> likeMap);

	int decresePostLikeCount(int postId);

	int insertPostLike(HashMap<String, Object> likeMap);

	int increasePostLikeCount(int postId);

	int getCommentLikeFlag(HashMap<String, Object> likeMap);

	int insertCommentLike(HashMap<String, Object> likeMap);

	int increaseCommentLikeCount(int commentId);

	int deleteCommentLike(HashMap<String, Object> likeMap);

	int decreseCommentLikeCount(int commentId);

}
