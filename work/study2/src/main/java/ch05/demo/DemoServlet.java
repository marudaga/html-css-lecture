package ch05.demo;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ch05/demo")
public class DemoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// GET 방식으로 요청한 경우
		
		// forward 할때 path의 가장 앞 / 는 context path 까지 이다.
		// 서블릿에서의 포워딩
		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/ch05/write.jsp");
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// POST 방식으로 요청한 경우
		req.setCharacterEncoding("utf-8");
		
		String name = req.getParameter("name");
		int age = Integer.parseInt(req.getParameter("age"));
		
		String s = age >= 19 ? "성인" : "미성년자";
		
		String a = name +"님의 나이가 " + age + "이므로 " + s +" 입니다.";
		
		req.setAttribute("msg", a);
		
		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/ch05/result.jsp");
		rd.forward(req, resp);
	}
}
