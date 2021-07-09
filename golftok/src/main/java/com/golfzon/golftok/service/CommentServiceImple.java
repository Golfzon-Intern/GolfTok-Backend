package com.golfzon.golftok.service;

import java.util.ArrayList;
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

}
