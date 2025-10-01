package controller.myPage;

import java.io.IOException;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

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
@WebServlet("/myPage/diary/delete")
public class DiaryDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DiaryDelete() {
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
		HttpSession session = request.getSession();
		DiaryService service = new DiaryServiceImpl();
		String dNo = request.getParameter("dNo");
		try {
			boolean delYn = service.delete(Integer.parseInt(dNo));
			System.out.println("diaryDelete" + delYn);
			if (delYn) {
				request.setAttribute("msg", "삭제");
				if(session.getAttribute("dNo") != null) session.removeAttribute("dNo");
				request.getRequestDispatcher("/myPage/diarySucc.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
