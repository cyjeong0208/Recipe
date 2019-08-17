package com.solrecipe.recipe.admin;

public class Paging {
	
	// 페이징
	public int listCnt;
	public int pageCnt;
	public int page;
	public int totalPosts;
	public int totalPage;
	public int startPage;
	public int endPage;
	
	// 한 페이지 게시글개수 , 한번에 보여질 페이지 개수, 현재 페이지, 총 게시글 개수    
	public Paging(int listCnt, int pageCnt, int page, int totalPosts) {
		this.listCnt = listCnt;
		this.pageCnt = pageCnt;
		this.page = page;
		this.totalPosts = totalPosts;
		totalPage = (totalPosts-1)/listCnt+1;
		
		if (page > totalPage){
			page = totalPage;
		}
		startPage = ((page - 1) / pageCnt) * pageCnt + 1;
		
		endPage = startPage + pageCnt - 1;
		if (endPage > totalPage) {
			endPage = totalPage;
		}
	}
}
