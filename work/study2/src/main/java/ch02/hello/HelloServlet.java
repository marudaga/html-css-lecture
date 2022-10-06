package ch02.hello;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.GenericServlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
/*
 -GenericServlet
 :추상클래스
 :servlet 인터페이스 구현 클래스
  : 서블릿의 기반이 되는 클래스
  :service()메소드는 추상 메소드이므로 반드시 재정의해야함
 * */
public class HelloServlet extends GenericServlet {
	private static final long serialVersionUID = 1L;

	@Override//init은 첫번째만 실행되
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config);

		//서블릿이 초기화 될 때 단한번 실행. 두번 다시 실행하지 않음
		System.out.println("init ...");
	}

	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
		//클라이언트가 요청할 때마다 실행. - 클라이언트의 요청을 처리하고 결과를 응답한다.
		
		try {
			Calendar now = Calendar.getInstance();
			String s = String.format("%tF %tA %tT",  now, now, now);
			
			//클라이언트에게 보내는 문서타입
			res.setContentType("text/html; charset=UTF-8");
			
			//클라이언트에게 HTML 문서 전송
			PrintWriter out = res.getWriter();
			out.println("<html>");
			out.println("<html><title>첫번째 서블릿 </title></head>");
			out.println("<body>");
			out.println("<h3>서블릿 첫번째 예제</h3>");
			out.println("<p>지금 시간은 <b>" + s+ "</b> 입니다.</p>");
			out.println("</body>");
			out.println("</html");
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void destroy() {
		//서블릿이 파괴될 때 단한번 실행. WAS가 종료되는 시점
		System.out.println("destroy...");
		
	}

}
