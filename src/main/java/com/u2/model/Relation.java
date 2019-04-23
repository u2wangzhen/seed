package com.u2.model;

public class Relation {

	private String id;
	private Long mainId;
	private Long otherId;
	public Relation(){}
	public Relation(Long mainId, Long otherId) {
		super();
		this.mainId = mainId;
		this.otherId = otherId;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Long getMainId() {
		return mainId;
	}
	public void setMainId(Long mainId) {
		this.mainId = mainId;
	}
	public Long getOtherId() {
		return otherId;
	}
	public void setOtherId(Long otherId) {
		this.otherId = otherId;
	}
}
