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
			//System.out.println("commentGroup:"+commentGroup);
			// id값을 설정하기 위해 groupOrder값을 임시로 넣는다
			map.put("groupOrder","-1");
			commentMapper.inputComment(map);
			
			String commentCount = Integer.toString(commentMapper.getCommentCount(commentGroup)-1);
			//System.out.println("commentCount:"+commentCount);
			
			// 임시 저장되어있던 -1을 알맞은 값으로 변경
			map.put("groupOrder",commentCount);
			return commentMapper.updateGroupOrder(commentCount);
		}
	}

	@Override
	public int updateComment(HashMap<String, Object> map) {
		return commentMapper.updateComment(map);
	}

	@Override
	public int getPostIdByCommentId(int commentId) {
		return commentMapper.getPostIdByCommentId(commentId);
	}

	@Override
	public int deleteComment(int commentId) {
		// 댓글인지, 대댓글인지 확인 필요
		// 댓글이 삭제되면, 그에 포함 된 모든 대댓글 삭제되야 함
		// 대댓글 삭제 -> 삭제 한 대댓글보다 groupOrder 큰 대댓글의 groupOrder 다 1씩 -1 해야 함
		int groupLayer = commentMapper.getGroupLayerByCommentId(commentId);
		int commentGroup = commentMapper.getCommentGroupByCommentId(commentId);
		System.out.println("groupLayer:"+groupLayer);
		System.out.println("commentGroup:"+commentGroup);
		
		// 댓글 삭제
		if(groupLayer==0) {
			return commentMapper.deleteComment(commentGroup);
		}else { // 대댓글 삭제
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("groupOrder",commentMapper.getGroupOrderByCommentId(commentId));
			map.put("commentGroup", commentGroup);
			
			// 현재 댓글 + 상위 대댓글의 개수 구하기
			//int deleteCommentCount = commentMapper.countUpperChildrenComment(map);
			//System.out.println("deleteCommentCount:"+deleteCommentCount);
			
			// 대댓글 삭제
			commentMapper.deleteChildrenComment(map);
			// 대댓글 정렬
			return commentMapper.orderChildrenComment(map);
		}
	}

	@Override
	public int getGroupLayerByCommentId(int commentId) {
		return commentMapper.getGroupLayerByCommentId(commentId);
	}

	@Override
	public int likeComment(int commentId) {
		return commentMapper.likeComment(commentId);
	}

	@Override
	public int unlikeComment(int commentId) {
		return commentMapper.unlikeComment(commentId);
	}
}
