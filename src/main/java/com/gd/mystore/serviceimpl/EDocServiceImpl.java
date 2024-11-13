package com.gd.mystore.serviceimpl;

import org.springframework.stereotype.Service;

import com.gd.mystore.dao.EDocDao;
import com.gd.mystore.service.EDocService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class EDocServiceImpl implements EDocService {
	
	private final EDocDao edocDao;

}
