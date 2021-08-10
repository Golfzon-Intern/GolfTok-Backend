package com.golfzon.golftok.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface CommentMapper {
	public List<HashMap<String, Object>> getParentComments(int postId);
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
	public List<HashMap<String, Object>> getChidrenComments(int commentId);
}
