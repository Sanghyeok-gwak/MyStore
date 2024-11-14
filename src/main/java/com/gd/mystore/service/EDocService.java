package com.gd.mystore.service;

import java.util.List;

import com.gd.mystore.dto.EDocSampleDto;
import com.gd.mystore.dto.PageInfoDto;

public interface EDocService {
	
	// 양식 목록 조회(페이징)
	int selectEDocListCount();
	List<EDocSampleDto> selectEDocList(PageInfoDto pi);
	
	// 양식 등록
	int insertEDocSample(EDocSampleDto es);
	
	// 양식 삭제
	int deleteEdocSample(String[] deleteNo);
}
