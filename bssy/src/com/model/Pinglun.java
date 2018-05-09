package com.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="t_Pinglun")
public class Pinglun implements Serializable{

	private static final long serialVersionUID = -7141419035239709511L;

	private long id;
	
	private String pingluncontent;//内容
	
	private Date createtime;
	
	private int pinglunlock;
	
	private Content content;
	
	private User user;
	

	
	@ManyToOne
	@JoinColumn(name="contentid")
	public Content getContent() {
		return content;
	}

	public String getPingluncontent() {
		return pingluncontent;
	}

	public void setPingluncontent(String pingluncontent) {
		this.pingluncontent = pingluncontent;
	}

	public int getPinglunlock() {
		return pinglunlock;
	}

	public void setPinglunlock(int pinglunlock) {
		this.pinglunlock = pinglunlock;
	}

	@ManyToOne
	@JoinColumn(name="userid")
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setContent(Content content) {
		this.content = content;
	}

	

	@Id
	@GeneratedValue
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	
	
}
