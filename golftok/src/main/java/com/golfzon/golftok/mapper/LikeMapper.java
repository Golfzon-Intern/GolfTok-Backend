package com.golfzon.golftok.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface LikeMapper {

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
