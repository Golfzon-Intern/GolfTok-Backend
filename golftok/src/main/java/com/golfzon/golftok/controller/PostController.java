package com.golfzon.golftok.controller;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.StringWriter;
import java.net.HttpURLConnection;
import java.security.Principal;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;

import javax.servlet.http.HttpServletResponse;

import org.codehaus.jettison.json.JSONException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
//import org.codehaus.jettison.json.JSONObject;
import org.json.simple.parser.ParseException;
import org.python.util.PythonInterpreter;
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

import com.golfzon.golftok.model.Criteria;
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
	public HashMap<String, Object> getPostList(Principal principal,
			@RequestParam(value = "currentPageNo") int currentPageNo, Criteria criteria)
			throws InterruptedException, IOException, ParseException, JSONException {
		List<HashMap<String, Object>> allPostList = null;
		// paging 설정
		criteria.setRecordsPerPage(15);
		criteria.setCurrentPageNo(currentPageNo);
		// 해당페이지 시작 인덱스 설정
		criteria.setStartIndex((currentPageNo - 1) * 5);

		HashMap<String, Object> map = new HashMap<String, Object>();
		System.out.println("principal:" + principal);
		
		allPostList = postService.getAllPosts(criteria);
		map.put("allPostList", allPostList);

		// 로그인 되지 않았을 때 좋아요 순 게시물
		/*
		 * if(principal==null) { allPostList = postService.getAllPosts(criteria);
		 * map.put("allPostList", allPostList);
		 * 
		 * // 로그인 됐을 시, 사용자 기반 추천 }else {
		 * 
		 * System.setProperty("python.cachedir.skip", "true"); PythonInterpreter
		 * interpreter = new PythonInterpreter();
		 * interpreter.exec("from java.lang import System");
		 * 
		 * StringWriter out = new StringWriter(); interpreter.setOut(out);
		 * 
		 * interpreter.execfile(
		 * "C://Users//owner//PycharmProjects//golftok//content_test.py");
		 * 
		 * // 추천 알고리즘 실행
		 * 
		 * ProcessBuilder pb = new ProcessBuilder("python",
		 * "C://Users//owner//PycharmProjects//golftok//content_test.py", "1.pdf");
		 * 
		 * pb.redirectErrorStream(true); Process proc = pb.start();
		 * 
		 * 
		 * 
		 * JSONParser parser = new JSONParser();
		 * 
		 * // JSON 파일 읽기 Reader reader = new FileReader(
		 * "C://Users//owner//PycharmProjects//golftok//post_predictions.json");
		 * JSONObject jsonObject = (JSONObject) parser.parse(reader);
		 * 
		 * JSONArray recommendedList = (JSONArray) jsonObject.get("data");
		 * 
		 * 
		 * for (Object s : recommendedList) { System.out.println(s); }
		 * 
		 * 
		 * 
		 * JSONArray m = (JSONArray) jsonObject.get("data"); Iterator<Object> iterator =
		 * m.iterator();
		 * 
		 * System.out.println("**JsonList**"); while (iterator.hasNext()) { String s =
		 * (String) iterator.next(); System.out.println(s); }
		 * 
		 * 
		 * 
		 * Reader reader = new InputStreamReader(proc.getInputStream(),"euc-kr");
		 * BufferedReader bf = new BufferedReader(reader); String s; while ((s =
		 * bf.readLine()) != null) { System.out.println(s); }
		 * 
		 * map.put("allPostList", recommendedList);
		 * 
		 * interpreter.close(); }
		 */

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
	public HashMap<String, Object> insertPost(@RequestBody HashMap<String, Object> map, Principal principal,
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
			postMap.put("postId", postId);

			postService.insertHashTag(postMap);
		}

		return map;
	}

	// 게시물 (동영상) 상세보기
	@GetMapping("detail")
	public HashMap<String, Object> getDetailPost(@RequestParam(value = "postId") int postId,
			@RequestParam(value = "type") int type) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<HashMap<String, Object>> postList = null;

		HashMap<String, Object> detailMap = new HashMap<String, Object>();
		detailMap.put("postId", postId);

		// 메인 페이지 상세보기
		if (type == 0) {
			detailMap.put("prevPostId", 0);
			detailMap.put("nextPostId", 0);

			postList = postService.getDetailPost(detailMap);
		} else { // 프로필 페이지 상세보기
			int userId = postService.getUserIdByPostId(postId);

			HashMap<String, Object> postIdMap = new HashMap<String, Object>();
			postIdMap.put("userId", userId);
			postIdMap.put("postId", postId);

			Integer prevPostId = postService.getPreviousPostId(postIdMap);
			Integer nextPostId = postService.getNextPostId(postIdMap);

			detailMap.put("prevPostId", prevPostId);
			detailMap.put("nextPostId", nextPostId);

			postList = postService.getDetailPost(detailMap);
		}

		map.put("postList", postList);

		return map;
	}

	// 게시물 수정
	@PutMapping("update")
	@ResponseStatus(code = HttpStatus.OK)
	public void updatePost(@RequestBody HashMap<String, Object> map, HttpServletResponse response) throws IOException {
		if (postService.updatePost(map) == 0) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND); // 404
		} else {
			System.out.println("Success!!!");
		}
	}

	// 게시물 삭제
	@DeleteMapping("delete")
	@ResponseStatus(code = HttpStatus.NO_CONTENT)
	public void deletePost(@RequestParam(value = "postId") int postId, HttpServletResponse response)
			throws IOException {
		if (postService.deletePost(postId) == 0) {
			response.sendError(HttpServletResponse.SC_FORBIDDEN); // 403 에러
		} else {
			System.out.println("Success!!!");
		}
	}

	// '#'으로 게시물 검색
	@GetMapping("search")
	public HashMap<String, Object> searchPosts(@RequestParam(value = "keyword") String keyword) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<TokPosts> postList = postService.searchPosts(keyword);

		map.put("postList", postList);

		return map;
	}
}