package com.golfzon.golftok.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.golfzon.golftok.model.Comments;
import com.golfzon.golftok.model.TokPosts;
import com.golfzon.golftok.service.CommentService;
import com.golfzon.golftok.service.LikeService;
import com.golfzon.golftok.service.PostService;
import com.golfzon.golftok.service.UsersService;

@RestController
@RequestMapping("like")
public class LikeController {
	@Autowired
	private UsersService userService;

	@Autowired
	private PostService postService;

	@Autowired
	private CommentService commentService;

	@Autowired
	private LikeService likeService;

	// 게시물 좋아요, 좋아요 취소
	@PutMapping("post")
	@ResponseStatus(code = HttpStatus.OK)
	public HashMap<String, Object> likePost(@RequestBody HashMap<String, Object> map, HttpServletResponse response,
			Principal principal) throws IOException {
		int postId = (int) map.get("postId");
		String userName = principal.getName();

		int userId = userService.getUserIdByUserName(userName);

		HashMap<String, Object> likeMap = new HashMap<String, Object>();
		likeMap.put("postId", postId);
		likeMap.put("userId", userId);

		// 좋아요인지 좋아요 취소인지 확인
		int flag = likeService.getPostLikeFlag(likeMap);

		if (flag > 0) { // 좋아요 취소
			if (likeService.deletePostLike(likeMap) == 0) response.sendError(HttpServletResponse.SC_NOT_FOUND);
			
			if (likeService.decresePostLikeCount(postId) == 0) response.sendError(HttpServletResponse.SC_NOT_FOUND);
			
		} else { // 좋아요
			if (likeService.insertPostLike(likeMap) == 0) response.sendError(HttpServletResponse.SC_NOT_FOUND);
			
			if (likeService.increasePostLikeCount(postId) == 0) response.sendError(HttpServletResponse.SC_NOT_FOUND);
		}

		HashMap<String, Object> postLikeMap = new HashMap<String, Object>();

		if (flag > 0) flag = 1;
		postLikeMap.put("flag", flag);
		postLikeMap.put("likeCount", postService.getPostLikeCount(postId));

		return postLikeMap;
	}

	// 댓글 좋아요, 좋아요 취소
	@PutMapping("comment")
	@ResponseStatus(code = HttpStatus.OK)
	public HashMap<String, Object> likeComment(@RequestBody HashMap<String, Object> map, HttpServletResponse response,
			Principal principal) throws IOException {
		int commentId = (int) map.get("commentId");
		String userName = principal.getName();

		int userId = userService.getUserIdByUserName(userName);

		HashMap<String, Object> likeMap = new HashMap<String, Object>();
		likeMap.put("commentId", commentId);
		likeMap.put("userId", userId);

		// 좋아요인지 좋아요 취소인지 확인
		int flag = likeService.getCommentLikeFlag(likeMap);

		if (flag > 0) { // 좋아요 취소
			if (likeService.deleteCommentLike(likeMap) == 0) response.sendError(HttpServletResponse.SC_NOT_FOUND);
			
			if (likeService.decreseCommentLikeCount(commentId) == 0) response.sendError(HttpServletResponse.SC_NOT_FOUND);

		} else { // 좋아요
			if (likeService.insertCommentLike(likeMap) == 0) response.sendError(HttpServletResponse.SC_NOT_FOUND);

			if (likeService.increaseCommentLikeCount(commentId) == 0) response.sendError(HttpServletResponse.SC_NOT_FOUND);
		}

		HashMap<String, Object> commentLikeMap = new HashMap<String, Object>();

		if (flag > 0) flag = 1;
		commentLikeMap.put("flag", flag);
		commentLikeMap.put("likeCount", commentService.getCommentLikeCount(commentId));

		return commentLikeMap;
	}
	
	

	// 게시물 좋아요, 좋아요 취소
	/*
	 * @PutMapping("post")
	 * 
	 * @ResponseStatus(code = HttpStatus.OK) public HashMap<String, Object>
	 * likePost(@RequestBody HashMap<String, Object> map, HttpServletResponse
	 * response) throws IOException { // 좋아요 : 1, 좋아요 취소 : 0 int flag = (int)
	 * map.get("flag"); int postId = (int) map.get("postId");
	 * 
	 * if (flag == 1) { if (postService.likePost(postId) == 0) {
	 * response.sendError(HttpServletResponse.SC_NOT_FOUND); // 404 } } else { if
	 * (postService.unlikePost(postId) == 0) {
	 * response.sendError(HttpServletResponse.SC_NOT_FOUND); // 404 } }
	 * 
	 * HashMap<String, Object> detailMap = new HashMap<String, Object>();
	 * List<TokPosts> postList = postService.getDetailPost(postId);
	 * detailMap.put("postList", postList);
	 * 
	 * return detailMap; }
	 */

	// 댓글 좋아요, 좋아요 취소
	/*
	 * @PutMapping("comment")
	 * 
	 * @ResponseStatus(code = HttpStatus.OK) public HashMap<String, Object>
	 * likeComment(@RequestBody HashMap<String, Object> map, HttpServletResponse
	 * response) throws IOException { // 좋아요 : 1, 좋아요 취소 : 0 int flag = (int)
	 * map.get("flag"); int commentId = (int) map.get("commentId");
	 * 
	 * if (flag == 1) { if (commentService.likeComment(commentId) == 0) {
	 * response.sendError(HttpServletResponse.SC_NOT_FOUND); // 404 } } else { if
	 * (commentService.unlikeComment(commentId) == 0) {
	 * response.sendError(HttpServletResponse.SC_NOT_FOUND); // 404 } }
	 * 
	 * int postId = commentService.getPostIdByCommentId(commentId); HashMap<String,
	 * Object> detailMap = new HashMap<String, Object>(); List<Comments> commentList
	 * = commentService.getAllComments(postId);
	 * 
	 * detailMap.put("commentList", commentList);
	 * 
	 * return detailMap; }
	 */
}
