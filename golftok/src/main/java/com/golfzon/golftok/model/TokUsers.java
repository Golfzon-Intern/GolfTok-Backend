package com.golfzon.golftok.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
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
	private String userGrade;
}
