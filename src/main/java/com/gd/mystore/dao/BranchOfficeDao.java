package com.gd.mystore.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gd.mystore.dto.CommonCodeDto;
import com.gd.mystore.dto.PageInfoDto;
import com.gd.mystore.dto.ProductDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Repository
public class BranchOfficeDao {
	private final SqlSessionTemplate sqlSession;

	public int selectProductListCount() {
		return sqlSession.selectOne("branchofficeMapper.selectProductListCount");
	}
	
	public List<ProductDto> selectList(PageInfoDto pi) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() - 1) * pi.getBoardLimit() , pi.getBoardLimit());		
		return sqlSession.selectList("branchofficeMapper.selectList",null,rowBounds);
	}
	
	public ProductDto selectDto(int prono) { 
		return sqlSession.selectOne("branchofficeMapper.selectDto",prono);
	}
	
	public List<CommonCodeDto> selectCommonDto() {
		return sqlSession.selectList("branchofficeMapper.selectCommonDto");
	}
	
	public int updateProduct(ProductDto productDto ) {
		return sqlSession.update("branchofficeMapper.updateProduct",productDto);
	}
	
	public int insertProduct(ProductDto productDto) {
		return sqlSession.insert("branchofficeMapper.insertProduct",productDto);
	}
	public int deleteProduct(String[] checkedValues ) {
		return sqlSession.delete("branchofficeMapper.deleteProduct",checkedValues);
	}
	public int searchCount(String searchValue) {
		return sqlSession.selectOne("branchofficeMapper.searchCount",searchValue);	
	}
	public List<ProductDto> selectSearchList(PageInfoDto pi, String search){
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() - 1) * pi.getBoardLimit() , pi.getBoardLimit());
		return sqlSession.selectList("branchofficeMapper.selectSearchList",search,rowBounds);
	}
}
