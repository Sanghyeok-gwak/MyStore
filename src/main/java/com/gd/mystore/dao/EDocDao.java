package com.gd.mystore.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gd.mystore.dto.EDocSampleDto;
import com.gd.mystore.dto.PageInfoDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Repository
public class EDocDao {
	
	private final SqlSessionTemplate sqlSession;
	
	public int selectEDocSampleListCount() {
		return sqlSession.selectOne("edocMapper.selectEDocSampleListCount");
	}

	public List<EDocSampleDto> selectEDocSampleList(PageInfoDto pi){
		RowBounds rowBounds = new RowBounds( (pi.getCurrentPage() - 1) * pi.getBoardLimit(), pi.getBoardLimit());
		return sqlSession.selectList("edocMapper.selectEDocSampleList", null, rowBounds);
	}
}
