package com.gd.mystore.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gd.mystore.dto.BoardDto;
import com.gd.mystore.dto.BoardFileDto;
import com.gd.mystore.dto.EmpMemberDto;
import com.gd.mystore.dto.GoodDto;
import com.gd.mystore.dto.PageInfoDto;
import com.gd.mystore.dto.ReplyDto;
import com.gd.mystore.service.BoardService;
import com.gd.mystore.util.FileUtil;
import com.gd.mystore.util.PagingUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/board")
@RequiredArgsConstructor
@Controller
public class BoardController {

	private final BoardService boardService;
	private final PagingUtil pagingUtil;
	private final FileUtil fileUtil;
	
	// 메뉴바에 있는 메뉴 클릭시 /board/list.do   => 1번페이지 요청
	// 페이징바에 있는 페이지 클릭시 /board/list.do?page=xx
	
	@GetMapping("/list.do")
	public String list(@RequestParam(value="page", defaultValue="1") int currentPage
					   , @RequestParam(value="boardTypeNo", defaultValue="1001") String boardTypeNo
	                   , Model model) {
	    
	    int listCount = boardService.selectBoardListCount(boardTypeNo);
	    
	    PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 10);
	    List<BoardDto> list = boardService.selectBoardList(pi, boardTypeNo);
	    
	    model.addAttribute("pi", pi);
	    model.addAttribute("list", list);
	    
	    return "board/boardList"; 
	}

	
	@GetMapping("/search.do")
	public String search(@RequestParam(value="page", defaultValue="1") int currentPage
					,    @RequestParam Map<String, String> search // RequestParam을 쓰면 알아서 map객체에 키 밸류값을 담아줌
					,	 Model model) {
		
		// Map<String, String> search ==> {condition = user_id | board_title | board_content, keyword=란}
		
		int listCount = boardService.selectSearchListCount(search);
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 10);
		List<BoardDto> list = boardService.selectSearchList(search, pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		
		return "board/boardList";
		
		
		
	}
	
	
	@GetMapping("/boardRegist.do")
	public String registPage(Model model) {
		// 부서명 리스트와 게시판 유형 리스트를 가져온다
	    List<BoardDto> deptList = boardService.selectDeptList();
	    List<BoardDto> boardTypeList = boardService.selectBoardNameList();

	    // 모델에 데이터 추가
	    model.addAttribute("deptList", deptList);
	    model.addAttribute("boardTypeList", boardTypeList);

	    return "board/boardRegist"; // JSP 페이지 이름
	}


	@PostMapping("/insert.do")
	public String regist(BoardDto board
			, List<MultipartFile> uploadFiles
			, HttpSession session
			, RedirectAttributes rdAttributes){
		
		// board테이블에 insert할 데이터 
		board.setEmpNo(String.valueOf( ((EmpMemberDto)session.getAttribute("loginUser")).getEmpNo() ));
		
		// 첨부파일 업로드 후에
		// attachment테이블에 insert할 데이터
		List<BoardFileDto> attachList = new ArrayList<>();
		for( MultipartFile file : uploadFiles) {
			if(file != null && !file.isEmpty()) {
				Map<String, String>map = fileUtil.fileupload(file, "board");
				attachList.add(BoardFileDto.builder()
						.filePath(map.get("filePath"))
						.fileSystemName(map.get("filesystemName"))
						.originalName(map.get("originalName"))
						.refType("A")
						.build());
			}
		}
		
		board.setBoardList(attachList); // 제목,내용,작성자회원번호,첨부파일들정보
		
		int result = boardService.insertBoard(board);
		
		if(attachList.isEmpty() && result == 1 
				|| !attachList.isEmpty() && result == attachList.size()) {
			rdAttributes.addFlashAttribute("alertMsg", "게시글 등록 성공");
			
		}else {
			rdAttributes.addFlashAttribute("alertMsg", "게시글 등록 실패");
			
			
			
		}
		
		return "redirect:/board/list.do";
	}
	
	
	@GetMapping("/increase.do")
	public String increaseCount(int no) { // 조회수 증가용 (타인의 글일 경우 호출) => board/
		
		boardService.updateIncreaseCount(no);
		
		return "redirect:/board/boardDetail.do?no=" + no;
				
	}
	
	
	
	@GetMapping("/boardDetail.do")
	public void detail(@RequestParam(value = "no", required = false) Integer no, 
		      @ModelAttribute ReplyDto ReplyDto,  // BoardDto 객체로 자동 바인딩
              Model model) {
	
	    // 상세페이지에 필요한 데이터
	    BoardDto b = boardService.selectBoard(no);
	    int listCount = boardService.replycount(no);

	    // 게시글에 대한 댓글 목록
	    List<ReplyDto> reply = boardService.replylist(no);

	    // 각 댓글의 createDate 포맷팅
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

	    // 댓글 목록에서 createDate 포맷팅 후 변경
	    for (ReplyDto r : reply) {
	        String formattedDate = sdf.format(r.getCreateDate());  // r.getCreateDate()가 Date일 경우
	        r.setFormattedCreateDate(formattedDate); // 포맷팅된 날짜를 ReplyDto 객체에 추가
	    }

	    // 모델에 데이터 추가
	    model.addAttribute("b", b);  // 게시글 정보
	    model.addAttribute("listCount", listCount);  // 댓글 수
	    model.addAttribute("reply", reply);  // 댓글 목록
	}

	

	
		
	
	   // 댓글 작성
	@PostMapping("/addReply.do")
	public String replyInsert(ReplyDto r, HttpSession session) {
	    // 로그인된 사용자 정보에서 사용자 번호를 가져와 replyWriter에 설정
	    EmpMemberDto loginUser = (EmpMemberDto) session.getAttribute("loginUser");

	    // 로그인된 사용자 정보가 있을 경우 댓글 작성자 정보 설정
	    if (loginUser != null) {
	        r.setEmpNo(loginUser.getEmpNo()); // 댓글 작성자의 empNo 설정
	    }

	    if (r.getReplyContent() != null && r.getReplyContent().startsWith(",")) {
	        r.setReplyContent(r.getReplyContent().substring(1)); // 첫 번째 ',' 제거
	    }
	    
	    // 댓글을 데이터베이스에 추가
	    int result = boardService.insertReply(r);
	    
	 

	    // 댓글 추가 성공/실패에 따라 리다이렉트 처리
	    return "redirect:/board/boardDetail.do?no=" + r.getRefBno();
	}




	
	@PostMapping("/boardModify.do")
	public void modifyPage(int no, Model model) {
		 List<BoardDto> deptList = boardService.selectDeptList();
		    List<BoardDto> boardTypeList = boardService.selectBoardNameList();

		    // 모델에 데이터 추가
		    model.addAttribute("deptList", deptList);
		    model.addAttribute("boardTypeList", boardTypeList);

		    model.addAttribute("b", boardService.selectBoard(no));
	}
	
	@PostMapping("/update.do")
	public String modify(BoardDto board 		// 번호,제목,내용
					   , String[] delFileNo   // null | 삭제할첨부파일번호들
					   , List<MultipartFile> uploadFiles // 새로넘어온첨부파일들
					   , RedirectAttributes rdAttributes ) {
		
		// 후에 db에 반영 성공시 삭제할 파일들 삭제 위해 미리 조회
		List<BoardFileDto> delAttachList = boardService.selectDelAttach(delFileNo);
		
		List<BoardFileDto> attachList = new ArrayList<>();
		for(MultipartFile file : uploadFiles) {
			if(file != null && !file.isEmpty()) {
				Map<String, String> map = fileUtil.fileupload(file, "board");
				attachList.add(BoardFileDto.builder()
										.filePath(map.get("filePath"))
										.originalName(map.get("originalName"))
										.fileSystemName(map.get("filesystemName"))
										.refType("A")
										.refNo(board.getBoardNo())
										.build());	
			}
		}
		board.setBoardList(attachList);
		
		int result = boardService.updateBoard(board, delFileNo);
		
		if(result > 0) { // 성공
			rdAttributes.addFlashAttribute("alertMsg", "성공적으로 수정되었습니다.");
			for(BoardFileDto at : delAttachList) {
				new File(at.getFilePath() + "/" + at.getFileSystemName()).delete();
			}
		}else { // 실패
			rdAttributes.addFlashAttribute("alertMsg", "게시글 수정에 실패했습니다.");
		}
		
		return "redirect:/board/boardDetail.do?no=" + board.getBoardNo();
		
	}
	
	
	
	@PostMapping("/delete.do")
	public String remove(int no, RedirectAttributes rdAttributes) {
		int result = boardService.deleteBoard(no);
		
		if(result > 0) {
			rdAttributes.addFlashAttribute("alertMsg", "성공적으로 삭제되었습니다.");
		}else {
			rdAttributes.addFlashAttribute("alertMsg", "게시글 삭제에 실패하였습니다.");
		}
		
		return "redirect:/board/list.do";
	}
	
	@PostMapping("/replydelete.do")
	public String removeReply(int replyNo, RedirectAttributes rdAttributes , HttpServletRequest request) {
		
		 String referer = request.getHeader("Referer"); // referer 헤더에서 현재 URL을 가져옴

		int result = boardService.deleteReplyCompletely(replyNo);
		
	
		if(result > 0) {
			rdAttributes.addFlashAttribute("alertMsg", "댓글이 삭제되었습니다.");
		}else {
			rdAttributes.addFlashAttribute("alertMsg", "댓글 삭제에 실패하였습니다.");
		}
		
		 return "redirect:" + referer; // referer 변수에 저장된 현재 페이지로 리다이렉트
	}
	
	
	@PostMapping("/replyUpdate.do")
	public String updateReply(ReplyDto r, RedirectAttributes rdAttributes , HttpServletRequest request) {
		
		
		 String referer = request.getHeader("Referer"); // referer 헤더에서 현재 URL을 가져옴
		
		 int result = boardService.replyUpdate(r);
		 
		 if(result > 0) {
				rdAttributes.addFlashAttribute("alertMsg", "댓글이 수정되었습니다.");
			}else {
				rdAttributes.addFlashAttribute("alertMsg", "댓글 수정에 실패하였습니다.");
			}
		
		 return "redirect:" + referer; // referer 변수에 저장된 현재 페이지로 리다이렉트
		 
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // 클라이언트에서 전달된 파라미터 처리
	    int replyNo = Integer.parseInt(request.getParameter("replyNo"));  // 댓글 번호
	    String empName = request.getParameter("empName");                  // 사용자 이름
	    String goodReply = request.getParameter("goodReply");              // 좋아요 상태 ('Y' or 'N')

	    GoodDto goodDto = new GoodDto();
	    goodDto.setReplyNo(replyNo);
	    goodDto.setEmpName(empName);
	    goodDto.setGoodReply(goodReply);

	    int result = 0; 

	    try {
	        if ("Y".equals(goodReply)) {
	            // 최초 좋아요 추가 또는 기존 좋아요를 다시 'Y'로 설정하는 경우
	            // 먼저 이미 좋아요가 눌러졌는지 확인하고, 눌러졌으면 UPDATE, 아니면 INSERT
	            int count = boardService.checkGoodStatus(goodDto);
	            if (count > 0) {
	                // 이미 좋아요 상태라면 상태 변경 (UPDATE)
	                result = boardService.updateGood(goodDto);
	            } else {
	                // 처음 좋아요 추가 (INSERT)
	                result = boardService.insertGood(goodDto);
	            }
	        } else {
	            // 좋아요 상태가 'N'으로 변경되는 경우
	            result = boardService.updateGood(goodDto);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    // 클라이언트로 응답 (성공 여부)
	    if (result > 0) {
	        response.setStatus(HttpServletResponse.SC_OK); // 성공
	    } else {
	        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // 실패
	    }
	}

	
	@GetMapping("/mainlist.do")
	@ResponseBody
	public Map<String, Object> getBoardList() {

	    Map<String, Object> response = new HashMap<>();

	    try {
	        // 게시판 목록 조회
	        List<BoardDto> list = boardService.selectmainBoardList();
	        
	        // 반환된 데이터 확인
	        if (list != null && !list.isEmpty()) {
	            response.put("success", true);
	            response.put("boardList", list);  // 게시판 목록
	        } else {
	            response.put("success", false);
	            response.put("message", "게시판 목록이 없습니다.");
	        }
	        
	    } catch (Exception e) {
	        // 오류 발생 시
	        response.put("success", false);
	        response.put("message", "게시판 목록을 불러오는 데 실패했습니다.");
	        e.printStackTrace();  // 예외 출력
	    }

	    return response;
	}


	
}
