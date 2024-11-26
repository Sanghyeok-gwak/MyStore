package com.gd.mystore.scheduler;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.gd.mystore.service.WorkService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Component
public class WorkScheduler {
	
	private final WorkService workService;
	
//	@Scheduled(cron="0 1 * * * MON-FRI") //평일 12시
//	@Scheduled(cron="0 10 22 * * MON-FRI") //평일 12시
//	public void workDataInsert() {
//		log.debug("@@@@@@@@근태 스케줄러 실행됨@@@@@@");
//		workService.insertEmpWork();
//	}
	
	
	
	
	
	
	
	
}
