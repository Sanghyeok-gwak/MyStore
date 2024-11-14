package com.gd.mystore.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class PageInfoDto {

	private int listCount;
	private int currentPage;
	private int pageLimit;
	private int boardLimit;
	private int maxPage;
	private int startPage;
	private int endPage;
}
