package com.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="t_User")
public class User implements Serializable{

	private static final long serialVersionUID = -7141419035239709511L;

	private long id;
	
	private String username;
	
	private String password;
	
	private int userlock;
	
	private Date createtime;


	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public int getUserlock() {
		return userlock;
	}

	public void setUserlock(int userlock) {
		this.userlock = userlock;
	}

	@Id
	@GeneratedValue
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	
	
}
