package com.model;

import java.time.LocalDateTime;

public class Comment {
	
	private int commentId;
	private int songId;
	private int userId;
	private String content;
	private LocalDateTime commentTime;
	
	public Comment(String content, LocalDateTime commentTime, int commentId, int songId, int userId) {
		this.commentId = commentId;
		this.content = content;
		this.commentTime = commentTime;
		this.songId = songId;
		this.userId = userId;
	}


	public String getContent() {
		return content;
	}

	public LocalDateTime getCommentTime() {
		return commentTime;
	}


	public int getCommentId() {
		return commentId;
	}


	public int getSongId() {
		return songId;
	}


	public int getUserId() {
		return userId;
	}
	
	
}
