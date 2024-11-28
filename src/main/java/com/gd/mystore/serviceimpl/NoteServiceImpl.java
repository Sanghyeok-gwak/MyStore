package com.gd.mystore.serviceimpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.gd.mystore.dao.NoteDao;
import com.gd.mystore.dto.NoteDto;
import com.gd.mystore.dto.PageInfoDto;
import com.gd.mystore.service.NoteService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@RequiredArgsConstructor
@Service

public class NoteServiceImpl implements NoteService {
	private final NoteDao noteDao;

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
            if (value.startsWith("S")) {
                sValues.add(value.substring(1));
            } else if (value.startsWith("R")) {
                rValues.add(value.substring(1));
            }
        }
        
        for(int i =0; i<rValues.size(); i++) {
        	result = noteDao.updateRecepTrash(rValues.get(i));
        }
        for(int i =0; i<sValues.size(); i++) {
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
            if (value.startsWith("S")) {
                sValues.add(value.substring(1));
            } else if (value.startsWith("R")) {
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



//	@Override
//	public int sendNote(SendNoteDto noteDto) {
//		return noteDao.sendNote(noteDto);
//	}
}
