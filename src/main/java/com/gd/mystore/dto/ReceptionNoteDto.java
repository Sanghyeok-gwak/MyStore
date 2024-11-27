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



public class ReceptionNoteDto {
	private int receptionNo;
	private int sendNo;
	private String sentId;
	private String recepId;
	private String title;
	private String content;
	private String recCheck;
	private String recDate;
	private String status;
	
}
