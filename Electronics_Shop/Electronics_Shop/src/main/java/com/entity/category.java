package com.entity;

public class category {

	private int cid;
	private String cname;
        private String pdesc; 
	
	public category() {
	
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}
	 public String getPdesc() {  
		return pdesc;
	}
	public void setPdesc(String pdesc) { 
		this.pdesc = pdesc;
	}
	
}
