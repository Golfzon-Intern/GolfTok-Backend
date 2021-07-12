package com.golfzon.golftok.controller;


import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.golfzon.golftok.model.Comments;
import com.golfzon.golftok.model.TokPosts;
import com.golfzon.golftok.service.CommentService;
import com.golfzon.golftok.service.PostService;

@RestController
@RequestMapping("/golftok")
public class CommentController {
	@Autowired
	private PostService postService;
	
	@Autowired
	private CommentService commentService;
	
	// 댓글 작성
	@PostMapping("inputComment")
	public HashMap<String, Object> inputComment(@RequestBody HashMap<String, Object> map) {
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
}
