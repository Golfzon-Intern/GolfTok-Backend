package com.golfzon.golftok.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.HashMap;

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
	
	// 게시물 좋아요
	@PostMapping("post")
	@ResponseStatus(code = HttpStatus.OK)
	public void likePost(@RequestBody HashMap<String, Object> map, HttpServletResponse response,
			Principal principal) throws IOException {
		int postId = (int) map.get("postId");
		
		String userName = principal.getName();
		int userId = userService.getUserIdByUserName(userName);
		
		HashMap<String, Object> likeMap = new HashMap<String, Object>();
		likeMap.put("postId", postId);
		likeMap.put("userId", userId);
		
		// 좋아요 테이블에 추가 및 게시물의 좋아요 수 변경
		if (likeService.insertPostLike(likeMap) == 0 || likeService.increasePostLikeCount(postId)==0) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
		}
	}
	
	// 게시물 좋아요 취소
	@DeleteMapping("post")
	@ResponseStatus(code = HttpStatus.OK)
	public void unlikePost(@RequestParam(value = "postId") int postId, HttpServletResponse response,
			Principal principal) throws IOException {
		String userName = principal.getName();
		int userId = userService.getUserIdByUserName(userName);
		
		HashMap<String, Object> likeMap = new HashMap<String, Object>();
		likeMap.put("postId", postId);
		likeMap.put("userId", userId);
		
		// 좋아요 컬럼 삭제 및 게시물의 좋아요 수 변경
		if (likeService.deletePostLike(likeMap) == 0 || likeService.decresePostLikeCount(postId) == 0) {
			response.sendError(HttpServletResponse.SC_FORBIDDEN);
		}
	}
	
	// 댓글 좋아요
	@PostMapping("comment")
	@ResponseStatus(code = HttpStatus.OK)
	public void likeComment(@RequestBody HashMap<String, Object> map, HttpServletResponse response, Principal principal)
			throws IOException {
		int commentId = (int) map.get("commentId");
		String userName = principal.getName();
		int userId = userService.getUserIdByUserName(userName);

		HashMap<String, Object> likeMap = new HashMap<String, Object>();
		likeMap.put("commentId", commentId);
		likeMap.put("userId", userId);
		
		// 좋아요 테이블에 삽입 및 게시물의 좋아요 수 변경
		if (likeService.insertCommentLike(likeMap) == 0 || likeService.increaseCommentLikeCount(commentId) == 0) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
		}
	}
	
	// 좋아요 취소
	@DeleteMapping("comment")
	@ResponseStatus(code = HttpStatus.OK)
	public void unlikeComment(@RequestParam(value = "commentId") int commentId, HttpServletResponse response,
			Principal principal) throws IOException {
		String userName = principal.getName();
		int userId = userService.getUserIdByUserName(userName);
		
		HashMap<String, Object> likeMap = new HashMap<String, Object>();
		likeMap.put("commentId", commentId);
		likeMap.put("userId", userId);
		
		// 좋아요 테이블에서 삭제 및 게시물의 좋아요 수 변경
		if (likeService.deleteCommentLike(likeMap) == 0 || likeService.decreseCommentLikeCount(commentId) == 0) {
			response.sendError(HttpServletResponse.SC_FORBIDDEN);
		}
	}
	
	// 게시물 좋아요 정보 반환
	@GetMapping("post")
	@ResponseStatus(code = HttpStatus.OK)
	public HashMap<String, Object> getLike(@RequestParam(value = "postId") int postId, HttpServletResponse response,
			Principal principal) throws IOException {
		String userName = principal.getName();
		int userId = userService.getUserIdByUserName(userName);
		
		HashMap<String, Object> likeMap = new HashMap<String, Object>();
		likeMap.put("postId", postId);
		likeMap.put("userId", userId);
		
		// 좋아요가 되어 있는지 확인
		int flag = likeService.getPostLikeFlag(likeMap);
		System.out.println("flag:"+flag);
		if (flag > 0) flag = 0;
		else flag=1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("flag", flag);
		map.put("likeCount", postService.getPostLikeCount(postId));
		
		return map;
	}
}
