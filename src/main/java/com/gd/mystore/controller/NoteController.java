package com.gd.mystore.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gd.mystore.dto.EmpMemberDto;
import com.gd.mystore.dto.NoteDto;
import com.gd.mystore.dto.PageInfoDto;
import com.gd.mystore.service.NoteService;
import com.gd.mystore.util.PagingUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/note")
@RequiredArgsConstructor
@Controller
public class NoteController {
	
	private final NoteService noteService;
	private final PagingUtil pagingUtil;
	
	//받은 쪽지함
	@GetMapping("reception.no")
	public String reception(@RequestParam(value="page", defaultValue="1") int currentPage ,HttpSession session,Model model) {
		String empNo =( String.valueOf( ((EmpMemberDto)session.getAttribute("loginUser")).getEmpNo() ) );
		Map<String, Object> map = new HashMap<>();
		map.put("empNo", empNo);
		map.put("status", 'Y');
		
		int listCount = noteService.selectRecepCount(map);
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 10, 10);
		
		List<NoteDto> list = noteService.selectInBox(pi,empNo);
		
		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
		return "note/noteinbox";
	}
	//보낸 쪽지함
	@GetMapping("send.no")
	public String send(@RequestParam(value="page", defaultValue="1") int currentPage ,HttpSession session,Model model) {
		String empNo =( String.valueOf( ((EmpMemberDto)session.getAttribute("loginUser")).getEmpNo() ) );
		Map<String, Object> map = new HashMap<>();
		map.put("empNo", empNo);
		map.put("status", 'Y');
		
		int listCount = noteService.selectSendCount(map);
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 10, 10);
		
		List<NoteDto> list = noteService.selectSendList(pi,empNo);
		
		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
		
		
		return "note/sendnote";
	}
	
	//임시 저장
	@GetMapping("temporay.no")
	public String temporay(@RequestParam(value="page", defaultValue="1") int currentPage ,HttpSession session,Model model) {
		String empNo =( String.valueOf( ((EmpMemberDto)session.getAttribute("loginUser")).getEmpNo() ) );
		Map<String, Object> map = new HashMap<>();
		map.put("empNo", empNo);
		map.put("status", 'Y');
		
		int listCount = noteService.selectSendCount(map);
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 10, 10);
		
		List<NoteDto> list = noteService.selectTemporayList(pi,empNo);
		
		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
		
		return "note/temporarynote";
	}
	//휴지통 
	@GetMapping("trashnote.no")
	public String trashnote(@RequestParam(value="page", defaultValue="1") int currentPage ,HttpSession session,Model model) {
		String empNo =( String.valueOf( ((EmpMemberDto)session.getAttribute("loginUser")).getEmpNo() ) );
		Map<String, Object> map = new HashMap<>();
		map.put("empNo", empNo);
		map.put("status", 'N');
		
		int listCount = noteService.selectSendCount(map);
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 10, 10);
		
		List<NoteDto> list = noteService.selectTrashNote(pi,empNo);
		
		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
		
		return "note/trashnote";
	}
	
	
	@GetMapping("write.no")
	public String writenotePage() {
		return "note/writenote";
	}
	
	@GetMapping("temporayadd.no")
	public void temporayAdd(){
		
	}
	
	
	@ResponseBody
	@PostMapping("receptrashnote.no")
	public int recepTrashNote(String[] checkedValues) {
		Map<String, Object> map = new HashMap<>();
		map.put("type", "recep");
		map.put("checkedValues", checkedValues);
		return noteService.updateRece(map);
	}
	@ResponseBody
	@PostMapping("sendtrashnote.no")
	public int sendTrashNote(String[] checkedValues) {
		Map<String, Object> map = new HashMap<>();
		map.put("type", "send");
		map.put("checkedValues", checkedValues);
		
		return noteService.updateRece(map);
	}
	
	@ResponseBody
	@PostMapping("delete.no")
	public int deleteTrash(@RequestParam("checkedValues") String[] checkedValues) {
		return noteService.deleteNote(checkedValues) ;
	}
	
	@ResponseBody
	@PostMapping("updatesend.no")
	public int updateSendTrash(String[] checkedValues) {
		return noteService.updateSendTrash(checkedValues) ;
	}
	
	@GetMapping("recepDetail.no")
	public String selectRecepDetail(String no,Model model){
		Map<String, Object> map = new HashMap<>();
		map.put("type", "recep");
		map.put("no", no);
		
		NoteDto n = noteService.selectDetail(map);
		n.setSource("Y");
		log.debug("adsf : {}"+n);
		model.addAttribute("n",n);
		
		return "note/detail";
	}
	
	@GetMapping("sendDetail.no")
	public String selectSendDetail(String no,Model model){
		Map<String, Object> map = new HashMap<>();
		map.put("type", "send");
		map.put("no", no);
		log.debug("no :"+map.get("type"));
		log.debug("no :"+map.get("no"));
		NoteDto n = noteService.selectDetail(map);
		log.debug("adsf : {}"+n);
		model.addAttribute("n",n);
		
		return "note/detail";
	}
	
	@ResponseBody
	@PostMapping("/empcheck.no")
    public int checkEmp(@RequestParam("data") String data) {
        
        log.debug("test : "+data);
        
        String[] checkEmp = data.split(",");
        int result = noteService.checkEmp(checkEmp);
        if(result == checkEmp.length) {
        	result= -1;
        }
        
        return result;
    }
	
	@PostMapping("insert.no")
	public String insertNote(NoteDto noteDto, RedirectAttributes rdAttributes) {
		
		int result = noteService.insertNote(noteDto);
		
		if(result>0) {
			rdAttributes.addFlashAttribute("alertMsg", "쪽지 전송 성공");
		}else {
			rdAttributes.addFlashAttribute("alertMsg", "쪽지 전송 실패");
		}
		
		return "redirect:/note/reception.no";
	}
	
	
}
