package com.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="t_Similar")
public class Similar implements Serializable{
	private static final long serialVersionUID = -7141419035239709511L;
	private long id;
	private Content contentCo;
	private Content contentCt;
	private double sim;
	
	@Id
	@GeneratedValue
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	@ManyToOne
	@JoinColumn(name="co")
	public Content getContentCo() {
		return contentCo;
	}
	public void setContentCo(Content contentCo) {
		this.contentCo = contentCo;
	}
	@ManyToOne
	@JoinColumn(name="ct")
	public Content getContentCt() {
		return contentCt;
	}
	public void setContentCt(Content contentCt) {
		this.contentCt = contentCt;
	}
	public double getSim() {
		return sim;
	}
	public void setSim(double sim) {
		this.sim = sim;
	}
	
}
