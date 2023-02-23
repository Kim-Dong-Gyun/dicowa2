package com.dicowa.board.domain;

import java.util.Date;
import java.util.Objects;

public class NoticeBoardDto {
	private Integer bno;
	private String title;
	private String contents;
	private String writer;
	private Date regdate;
	private int viewcnt;
	private int goodcnt;
	
	public NoticeBoardDto() {}
	
	public NoticeBoardDto(String title, String contents, String writer) {
		
		this.title = title;
		this.contents = contents;
		this.writer = writer;
	}
	
	public Integer getBno() {
		return bno;
	}
	public void setBno(Integer bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	public int getGoodcnt() {
		return goodcnt;
	}
	public void setGoodcnt(int goodcnt) {
		this.goodcnt = goodcnt;
	}
	@Override
	public String toString() {
		return "NoticeBoardDto [bno=" + bno + ", title=" + title + ", contents=" + contents + ", writer=" + writer
				+ ", regdate=" + regdate + ", viewcnt=" + viewcnt + ", goodcnt=" + goodcnt + "]";
	}
	@Override
	public int hashCode() {
		return Objects.hash(bno, contents, goodcnt, regdate, title, viewcnt, writer);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		NoticeBoardDto other = (NoticeBoardDto) obj;
		return Objects.equals(bno, other.bno) && Objects.equals(contents, other.contents) && goodcnt == other.goodcnt
				&& Objects.equals(regdate, other.regdate) && Objects.equals(title, other.title)
				&& viewcnt == other.viewcnt && Objects.equals(writer, other.writer);
	}
	
	
}
