package com.golfzon.golftok.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Follow {
	private int followId;
	private int userId;
	private int friendId;
}
