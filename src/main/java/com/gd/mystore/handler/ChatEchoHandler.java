package com.gd.mystore.handler;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Component // servlet-context.xml 에 빈등록 구문 대체
public class ChatEchoHandler extends TextWebSocketHandler {
	
	private List<WebSocketSession> sessionList = new ArrayList<>();

	/**
	 * 1) afterConnectionEstablished : 웹소켓에 클라이언트가 연결되었을 때 처리할 내용 정의
	 * 
	 * @param session - 현재 웹소켓과 연결된 클라이언트 객체 (즉, 채팅방에 접속된 클라이언트)
	 */
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);
		
		
	}

	/**
	 * 2) handleMessage : 웹소켓으로 데이터(텍스트, 파일 등)가 전송되었을 경우 처리할 내용 정의
	 * 
	 * @param session - 현재 웹소켓으로 데이터를 전송한 클라이언트 객체
	 * @param message - 전송된 데이터에 대한 정보를 가지고 있는 객체
	 */
	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		
	}
	
	/**
	 * 3) afterConnectionClosed : 웹소켓에 클라이언트가 연결이 끊겼을 때 처리할 내용 정의
	 */
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		sessionList.remove(session);
		
		
	}
	
	public List<WebSocketSession> getSessionList() {
		return sessionList;
	}
	
	
	
}