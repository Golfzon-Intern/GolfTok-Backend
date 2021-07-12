package com.golfzon.golftok.service;

import java.util.HashMap;
import java.util.List;

import com.golfzon.golftok.model.Comments;

public interface CommentService {
	List<Comments> getAllComments(int postId);
	int inputComment(HashMap<String, Object> map);
	int editComment(HashMap<String, Object> map);
	int getPostIdByCommentId(int commentId);
	int deleteComment(int commentId);
}
