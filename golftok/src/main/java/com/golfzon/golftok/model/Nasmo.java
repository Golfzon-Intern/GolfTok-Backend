package com.golfzon.golftok.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Nasmo {
	private int nasmoId;
	private int userId;
	private String videoRoot;
	private String nasmoThumbnail;
}
