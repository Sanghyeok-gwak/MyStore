package com.gd.mystore.serviceimpl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.gd.mystore.dao.EDocDao;
import com.gd.mystore.dto.DepartmentDto;
import com.gd.mystore.dto.EDocSampleDto;
import com.gd.mystore.dto.EmpMemberDto;
import com.gd.mystore.dto.PageInfoDto;
import com.gd.mystore.service.EDocService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class EDocServiceImpl implements EDocService {
	
	private final EDocDao edocDao;

	@Override
	public int selectEDocListCount() {
		return edocDao.selectEDocSampleListCount();
	}

	@Override
	public List<EDocSampleDto> selectEDocFormList(PageInfoDto pi) {
		return edocDao.selectEDocSampleList(pi);
	}

	@Override
	public int insertEDocSample(EDocSampleDto es) {
		return edocDao.insertEDocSample(es);
	}

	@Override
	public int deleteEdocSample(String[] deleteNo) {
		return edocDao.deleteEDocSample(deleteNo);
	}

	@Override
	public List<EDocSampleDto> selectEDocFormList() {
		return edocDao.selectEdocFormList();
	}

	@Override
	public EDocSampleDto selectEDocForm(int sampleNoInt) {
		return edocDao.selectEdocForm(sampleNoInt);
	}

	@Override
	public List<DepartmentDto> selectDepartments() {
		return edocDao.selectDepartments();
	}

	@Override
	public List<EmpMemberDto> selectEmployees() {
		return edocDao.selectEmployees();
	}

}
