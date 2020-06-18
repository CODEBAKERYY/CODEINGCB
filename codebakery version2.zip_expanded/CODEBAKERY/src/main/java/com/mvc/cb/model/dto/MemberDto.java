package com.mvc.cb.model.dto;

public class MemberDto {
	private String user_id;
	private String user_pw;
	private String user_pwchk;
	private String user_name;
	private String user_phone;
	private String user_mail;
	private int user_point;
	private String user_lang;
	public MemberDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberDto(String user_id, String user_pw, String user_pwchk, String user_name, String user_phone,
			String user_mail, int user_point, String user_lang) {
		super();
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_pwchk = user_pwchk;
		this.user_name = user_name;
		this.user_phone = user_phone;
		this.user_mail = user_mail;
		this.user_point = user_point;
		this.user_lang = user_lang;
	}
	public MemberDto(String user_id, String user_pw, String user_name, String user_phone, String user_mail,
			int user_point, String user_lang) {
		super();
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_phone = user_phone;
		this.user_mail = user_mail;
		this.user_point = user_point;
		this.user_lang = user_lang;
	}
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	
	public String getUser_pwchk() {
		return user_pwchk;
	}
	public void setUser_pwchk(String user_pwchk) {
		this.user_pwchk = user_pwchk;
	}
	
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_mail() {
		return user_mail;
	}
	public void setUser_mail(String user_email) {
		this.user_mail = user_email;
	}
	public int getUser_point() {
		return user_point;
	}
	public void setUser_point(int user_point) {
		this.user_point = user_point;
	}
	public String getUser_lang() {
		return user_lang;
	}
	public void setUser_lang(String user_lang) {
		this.user_lang = user_lang;
	}
	@Override
	public String toString() {
		return "MemberDto [user_id=" + user_id + ", user_pw=" + user_pw + ", user_name=" + user_name + ", user_phone="
				+ user_phone + ", user_mail=" + user_mail + ", user_point=" + user_point + ", user_lang=" + user_lang
				+ "]";
	}
	
	
	

	

}
