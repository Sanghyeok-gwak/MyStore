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
	private String noteId;
	private String title;
	private String content;
	private String sentTime;
	private String sentId;
	private String deliverId;
	private String status;
	private String receivedTime;
	private String empNo;
}
