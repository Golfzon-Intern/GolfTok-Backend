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

import com.golfzon.golftok.model.TokPosts;
import com.golfzon.golftok.service.PostService;
import com.golfzon.golftok.service.UsersService;

@RestController
@RequestMapping("post")
public class PostController {
	@Autowired
	private PostService postService;
	
	@Autowired
	private UsersService userService;
	
	// 게시물 리스트 보기
	@GetMapping("postList")
	public HashMap<String, Object> getPostList(Principal principal) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		System.out.println("principal:"+principal);
		
		List<HashMap<String, Object>> todayPostList = postService.getTodayAllPosts();
		List<HashMap<String, Object>> otherPostList = postService.getOtherDayAllPosts();
		
		map.put("todayPostList", todayPostList);
		map.put("otherPostList", otherPostList);

		return map;
	}

	// 나의 나스모 영상 보기
	@GetMapping("nasmoList")
	public HashMap<String, Object> getNasmo(Principal principal) {
		String userName = principal.getName();
		int userId = userService.getUserIdByUserName(userName);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<HashMap<String, Object>> nasmoList = postService.getNasmo(userId);
		map.put("nasmoList", nasmoList);

		return map;
	}

	// 동영상 게시물 업로드
	@PostMapping("insert")
	@ResponseStatus(HttpStatus.CREATED)
	public HashMap<String, Object> insertPost(@RequestBody HashMap<String, Object> map,Principal principal,
			HttpServletResponse response) throws IOException {
		String postContent = (String) map.get("postContent");
		String userName = principal.getName();
		int userId = userService.getUserIdByUserName(userName);

		map.put("userId", userId);
		
		if (postService.insertPost(map) == 0) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
		} else {
			HashMap<String, Object> postMap = new HashMap<String, Object>();
			postMap.put("postContent", postContent);
			postMap.put("userId", userId);
			
			int postId = postService.getPostIdByContentAndId(postMap);
			postMap.put("postId",postId);
			
			postService.insertHashTag(postMap);
			
			System.out.println("Success!!!");
		}

		return map;
	}

	// 게시물 (동영상) 상세보기 (게시물+댓글)
	@GetMapping("detail")
	public HashMap<String, Object> getDetailPost(@RequestParam(value = "postId") int postId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<TokPosts> postList = postService.getDetailPost(postId);
		
		map.put("postList", postList);
		
		return map;
	}

	// 게시물 수정
	@PutMapping("update")
	@ResponseStatus(code = HttpStatus.OK)
	public void updatePost(@RequestBody HashMap<String, Object> map, 
			HttpServletResponse response) throws IOException{
		if (postService.updatePost(map) == 0) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND); // 404
		} else {
			System.out.println("Success!!!");
		}
	}

	// 게시물 삭제
	@DeleteMapping("delete")
	@ResponseStatus(code = HttpStatus.NO_CONTENT)
	public void deletePost(@RequestParam(value = "postId") int postId,
			HttpServletResponse response) throws IOException{
		if (postService.deletePost(postId) == 0) {
			response.sendError(HttpServletResponse.SC_FORBIDDEN); //403 에러
		} else {
			System.out.println("Success!!!");
		}
	}
	
	// 게시물 좋아요, 좋아요 취소
	@PutMapping("like")
	@ResponseStatus(code = HttpStatus.OK)
	public HashMap<String, Object> likePost(@RequestBody HashMap<String, Object> map,
			HttpServletResponse response) throws IOException{
		// 좋아요 : 1, 좋아요 취소 : 0
		int flag = (int) map.get("flag");
		int postId = (int) map.get("postId");
		
		if (flag==1) {
			if (postService.likePost(postId)==0) {
				response.sendError(HttpServletResponse.SC_NOT_FOUND); // 404
			}
		}else {
			if (postService.unlikePost(postId)==0) {
				response.sendError(HttpServletResponse.SC_NOT_FOUND); // 404
			}
		}
		
		HashMap<String, Object> detailMap = new HashMap<String, Object>();
		List<TokPosts> postList = postService.getDetailPost(postId);
		detailMap.put("postList", postList);

		return detailMap;
	}

	// '#'으로 게시물 검색
	@GetMapping("search")
	public List<TokPosts> searchPosts(@RequestParam(value = "keyword") String keyword) {
		List<TokPosts> postList = postService.searchPosts(keyword);

		return postList;
	}
}