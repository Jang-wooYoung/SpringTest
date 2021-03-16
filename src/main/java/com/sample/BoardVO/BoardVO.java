package com.sample.BoardVO;

public class BoardVO {
	
	private int currentPage;
	private int rowCount;
	private int blockPage; //페이지 목록수
	private int rowStart;
	private int rowEnd;
	private int totalCount;
	private int startPage; //첫페이지
	private int endPage; //끝페이지
	private String searchType = "";
	private String keyword = "";
	
	public BoardVO() {
		this.currentPage = 1;
		this.rowCount = 5;
		this.blockPage = 5;
	}
	
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}
	
	public void setRowCount(int rowCount) {
		if(rowCount <= 0) {
			this.rowCount = 5;
			return;
		}else {
			this.rowCount = rowCount;
		}
	}

	public void setCurrentPage(int currentPage) {
		if(currentPage <= 0) {
			this.currentPage = 1;
			return;
		}else {
			this.currentPage = currentPage;
		}
	}
	
	public void setBlockPage(int blockPage) {
		if(blockPage <= 0) {
			this.blockPage = 5;
		}else {
			this.blockPage = blockPage;
		}
	}
	
	public void setRowStart(int currentPage, int rowCount) {
		rowStart = ((currentPage - 1) * rowCount);
	}
	
	public void setRowEnd(int currentPage, int rowCount) {
		rowEnd = (rowStart + rowCount);
	}
	
	public int getTotalCount() {
		return this.totalCount;
	}
	
	public int getStartPage() {
		return this.startPage;
	}
	
	public int getEndPage() {
		return this.endPage;
	}
	
	public int getBlockPage() {
		return this.blockPage;
	}
	
	public int getTotalPage() {
		return this.endPage;
	}
	
	public int getCurrentPage() {
		return this.currentPage;
	}
	
	public int getRowCount() {
		return this.rowCount;
	}
	
	public int getRowStart() {		
		return this.rowStart;
	}
	
	public int getRowEnd() {		
		return this.rowEnd;
	}
	
	public String getSearchType() {
		return this.searchType;
	}
	
	public String getKeyword() {
		return this.keyword;
	}
	
	private void calcData() {
		endPage = (int)Math.ceil((double)totalCount / (double)rowCount);		
		startPage = 1;
	}
	
	@Override
	public String toString() {
		return "BoardVO [currentPage = "+currentPage+", rowCount = "+rowCount+", rowStart = "+rowStart+", rowEnd = "+rowEnd+", searchType = "+searchType+", keyword = "+keyword+"]";
	}	
}
