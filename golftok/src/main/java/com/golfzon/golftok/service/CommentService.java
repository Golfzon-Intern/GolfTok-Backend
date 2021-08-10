package com.golfzon.golftok.service;

import java.util.HashMap;
import java.util.List;

import com.golfzon.golftok.model.Comments;

public interface CommentService {
	List<HashMap<String, Object>> getParentComments(int postId);
	int inputComment(HashMap<String, Object> map);
	int updateComment(HashMap<String, Object> map);
	int getPostIdByCommentId(int commentId);
	int deleteComment(int commentId);
	int getGroupLayerByCommentId(int commentId);
	int likeComment(int commentId);
	int unlikeComment(int commentId);
	int getCommentLikeCount(int commentId);
	List<HashMap<String, Object>> getChidrenComments(int commentId);
}
