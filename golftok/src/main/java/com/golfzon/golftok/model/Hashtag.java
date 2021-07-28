package com.golfzon.golftok.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Hashtag {
	private int hashtagId;
	private int postId;
	private String hashtagContent;
}
