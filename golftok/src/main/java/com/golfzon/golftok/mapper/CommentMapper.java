package com.golfzon.golftok.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.golfzon.golftok.model.Comments;

@Mapper
@Repository
public interface CommentMapper {
	public List<Comments> getAllComments(int postId);
	public int inputComment(HashMap<String, Object> map);
	public int getCommentCount(String commentGroup);
	public int updateGroupOrder(String commentCount);
	public int updateComment(HashMap<String, Object> map);
	public int getPostIdByCommentId(int commentId);
	public int deleteComment(int commentId);
	public int getGroupLayerByCommentId(int commentId);
	public int deleteChildrenComment(HashMap<String, Object> map);
	public int countUpperChildrenComment(HashMap<String, Object> map);
	public Object getGroupOrderByCommentId(int commentId);
	public int orderChildrenComment(HashMap<String, Object> map);
	public int getCommentGroupByCommentId(int commentId);
	public int likeComment(int commentId);
	public int unlikeComment(int commentId);
	public int getCommentLikeCount(int commentId);
}
