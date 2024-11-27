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

public class SendNoteDto {
	private String sendNo;
	private String title;
	private String content;
	private String sentDate;
	private String sentId;
	private String status;
	private String tempStorage;
	
	
	
	
}
