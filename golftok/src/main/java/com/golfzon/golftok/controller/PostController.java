package com.golfzon.golftok.controller;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.StringWriter;
import java.net.HttpURLConnection;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;

import javax.servlet.http.HttpServletResponse;

import org.codehaus.jettison.json.JSONException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
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

		// paging 설정
		criteria.setRecordsPerPage(15);
		criteria.setCurrentPageNo(currentPageNo);
		// 해당페이지 시작 인덱스 설정
		criteria.setStartIndex((currentPageNo - 1) * 15);

		HashMap<String, Object> map = new HashMap<String, Object>();

		//allPostList = postService.getAllPosts(criteria);
		//map.put("allPostList", allPostList);

		
		// 로그인 되지 않았을 때 랜덤 게시물
		if (principal == null) {
			List<HashMap<String, Object>> allPostList = postService.getAllPosts(criteria);
			map.put("allPostList", allPostList);
		} else { // 로그인 됐을 시, 사용자 기반 추천
			String userName = principal.getName();
			int userId = userService.getUserIdByUserName(userName);
			
			ProcessBuilder pb = new ProcessBuilder("python", "-u",
					"C://Users//owner//PycharmProjects//golftok//content_test.py");
			Process p = pb.start();

			BufferedReader inFile = new BufferedReader(new InputStreamReader(p.getInputStream(), "euc-kr"));
			String sLine = null;
			ArrayList<Integer> postIdList = new ArrayList<Integer>();

			while ((sLine = inFile.readLine()) != null) {
				String[] sList = sLine.split(" ");
				int sListSize = sList.length - 1;

				if (sList[sListSize].matches("[+-]?\\d*(\\.\\d+)?")) {
					postIdList.add(Integer.parseInt(sList[sListSize]));
				}
			}

			List<HashMap<String, Object>> allPostList = new ArrayList<HashMap<String, Object>>();
			int startIdx = (currentPageNo - 1) * 15;
			
			for (int i=startIdx; i<=startIdx+14; i++) {
				if(i<postIdList.size()) {
					HashMap<String, Object> postMap = postService.getPostByPostId(postIdList.get(i));
					allPostList.add(postMap);
				}else break;
			}

			map.put("allPostList", allPostList);
			inFile.close();
		}

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
	public void insertPost(@RequestBody HashMap<String, Object> map, Principal principal,
			HttpServletResponse response) throws IOException {
		String postContent = (String) map.get("postContent");
		String golfClub = (String)map.get("golfClub");
		String userName = principal.getName();
		int userId = userService.getUserIdByUserName(userName);

		map.put("userId", userId);

		if (postService.insertPost(map) == 0) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
		} else {
			HashMap<String, Object> postMap = new HashMap<String, Object>();
			postMap.put("postContent", postContent);
			postMap.put("golfClub",golfClub);
			postMap.put("userId", userId);

			int postId = postService.getPostIdByContentAndId(postMap);
			postMap.put("postId", postId);
			System.out.println("postId11:"+postId);

			postService.insertHashTag(postMap);
		}
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