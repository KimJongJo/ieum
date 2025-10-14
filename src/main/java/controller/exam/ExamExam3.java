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
@WebServlet("/exam/exam3")
public class ExamExam3 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ExamExam3() {
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
		request.setAttribute("navPath2", "/ieum/exam/exam3");
		request.setAttribute("navPathName2", "삶의질");
		request.setAttribute("navcurPage", "검진");
		
		request.getRequestDispatcher("/exam/examQues3.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		Integer eNo = 4;
		String examName = "조울증(성인)";
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

			if (total < 22) {
				examSign = "정상";
				examResult1 = "주의력 및 과잉행동과 관련한 어려움이 없는 건강한 상태 혹은 때때로 집중하지 못하거나, 부주의하거나, 충동적인 행동 등을 보이지만 이는 또래 아이들이 경험하는 정도로정상범위에 속합니다.";
				examResult2 = "따라서 주기적인 정신건강 검진을 통해 주의력 결핍 과잉행동 장애를 예방하여 건강한 삶을 유지하도록 하세요."+"\r\n"
						+ "또한, 주의력 결핍 과잉행동 장애 증상과 치료 방법에 대해 자세히 알고 싶다면 정신건강정보를 활용하세요."+"\r\n";

			} else {
				examSign = "위험";
				examResult1 = "또래 아동에 비해 집중하지 못하거나, 부주의하거나, 충동적인 행동 등을 보여 학업을 비롯한 대인관계에서 어려움을 경험하고 있을 가능성이 높음을 의미합니다.";
				examResult2 = "따라서 근처의 정신건강센터에 방문하여 전문가와 상담하는 것을 추천 드립니다."+"\r\n"
						+ "더불어 주의력 결핍 과잉행동 장애 증상과 치료 방법에 대해 자세히 알고 싶다면 정신건강정보를 활용하세요."+"\r\n";

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
