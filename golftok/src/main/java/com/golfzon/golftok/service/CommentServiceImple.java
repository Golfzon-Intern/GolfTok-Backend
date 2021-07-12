package com.golfzon.golftok.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.golfzon.golftok.mapper.CommentMapper;
import com.golfzon.golftok.model.Comments;

@Service
@Transactional
public class CommentServiceImple implements CommentService{
	@Autowired
	private CommentMapper commentMapper;
	
	@Override
	public List<Comments> getAllComments(int postId) {
		List<Comments> allCommentList = commentMapper.getAllComments(postId);
		List<Comments> parentCommentList = new ArrayList<Comments>();
		List<Comments> chilrenCommentList = new ArrayList<Comments>();
		List<Comments> newCommentList = new ArrayList<Comments>();
		
		for(Comments comment : allCommentList) {
			// 부모, 자식 분리 (부모:0, 자식:1)
			if(comment.getGroupLayer()==0) {
				parentCommentList.add(comment);
			}else {
				chilrenCommentList.add(comment);
			}
		}
		
		// 부모 먼저 넣기
		for(Comments pComment: parentCommentList) {
			newCommentList.add(pComment);
			// 해당 부모의 자식 넣기
			for(Comments cComment:chilrenCommentList) {
				if(pComment.getCommentGroup().equals(cComment.getCommentGroup())) {
					newCommentList.add(cComment);
				}
			}
		}
		
		return newCommentList;
	}

	@Override
	public int inputComment(HashMap<String, Object> map) {
		int groupLayer=(int) map.get("groupLayer");
		
		// 댓글 입력
		if (groupLayer==0) {
			map.put("groupOrder","0");
			return commentMapper.inputComment(map);
		}else { // 대댓글 입력

			String commentGroup = (String) map.get("commentGroup");
			System.out.println("commentGroup:"+commentGroup);
			// id값을 설정하기 위해 groupOrder값을 임시로 넣는다
			map.put("groupOrder","-1");
			commentMapper.inputComment(map);
			
			String commentCount = Integer.toString(commentMapper.getCommentCount(commentGroup)-1);
			System.out.println("commentCount:"+commentCount);
			
			// 임시 저장되어있던 -1을 알맞은 값으로 변경
			map.put("groupOrder",commentCount);
			return commentMapper.updateGroupOrder(commentCount);
		}
	}
}
