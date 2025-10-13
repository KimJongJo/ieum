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
@WebServlet("/exam/exam10")
public class ExamExam10 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ExamExam10() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/exam/examQues10.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		Integer eNo = 10;
		String examName = "외상후 스트레스장애 (PTSD)";
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

			if (total < 17) {
				examSign = "정상군";
				examResult1 = "귀하는 정상범위에 해당합니다.";
				examResult2 = "그러나 스스로 느끼시는 스트레스 수준이 심하시다면 도움을 요청하시기 바랍니다.";

			} else if(16 < total && total < 24) {
				examSign = "경증";
				examResult1 = "귀하는 중간정도의 트라우마 증상이 시사됩니다.";
				examResult2 = "트라우마 증상은 침습 증상(트라우마와 관련된 불쾌한 기억이 반복적으로 떠오르것을 의미), 회피(트라우마 사건을 연상시키는 것들을 피하려고 노력하는 것을 의미), 과각성(항상 긴장 상태)등으로 일상생활을 어렵게 만들기도 합니다. 가까운 지역센터나 전문기관을 방문하여 보다 상세한 평가와 도움을 받아보시기 바랍니다.";
			
			}else {
				examSign = "고위험군";
				examResult1 = "귀하는 심한 정도의 트라우마 증상이 시사됩니다.";
				examResult2 = "트라우마 증상은 침습 증상(트라우마와 관련된 불쾌한 기억이 반복적으로 떠오르것을 의미), 회피(트라우마 사건을 연상시키는 것들을 피하려고 노력하는 것을 의미), 과각성(항상 긴장 상태)으로 전문기관의 치료적 개입과 평가가 요구됩니다.";
				
			}

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
