package com.golfzon.golftok.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.golfzon.golftok.model.Comments;
import com.golfzon.golftok.service.CommentService;
import com.golfzon.golftok.service.UsersService;

@RestController
@RequestMapping("comment")
public class CommentController {
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private UsersService userService;
	
	// 부모 댓글 리스트 보기
	@GetMapping("parentList")
	public HashMap<String, Object> commentList(@RequestParam("postId") int postId){
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<HashMap<String, Object>> commentList = commentService.getParentComments(postId);
		map.put("parentList", commentList);
		return map;
	}
	
	// 자식 댓글 리스트 보기
	@GetMapping("childrenList")
	public HashMap<String, Object> childrenList(@RequestParam("commentId") int commentId){
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<HashMap<String, Object>> commentList = commentService.getChidrenComments(commentId);
		map.put("childrenList", commentList);
		return map;
	}

	// 댓글 작성
	@PostMapping("input")
	@ResponseStatus(code = HttpStatus.CREATED)
	public void inputComment(@RequestBody HashMap<String, Object> map,Principal principal,
			HttpServletResponse response) throws IOException{
		String userName = principal.getName();
		int userId = userService.getUserIdByUserName(userName);
		
		map.put("userId", userId);
		if (commentService.inputComment(map) == 0) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
		} else {
			System.out.println("Success!!!");
		}
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
}
