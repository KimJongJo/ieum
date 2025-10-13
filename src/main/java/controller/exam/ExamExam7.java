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
@WebServlet("/exam/exam7")
public class ExamExam7 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ExamExam7() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/exam/examQues7.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		Integer eNo = 7;
		String examName = "수면";
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

			if (total < 8) {
				examSign = "불면증 아님";
				examResult1 = "귀하는 정상범위에 해당합니다. 유의한 수준의 불면증이 시사되지 않습니다.";
				examResult2 = "하지만, 귀하께서 일상 속에서 수면으로 인한 어려움을 많이 느끼고 있다면, 다른 정신건강자가검진도 함께 해보시는 것을 권유드립니다.";

			} else if(7 < total && total < 15) {
				examSign = "경미한 수준";
				examResult1 = "귀하는 경미한 수준의 불면증에 해당하고 있습니다. 수면의 질과 양에 있어서 무엇인가 방해를 받고 있다면, 원인을 파악하여 해결하는 것이 중요할 것으로 보입니다. (예: 따뜻한 우유 한잔, 자기전 핸드폰 사용 줄이기 등)";
				examResult2 = "어떤 문제로 수면의 어려움이 있는지 살펴보고 해결할 수 있는 방법을 시도해보시기 바랍니다."+"\r\n"
						+ "또한 귀하께서 일상 속에서 수면으로 인한 어려움을 많이 느끼고 있다면, 다른 정신건강자가검진도 함께 해보시는 것을 권유드립니다.";

			}else if (14 < total && total < 22) {
				examSign = "중한 수준";
				examResult1 = "귀하는 중한 수준의 불면증에 해당하고 있습니다. 혹시 일상생활의 영향을 받고 계시다면 전문가의 도움을 받으시길 권유드립니다.";
				examResult2 = "더불어 다른 정신건강의 어려움이 수면과 서로 영향이 있을 수 있기에 다른 정신건강자가검진도 함께 해보시는 것을 권유드립니다.";

				
			}else {
				examSign = "심각한 수준";
				examResult1 = "귀하는 심각한 수준의 불면증에 해당하고 있습니다. 이러한 수면 패턴은 일상생활에 상당한 지장을 줄 수 있기에 전문가의 도움을 받으시길 바랍니다. ";
				examResult2 = "또한 다른 정신건강의 어려움이 수면과 서로 영향이 있을 수 있기 때문에 다른 정신건강자가검진도 함께 해보시는 것을 권유드립니다.";
				
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
