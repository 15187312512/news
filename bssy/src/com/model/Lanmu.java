package com.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="t_Lanmu")
public class Lanmu implements Serializable{

	private static final long serialVersionUID = -7141419035239709511L;

	private long id;
	
	private String lanmuming;
	
	private int lanmulock;


	public int getLanmulock() {
		return lanmulock;
	}

	public void setLanmulock(int lanmulock) {
		this.lanmulock = lanmulock;
	}

	@Id
	@GeneratedValue
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getLanmuming() {
		return lanmuming;
	}

	public void setLanmuming(String lanmuming) {
		this.lanmuming = lanmuming;
	}

	

	

	
	
}
