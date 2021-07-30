package com.golfzon.golftok.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CommentLike {
	private int commentLikeId;
	private int commentId;
	private int userId;
}
