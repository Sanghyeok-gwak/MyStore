package com.gd.mystore.serviceimpl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.gd.mystore.dao.NoteDao;
import com.gd.mystore.dto.EmpMemberDto;
import com.gd.mystore.dto.NoteDto;
import com.gd.mystore.dto.PageInfoDto;
import com.gd.mystore.handler.ChatEchoHandler;
import com.gd.mystore.service.NoteService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@RequiredArgsConstructor
@Service

public class NoteServiceImpl implements NoteService {
	private final NoteDao noteDao;
	
	private final  ChatEchoHandler chat;
	
	
	@Override
	public int selectRecepCount(Map<String,Object> map) {
		return noteDao.selectRecepCount(map);
	}

	@Override
	public int selectSendCount(Map<String, Object> map) {
		return noteDao.selectSendCount(map);
	}
	
	@Override
	public List<NoteDto> selectInBox(PageInfoDto pi, String empNo) {
		return noteDao.selectInBox(pi,empNo);
	}

	@Override
	public List<NoteDto> selectSendList(PageInfoDto pi, String empNo) {
		return noteDao.selectSendList(pi,empNo);
	}

	@Override
	public List<NoteDto> selectTemporayList(PageInfoDto pi, String empNo) {
		return noteDao.selectTemporayList(pi,empNo);
	}

	@Override
	public List<NoteDto> selectTrashNote(PageInfoDto pi, String empNo) {
		return noteDao.selectTrashNote(pi,empNo);
	}

	@Override
	public int updateRece(Map<String, Object> map) {
		int result = 0;
		
		if(map.get("type").equals("recep")) {
			for(int i =0; i<((String[])(map.get("checkedValues"))).length; i++) {
				result += noteDao.updateRece(((String[])(map.get("checkedValues")))[i]);
			}
		}else {
			for(int i =0; i<((String[])(map.get("checkedValues"))).length; i++) {
				result += noteDao.updateSend(((String[])(map.get("checkedValues")))[i]);
			}
		}
		
		
		
		return result;
	}

	@Override
	public int updateSendTrash(String[] checkedValues) {
		
		int result=0;
		List<String> sValues = new ArrayList<>();
        List<String> rValues = new ArrayList<>();
        
        for (String value : checkedValues) {
            if (value.startsWith("R")) {
                sValues.add(value.substring(1));
            } else if (value.startsWith("S")) {
                rValues.add(value.substring(1));
            }
        }
        
        for(int i =0; i<rValues.size(); i++) {
        	log.debug("recep : {}",rValues.get(i) );
        	result = noteDao.updateRecepTrash(rValues.get(i));
        }
        for(int i =0; i<sValues.size(); i++) {
        	log.debug("send : {}",sValues.get(i) );
        	result+= noteDao.updateSendTrash(sValues.get(i));
        }
        
		
		
		
		
		return result;
	}

	@Override
	public int deleteNote(String[] checkedValues) {
		int result=0;
		List<String> sValues = new ArrayList<>();
        List<String> rValues = new ArrayList<>();
        
        for (String value : checkedValues) {
            if (value.startsWith("R")) {
                sValues.add(value.substring(1));
            } else if (value.startsWith("S")) {
                rValues.add(value.substring(1));
            }
        }
        
        for(int i =0; i<rValues.size(); i++) {
        	result = noteDao.deletRecepTrash(rValues.get(i));
        }
        for(int i =0; i<sValues.size(); i++) {
        	result+= noteDao.deletSendTrash(sValues.get(i));
        }
        
		return result;
	}

	@Override
	public NoteDto selectDetail(Map<String,Object> map) {
		NoteDto noteDto = new NoteDto();
		int result = 0;
		if(map.get("type").equals("recep")) {
			if(((String)(map.get("recCheck"))).equals("Y")) {
				noteDto = noteDao.selectRecepDetail(((String)(map.get("no"))));
			}else if(((String)(map.get("recCheck"))).equals("N")) {
			    result = noteDao.selectSendYDetail(map);
			    if(result>0) {
			    	noteDto = noteDao.selectRecepDetail(((String)(map.get("no"))));
			    }
			}
			
		}else if(map.get("type").equals("send")){
			noteDto = noteDao.selectSendDetail(((String)(map.get("no"))));
			log.debug("noteDto : "+noteDto);
		}
		
		return noteDto;
	}

	@Override
	public int checkEmp(String[] checkEmp) {
		int result = 0;
		
		for(String e : checkEmp) {
			result += noteDao.checkEmp(e);
		}
		
		
		
		
		return result;
	}

	@Override
	public int insertNote(NoteDto noteDto) throws IOException {
		
		int result = noteDao.insertSendNote(noteDto);
		
		
		String[] receptionIds = noteDto.getReceptionId().split(","); // ["B", "C"]
		
		// noteDto.getReceptionId() => "B,C"
	
		if(result>0 && !noteDto.getTempStorage().equals("Y")) {
			result=0;
			
			for(String receptionId : receptionIds) {
				noteDto.setReceptionId(receptionId);
				result += noteDao.insertRecepNote(noteDto);
				
			}
			
			List<WebSocketSession> list = chat.getSessionList();
			
			for(WebSocketSession wss : list) {
				if( noteDto.getReceptionId().contains( ((EmpMemberDto)wss.getAttributes().get("loginUser")).getEmpNo())) {
					int count = noteDao.checkCount(((EmpMemberDto)wss.getAttributes().get("loginUser")).getEmpNo());
					int total = noteDao.selectReadNote(((EmpMemberDto)wss.getAttributes().get("loginUser")).getEmpNo());
					wss.sendMessage(new TextMessage(String.valueOf(count) + "/" + String.valueOf(total) ));
					
				}
			}
		}
		
		return result;
	}

	@Override
	public int sideCount(String userNo) {
		return noteDao.checkCount(userNo);
	}

	@Override
	public List<NoteDto> selectMainNote(String no) {
		return noteDao.selectMainNote(no);
	}

	@Override
	public int selectReadNote(String no) {
		return noteDao.selectReadNote(no);
	}

	@Override
	public int selectNoReadNote(String no) {
		return noteDao.selectNoReadNote(no);
	}

	@Override
	public int recInsertTemp(NoteDto noteDto) throws IOException {
		int result = noteDao.updateTemp(noteDto);
		log.debug("result : "+result);
		
		String[] receptionIds = noteDto.getReceptionId().split(","); // ["B", "C"]
		
		if(result >0) {
			for(String receptionId : receptionIds) {
				noteDto.setReceptionId(receptionId);
				result += noteDao.insertTempRecepNote(noteDto);
				
			}
			
			List<WebSocketSession> list = chat.getSessionList();
			
			for(WebSocketSession wss : list) {
				if( noteDto.getReceptionId().contains( ((EmpMemberDto)wss.getAttributes().get("loginUser")).getEmpNo())) {
					int count = noteDao.checkCount(((EmpMemberDto)wss.getAttributes().get("loginUser")).getEmpNo());
					int total = noteDao.selectReadNote(((EmpMemberDto)wss.getAttributes().get("loginUser")).getEmpNo());
					log.debug("total : "+total);
					wss.sendMessage(new TextMessage(String.valueOf(count) + "/" + String.valueOf(total) ));
					
				}
			}
		}
		
		
		
		return result;
	}
	
}
		