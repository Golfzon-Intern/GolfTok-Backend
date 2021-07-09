package com.golfzon.golftok.model;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TokUsers {
	private int userId;
	private String userName;
	private String userNickname;
	private String userPassword;
	private String userIcon;
	private int friendCount;
	private String introductionMessage;
	private String accountAccess;
	private String birthDate;
}
