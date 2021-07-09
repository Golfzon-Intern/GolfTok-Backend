package com.golfzon.golftok.service;

import java.util.List;

import com.golfzon.golftok.model.Comments;

public interface CommentService {

	List<Comments> getAllComments(int postId);

}
