package com.golfzon.golftok.controller;

import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.golfzon.golftok.service.CommentService;
import com.golfzon.golftok.service.LikeService;
import com.golfzon.golftok.service.PostService;
import com.golfzon.golftok.service.UsersService;
import com.opencsv.CSVReader;
import com.opencsv.CSVWriter;

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
		
		// 추천 서비스 실행을 위해, 누른 좋아요 csv 파일에 반영
		String filePath = "C://Users//owner//PycharmProjects//golftok//like_data.csv";
		readDataFromCsv(filePath,Integer.toString(userId),Integer.toString(postId),true);
	}
	
	// 게시물 좋아요 취소
	@DeleteMapping("post")
	@ResponseStatus(code = HttpStatus.OK)
	public void unlikePost(@RequestParam(value = "postId") Integer postId, HttpServletResponse response,
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
		
		// 추천 서비스 실행을 위해, 누른 좋아요 csv 파일에 반영
		String filePath = "C://Users//owner//PycharmProjects//golftok//like_data.csv";
		readDataFromCsv(filePath,Integer.toString(userId),Integer.toString(postId),false);
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
	
	// 댓글 좋아요 취소
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
	public HashMap<String, Object> getPostLike(@RequestParam(value = "postId") int postId, HttpServletResponse response,
			Principal principal) throws IOException {
		System.out.println("postId:"+postId);
		HashMap<String, Object> map = new HashMap<String, Object>();

		if (principal!=null) {
			String userName = principal.getName();
			int userId = userService.getUserIdByUserName(userName);
			
			HashMap<String, Object> likeMap = new HashMap<String, Object>();
			likeMap.put("postId", postId);
			likeMap.put("userId", userId);
			
			// 좋아요가 되어 있는지 확인
			int flag = likeService.getPostLikeFlag(likeMap);
			if (flag > 0) flag = 0;
			else flag=1;
			
			map.put("flag", flag);
		}else {
			map.put("flag", 1);
		}

		System.out.println("likeCount:"+postService.getPostLikeCount(postId));
		map.put("likeCount", postService.getPostLikeCount(postId));
		
		return map;
	}
	
	// 댓글 좋아요 정보 반환
	@GetMapping("comment")
	@ResponseStatus(code = HttpStatus.OK)
	public HashMap<String, Object> getCommentLike(@RequestParam(value = "commentId") int commentId, HttpServletResponse response,
			Principal principal) throws IOException {
		String userName = principal.getName();
		int userId = userService.getUserIdByUserName(userName);
		
		HashMap<String, Object> likeMap = new HashMap<String, Object>();
		likeMap.put("commentId", commentId);
		likeMap.put("userId", userId);

		// 좋아요가 되어 있는지 확인
		int flag = likeService.getCommentLikeFlag(likeMap);
		if (flag > 0) flag = 0;
		else flag = 1;

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("flag", flag);
		map.put("likeCount", commentService.getCommentLikeCount(commentId));
		
		return map;
	}

	// 좋아요가 변경 될 때마다 csv 파일 수정
	public static void readDataFromCsv(String filePath,String userId, String postId, boolean flag) throws IOException {
		// 좋아요 시, csv 파일에 데이터 추가
		if(flag==true) {
			CSVWriter csvWriter = new CSVWriter(new FileWriter(filePath,true));
			String[] likeData = new String[] {userId,postId,"1"};
			csvWriter.writeNext(likeData);
			csvWriter.close();
			
		}else{// 좋아요 취소 시, csv 파일 데이터 삭제
			CSVReader reader = new CSVReader(new FileReader(filePath));
			String[] nextLine;
			ArrayList<String> likeDateList = new ArrayList<String>();
	
			int csvRow=0;
			int breakFlag=0;
			while ((nextLine = reader.readNext()) != null) { 
				for (int i = 0; i < nextLine.length; i++) {
					likeDateList.add(nextLine[i]);
				}
				
				int idx=0;
				boolean b=true;
				for(String s : likeDateList) {
					if(idx==0) {
						if (!s.equals(userId)) {
							b=false;
							break;
						}
					}
					if(idx==1) {
						if(!s.equals(postId)) {
							b=false;
							break;
						}
					}
					idx+=1;
					if(idx>2) break;
				}
				
				// 조건에 맞는 행을 찾으면 csv 파일에서 행 삭제 후, 다시 쓰기
				if(b) {
					reader = new CSVReader(new FileReader(filePath));
					List<String[]> allElements = reader.readAll();
					allElements.remove(csvRow);
					CSVWriter csvWriter = new CSVWriter(new FileWriter(filePath));
					csvWriter.writeAll(allElements);
					csvWriter.close();
					breakFlag=1;
				}
				
				likeDateList.clear();
				if(breakFlag==1) break;
				csvRow+=1;
			}
		}
	}
}
