package com.sample.BoardVO;

import java.util.Date;

public class CommentVO {
	private String dataUid;
	private String commentUid;
	private String commentContent;
	private String userNickname;
	private Date regDate;
	
	public String getDataUid() {
		return dataUid;
	}
	public void setDataUid(String dataUid) {
		this.dataUid = dataUid;
	}
	public String getCommentUid() {
		return commentUid;
	}
	public void setCommentUid(String commentUid) {
		this.commentUid = commentUid;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
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
