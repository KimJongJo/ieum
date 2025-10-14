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
@WebServlet("/exam/exam8")
public class ExamExam8 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ExamExam8() {
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
		request.setAttribute("navPath2", "/ieum/exam/exam8");
		request.setAttribute("navPathName2", "알코올중독");
		request.setAttribute("navcurPage", "검진");
		
		request.getRequestDispatcher("/exam/examQues8.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		Integer eNo = 8;
		String examName = "알코올중독";
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

			if (total < 6) {
				examSign = "정상음주";
				examResult1 = "정상음주군'에 속하고 있으며, 비교적 건강하고 안전한 음주습관을 가지고 있습니다.";
				examResult2 = "";

			} else if(5 < total && total < 10) {
				examSign = "위험음주";
				examResult1 = "위험음주군'으로 음주에 대한 단기개입과 지속적인 모니터링이 필요합니다.";
				examResult2 = "";
			
			}else {
				examSign = "알코올사용장애";
				examResult1 = "알코올사용장애진단척도 결과, '사용장애추정군'으로 신체증상, 불안, 불면, 사회부적응, 우울 등 증상이 나타날 수 있으므로 세심한 관심과 전문가의 치료적 개입이 필요합니다. ";
				examResult2 = "";
				
			}

			request.setAttribute("eNo", eNo);
			request.setAttribute("examName", examName);
			request.setAttribute("examNotice", examNotice);
			request.setAttribute("examResult1", examResult1);
			request.setAttribute("examResult2", examResult2);
			request.setAttribute("examSign", examSign);
			request.setAttribute("total", total);
			
			request.setAttribute("navPath", "/ieum/exam");
			request.setAttribute("navPathName", "자가검진");
			request.setAttribute("navPath2", "/ieum/exam/exam8");
			request.setAttribute("navPathName2", "알코올중독");
			request.setAttribute("navcurPage", "검진결과");

			examNotice = examNotice.replaceAll("\r\n", "<br>");
			examResult1 = examResult1.replaceAll("\r\n", "<br>");
			examResult2 = examResult2.replaceAll("\r\n", "<br>");
			request.getRequestDispatcher("/exam/examResult.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
