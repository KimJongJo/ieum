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
@WebServlet("/exam/exam1")
public class ExamExam1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ExamExam1() {
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
		request.setAttribute("navPath2", "/ieum/exam/exam1");
		request.setAttribute("navPathName2", "우울");
		request.setAttribute("navcurPage", "검진");
		
		request.getRequestDispatcher("/exam/examQues1.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		Integer eNo = 1;
		String examName = "우울증";
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

			if (total < 7) {
				examSign = "정상";
				examResult1 = "귀하는 종종 우울감을 경험하나 정상범위에 속하고 있습니다.";
				examResult2 = "평소 정기적인 검진과 관리를 통해 우울증을 예방하고 건강한 삶을 유지하시기 바랍니다.";

			} else if(15<total && total<19) {
				examSign = "경미한 우울";
				examResult1 = "귀하는 경미한 수준의 우울감이 있으나 일상생활에 지장을 줄 정도는 아닙니다.";
				examResult2 = "이러한 높은 수준의 조울증상은 흔히 신체적, 심리적 대처자원을 저하시키며 개인의 일상생활을 어렵게 만들기도 합니다." + "\r\n"
						+ "가까운 지역센터나 전문기관을 방문하여 보다 상세한 평가와 도움을 받아보시기 바랍니다.";

			}else if(20<total && total<25) {
				examSign = "중한 우울";
				examResult1 = "귀하는 높은 수준의 우울감이 시사됩니다.";
				examResult2 = "다만, 이러한 기분상태가 지속 될 경우 개인의 신체적, 심리적 대처자원을 저하시킬 수 있습니다."+"\r\n"
						+ "그러한 경우, 가까운 지역센터나 전문기관을 방문하시기 바랍니다.";

			}else {
				examSign = "심한 우울";
				examResult1 = "귀하는 심한 수준의 우울감이 시사되어, 전문기관의 치료적 개입과 평가가 요구됩니다.";
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
			request.setAttribute("navPath2", "/ieum/exam/exam1");
			request.setAttribute("navPathName2", "우울");
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
