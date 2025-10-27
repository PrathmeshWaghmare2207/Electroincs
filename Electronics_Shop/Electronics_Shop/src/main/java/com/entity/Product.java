package com.entity;

public class Product {
	
	private int pid;
	private String pname;
	private int pprice;
	private int pquantity;
	private String pimage;
	private int bid;
	private int cid;
    private String pdesc;
    private String bname;
    private String cname;

    // Default constructor
    public Product() {}

    // Constructor for updating products
    public Product(int pid, String pname, int pprice, int pquantity, String pdesc) {
        this.pid = pid;
        this.pname = pname;
        this.pprice = pprice;
        this.pquantity = pquantity;
        this.pdesc = pdesc;
    }

    // Getters and setters (unchanged)
    public int getPid() { return pid; }
    public void setPid(int pid) { this.pid = pid; }
    public String getPname() { return pname; }
    public void setPname(String pname) { this.pname = pname; }
    public int getPprice() { return pprice; }
    public void setPprice(int pprice) { this.pprice = pprice; }
    public int getPquantity() { return pquantity; }
    public void setPquantity(int pquantity) { this.pquantity = pquantity; }
    public String getPimage() { return pimage; }
    public void setPimage(String pimage) { this.pimage = pimage; }
    public int getBid() { return bid; }
    public void setBid(int bid) { this.bid = bid; }
    public int getCid() { return cid; }
    public void setCid(int cid) { this.cid = cid; }
    public String getPdesc() { return pdesc; }
    public void setPdesc(String pdesc) { this.pdesc = pdesc; }
    public String getBname() { return bname; }
    public void setBname(String bname) { this.bname = bname; }
    public String getCname() { return cname; }
    public void setCname(String cname) { this.cname = cname; }
}
