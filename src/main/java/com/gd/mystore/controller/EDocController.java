package com.gd.mystore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/edoc")
public class EDocController {
	
	@GetMapping("collectlist")
	public void collectlist() {}
	
	@GetMapping("completedetail")
	public void completedetail() {}
	// 영역 나감

	@GetMapping("completelist")
	public void completelist() {}
	
	@GetMapping("draftcompanion")
	public void draftcompanion() {}
	// 영역나감
	
	@GetMapping("draftcompanionlist")
	public void draftcompanionlist() {}
	
	@GetMapping("draftcomplete")
	public void draftcomplete() {}
	// 영역 나감
	
	@GetMapping("draftcompletelist")
	public void draftcompletelist() {}
	
	@GetMapping("draftprogress")
	public void draftprogress() {}
	// 영역 나감
	
	@GetMapping("draftprogresslist")
	public void draftprogresslist() {}
	
	@GetMapping("draftwait")
	public void draftwait() {}
	// 영역 나감
	
	@GetMapping("draftwaitlist")
	public void draftwaitlist() {}
	
	@GetMapping("edocmodelist")
	public void edocmodelist() {}
	
	@GetMapping("edocmodewriter")
	public void edocmodewriter() {}
	
	@GetMapping("edocwrite")
	public void edocwrite() {}
	// 영역 나감
	
	@GetMapping("pendingdetail")
	public void pendingdetail() {}
	// 영역 나감
	
	@GetMapping("pendinglist")
	public void pendinglist() {}
	
	@GetMapping("scheduleddetail")
	public void scheduleddetail() {}
	// 영역 나감
	
	@GetMapping("scheduledlist")
	public void scheduledlist() {}
	

	
	
	
}
