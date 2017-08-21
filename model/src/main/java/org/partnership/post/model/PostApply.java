package org.partnership.post.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="post_apply")
public class PostApply implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id@GeneratedValue(strategy=GenerationType.AUTO)
	private long id;
	
	private String fullname;
	private String email;
	private String message;
	@DateTimeFormat(pattern = "dd/MM/yyyy hh:mm:ss")
	@Temporal(TemporalType.TIMESTAMP)
	private Date daycreate;
	@Column(name="post_id")
	private long postId;
	
	@Lob
	private byte[] cv;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public long getPostId() {
		return postId;
	}

	public void setPostId(long postId) {
		this.postId = postId;
	}

	public byte[] getCv() {
		return cv;
	}

	public void setCv(byte[] cv) {
		this.cv = cv;
	}

	public Date getDaycreate() {
		return daycreate;
	}

	public void setDaycreate(Date daycreate) {
		this.daycreate = daycreate;
	}
	
	
}
