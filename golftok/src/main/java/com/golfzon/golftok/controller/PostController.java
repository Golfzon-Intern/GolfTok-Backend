package com.golfzon.golftok.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
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

@RestController
@RequestMapping("/golftok")
public class PostController {
	@Autowired
	private PostService postService;

	@Autowired
	private CommentService commentService;

	// 나스모 영상 올리기 클릭 -> 나의 나스모 영상 보기
	@GetMapping("showNasmo")
	public HashMap<String, Object> showNasmo(@RequestParam(value = "userId") int userId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<HashMap<String, Object>> nasmoList = postService.showNasmo(userId);
		map.put("nasmoList", nasmoList);

		return map;
	}

	// 동영상 게시물 업로드
	@PostMapping("uploadPost")
	public HashMap<String, Object> insertPost(@RequestBody HashMap<String, Object> map) {
		if (postService.insertPost(map) == 0) {
			System.out.println("inputing post cannot be done!");
		} else {
			System.out.println("Success!!!");
		}
		
		// 업로드 후, 프로필 페이지로!!! (프로필 페이지의 데이터 넘겨줘야 함)
		return map;
	}

	// 게시물 (동영상) 상세보기 (게시물+댓글)
	@GetMapping("getDetailPost")
	public HashMap<String, Object> getDetailPost(@RequestParam(value = "postId") int postId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<TokPosts> postList = postService.getDetailPost(postId);
		List<Comments> commentList = commentService.getAllComments(postId);

		map.put("postList", postList);
		map.put("commentList", commentList);

		return map;
	}

	// 게시물 수정
	@PutMapping("editPost")
	public HashMap<String, Object> editPost(@RequestBody HashMap<String, Object> map) {
		if (postService.editPost(map) == 0) {
			System.out.println("editing post cannot be done!");
		} else {
			System.out.println("Success!!!");
		}
		return map;
	}

	// 게시물 삭제
	@DeleteMapping("deletePost")
	public HashMap<String, Object> deletePost(@RequestParam(value = "postId") int postId) {
		if (postService.deletePost(postId) == 0) {
			System.out.println("deleting post cannot be done!");
		} else {
			System.out.println("Success!!!");
		}
		return null;
	}
	
	// 게시물 좋아요, 좋아요 취소
	@PutMapping("likePost")
	public void likePost(@RequestBody HashMap<String, Object> map) {
		// 좋아요 : 1, 좋아요 취소 : 0
		int flag = (int) map.get("flag");
		int postId = (int) map.get("postId");
		
		if (flag==1) {
			postService.likePost(postId);
		}else {
			postService.unlikePost(postId);
		}
		
		// 좋아요 수 변경된거니까 front로 또 보내주긴 해야 함
	}
}