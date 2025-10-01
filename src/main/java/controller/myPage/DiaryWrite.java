package controller.myPage;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

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
 * Servlet implementation class DiaryWrite
 */
@WebServlet("/myPage/diary/write")
public class DiaryWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DiaryWrite() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
//	    Integer uNo = (Integer)session.getAttribute("uNo");
		Integer uNo = 123;
		DiaryService service = new DiaryServiceImpl();
		try {
			String selectedDt = request.getParameter("date");
			LocalDateTime now = LocalDateTime.now();
			String formattedNow = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			if (selectedDt != null)
				request.setAttribute("targetDt", selectedDt);
			else
				request.setAttribute("targetDt", formattedNow);
			request.setAttribute("nowDt", formattedNow);
			Boolean hisYn = service.getHisYn(uNo);
			request.setAttribute("recentHistory", hisYn);
			request.getRequestDispatcher("/myPage/diaryWrite.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
//	    Integer uNo = (Integer)session.getAttribute("uNo");
		Integer uNo = 123;
		DiaryService service = new DiaryServiceImpl();
		try {
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String emoji = request.getParameter("emoji");
			String targetDtString = request.getParameter("targetDt");
			Date targetDt = Date.valueOf(targetDtString);
			DiaryDto diary = new DiaryDto(uNo, title, content, emoji, targetDt);
			service.write(diary);
			request.setAttribute("msg", "작성");
			session.removeAttribute("dNo");
			request.getRequestDispatcher("/myPage/diarySucc.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
