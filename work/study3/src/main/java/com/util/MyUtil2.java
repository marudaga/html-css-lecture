package com.util;
//페이징처리
public class MyUtil2 {
	/**
	 * 전체 페이지 구하기
	 * @param dataCount 총데이터수
	 * @param size 		한화면에 출력할 목록수
	 * @return 			전체 페이지수
	 * 목록수= 데이터수 = 행의 개수
	 * */
	public int pageCount(int dataCount, int size) {
		if(dataCount <= 0) {
			return 0;
		}
		return dataCount / size + (dataCount %size >0 ? 1:0);
	}
	/**
	 * @param current_page		현재 표시되는 페이지 번호
	 * @param total_page		전체 페이지수
	 * @param list_url		링크를 설정한 주소
	 * @return				페이징 결과
	 */
	public String paging(int current_page, int total_page, String list_url) {
		StringBuilder sb = new StringBuilder();
		
		int numPerBlock =10;
		int currentPageSetup;
		int n, page;
		
		if(current_page <1 || total_page < current_page) {
			return "";
		}
		
		// localhost   ?key&value
		if(list_url.indexOf("?") != -1) {
			list_url +="&";
		} else {
			list_url += "?";
		}
		//numPerBlock :한페이지에 출력할 데이터 개수
		//currentPageSetup : 표시를 시작할 페이지 -1
		currentPageSetup = (current_page/numPerBlock)*numPerBlock;
		if(current_page<=6) {
			currentPageSetup = 0;
		}
		else {
			currentPageSetup = current_page-5;
		}
		
//		currentPageSetup = (current_page/numPerBlock)*numPerBlock;
//		if(current_page % numPerBlock ==0) {
//			currentPageSetup = currentPageSetup- numPerBlock;
//		}
//		currentPageSetup = currentPageSetup- numPerBlock;		
		
		sb.append("<div class='paginate'>");
		//처음페이지, 이전(10페이지 전)
		n = current_page - 1;
		if(total_page>numPerBlock&&currentPageSetup>0) {
			sb.append("<a href='" + list_url + "page=1'>처음</a>");
			sb.append("<a href='" + list_url + "page=" + n + "'>이전</a>");
		}
		
		//페이징처리
		page = currentPageSetup +1;
		while(page<=total_page&&page-5 <=(currentPageSetup-5 + numPerBlock)){
			if(page >= current_page-5) {
				sb.append("<a href='" + list_url + "page=" + page + "'>" + page + "</a>");
			} else if(page == current_page){
				sb.append("<span>" + page + "</span>");
			} else {
				sb.append("<a href='" + list_url + "page=" + page + "'>" 
						+ page + "</a>");
			}
			page++;
		}
		
		//다음(10페이지 후 ), 마지막 페이지
		n = current_page + 1;
		if(n > total_page) n = total_page;
		if(total_page -currentPageSetup > numPerBlock) {
			sb.append("<a href='" + list_url + "page=" + n + "'>다음</a>");
			sb.append("<a href='" + list_url + "page=" + total_page + "'>끝</a>");
		}
		
		sb.append("</div>");
		
		return sb.toString();
	}
	
}
