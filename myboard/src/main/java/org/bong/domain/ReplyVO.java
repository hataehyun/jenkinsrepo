package org.bong.domain;

import java.sql.Timestamp;

public class ReplyVO {
	private int rno;
	private String rcontent;
	private String writer;
	private Timestamp regdate;
	private Timestamp updatedate;
	private int gno, gord, lpno, mpno, spno, depth, bno;
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public Timestamp getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Timestamp updatedate) {
		this.updatedate = updatedate;
	}
	
	public int getGno() {
		return gno;
	}
	public void setGno(int gno) {
		this.gno = gno;
	}
	public int getGord() {
		return gord;
	}
	public void setGord(int gord) {
		this.gord = gord;
	}
	public int getLpno() {
		return lpno;
	}
	public void setLpno(int lpno) {
		this.lpno = lpno;
	}
	public int getMpno() {
		return mpno;
	}
	public void setMpno(int mpno) {
		this.mpno = mpno;
	}
	public int getSpno() {
		return spno;
	}
	public void setSpno(int spno) {
		this.spno = spno;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	
	@Override
	public String toString() {
		return "ReplyVO [rno=" + rno + ", rcontent=" + rcontent + ", writer=" + writer + ", regdate=" + regdate
				+ ", updatedate=" + updatedate + ", gno=" + gno + ", gord=" + gord + ", lpno=" + lpno + ", mpno=" + mpno
				+ ", spno=" + spno + ", depth=" + depth + ", bno=" + bno + "]";
	}
	
	
}
