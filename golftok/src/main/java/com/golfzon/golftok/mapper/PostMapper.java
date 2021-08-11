package com.golfzon.golftok.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.golfzon.golftok.model.Comments;
import com.golfzon.golftok.model.Criteria;
import com.golfzon.golftok.model.TokPosts;

@Mapper
@Repository
public interface PostMapper {
	public int insertPost(HashMap<String, Object> map);

	public List<HashMap<String, Object>> getNasmo(int userId);

	public List<HashMap<String, Object>> getDetailPost(HashMap<String, Object> detailMap);

	public List<Comments> getAllComments(int postId);

	public int updatePost(HashMap<String, Object> map);

	public int deletePost(int postId);

	public List<HashMap<String, Object>> getTodayAllPosts(Criteria criteria);

	public List<HashMap<String, Object>> getOtherDayAllPosts(Criteria criteria);

	public List<HashMap<String, Object>> getAllUserPosts(int userId);

	public void insertHashtag(HashMap<String, Object> map);

	public int getPostIdByContentAndId(HashMap<String, Object> postMap);

	public List<TokPosts> searchPosts(String keyword);

	public Object getPostLikeCount(int postId);

	public List<HashMap<String, Object>> getAllPosts(Criteria criteria);

	public List<HashMap<String, Object>> getProfilePosts(Integer userId);

	public int getUserIdByPostId(int postId);

	public Integer getPreviousPostId(HashMap<String, Object> detailMap);

	public Integer getNextPostId(HashMap<String, Object> detailMap);
}
