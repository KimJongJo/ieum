package controller.exam;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ExamResult
 */
@WebServlet("/exam/result")
public class ExamResult extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ExamResult() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		Integer total = (Integer) request.getAttribute("total");
		String examName = (String) request.getAttribute("examName");
		String examNotice = (String) request.getAttribute("examNotice");
		String examResult = (String) request.getAttribute("examResult");
		String examSign = (String) request.getAttribute("examSign");

		try {

			request.setAttribute("total", total);
			request.setAttribute("examName", examName);
			request.setAttribute("examNotice", examNotice);
			request.setAttribute("examResult", examResult);
			request.setAttribute("examSign", examSign);

			examNotice = examNotice.replaceAll("\\r\\n", "<br>");
			examResult = examResult.replaceAll("\\r\\n", "<br>");
			request.getRequestDispatcher("/exam/examResult.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
