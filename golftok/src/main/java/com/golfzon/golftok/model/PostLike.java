package com.golfzon.golftok.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PostLike {
	private int postLikeId;
	private int postId;
	private int userId;
}
