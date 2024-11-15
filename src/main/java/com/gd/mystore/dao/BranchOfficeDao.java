package com.gd.mystore.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gd.mystore.dto.PageInfoDto;
import com.gd.mystore.dto.ProductDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class BranchOfficeDao {
	private final SqlSessionTemplate sqlSession;

	public int selectProductListCount() {
		return sqlSession.selectOne("branchofficeMapper.selectProductListCount");
	}
	
	public List<ProductDto> selectList(PageInfoDto pi) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() - 1) * pi.getBoardLimit() , pi.getBoardLimit());		
		return sqlSession.selectList("branchofficeMapper.select",null,rowBounds);
	}
	
}
