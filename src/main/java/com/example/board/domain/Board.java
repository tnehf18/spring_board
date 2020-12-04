package com.example.board.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Board {
	
	private Integer bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private Integer readcnt;

}
