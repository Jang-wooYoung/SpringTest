package com.sample.BoardVO;

import java.util.Date;

public class BoardVO {
	private String dataUid;
	private String dataTitle;	
	private String dataContent;
	private String userNickname;
	private Date regDate;
		
	public String getDataUid() {
		return dataUid;
	}
	public void setDataUid(String dataUid) {
		this.dataUid = dataUid;
	}
	public String getDataTitle() {
		return dataTitle;
	}
	public void setDataTitle(String dataTitle) {
		this.dataTitle = dataTitle;
	}
	public String getDataContent() {
		return dataContent;
	}
	public void setDataContent(String dataContent) {
		this.dataContent = dataContent;
	}
	public String getUserNickname() {
		return userNickname;
	}
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
}
