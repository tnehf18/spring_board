package com.example.common;

public class PageUtil {
	
	private int pageLength=10;	//페이지 길이. 기본값: 10
	private int pageSize;		//페이지 당 row 개수
	private int totCnt;			//총 row 개수
	private int currentIdx;		//현재 페이지.
	private int firstIdx;		//첫 페이지
	private int finalIdx;		//마지막 페이지
	private int startIdx;		//시작 페이지
	private int endIdx;			//종료 페이지
	private int prevIdx;		//이전 페이지
	private int nextIdx;		//다음 페이지
	private int startRN=0;		//조회시 시작할 row 행. 기본값: 0
	
	public PageUtil(int pageSize, int totCnt, int currenIdx) {
		this.pageSize = pageSize;
		this.totCnt = totCnt;
		this.currentIdx = currenIdx;
		
		this.firstIdx = totCnt != 0 ? 1 : 0;
		this.finalIdx = (int) Math.ceil((double) totCnt / pageSize);
		this.startIdx = ((currentIdx - 1) / pageLength) * pageLength + 1;
		this.endIdx = getStartIdx() + pageLength - 1 > getFinalIdx() ? getFinalIdx() : getStartIdx() + pageLength - 1;
		this.prevIdx = getStartIdx() - 1 > 0 ? getStartIdx() - 1 : 1;
		this.nextIdx = getStartIdx() + pageLength > getFinalIdx() ? getFinalIdx() : getStartIdx() + pageLength;
		this.startRN = ((currenIdx - 1) * pageLength);
		
		if (finalIdx <= pageLength && (firstIdx == 0 || finalIdx <= endIdx))
			this.firstIdx = 1;
		if (finalIdx <= endIdx) 
			this.finalIdx = endIdx;
		if (finalIdx <= pageLength && finalIdx <= endIdx) 
			this.prevIdx = 1;
		if (finalIdx <= endIdx) 
			this.nextIdx = endIdx; 
	}
	
	public int getPageLength() {
		return pageLength;
	}
	public void setPageLength(int pageLength) {
		this.pageLength = pageLength;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotCnt() {
		return totCnt;
	}
	public void setTotCnt(int totCnt) {
		this.totCnt = totCnt;
	}
	public int getCurrentIdx() {
		return currentIdx;
	}
	public void setCurrentIdx(int currentIdx) {
		this.currentIdx = currentIdx;
	}
	public int getFirstIdx() {
		return firstIdx;
	}
	public void setFirstIdx(int firstIdx) {
		this.firstIdx = firstIdx;
	}
	public int getFinalIdx() {
		return finalIdx;
	}
	public void setFinalIdx(int finalIdx) {
		this.finalIdx = finalIdx;
	}
	public int getStartIdx() {
		return startIdx;
	}
	public void setStartIdx(int startIdx) {
		this.startIdx = startIdx;
	}
	public int getEndIdx() {
		return endIdx;
	}
	public void setEndIdx(int endIdx) {
		this.endIdx = endIdx;
	}
	public int getPrevIdx() {
		return prevIdx;
	}
	public void setPrevIdx(int prevIdx) {
		this.prevIdx = prevIdx;
	}
	public int getNextIdx() {
		return nextIdx;
	}
	public void setNextIdx(int nextIdx) {
		this.nextIdx = nextIdx;
	}
	public int getStartRN() {
		return startRN;
	}
	public void setStartRN(int startRN) {
		this.startRN = startRN;
	}

	@Override
	public String toString() {
		return "PageUtil [pageLength=" + pageLength + ", pageSize=" + pageSize + ", totCnt=" + totCnt + ", currentIdx="
				+ currentIdx + ", firstIdx=" + firstIdx + ", finalIdx=" + finalIdx + ", startIdx=" + startIdx
				+ ", endIdx=" + endIdx + ", prevIdx=" + prevIdx + ", nextIdx=" + nextIdx + ", startRN=" + startRN + "]";
	}
	
}
