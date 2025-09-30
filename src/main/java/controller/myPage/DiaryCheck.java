package controller.myPage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.DiaryDto;
import service.myPage.DiaryService;
import service.myPage.DiaryServiceImpl;

/**
 * Servlet implementation class Diary
 */
@WebServlet("/myPage/diary/check")
public class DiaryCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DiaryCheck() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		DiaryService service = new DiaryServiceImpl();
		HttpSession session = request.getSession();
		try {
			String date = request.getParameter("date");
			Integer uNo = (Integer) session.getAttribute("uNo");
			DiaryDto diary = service.getDate(uNo, date);
//			System.out.println("Diary" + diary.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
