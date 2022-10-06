package com.guest;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.MyUtil;

@WebServlet("/guest/*")
public class GuestServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		execute(req,resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		execute(req,resp);
	}
	
	protected void forward(HttpServletRequest req, HttpServletResponse resp, String path) throws ServletException, IOException {
		// 포워딩
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	protected void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		req.setCharacterEncoding("utf-8");
		
		String uri = req.getRequestURI();
		
		if(uri.indexOf("main.do") != -1) {
			main(req,resp);
		} else if(uri.indexOf("write_ok.do") != -1) {
			writeForm(req,resp);
		} else if(uri.indexOf("delete.do")!=-1) {
			deleteForm(req,resp);
		}
	}

	private void main(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//방명록 
		GuestDAO dao = new GuestDAO();
		MyUtil util = new MyUtil();
		String cp = req.getContextPath();
		
		try {
			String page = req.getParameter("page");
			int current_page = 1;
			if(page != null) {
				current_page = Integer.parseInt(page);
			}
			// 전체 데이터 개수
			int dataCount;
			dataCount = dao.dataCount();
			// 전체 페이지 수
			int size = 10; 
			// 한페이지에 출력할 데이터 수
			int total_page = util.pageCount(dataCount, size);
			if(current_page > total_page) {
				current_page = total_page;
			}	
			// 게시글 가져오기
			int offset = (current_page - 1) * size;
			if(offset < 0) offset = 0;
			
			List<GuestDTO> list;
			list = dao.listGuest(offset, size);
			
			// 페이징 처리
			String listUrl = cp + "/guest/main.do"; 
						
			String paging = util.paging(current_page, total_page, listUrl);
			// 포워딩할 JSP에 전달할 속성(attribute)
			req.setAttribute("list", list);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("size", size);
			req.setAttribute("page", current_page);
			req.setAttribute("total_page", total_page);
			req.setAttribute("listUrl", listUrl);
			req.setAttribute("paging", paging);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		forward(req, resp, "/WEB-INF/views/guest/guest.jsp");
	}
	
	private void writeForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 글등록
		GuestDAO dao = new GuestDAO();
		String cp = req.getContextPath();
		
		try {
			GuestDTO dto = new GuestDTO();
			System.out.println(dto.getName()+dto.getContent());
			
			dto.setName(req.getParameter("name"));
			dto.setContent(req.getParameter("content"));
			
			
			dao.insertGuest(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		resp.sendRedirect(cp + "/guest/main.do");
		
	}
	
	private void deleteForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 글삭제 완료
		GuestDAO dao = new GuestDAO();
		String cp = req.getContextPath();
		
		
		try {
			long num = Long.parseLong(req.getParameter("num"));

			dao.deleteGuest(num);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		resp.sendRedirect(cp + "/guest/main.do");
	}

	
}
