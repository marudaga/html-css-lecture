package com.bbs;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.MyUtil;

@WebServlet("/bbs/*")
public class BoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		execute(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		execute(req, resp);
	}
	
	protected void forward(HttpServletRequest req, HttpServletResponse resp, String path) throws ServletException, IOException {
		// 포워딩
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	protected void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		// http://localhost:9090/study3/bbs/list.do
		//  uri : /study3/bbs/list.do

		// cp 부터 끝까지 주소(QueryString 제외)
		String uri = req.getRequestURI();
		
		if(uri.indexOf("list.do") != -1) {
			list(req, resp);
		} else if(uri.indexOf("write.do") != -1) {
			writeForm(req, resp);
		} else if(uri.indexOf("write_ok.do") != -1) {
			writeSubmit(req, resp);
		} else if(uri.indexOf("article.do") != -1) {
			article(req, resp);
		} else if(uri.indexOf("pwd.do") != -1) {
			pwdForm(req, resp);
		} else if(uri.indexOf("pwd_ok.do") != -1) {
			pwdSubmit(req,resp);
		} else if(uri.indexOf("update_ok.do") != -1) {
			updateSubmit(req, resp);
		} 
	}
	
	protected void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 글 리스트
		BoardDAO dao = new BoardDAO();
		MyUtil util = new MyUtil();
		String cp = req.getContextPath();
		
		try {
			// 페이지 번호
			String page = req.getParameter("page");
			int current_page = 1;
			if(page != null) {
				current_page = Integer.parseInt(page);
			}
			
			// 검색
			String condition = req.getParameter("condition");
			String keyword = req.getParameter("keyword");
			if(condition == null) {
				condition = "all";
				keyword = "";
			}
			
			// GET 방식이면 디코딩
			if(req.getMethod().equalsIgnoreCase("GET")) {
				keyword = URLDecoder.decode(keyword, "utf-8");
			}
			
			// 전체 데이터 개수
			int dataCount;
			if(keyword.length() == 0) { // 검색이 아닌 경우
				dataCount = dao.dataCount();
			} else { // 검색인 경우
				dataCount = dao.dataCount(condition, keyword);
			}
			
			// 전체 페이지 수
			int size = 10; // 한페이지에 출력할 데이터 수
			int total_page = util.pageCount(dataCount, size);
			if(current_page > total_page) {
				current_page = total_page;
			}
			
			// 게시글 가져오기
			int offset = (current_page - 1) * size;
			if(offset < 0) offset = 0;
			
			List<BoardDTO> list;
			if(keyword.length() == 0 ) {
				list = dao.listBoard(offset, size);
			} else {
				list = dao.listBoard(offset, size, condition, keyword);
			}
			
			String query = "";
			if(keyword.length() != 0) {
				query = "condition="+condition+"&keyword="+URLEncoder.encode(keyword, "utf-8");
			}
			
			// 페이징 처리
			String listUrl = cp + "/bbs/list.do"; // 글리스트 주소
			String articleUrl = cp + "/bbs/article.do?page=" + current_page;
			if(query.length() != 0) {
				listUrl += "?" + query;
				articleUrl += "&" + query;
			}
			
			String paging = util.paging(current_page, total_page, listUrl);
			
			// 포워딩할 JSP에 전달할 속성(attribute)
			req.setAttribute("list", list);
			req.setAttribute("page", current_page);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("size", size);
			req.setAttribute("total_page", total_page);
			req.setAttribute("articleUrl", articleUrl);
			req.setAttribute("paging", paging);
			req.setAttribute("condition", condition);
			req.setAttribute("keyword", keyword);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 포워딩에서의 /는 cp 까지
		forward(req, resp, "/WEB-INF/views/bbs/list.jsp");
	}
	
	protected void writeForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 글 쓰기 폼
		req.setAttribute("mode", "write");
		// mode 수정일때,,,,, mode: 등록, 수정을 나타내는 값;
		forward(req, resp, "/WEB-INF/views/bbs/write.jsp");
	}
	
	protected void writeSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 글 저장
		BoardDAO dao = new BoardDAO();
		String cp = req.getContextPath();
		
		try {
			// 폼데이터 : 이름, 제목, 패스, 내용
			// 번호:시퀀스, 등록일:SYSDATE, 조회수:0, ip:클라이언트 IP
			BoardDTO dto = new BoardDTO();
			
			dto.setName(req.getParameter("name"));
			dto.setSubject(req.getParameter("subject"));
			dto.setContent(req.getParameter("content"));
			dto.setPwd(req.getParameter("pwd"));
			
			// 클라이언트 IP
			dto.setIpAddr(req.getRemoteAddr());
			
			dao.insertBoard(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 등록 후 list.do로 리다이렉트
		resp.sendRedirect(cp + "/bbs/list.do");
		
	}
	
	protected void article(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 글 보기
		BoardDAO dao = new BoardDAO();
		String cp = req.getContextPath();
		
		String page = req.getParameter("page");
		String query = "page=" + page;
		
		try {
			long num = Long.parseLong(req.getParameter("num"));
			String condition = req.getParameter("condition");
			String keyword = req.getParameter("keyword");
			if(keyword == null) {
				condition ="all";
				keyword="";
			}
			keyword = URLDecoder.decode(keyword, "utf-8");
			
			if(keyword.length() !=0) {
				query +="&condition="+condition+"&keyword="+URLEncoder.encode(keyword,"utf-8");
			}
			
			//조회수 증가
			dao.updateHitCount(num);
			//게시글 가져오기
			BoardDTO dto = dao.readBoard(num);
			if(dto ==null) {
				resp.sendRedirect(cp+"/bbs/list.do?"+query);
				return;
			}
			
			//content 엔터를 <br>로
			dto.setContent(dto.getContent().replace("\n","<br>"));
			
			//이전글/다음글 가져오기
			BoardDTO preReadDto = dao.preReadBoard(num, condition, keyword);
			BoardDTO nextReadDto= dao.nextReadBoard(num, condition, keyword);

			//포워딩할 JSP에 전달할 속성
			req.setAttribute("dto",dto);
			req.setAttribute("preReadDto",preReadDto);
			req.setAttribute("nextReadDto",nextReadDto);
			req.setAttribute("page", page);
			req.setAttribute("query", query);
			
			//JSP로 포워딩
			forward(req,resp, "/WEB-INF/views/bbs/article.jsp");
			return;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		//에러가 발생하면
		resp.sendRedirect(cp+"/bbs/list.do?"+query);
	}
	
	protected void pwdForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 글 수정/ 글삭제에서 패스워드 입력 폼
		String cp = req.getContextPath();
		String page = req.getParameter("page");
		
		try {
			long num = Long.parseLong(req.getParameter("num"));
			String mode = req.getParameter("mode");
			String condition = req.getParameter("condition");
			String keyword = req.getParameter("keyword");
			
			if(condition ==null) {
				condition = "all";
				keyword = "";
			}
			
			 req.setAttribute("num", num);
			 req.setAttribute("mode",mode);
			 req.setAttribute("page", page);
			 req.setAttribute("condition", condition);
			 req.setAttribute("keyword", keyword);
			 
			 
			 forward(req, resp, "/WEB-INF/views/bbs/pwd.jsp");
			 return;
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
		//에러가 발생하면
		resp.sendRedirect(cp+"/bbs/list.do?page="+page);
		
	}
	
	protected void pwdSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 패스워드 검사
		BoardDAO dao = new BoardDAO();
		String cp = req.getContextPath();
		String page = req.getParameter("page");
		String query = "page="+ page;
		
		try {
			long num = Long.parseLong(req.getParameter("num"));			
			String pwd = req.getParameter("pwd");
			String mode = req.getParameter("mode");
			String condition = req.getParameter("condition");
			String keyword = req.getParameter("keyword");		
//			if(keyword == null) {
//				condition = "all";
//				keyword = "";
//			}
//			keyword = URLDecoder.decode(keyword,"utf-8");
//			post방식이어서 디코딩 필요없음
			if(keyword.length() != 0) {
				query += "&condition="+condition+"&keyword="+URLEncoder.encode(keyword,"utf-8");
			}
			
			BoardDTO dto = dao.readBoard(num);
			if(dto ==null) {
				resp.sendRedirect(cp+"/bbs/list.do?"+query);
				return;
			}
			if(! dto.getPwd().equals(pwd)) {
				String msg = "패스워드가 일치하지 않습니다.";

				req.setAttribute("num", num);
				req.setAttribute("mode", mode);
				req.setAttribute("pwd", pwd);
				req.setAttribute("condition", condition);
				req.setAttribute("keyword", keyword);
				req.setAttribute("msg", msg);
				
				forward(req,resp,"/WEB-INF/views/bbs/pwd.jsp");
				return;
			}
			if(mode.equals("update")) {
				req.setAttribute("mode", "update");
				req.setAttribute("dto", dto);
				req.setAttribute("page", page);
				
				forward(req,resp, "/WEB-INF/views/bbs/write.jsp");
				return;
			} else if(mode.equals("delete")) {
				dao.deleteBoard(num);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		resp.sendRedirect(cp+"/bbs/list.do?"+query);
	
	}
	protected void updateSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 글 수정 완료
		BoardDAO dao = new BoardDAO();
		String cp = req.getContextPath();
		String page = req.getParameter("page");
		

		try {
			BoardDTO dto = new BoardDTO();
			
			dto.setNum(Long.parseLong(req.getParameter("num")));
			dto.setName(req.getParameter("name"));
			dto.setSubject(req.getParameter("subject"));
			dto.setContent(req.getParameter("content"));
			dto.setPwd(req.getParameter("pwd"));
			
			dao.updateBoard(dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 수정 후 list.do로 리다이렉트
		resp.sendRedirect(cp + "/bbs/list.do?page="+page);
	}
	
	
	
}
