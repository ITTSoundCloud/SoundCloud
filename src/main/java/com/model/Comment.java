package com.model;

import java.time.LocalDateTime;

public class Comment {
	
	private int commentId;
	private int songId;
	private int userId;
	private String content;
	private LocalDateTime commentTime;
	private String username;
	
	
	public Comment(String content, LocalDateTime commentTime, int commentId, int songId, int userId) {
		this.commentId = commentId;
		this.content = content;
		this.commentTime = commentTime;
		this.songId = songId;
		this.userId = userId;
	}



	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
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



	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + commentId;
		return result;
	}



	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Comment other = (Comment) obj;
		if (commentId != other.commentId)
			return false;
		return true;
	}
	
	
	
	
}
