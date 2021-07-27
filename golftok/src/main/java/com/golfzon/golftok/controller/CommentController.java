package com.golfzon.golftok.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.golfzon.golftok.model.Comments;
import com.golfzon.golftok.model.TokPosts;
import com.golfzon.golftok.service.CommentService;
import com.golfzon.golftok.service.PostService;
import com.golfzon.golftok.service.UsersService;

@RestController
@RequestMapping("comment")
public class CommentController {
	@Autowired
	private PostService postService;

	@Autowired
	private CommentService commentService;
	
	@Autowired
	private UsersService userService;

	// 댓글 작성
	@PostMapping("input")
	@ResponseStatus(code = HttpStatus.CREATED)
	public HashMap<String, Object> inputComment(@RequestBody HashMap<String, Object> map,Principal principal,
			HttpServletResponse response) throws IOException{
		HashMap<String, Object> commentMap = new HashMap<String, Object>();
		String userName = principal.getName();
		int userId = userService.getUserIdByUserName(userName);
		
		map.put("userId", userId);
		if (commentService.inputComment(map) == 0) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
		} else {
			System.out.println("Success!!!");
		}

		int postId = (int) map.get("postId");
		
		List<Comments> commentList = commentService.getAllComments(postId);
		commentMap.put("commentList", commentList);

		// 상세보기 페이지
		return commentMap;
	}

	// 댓글 수정
	@PutMapping("update")
	@ResponseStatus(HttpStatus.OK)
	public void updateComment(@RequestBody HashMap<String, Object> map,
			HttpServletResponse response) throws IOException{
		if (commentService.updateComment(map) == 0) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
		} else {
			System.out.println("Success!!!");
		}
	}

	// 댓글 삭제
	@DeleteMapping("delete")
	@ResponseStatus(code = HttpStatus.NO_CONTENT)
	public void deleteComment(@RequestParam(value = "commentId") int commentId,
			HttpServletResponse response) throws IOException{
		//HashMap<String, Object> commentMap = new HashMap<String, Object>();
		// 댓글 삭제 전, 미리 댓글id를 이용 해 게시물 정보 얻어오기
		//int postId = commentService.getPostIdByCommentId(commentId);

		if (commentService.deleteComment(commentId) == 0) {
			response.sendError(HttpServletResponse.SC_FORBIDDEN); //403 에러
		} else {
			System.out.println("Success!!!");
		}

		/*
		 * List<Comments> commentList = commentService.getAllComments(postId);
		 * commentMap.put("commentList", commentList);
		 * 
		 * return commentMap;
		 */
	}

	// 댓글 좋아요, 좋아요 취소
	@PutMapping("like")
	@ResponseStatus(code = HttpStatus.OK)
	public HashMap<String, Object> likePost(@RequestBody HashMap<String, Object> map,
			HttpServletResponse response) throws IOException{
		// 좋아요 : 1, 좋아요 취소 : 0
		int flag = (int) map.get("flag");
		int commentId = (int) map.get("commentId");

		if (flag == 1) {
			if (commentService.likeComment(commentId)==0) {
				response.sendError(HttpServletResponse.SC_NOT_FOUND); // 404
			}
		} else {
			if (commentService.unlikeComment(commentId)==0) {
				response.sendError(HttpServletResponse.SC_NOT_FOUND); // 404
			}
		}

		int postId = commentService.getPostIdByCommentId(commentId);
		HashMap<String, Object> detailMap = new HashMap<String, Object>();
		List<Comments> commentList = commentService.getAllComments(postId);

		detailMap.put("commentList", commentList);

		return detailMap;
	}
}
