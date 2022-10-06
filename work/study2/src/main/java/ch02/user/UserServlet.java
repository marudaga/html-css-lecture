package ch02.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 - HttpServlet 클래스
   : 추상 클래스
   : GenericServlet 클래스를 상속 받음
   : GenericServlet 클래스의 service() 메소드가 재정의 되어 있음
   : service() 메소드는 요청 method에 따라 다음의 메소드가 호출되도록 구현되어 있음
     doGet(HttpServletRequest req, HttpServletResponse resp)
     doPost(HttpServletRequest req, HttpServletResponse resp)
   : 요청 method
     - GET : 기본 요청 방식으로 주소줄에 파라미터를 전달
     - POST : <form method="post" ... ></form> 을 통해 요청
              body에 정보를 실어서 보냄
*/

// @WebServlet : 서블릿과 url을 매핑
@WebServlet("/user")  // => 주소 : localhost:9090/study2/user
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// GET 방식으로 요청한 경우
		// HttpServletRequest : 클라이언트가 보낸 요청정보를 가지고 있는 객체
		// HttpServletResponse : 처리결과를 클라이언트에게 응답할 정보를 가지고 있는 객체
		
		try {
			// 클라이언트가 보낸 파라미터 정보를 받는다. 파라미터는 String으로 넘어온다.
			String a = req.getParameter("name");
			int b = Integer.parseInt(req.getParameter("age"));
			String state = b>=19 ? "성인" : "미성년자";
			
			// 서버가 클라이언트에게 응답할 문서 타입
			resp.setContentType("text/html; charset=utf-8");
			
			PrintWriter out = resp.getWriter();
			
			out.println("<html>");
			out.println("<head><title>서블릿예제</title></head>");
			out.println("<body>");
			out.println("<h3>GET 방식으로 요청 받은 경우</h3>");
			out.println("<p>"+a + "님의 나이가 " + b + " 이므로 " + state + "입니다.</p>");
			out.println("</body>");
			out.println("</html>");
		} catch (Exception e) {
			// 예외가 발생하는 경우 서버에 로그로 기록
			getServletContext().log("error", e);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// POST 방식으로 요청한 경우
		
		try {
			// 클라이언트가 서버로 요청한 문자의 인코딩 설정
			// 설정하지 않으면 post 방식에서는 한글이 깨짐
			req.setCharacterEncoding("utf-8");
			
			// 클라이언트가 보낸 파라미터 정보를 받는다. 파라미터는 String으로 넘어온다.
			String a = req.getParameter("name");
			int b = Integer.parseInt(req.getParameter("age"));
			String state = b>=19 ? "성인" : "미성년자";
			
			// 서버가 클라이언트에게 응답할 문서 타입
			resp.setContentType("text/html; charset=utf-8");
			
			PrintWriter out = resp.getWriter();
			
			out.println("<html>");
			out.println("<head><title>서블릿예제</title></head>");
			out.println("<body>");
			out.println("<h3>POST 방식으로 요청 받은 경우</h3>");
			out.println("<p>"+a + "님의 나이가 " + b + " 이므로 " + state + "입니다.</p>");
			out.println("</body>");
			out.println("</html>");
		} catch (Exception e) {
			// 예외가 발생하는 경우 서버에 로그로 기록
			getServletContext().log("error", e);
		}		
	}

}
