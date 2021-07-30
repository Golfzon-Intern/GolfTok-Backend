package com.golfzon.golftok.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	// 현재 페이지 번호
	private int currentPageNo;
	// 페이지당 출력할 데이터 개수
	private int recordsPerPage;
	// 시작 인덱스
	private int startIndex;
	private int userId;
}
