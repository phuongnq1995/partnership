package org.partnership.user.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="contact")
public class Contact implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Id@GeneratedValue(strategy=GenerationType.AUTO)
	private long id;
	
	@Column(name="name_send")
	private String senderName;
	
	@NotNull
	@ManyToOne
	@JoinColumn(name="user_send")
	private User userSend;
	
	@NotNull
	@ManyToOne
	@JoinColumn(name="user_receive")
	private User userReceive;
	
	@Column(name="send_time")
	@DateTimeFormat(pattern = "dd/MM/yyyy hh:mm:ss")
	@Temporal(TemporalType.TIMESTAMP)
	private Date sendTime;
	
	@Size(min=3, max=1000)
	@Column
	private String message;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getSenderName() {
		return senderName;
	}

	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}

	public User getUserSend() {
		return userSend;
	}

	public void setUserSend(User userSend) {
		this.userSend = userSend;
	}

	public User getUserReceive() {
		return userReceive;
	}

	public void setUserReceive(User userReceive) {
		this.userReceive = userReceive;
	}

	public Date getSendTime() {
		return sendTime;
	}

	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
}
