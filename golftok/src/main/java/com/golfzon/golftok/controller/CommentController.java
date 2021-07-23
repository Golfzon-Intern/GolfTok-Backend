package com.golfzon.golftok.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.golfzon.golftok.model.Comments;
import com.golfzon.golftok.model.TokPosts;
import com.golfzon.golftok.service.CommentService;
import com.golfzon.golftok.service.PostService;
import com.golfzon.golftok.service.UsersService;

@RestController
@RequestMapping("/golftok/comment")
public class CommentController {
	@Autowired
	private PostService postService;

	@Autowired
	private CommentService commentService;
	
	@Autowired
	private UsersService userService;

	// 댓글 작성
	@PostMapping("inputComment")
	public HashMap<String, Object> inputComment(@RequestBody HashMap<String, Object> map,Principal principal) {
		String userName = principal.getName();
		int userId = userService.getUserIdByUserName(userName);
		
		map.put("userId", userId);
		if (commentService.inputComment(map) == 0) {
			System.out.println("inputing comment cannot be done!");
		} else {
			System.out.println("Success!!!");
		}

		int postId = (int) map.get("postId");
		List<TokPosts> postList = postService.getDetailPost(postId);
		List<Comments> commentList = commentService.getAllComments(postId);

		map.put("postList", postList);
		map.put("commentList", commentList);

		// 상세보기 페이지
		return map;
	}

	// 댓글 수정
	@PutMapping("editComment")
	public HashMap<String, Object> editComment(@RequestBody HashMap<String, Object> map) {
		int commentId = (int) map.get("commentId");

		if (commentService.editComment(map) == 0) {
			System.out.println("editing comment cannot be done!");
		} else {
			System.out.println("Success!!!");
		}

		int postId = commentService.getPostIdByCommentId(commentId);
		List<TokPosts> postList = postService.getDetailPost(postId);
		List<Comments> commentList = commentService.getAllComments(postId);

		map.put("postList", postList);
		map.put("commentList", commentList);

		return map;
	}

	// 댓글 삭제
	@DeleteMapping("deleteComment")
	public HashMap<String, Object> deleteComment(@RequestParam(value = "commentId") int commentId) {

		// 댓글 삭제 전, 미리 댓글id를 이용 해 게시물 정보 얻어오기
		int postId = commentService.getPostIdByCommentId(commentId);

		if (commentService.deleteComment(commentId) == 0) {
			System.out.println("deleting comment cannot be done!");
		} else {
			System.out.println("Success!!!");
		}

		List<TokPosts> postList = postService.getDetailPost(postId);
		List<Comments> commentList = commentService.getAllComments(postId);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("postList", postList);
		map.put("commentList", commentList);

		return map;
	}

	// 댓글 좋아요, 좋아요 취소
	@PutMapping("likeComment")
	public HashMap<String, Object> likePost(@RequestBody HashMap<String, Object> map) {
		// 좋아요 : 1, 좋아요 취소 : 0
		int flag = (int) map.get("flag");
		int commentId = (int) map.get("commentId");

		if (flag == 1) {
			commentService.likeComment(commentId);
		} else {
			commentService.unlikeComment(commentId);
		}

		int postId = commentService.getPostIdByCommentId(commentId);
		HashMap<String, Object> detailMap = new HashMap<String, Object>();
		List<TokPosts> postList = postService.getDetailPost(postId);
		List<Comments> commentList = commentService.getAllComments(postId);

		detailMap.put("postList", postList);
		detailMap.put("commentList", commentList);

		return detailMap;
	}
}
