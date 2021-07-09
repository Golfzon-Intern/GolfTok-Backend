package com.golfzon.golftok.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Request {
	private int requestId;
	private int userId;
	private int requestedId;
	private String requestDate;
}
