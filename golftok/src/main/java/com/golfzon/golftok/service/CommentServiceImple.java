package com.golfzon.golftok.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.golfzon.golftok.mapper.CommentMapper;

@Service
@Transactional
public class CommentServiceImple implements CommentService{
	@Autowired
	private CommentMapper commentMapper;
	
	@Override
	public List<HashMap<String, Object>> getParentComments(int postId) {
		return commentMapper.getParentComments(postId);
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
			
			// id값을 설정하기 위해 groupOrder값을 임시로 넣는다
			map.put("groupOrder","-1");
			commentMapper.inputComment(map);
			
			String commentCount = Integer.toString(commentMapper.getCommentCount(commentGroup)-1);
			
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

		// 댓글 삭제
		if(groupLayer==0) {
			return commentMapper.deleteComment(commentGroup);
		}else { // 대댓글 삭제
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("groupOrder",commentMapper.getGroupOrderByCommentId(commentId));
			map.put("commentGroup", commentGroup);

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

	@Override
	public int getCommentLikeCount(int commentId) {
		return commentMapper.getCommentLikeCount(commentId);
	}


	@Override
	public List<HashMap<String, Object>> getChidrenComments(int commentId) {
		return commentMapper.getChidrenComments(commentId);
	}


	@Override
	public int getLatestComment() {
		return commentMapper.getLatestComment();
	}


	@Override
	public HashMap<String, Object> getCommentByCommentId(HashMap<String, Object> map) {
		HashMap<String, Object> commentMap = commentMapper.getCommentByCommentId(map);
		if ((int)map.get("groupLayer")==0) {
			commentMap.put("childrenCount", 0);
		}
		return commentMap;
	}

	@Override
	public int getCommentCountByPostId(int postId) {
		return commentMapper.getCommentCountByPostId(postId);
	}
}
