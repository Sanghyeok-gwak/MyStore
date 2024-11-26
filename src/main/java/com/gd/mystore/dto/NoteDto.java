package com.gd.mystore.dto;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString

public class NoteDto {
	private int noteid;
	//NOTE_ID	NUMBER
	private String title;
	//NOTE_TITLE	VARCHAR2(200 BYTE)
	private String content;
	//NOTE_CONTENT	CLOB
	private String sentTime;
	//SENT_TIME	DATE
	private String sentId;
	//SEND_ID	NUMBER
	private String deliverId;
	//DELIVER_ID	NUMBER
	private String status;
	//STATUS	CHAR(1 BYTE)
	private String receivedTime;
	//RECEIVED_TIME	DATE
	private String empNo;
	//EMP_NO	NUMBER
}
