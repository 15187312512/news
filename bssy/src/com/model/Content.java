package com.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="t_Content")
public class Content implements Serializable{

	private static final long serialVersionUID = -7141419035239709511L;

	private long id;
	
	private String title;//标题
	
	private String content;//内容
	
	private Date createtime;
	
	private int dianjicishu;//点击数
	
	private Lanmu lanmu;
	
	private int tuijian;
	
	private int contentlock;
	

	public int getContentlock() {
		return contentlock;
	}

	public void setContentlock(int contentlock) {
		this.contentlock = contentlock;
	}

	public int getTuijian() {
		return tuijian;
	}

	public void setTuijian(int tuijian) {
		this.tuijian = tuijian;
	}

	@ManyToOne
	@JoinColumn(name="lanmuid")
	public Lanmu getLanmu() {
		return lanmu;
	}

	public void setLanmu(Lanmu lanmu) {
		this.lanmu = lanmu;
	}

	@Id
	@GeneratedValue
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	
	@Column(name="content", columnDefinition="TEXT")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getDianjicishu() {
		return dianjicishu;
	}

	public void setDianjicishu(int dianjicishu) {
		this.dianjicishu = dianjicishu;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	
	
}
