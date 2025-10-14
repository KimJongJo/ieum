package controller.exam;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ExamScore
 */
@WebServlet("/exam/exam2")
public class ExamExam2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ExamExam2() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setAttribute("navPath", "/ieum/exam");
		request.setAttribute("navPathName", "자가검진");
		request.setAttribute("navPath2", "/ieum/exam/exam2");
		request.setAttribute("navPathName2", "스트레스");
		request.setAttribute("navcurPage", "검진");
		
		request.getRequestDispatcher("/exam/examQues2.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		Integer eNo = 2;
		String examName = "스트레스";
		String examResult1;
		String examResult2;
		String examSign;
		String examNotice = "건강이음 홈페이지의 [상담 예약]을 통해 전문 상담사에게 도움을 요청할 수 있습니다.";

		Integer total = 0;
		Integer count = 0;

		try {
			Enumeration<String> quesName = request.getParameterNames();

			while (quesName.hasMoreElements()) {
				String name = quesName.nextElement();
				String value = request.getParameter(name);

				try {
					total += Integer.parseInt(value);
					count++;
				} catch (NumberFormatException e) {
					e.printStackTrace();
				}
			}

			
				examSign = "";
				examResult1 = "귀하께서 느끼는 스트레스가 높다면, 다른 정신건강 자가검진도 함께 해보시는 것을 권유드립니다.";
				examResult2 = "스트레스가 심해지면, 우울증상과 불안증상과 같은 정신건강의 어려움을 경험하게 되고, 뿐만 아니라 불면, 답답함, 소화불량 등과 같은 신체적 건강에도 불편함을 느끼게 되어 평소에 비해 일상생활 기능이 저하 될 수 있으므로 주의가 필요합니다.";

			
		
			request.setAttribute("eNo", eNo);
			request.setAttribute("examName", examName);
			request.setAttribute("examNotice", examNotice);
			request.setAttribute("examResult1", examResult1);
			request.setAttribute("examResult2", examResult2);
			request.setAttribute("examSign", examSign);
			request.setAttribute("total", total);

			examNotice = examNotice.replaceAll("\r\n", "<br>");
			examResult1 = examResult1.replaceAll("\r\n", "<br>");
			examResult2 = examResult2.replaceAll("\r\n", "<br>");
			request.getRequestDispatcher("/exam/examResult.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
