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
@WebServlet("/exam/exam9")
public class ExamExam9 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ExamExam9() {
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
		request.setAttribute("navPath2", "/ieum/exam/exam9");
		request.setAttribute("navPathName2", "게임중독");
		request.setAttribute("navcurPage", "검진");
		
		request.getRequestDispatcher("/exam/examQues9.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		Integer eNo = 9;
		String examName = "게임중독";
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

			if (total < 10) {
				examSign = "정상";
				examResult1 = "귀하는 인터넷게임 사용 관련 장애가 있을 가능성이 낮은 것으로 보입니다.\r\n"
						+ "현재와 같이 건강한 습관을 유지하시기 바랍니다.";
				examResult2 = "";

			} else{
				examSign = "주의";
				examResult1 = "양성이라고 모두 인터넷 게임 사용관련 장애가 있는 것은 아닙니다.\r\n"
						+ "그러나 추가적인 검사를 통해 인터넷 사용관련 장애가 있는지를 확인해보셔야합니다.";
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
			request.setAttribute("navPath2", "/ieum/exam/exam9");
			request.setAttribute("navPathName2", "게임중독");
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
