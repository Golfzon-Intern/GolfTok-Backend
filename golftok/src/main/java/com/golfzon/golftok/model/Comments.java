package com.golfzon.golftok.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Comments {
	private int commentId;
	private int postId;
	private int userId;
	private String commentText;
	private String uploadDate;
	private int likeCount;
	private String commentGroup;
	private String groupOrder;
	private int groupLayer;
}
