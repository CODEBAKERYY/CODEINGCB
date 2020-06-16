package com.mvc.cb.model.dto;

public class NUserDto {
	
	private String nuser_Id;
	private String nuser_Pw;
	private String nuser_Content;
	
	
	public NUserDto() {
		super();
	}


	public NUserDto(String nuser_Id, String nuser_Pw, String nuser_Content) {
		super();
		this.nuser_Id = nuser_Id;
		this.nuser_Pw = nuser_Pw;
		this.nuser_Content = nuser_Content;
	}


	public String getNuser_Id() {
		return nuser_Id;
	}


	public void setNuser_Id(String nuser_Id) {
		this.nuser_Id = nuser_Id;
	}


	public String getNuser_Pw() {
		return nuser_Pw;
	}


	public void setNuser_Pw(String nuser_Pw) {
		this.nuser_Pw = nuser_Pw;
	}


	public String getNuser_Content() {
		return nuser_Content;
	}


	public void setNuser_Content(String nuser_Content) {
		this.nuser_Content = nuser_Content;
	}


	@Override
	public String toString() {
		return "NUserDto [nuser_Id=" + nuser_Id + ", nuser_Pw=" + nuser_Pw + ", nuser_Content=" + nuser_Content + "]";
	}
	
	

}
