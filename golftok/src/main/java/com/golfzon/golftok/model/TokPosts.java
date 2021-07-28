package com.golfzon.golftok.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TokPosts {
	private int postId;
	private int userId;
	private String postContent;
	private String videoRoot;
	private String uploadDate;
	private int likeCount;
	private int commentCount;
	private String locations;
	private String postThumbnail;
}
